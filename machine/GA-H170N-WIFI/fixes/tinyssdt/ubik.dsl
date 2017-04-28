/*
 * Tiny SSDT example 3: Full blown example
 * https://github.com/Piker-Alpha/RevoBoot/wiki/Tiny-SSDT-example-3:-Full-blown-example
 *
 *
 * The code snippet below is small (666 bytes of AML code), universal and portable 
 * and as such can be used on any system, with any kind of boot loader, but the last part of this example, 
 * specifically the use of Method _PTS in this SSDT example, is supported exclusively by RevoBoot.

 * Please that most of the device removals / renaming of devices in this SSDT example are not required. 
 * Not at all. Just examples of how things can be done without having to hack a factory DSDT to pieces. 
 * Which not only is a (time consuming) job for people who know what they are doing, but doing it like that. 
 * The old fashion way, limits it to one specific board only. The way we do it, the easy way, is not. Or far less.

 * Disclaimer: You may have to change the used scope names in this example and/or change the _PTS method 
 * a little to make it work for your hardware, but that's about as far as things can go wrong.

 * Another note is that any breakage you may run into, is most likely due to some error in your tiny SSDT. 
 * What we did when we ran into this kind of problem was to re-check everything and to fix the error. 
 * The golden rule here is to start thinking in namespace trees rather than devices and methods. Also. As a reminder. 
 * You can only add new devices and methods. You cannot override existing devices and/or methods!

 */

// https://github.com/Bumblebee-Project/Bumblebee/wiki/ACPI-for-Developers


/*

    MethodObj
    UnknownObj
    IntObj
    DeviceObj
    PkgObj
    
*/

// order
// PSM
//
// _SB
//     PCIO
//			PEG0
//			PEG1
//			PEG2
//			LPCB
//				PS2K // ps 2 keyboard
//
// GPE
// _PTS
// _WAK
// _PR

// todo
/*
Device PS2K (PS2 Keyboard)
Device PS2M (PS2 Mouse)
Device SPKR (Speaker)
Device FDC (Floppy Disk Controller)

    External (_SB_.PCI0.HDAS.PPMS, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.HDAS.PS0X, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.HDAS.PS3X, MethodObj)    // 0 Arguments (from opcode)
    
    
*/

