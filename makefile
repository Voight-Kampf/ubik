

# kexts
LILUDEBUGKEXT = kexts/Lilu/build/Debug/Lilu.kext
LILUKEXT = kexts/Lilu/build/Release/Lilu.kext
APPLEALCKEXT = kexts/AppleALC/build/Release/AppleALC.kext
IGPFIXKEXT = kexts/intelGraphicsFixup/build/Release/intelGraphicsFixup.kext
NVIDIAFIXKEXT = kexts/NvidiaGraphicsFixup/build/Release/NvidiaGraphicsFixup.kext
SHIKIKEXT = kexts/Shiki/build/Release/Shiki.kext
COREDISPLAYFIXUPKEXT = kexts/CoreDisplayFixup/build/Release/CoreDisplayFixup.kext
IMAC = kexts/iMac/iMac.kext


FakePCIID = kexts/OS-X-Fake-PCI-ID/build/FakePCIID.kext
FakePCIIDWIFI =	kexts/OS-X-Fake-PCI-ID/build/FakePCIID_Broadcom_WiFi.kext


# make rehabman projects
CODE_DIR = kexts/OS-X-Fake-PCI-ID


#.PHONY: kexts


lilu :
	xcodebuild -project kexts/Lilu/Lilu.xcodeproj -configuration Debug
	xcodebuild -project kexts/Lilu/Lilu.xcodeproj -configuration Release

copyliludebug :
	cp -r ${LILUDEBUGKEXT} kexts/AppleALC/Lilu.kext
	cp -r ${LILUDEBUGKEXT} kexts/Shiki/Lilu.kext
	cp -r ${LILUDEBUGKEXT} kexts/intelGraphicsFixup/Lilu.kext
	cp -r ${LILUDEBUGKEXT} kexts/NvidiaGraphicsFixup/Lilu.kext
	cp -r ${LILUDEBUGKEXT} kexts/CoreDisplayFixup/Lilu.kext
	
pack :
	cp -r ${LILUKEXT} build/
	cp -r ${NVIDIAFIXKEXT} build/
	cp -r ${APPLEALCKEXT} build/
	
	# cp -r ${IGPFIXKEXT} build/
	
	cp -r ${SHIKIKEXT} build/
	cp -r ${IMAC} build/
	
	cp -r ${FakePCIID} build/
	cp -r ${FakePCIIDWIFI} build/
	
	cp -r ${COREDISPLAYFIXUPKEXT} build/






kexts : $(LILUDEBUGKEXT) copyliludebug
	xcodebuild -project kexts/AppleALC/AppleALC.xcodeproj -configuration Release
	xcodebuild -project kexts/intelGraphicsFixup/intelGraphicsFixup.xcodeproj -configuration Release
	xcodebuild -project kexts/NvidiaGraphicsFixup/NvidiaGraphicsFixup.xcodeproj -configuration Release
	xcodebuild -project kexts/Shiki/Shiki.xcodeproj -configuration Release
	xcodebuild -project kexts/CoreDisplayFixup/CoreDisplayFixup.xcodeproj -configuration Release
	$(MAKE) -C $(CODE_DIR)

all: kexts pack
	

.PHONY: clean

clean :
	rm -r kexts/Shiki/Lilu.kext
	rm -r kexts/AppleALC/Lilu.kext
	rm -r kexts/intelGraphicsFixup/Lilu.kext
	rm -r kexts/NvidiaGraphicsFixup/Lilu.kext
	rm -r kexts/Shiki/Lilu.kext
	
	rm -r kexts/Shiki/build
	rm -r kexts/AppleALC/build
	rm -r kexts/Lilu/build
	rm -r kexts/intelGraphicsFixup/build
	rm -r kexts/NvidiaGraphicsFixup/build
	
	rm -r build/*



#.PHONY: fakepcid
#fakepcid:
#	$(MAKE) -C $(CODE_DIR)






