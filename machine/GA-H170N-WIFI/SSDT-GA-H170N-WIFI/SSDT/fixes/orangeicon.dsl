// _OSI handling

// DefinitionBlock ("", "SSDT", 2, "hack", "hack", 0)
// {
    // All _OSI calls in DSDT are routed to XOSI...
    // XOSI simulates "Windows 2009" (which is Windows 7)
    // Note: According to ACPI spec, _OSI("Windows") must also return true
    //  Also, it should return true for all previous versions of Windows.
     // External (\_SB_, DeviceObj)
//     External (_SB_.PCI0, DeviceObj)
    
    External (_SB_.PCI0.PPMC, DeviceObj)
    External (_SB_.PCI0.PPMC.PCIC, MethodObj)
    External (_SB_.PCI0.PPMC.PCID, MethodObj)
    External (PCIC, MethodObj)
    External (PCID, MethodObj)


// Scope(_SB.PCI0)
// {
        Device (PPMC)
        {
            Name (_ADR, 0x001F0002)  // _ADR: Address
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (PCIC (Arg0))
                {
                    Return (PCID (Arg0, Arg1, Arg2, Arg3))
                }

                Return (Package (0x02)
                {
                    //
                     "device-id",
                    Buffer (0x04)
                    {
                        0x81, 0x26, 0x00, 0x00
                    } 
                    //                                          
                })
            }
        }
// }            
                
                    
                            



// }