// HDEF

// DefinitionBlock ("", "SSDT", 1, "toleda", "amihdas1", 0x00003000)
// {


    //
    // External (_SB_.PCI0, DeviceObj)    // Warning: Unknown object
    External (\_SB_.PCI0.HDAS, DeviceObj)    // Warning: Unknown object
    // External (\_SB_.PCI0.HDAS._ADR, UnknownObj)    // Warning: Unknown object

    // _SB.PCI0
    // Scope (\_SB.PCI0)
    // {
        // hdef
        // Name (PEG0.PEGP._STA, Zero)  // _STA: Status
        Device (HDEF)
        {
            Name (_ADR, 0x001F0003)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, \_SB.PCI0.HDAS._ADR)
            }
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    0x05
                })
            }
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                         0x01, 0x00, 0x00, 0x00 // layout id 1
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
                    Buffer (Zero)
                    {
                        //
                    }, 
                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                })
            }
        }
        
        // Name (HDAS._STA, Zero)  // _STA: Status
        Scope (HDAS)
        {
            Name (_STA, Zero)
        }
        // hdef
 
    
    
    
       // }

    // Store ("ssdt-ami_100_hdas-hdef_audio_to_hdef-1_v1.0 github.com/toleda", Debug)

// }

// eof