# ubik


required kext sources and makefile for my hmac

### minimal kext requirement:

Lilu.kext
NvidiaGraphicsFixup.kext for GPU
AppleALC.kext for audio

Shiki.kext and iMac.kext for playable iTunes movies


With version 1.9 of Git and later, you can even download the submodules simultaneously:
```
git clone --recursive -j8 git@github.com:Voight-Kampf/ubik.git
```

For already cloned repos, or older Git versions, just use:
```
git submodule update --init --recursive
```

```
iMac17,1: 'Mac-B809C3757DA9BB8D'
iMac17,1 (Retina 5K, 27-inch, Late 2015) / Core i5 3.3GHz

iMac17,1: 'Mac-DB15BD556843C820'
iMac17,1 (Retina 5K, 27-inch, Late 2015) / Core i5 3.2GHz

iMac17,1: 'Mac-65CE76090165799A'
iMac17,1 (Retina 5K, 27-inch, Late 2015) / Core i7 4.0GHz
```




```
[ 1] 0x191e0000 - Intel® HD Graphics 515..........(ULX GT2)
[ 2] 0x19160000 - Intel® HD Graphics 520..........(ULT GT2)
[ 3] 0x19260000 - Intel® Iris™ Graphics 550.......(ULT GT3)
[ 4] 0x191b0000 - Intel® HD Graphics 530..........(Halo GT2)
[ 5] 0x193b0000 - Intel® Iris™ Pro Graphics 580...(Halo GT4)
[ 6] 0x19120000 - Intel® HD Graphics 530..........(Desktop GT2)
[ 7] 0x19020001 - Intel® HD Graphics 510..........(Desktop GT1)
[ 8] 0x19170001 - Skylake Desktop.................(GT1.5)
[ 9] 0x19120001 - Intel® HD Graphics 530..........(Desktop GT2)
[10] 0x19320001 - Skylake Desktop.................(GT4)
[11] 0x19160002 - Intel® HD Graphics 520..........(ULT GT2)
[12] 0x19260002 - Intel® Iris™ Graphics 540.......(ULT GT3)
[13] 0x191e0003 - Intel® HD Graphics 515..........(ULX GT2)
[14] 0x19260004 - Intel® Iris™ Graphics 540.......(ULT GT3)
[15] 0x193b0005 - Intel® Iris™ Pro Graphics 580...(Halo GT4)
[16] 0x193b0006 - Intel® Iris™ Pro Graphics 580...(Halo GT4)



[ 1] : 0x191e0000 – Skylake ULX GT2
[ 2] : 0x19160000 – Skylake ULT GT2
[ 3] : 0x19260000 – Skylake ULT GT3
[ 4] : 0x191b0000 – Skylake HALO GT2
[ 5] : 0x19120000 – Skylake Desktop GT2
[ 6] : 0x19020001 – Skylake Desktop GT1 (currently inactive)
[ 7] : 0x19170001 – Skylake Desktop GT1.5 (currently inactive)
[ 8] : 0x19120001 – Skylake Desktop GT2 (currently inactive)
[ 9] : 0x19320001 – Skylake Desktop GT4 (currently inactive)
[10] : 0x19160002 – Skylake ULT GT2
[11] : 0x19260002 – Skylake ULT GT3
[12] : 0x191e0003 – Skylake ULX GT2

```


// notes for skylake dsdt and ssdt fixes
UPDATES: As of 10.11.4, Skylake HD 530 graphics are now working with full acceleration and the APIC Fix is not necessary. Skylake is now the current platform recommendation.
https://www.tonymacx86.com/threads/testing-thread-skylake-platform-in-os-x.176407/


darkwake 
https://www.tonymacx86.com/threads/important-darkwake-0-flag-can-break-auto-sleep-in-10-8-1.69714/#post447117

```
// gDarkWakeFlags
enum {
    kDarkWakeFlagHIDTickleEarly      = 0x01, // hid tickle before gfx suppression
    kDarkWakeFlagHIDTickleLate       = 0x02, // hid tickle after gfx suppression
    kDarkWakeFlagHIDTickleNone       = 0x03, // hid tickle is not posted
    kDarkWakeFlagHIDTickleMask       = 0x03,
    kDarkWakeFlagIgnoreDiskIOInDark  = 0x04, // ignore disk idle in DW
    kDarkWakeFlagIgnoreDiskIOAlways  = 0x08, // always ignore disk idle
    kDarkWakeFlagIgnoreDiskIOMask    = 0x0C,
    kDarkWakeFlagAlarmIsDark         = 0x0100
};

static uint32_t         gDarkWakeFlags = kDarkWakeFlagHIDTickleNone;
```

pmset -g assertions
 sysctl -n machdep.xcpm.mode



```
csr-active-config                       HEX     N/A     NVRAM     DTRACE     Intern     Debug     PID     FS     Kexts     clover     NVRAM

csrutil enabled    -- no internal       00      0       0         0          0          0         0       0      0         0x00       %00%00%00%00
csrutil enabled                         10      0       0         0          1          0         0       0      0         0x10       %10%00%00%00
csrutil enabled    -- withoult kext     11      0       0         0          1          0         0       0      1         0x11       %11%00%00%00
csrutil enabled    -- withoult fs       12      0       0         0          1          0         0       1      0         0x12       %12%00%00%00
csrutil enabled    -- withoult debug    14      0       0         0          1          0         1       0      0         0x14       %14%00%00%00
csrutil enabled    -- withoult dtrace   30      0       0         1          1          0         0       0      0         0x30         0%00%00%00
csrutil enabled    -- withoult nvram    50      0       1         0          1          0         0       0      0         0x50         P%00%00%00
csrutil disabled                        77      0       1         1          1          0         1       1      1         0x77         w%00%00%00
csrutil disabled   -- No Internal       67      0       1         1          0          0         1       1      1         0x67         g%00%00%00
```

black screen issue
boot with: agdp=Mac-00BE6ED71E35EB86
https://pikeralpha.wordpress.com/2016/10/11/black-screen-tip-of-the-day/


high sierra

In my experience, most OSInstall.mpkg damaged/missing errors occur on hacks with NVRAM emulation ie
 
UEFI systems with non functioning hardware NVRAM ---> use EmuVariableUefi-64 and with Clover rc scripts, generate NVRAM.plist file(s) on disk
Legacy BIOS systems use Clover rc scripts to generate NVRAM.plist file(s) on disk
 
Fix is therefore to delete EmuVariableUefi-64 (UEFI systems) or delete NVRAM.plist files from all EFI partitions, incl USB installer (for legacy BIOS systems).  I also run the terminal command sudo NVRAM -c to reset my NVRAM before installing/upgrading High Sierra on my legacy systems.
 
If you have incorrect or old FF/FFM values in your SMBIOS/config.plist, these cause the "error while verifying firmware" message.
 
The system will record the unsuccessful firmware update so that if you try to boot again to "Boot macOS Install", you'll also get a OSInstall.mpkg is damaged/missing error the second time.
 
The fix is to update to Clover r4182 and boot into the High Sierra partition again (in its un-updated state).  This automatically deletes the "tainted" /macOS\ Install\ Data folder, and then re-run the "Install macOS High Sierra Beta.app" to generate a fresh macOS Install Data folder ---> reboot.
 
Hope that clarifies :)




sleep issues

Check for current setting
```
pmset -g live
```




