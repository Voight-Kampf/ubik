//
// GPU
//
// DefinitionBlock ("", "SSDT", 1, "APPLE", "GFX1", 0x00001000)
// {

    External (\_SB_.PCI0, DeviceObj)
    External (\_SB_.PCI0.PEG0, DeviceObj)
    External (\_SB_.PCI0.HDAS._ADR)
    External (\_SB_.PCI0.PEG0.PEGP, DeviceObj)

    // _SB.PCI0
    // Scope (PEG0)
    // {

        Device (GFX1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_SUN, One)  // _SUN: Slot User Number
            Method (_DSM, 4, NotSerialized)
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

        Device (HDAU)
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)
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


        /* Here we disable/hide Devices (PEGP) */
        // Name (PEG0.PEGP._STA, Zero)  // _STA: Status
        // Name (\_SB_.PCI0.PEG0.PEGP._STA, Zero)
        // or
        Scope (PEGP)
        {
            Name (_STA, Zero)
        }
    
       
    // } // end scope \ SB \ PEG0
// } // end definiton block



// eof
