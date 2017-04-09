// https://pikeralpha.wordpress.com/2016/07/13/simple-skylake-usb-fix-no-kexts-required/



DefinitionBlock ("ssdt_usb.aml", "SSDT", 2, "APPLE ", "Xhci", 0x00001000)
{
    External (\UMAP, IntObj)
 
    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store ("Method \\_SB._INI Called", Debug)
            Store (0xf2ff, \UMAP)
        }
    }
}