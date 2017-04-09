DefinitionBlock ("SSDT-USB.aml", "SSDT", 1, "sample", "USBFix", 0x00003000)
{
    // "USBInjectAllConfiguration" : override for USBInjectAll.kext
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        // "RehabManConfiguration"
        Name(RMCF, Package()
        {
            // XHC overrides for 100-series boards
            "8086_a12f", Package()
            {
                "port-count", Buffer() { 0x17, 0, 0, 0}, // Highest port number is SS07 at 0x17
                "ports", Package()
                {
                    "HS01", Package() // USB2 device on port #1 from USB3 motherboard header, port <01 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x01, 0, 0, 0 },
                    },
                    "HS02", Package() // USB2 device on port #2 from USB3 motherboard header, port <02 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x02, 0, 0, 0 },
                    },
                    "HS03", Package() // USB2 device on USB3 port between type-C and optical out, port <03 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x03, 0, 0, 0 },
                    },
                    "HS04", Package() // USB2 device on USB3 port under i219V Ethernet jack, port <04 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x04, 0, 0, 0 },
                    },
                    "HS05", Package() // USB2 device on USB3 port next to DVI, port <05 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x05, 0, 0, 0 },
                    },
                    "HS06", Package() // USB2 device on USB3 port closest to PS/2, port <06 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x06, 0, 0, 0 },
                    },
                    "HS07", Package() // USB2 device on USB3 Type C port, port <07 00 00 00>
                    {
                        "UsbConnector", 10,
                        "port", Buffer() { 0x07, 0, 0, 0 },
                    },
                    "HS08", Package() // USB2 for m.2 wireless Bluetooth features, port <08 00 00 00>
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 0x08, 0, 0, 0 },
                    },
                    "HS09", Package() // USB2 #1 from USB2 motherboard header, port <09 00 00 00>
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x09, 0, 0, 0 },
                    },
                    "HS10", Package() // USB2 #2 from USB2 motherboard header, port <0a 00 00 00>
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x0a, 0, 0, 0 },
                    },
                    "SS01", Package() // USB3 #1 from USB3 motherboard header, port <11 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x11, 0, 0, 0 },
                    },
                    "SS02", Package() // USB3 #2 from USB3 motherboard header, port <12 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x12, 0, 0, 0 },
                    },
                    "SS03", Package() // USB3 between Type C port and optical out, port <13 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x13, 0, 0, 0 },
                    },
                    "SS04", Package() // USB3 under i219V Ethernet jack, port <14 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x14, 0, 0, 0 },
                    },
                    "SS05", Package() // USB3 next to DVI, port <15 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x15, 0, 0, 0 },
                    },
                    "SS06", Package() // USB3 closest to PS/2, port <16 00 00 00>
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x16, 0, 0, 0 },
                    },
                    "SS07", Package() // USB3 Type C port, port <17 00 00 00>
                    {
                        "UsbConnector", 10,
                        "port", Buffer() { 0x17, 0, 0, 0 },
                    },
                },
            },
        })
    }
}