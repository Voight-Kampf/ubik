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




