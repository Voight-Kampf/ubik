/*
 *
 *
 * AAPL properties for Skylake Graphics (fixing graphic glitches)
 * https://pikeralpha.wordpress.com/2016/10/30/aapl-properties-for-skylake-graphics/
 *
 * using this with clover:
 *         – inject Intel: enabled
 *         – ig-platform-id: 0x19120000
 *
 * 2017 -- GA-H170N-WIFI
 *
 */
DefinitionBlock ("ssdt.aml", "SSDT", 2, "APPLE ", "igpu", 0x00001000)
{
    External (_SB_.PCI0, DeviceObj)
    External (IGPU, DeviceObj)
 
    Scope (\_SB.PCI0)
    {
        Device (IGPU)
        {
            Name (_ADR, 0x00020000)  
 
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
                    "AAPL,GfxYTile",
                    Buffer (0x4)
                    {
                        0x01, 0x00, 0x00, 0x00
                    }                    
                })
            }
        }
    }
}
