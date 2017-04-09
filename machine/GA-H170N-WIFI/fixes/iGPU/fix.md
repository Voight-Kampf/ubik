el sierra glitch fix from pikeralpha
https://pikeralpha.wordpress.com/2016/10/30/aapl-properties-for-skylake-graphics/


// some user 
The Glitch is Gone!

The ssdt method is not working on my machine, for some reason.
Using Clover I got it working with the device property patch:

Devices
AddProperties

Device
IntelGFX
Key
AAPL,GfxYTile
Value
AQAAAA==


But this alone does not work, I also needed:
– inject Intel: enabled
– ig-platform-id: 0x19120000
