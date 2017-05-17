/*
 * HPET
 */

//
External (\_SB.PCI0.HPET.HPTE, IntObj)

Method (_INI, 0, NotSerialized)
// Adding _INI Method.
{
    Store (One, \_SB.PCI0.HPET.HPTE)			// Sets the High Precision Timer setting in the UEFI BIOS to Enabled.
}
