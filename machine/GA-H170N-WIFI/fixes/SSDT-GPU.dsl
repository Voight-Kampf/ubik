/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLWf8PRC.aml, Sat Apr  8 23:16:15 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000BA (186)
 *     Revision         0x01
 *     Checksum         0x54
 *     OEM ID           "shiloh"
 *     OEM Table ID     "GFX1"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100331 (537920305)
 */

// PEGP@0
/*
// // original code from clover ssdt
_SB.PCI0.PEG0

    //
            Device (PEG0)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }

                Device (PEGP)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }
*/

DefinitionBlock ("", "SSDT", 1, "shiloh", "GFX1", 0x00001000)
{
    Device (\_SB.PCI0.PEG0.GFX1)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_SUN, One)  // _SUN: Slot User Number
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    Device (\_SB.PCI0.PEG0.HDAU)
    {
        Name (_ADR, One)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
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
                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }
    Name (\_SB_.PCI0.PEG0.PEGP._STA, Zero)
}