DefinitionBlock ("ssdt.aml", "SSDT", 1, "APPLE ", "general", 0x00001000)
{


    // external

    // PCIO
    External (\_SB.PCI0, DeviceObj)

    // USB
    External (\UMAP, IntObj)

    // GFX0 / GPU
    External (PEG0, DeviceObj)
    External (PEGP, DeviceObj)


    External (\_SB.PCI0.LPCB, DeviceObj)

    // PS2K and PS2M
    External (\_SB.PCI0.LPCB.PS2K, DeviceObj)
    External (\_SB.PCI0.LPCB.PS2M, DeviceObj)
    // External (\_SB.PCI0.LPCB, DeviceObj)

    // _PTS
    External (\_SB.TPM.TPTS, MethodObj)                 // 1 Arguments
    External (\_SB.PCI0.LPCB.SIO1.SIOS, MethodObj)      // 1 Arguments
    External (\_SB.PCI0.LPCB.SPTS, MethodObj)           // 1 Arguments
    External (\_SB.PCI0.NPTS, MethodObj)                // 1 Arguments
    External (RPTS, MethodObj)                          // 1 Arguments

    // AUDIO
    External (_SB_.PCI0.HDAS._ADR, UnknownObj) // ?

    /*
     *
     * root
     *
     */
    Scope (\)
    {
        



        /*
         *
         * System Bus tree
         *
         */
        Scope (\_SB)                            // Changing the scope to the System Bus tree.
        {



            // begin usb fix
            // Simple Skylake USB Fix (no kexts required)  
            // https://pikeralpha.wordpress.com/2016/07/13/simple-skylake-usb-fix-no-kexts-required/

            // External (\UMAP, IntObj)

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store ("Method \\_SB._INI Called", Debug)
                Store (0xf2ff, \UMAP)
            }
            // Store ("Method \\_SB._INI Called", Debug)
            // Store (0xf2ff, \UMAP)
            // end usb fix



            /*
             *
             * PCI0
             *
             */
            // External (\_SB.PCI0, DeviceObj)

            Scope (PCI0)                                    // And over to device PCI0.
            {



                /*
                 *
                 * NVIDIA GPU injection
                 *
                 */
                // External (PEG0, DeviceObj)

                Scope (PEG0)
                {

                    Device (GFX1)                           // Giving our GPU device a name. 
                    {
                        Name (_SUN, One)                    // A simple cosmetic only change. // _SUN: Slot User Number
                        Name (_ADR, Zero)                   // _ADR: Address

                        Method (_DSM, 4, NotSerialized)     // _DSM: Device-Specific Method
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03
                                })
                            }
                            Return (Package (0x02)
                            {
                                "hda-gfx", 
                                Buffer (0x0A)
                                {
                                    "onboard-1"
                               }
                            })
                        }
                    }

                    Device (HDAU)                           // Base for High Definition Audio link. 
                    {
                        Name (_ADR, One)                    // _ADR: Address
                        Method (_DSM, 4, NotSerialized)     // _DSM: Device-Specific Method
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03
                                })
                            }
                            Return (Package (0x02)
                            {
                                "hda-gfx",
                                Buffer (0x0A)
                                {
                                    "onboard-1"
                                }
                            })
                        }
                    }

                    //
                    // External (PEGP, DeviceObj)              // Creating a path to the factory EC0 in the namespace

                    Scope (PEGP)
                    {
                        Name (_STA, Zero)                   // Removing factory EC0 device
                    }
                    //

                    // Name (PEGP._STA, Zero)
                    // end NVIDIA GPU inject

                } // PEG0



                // deleting PS2 Kwyboard and Mouse
                // External (\_SB.PCI0.LPCB, DeviceObj)
                Scope (LPCB)
                {
                    // PS2K
                    Scope (PS2K)
                    {
                        Name (_STA, Zero)
                    }

                    // PS2M
                    Scope (PS2M)
                    {
                        Name (_STA, Zero)
                    }

                }


				/*
				https://www.tonymacx86.com/threads/modify-dsdt-for-lpcb-ionamematch.210070/
 Scope (_SB_.PCI0.LPCB)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (!Arg2)
            {
                Return ( Buffer() { 0x03 } )
            }

            Return ( Package () { "compatible", "pci8086,1d41" } ) // <-- Or whatever ID you want
        }
    }
				*/
				




            /*
             *
             * AUDO hdef
             * https://github.com/toleda/audio_ALCInjection
             */
            // External (\_SB_.PCI0, DeviceObj)                // Warning: Unknown object
            // External (\_SB_.PCI0.HDAS._ADR, UnknownObj)     // Warning: Unknown object

            Name (HDAS._STA, Zero)  // _STA: Status

            Device (HDEF)
            {
                Name (_ADR, 0x001F0003)                     // _ADR: Address
                Method (_INI, 0, NotSerialized)             // _INI: Initialize
                {
                    Store (Zero, \_SB.PCI0.HDAS._ADR)
                }
                Method (_PRW, 0, NotSerialized)             // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        0x05
                    })
                }
                Method (_DSM, 4, NotSerialized)             // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }
                    Return (Package (0x0C)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Built in"
                        }, 
                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00         // layout id 1
                        }, 
                        "device_type", 
                        Buffer (0x11)
                        {
                            "Audio Controller"
                        }, 
                        "built-in", 
                        Buffer (One)
                        {
                             0x00
                        }, 
                        "PinConfigurations", 
                        Buffer (Zero) {}, 
                        "hda-gfx", 
                        Buffer (0x0A)
                        {
                            "onboard-1"
                        }
                    })
                }
            }
            // AUDO hdef






            } // PCI0





        } // \_SB


        /////////
//    Scope (_SB.PCI0.LPCB.PS2K)
  //  {

    //}
        /////////



        /*
        A condition is added to method _PTS: if the argument is 5 (shutdown), 
        then no other actions shall be performed. Many reports confirmed this option 
        to fix shutdown issues with ASUS boards, maybe even with other vendors. 
        Some DSDT tables already contain such a condition and it is advised to turn the fix off in this case.
        */
        // sleep shutdown fix
        // External (\_SB.TPM.TPTS, MethodObj)                 // 1 Arguments
        // External (\_SB.PCI0.LPCB.SIO1.SIOS, MethodObj)      // 1 Arguments
        // External (\_SB.PCI0.LPCB.SPTS, MethodObj)           // 1 Arguments
        // External (\_SB.PCI0.NPTS, MethodObj)                // 1 Arguments
        // External (RPTS, MethodObj)                          // 1 Arguments

        Method (_PTS, 1, NotSerialized)                     // _PTS: Prepare To Sleep
        {
            If (LEqual (Arg0, 0x05))
            {
                // do nothing, sleep
            }
            ElseIf (Arg0)
            {
                \_SB.TPM.TPTS (Arg0)
                \_SB.PCI0.LPCB.SIO1.SIOS (Arg0)
                \_SB.PCI0.LPCB.SPTS (Arg0)
                \_SB.PCI0.NPTS (Arg0)
                RPTS (Arg0)
            }
        }
        // sleep shutdown fix




    }
    // end scope root



}
// end definiton block

// eof
