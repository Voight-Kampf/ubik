# makefile

#
# Patches/Installs/Builds DSDT patches for Gigabyte BRIX
#
# Created by RehabMan 
#
DSLDIR=./SSDT
BUILDDIR=./build
HDA=ALC269
RESOURCES=./Resources_$(HDA)make
HDAINJECT=AppleHDA_$(HDA).kext
HDAHCDINJECT=AppleHDAHCD_$(HDA).kext
HDAZML=AppleHDA_$(HDA)_Resources

VERSION_ERA=$(shell ./tools/print_version.sh)
ifeq "$(VERSION_ERA)" "10.10-"
	INSTDIR=/System/Library/Extensions
else
	INSTDIR=/Library/Extensions
endif
SLE=/System/Library/Extensions

IASLFLAGS=-ve
IASL=./tools/iasl

ALL=$(BUILDDIR)/SSDT.aml

# for now only build SSDT-HACK.aml, not patched set
.PHONY: all
all: $(ALL) $(HDAINJECT) $(HDAHCDINJECT)

$(BUILDDIR)/SSDT.aml: $(DSLDIR)/SSDT.dsl $(DSLDIR)/SSDT-GPU.dsl $(DSLDIR)/SSDT-HDEF.dsl $(DSLDIR)/fixes/Fix_Shutdown/_PTS.dsl 
	$(IASL) $(IASLFLAGS) -p $@ $<

.PHONY: clean
clean:
	rm -f $(BUILDDIR)/*.dsl $(BUILDDIR)/*.aml
	make clean_hda

# Clover Install
.PHONY: install
install: $(ALL)
	$(eval EFIDIR:=$(shell sudo ./mount_efi.sh /))
	rm -f $(EFIDIR)/EFI/CLOVER/ACPI/patched/SSDT-*.aml $(EFIDIR)/EFI/CLOVER/ACPI/patched/SSDT.aml
	cp $(ALL) $(EFIDIR)/EFI/CLOVER/ACPI/patched

$(HDAINJECT) $(HDAHCDINJECT): $(RESOURCES)/*.plist ./patch_hda.sh
	./patch_hda.sh $(HDA)

.PHONY: clean_hda
clean_hda:
	rm -rf $(HDAHCDINJECT) $(HDAZML) # $(HDAINJECT)

.PHONY: update_kernelcache
update_kernelcache:
	sudo touch $(SLE)
	sudo kextcache -update-volume /

.PHONY: install_hdadummy
install_hdadummy:
	sudo rm -Rf $(INSTDIR)/$(HDAINJECT)
	sudo rm -Rf $(INSTDIR)/$(HDAHCDINJECT)
	sudo cp -R ./$(HDAINJECT) $(INSTDIR)
	sudo rm -f $(SLE)/AppleHDA.kext/Contents/Resources/*.zml*
	if [ "`which tag`" != "" ]; then sudo tag -a Blue $(INSTDIR)/$(HDAINJECT); fi
	make update_kernelcache

.PHONY: install_hda
install_hda:
	sudo rm -Rf $(INSTDIR)/$(HDAINJECT)
	sudo rm -Rf $(INSTDIR)/$(HDAHCDINJECT)
	#sudo cp -R ./$(HDAHCDINJECT) $(INSTDIR)
	#if [ "`which tag`" != "" ]; then sudo tag -a Blue $(INSTDIR)/$(HDAHCDINJECT); fi
	sudo cp $(HDAZML)/*.zml* $(SLE)/AppleHDA.kext/Contents/Resources
	if [ "`which tag`" != "" ]; then sudo tag -a Blue $(SLE)/AppleHDA.kext/Contents/Resources/*.zml*; fi
	make update_kernelcache
