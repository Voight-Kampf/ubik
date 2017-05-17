// PS2 keyboard and mouse PS2K and PS2M

External (\_SB.PCI0.LPCB, DeviceObj)
External (\_SB.PCI0.LPCB.PS2K, DeviceObj)
External (\_SB.PCI0.LPCB.PS2M, DeviceObj)

Scope (LPCB)
{

    Scope (PS2K)
    {
        Name (_STA, Zero)
    }

    Scope (PS2M)
    {
        Name (_STA, Zero)
    }

}

// eof
