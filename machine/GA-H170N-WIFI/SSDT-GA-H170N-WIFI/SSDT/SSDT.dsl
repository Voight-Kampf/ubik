// Instead of providing patched DSDT/SSDT, just include a single SSDT
// and do the rest of the work in config.plist

// A bit experimental, but possible as desktops are much simpler vs. laptops
// Because of the minimal patches required, we can do most of the work in
// config.plist and small SSDTs such as this one.



// define ssdts here

// CPU / CPUNOTURBO -- turbo or not
// #define CPU

// NVIDIA GPU inject
#define GPU

// ALC1150
#define ALC

// shutdown fix for GA-H170N-WIFI
// ASCII: _PTS |     HEX: 5F 50 54 53 01    DECIMAL: 95 80 84 83 1    base64: X1BUUwE=
//        ZPTS |                                                              WlBUUwk=
// NOTE, than you have to rename the original _PTS method name in DSDT if you use this
#define FIXSHUTDOWN

// #define ORANGE

#define USB

////////////////////////////////////////////////////////////////////////

DefinitionBlock ("SSDT.aml", "SSDT", 1, "APPLE ", "general", 0x00001000)
{
    // External (\_SB_, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.PEG0, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)    // (from opcode)

    // cpu
    #ifdef CPU
        #include "cpu/SSDT-CPU.dsl"
    #endif
    #ifdef CPUNOTURBO
        #include "cpu/SSDT-CPU-NO-TURBO.dsl"
    #endif

    // system bus
    Scope (\_SB)
    {
        // usb fix from pikeralpha
        #ifdef USB
            #include "fixes/USB/SSDT-USB.dsl"
        #endif

        // PCI
        Scope (PCI0)
        {
            // PCI Express Graphics
            Scope (PEG0)
            {

                // NVIDIA GPU
                #ifdef GPU
                    #include "SSDT-GPU.dsl"
                #endif
                //
            }

            // disabling PS2 keyboard and mouse
            // #include "fixes/PS2.dsl"  // error for now

            // HDAS to HDEF
            #ifdef ALC
                #include "SSDT-HDEF.dsl"
            #endif

            #ifdef ORANGE
                #include "fixes/orangeicon.dsl"
            #endif

        }        
        // end scope _SB.PCI0

    }
    // end scope _SB

    // functions
    // must rename _PTS to something other, see fixes/_PTS.dsl
    #ifdef FIXSHUTDOWN
        #include "fixes/Fix_Shutdown/_PTS.dsl"
    #endif



} // end definition block

////////////////////////////////////////////////////////////////////////

// eof