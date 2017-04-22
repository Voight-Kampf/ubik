/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLekU7LJ.aml, Sat Apr 22 23:04:23 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000154 (340)
 *     Revision         0x01
 *     Checksum         0x0E
 *     OEM ID           "toleda"
 *     OEM Table ID     "amihdas1"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140926 (538183974)
 */

// zzz

DefinitionBlock ("", "SSDT", 1, "toleda", "amihdas1", 0x00003000)
{
    External (_SB_.PCI0, DeviceObj)    // Warning: Unknown object
    External (_SB_.PCI0.HDAS._ADR, UnknownObj)    // Warning: Unknown object

    Scope (\_SB.PCI0)
    {
        Device (HDEF)
        {
            Name (_ADR, 0x001F0003)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, \_SB.PCI0.HDAS._ADR)
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    0x05
                })
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x0C)
                {
                    "AAPL,slot-name", 
                    Buffer (0x09)
                    {
                        "Built in"
                    }, 

                    "layout-id", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00 // layout id 1
                    }, 

                    "device_type", 
                    Buffer (0x11)
                    {
                        "Audio Controller"
                    }, 

                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                           
                    }, 

                    "PinConfigurations", 
                    Buffer (Zero) {}, 
                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                })
            }
        }
    }

    Store ("ssdt-ami_100_hdas-hdef_audio_to_hdef-1_v1.0 github.com/toleda", Debug)
}

