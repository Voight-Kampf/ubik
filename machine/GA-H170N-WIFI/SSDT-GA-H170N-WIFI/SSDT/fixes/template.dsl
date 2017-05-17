/*
 * 
 */
 
 
 // Instead of providing patched DSDT/SSDT, just include a single SSDT
 // and do the rest of the work in config.plist

 // A bit experimental, but possible as desktops are much simpler vs. laptops
 // Because of the minimal patches required, we can do most of the work in
 // config.plist and small SSDTs such as this one.

DefinitionBlock ("", "SSDT", 1, "APPLE ", "general", 0x00001000)
{

     // _SB.PCI0
     Scope (\_SB.PCI0)
     {

         #include "SSDT-GPU.dsl"
         #include "SSDT-HDEF.dsl"

     }

} // end definition block

// eof