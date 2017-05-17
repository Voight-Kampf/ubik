/*
 * _PTS
 * fix shutdown 0004
 */
/*
A condition is added to method _PTS: if the argument is 5 (shutdown), 
then no other actions shall be performed. Many reports confirmed this option 
to fix shutdown issues with ASUS boards, maybe even with other vendors. 
Some DSDT tables already contain such a condition and it is advised to turn the fix off in this case.
*/

// https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/885f51aa3db921f1c8c24eaa076e4ccd469c8c3b/hotpatch/config.plist

// shutdown fix for GA-H170N-WIFI
// ASCII: _PTS |     HEX: 5F 50 54 53 01    DECIMAL: 95 80 84 83 1    base64: X1BUUwE=
//        ZPTS |                                                              WlBUUwk=
// note, than you have to rename the original _PTS method name in DSDT if you use this

// http://www.insanelymac.com/forum/topic/302236-yosemite-fails-to-wake-from-sleep/page-2


// sleep shutdown fix for H170N-WIFI
External (\_SB.TPM.TPTS, MethodObj)                 // 1 Arguments
External (\_SB.PCI0.LPCB.SIO1.SIOS, MethodObj)      // 1 Arguments
External (\_SB.PCI0.LPCB.SPTS, MethodObj)           // 1 Arguments
External (\_SB.PCI0.NPTS, MethodObj)                // 1 Arguments
External (RPTS, MethodObj)                          // 1 Arguments

// reference to original _PTS renamed with clover
// External(ZPTS, MethodObj)
// for calling into original _PTS method when required
//        ZPTS(Arg0)

Method (_PTS, 1, NotSerialized)                     // _PTS: Prepare To Sleep
{
    If (LEqual (Arg0, 0x05))
    {
        // do nothing, Shutdown
        // Return (Zero)
    }
    ElseIf (Arg0)
    {
        \_SB.TPM.TPTS (Arg0)
        \_SB.PCI0.LPCB.SIO1.SIOS (Arg0)
        \_SB.PCI0.LPCB.SPTS (Arg0)
        \_SB.PCI0.NPTS (Arg0)
        RPTS (Arg0)
    }
}
// sleep shutdown fix
