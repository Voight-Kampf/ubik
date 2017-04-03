LILUDEBUGKEXT = extensions/Lilu/build/Debug/Lilu.kext
LILUKEXT = extensions/Lilu/build/Release/Lilu.kext
APPLEALCKEXT = extensions/AppleALC/build/Release/AppleALC.kext
IGPFIXKEXT = extensions/intelGraphicsFixup/build/Release/intelGraphicsFixup.kext
NVIDIAFIXKEXT = extensions/NvidiaGraphicsFixup/build/Release/NvidiaGraphicsFixup.kext
SHIKIKEXT = extensions/Shiki/build/Release/Shiki.kext

#.PHONY: kexts


lilu :
	xcodebuild -project extensions/Lilu/Lilu.xcodeproj -configuration Debug
	xcodebuild -project extensions/Lilu/Lilu.xcodeproj -configuration Release

copyliludebug :
	cp -r ${LILUDEBUGKEXT} extensions/AppleALC/Lilu.kext
	cp -r ${LILUDEBUGKEXT} extensions/Shiki/Lilu.kext
	cp -r ${LILUDEBUGKEXT} extensions/intelGraphicsFixup/Lilu.kext
	cp -r ${LILUDEBUGKEXT} extensions/NvidiaGraphicsFixup/Lilu.kext
	
pack :
	cp -r ${LILUKEXT} build/
	cp -r ${LILUKEXT}.dSYM build/
	
	cp -r ${APPLEALCKEXT} build/
	cp -r ${APPLEALCKEXT}.dSYM build/
	
	cp -r ${IGPFIXKEXT} build/
	cp -r ${IGPFIXKEXT}.dSYM build/
	
	cp -r ${NVIDIAFIXKEXT} build/
	cp -r ${NVIDIAFIXKEXT}.dSYM build/
	
	cp -r ${SHIKIKEXT} build/
	cp -r ${SHIKIKEXT}.dSYM build/

kexts : $(LILUDEBUGKEXT) copyliludebug
	xcodebuild -project extensions/AppleALC/AppleALC.xcodeproj -configuration Release
	xcodebuild -project extensions/intelGraphicsFixup/intelGraphicsFixup.xcodeproj -configuration Release
	xcodebuild -project extensions/NvidiaGraphicsFixup/NvidiaGraphicsFixup.xcodeproj -configuration Release
	xcodebuild -project extensions/Shiki/Shiki.xcodeproj -configuration Release

all: kexts pack
	

.PHONY: clean

clean :
	rm -r extensions/Shiki/Lilu.kext
	rm -r extensions/AppleALC/Lilu.kext
	rm -r extensions/intelGraphicsFixup/Lilu.kext
	rm -r extensions/NvidiaGraphicsFixup/Lilu.kext
	rm -r extensions/Shiki/Lilu.kext
	
	rm -r extensions/Shiki/build
	rm -r extensions/AppleALC/build
	rm -r extensions/Lilu/build
	rm -r extensions/intelGraphicsFixup/build
	rm -r extensions/NvidiaGraphicsFixup/build
	
	rm -r build/*
