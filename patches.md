
```
working on high sierra and smbios iMac18,3:
Name: com.apple.driver.AppleGraphicsDevicePolicy
Comment: Disable board-id check to prevent no signal (c) lvs1974, Pike R. Alpha, vit9696, modifications by PMheart
Find: BA05000000
Replace: 33D2909090
MatchOS: 10.9.3,10.9.4,10.9.5,10.10.x,10.11.x,10.12.x,10.13.x
```
```
<dict>
	<key>Comment</key>
	<string>Disable board-id check to prevent no signal (c) lvs1974, Pike R. Alpha, vit9696, modifications by PMheart</string>
	<key>Disabled</key>
	<false/>
	<key>Find</key>
	<data>
	ugUAAAA=
	</data>
	<key>Name</key>
	<string>AppleGraphicsDevicePolicy</string>
	<key>Replace</key>
	<data>
	M9KQkJA=
	</data>
</dict>
```

```
dunno if this is working or not
https://www.tonymacx86.com/threads/the-perfect-customac-pro-macos-high-sierra-10-13-on-x99-full-success.227001/#post-1542618
com.apple.driver.AppleGraphicsDevicePolicy      
ba050000 00      
ba000000 00      

Disable board-id check to prevent no signal © lvs1974, Pike R. Alpha, vit9696
```




broadcom wifi patch
```
<dict>
	<key>Comment</key>
	<string>AirPortBrcm4360 - fcvo</string>
	<key>Disabled</key>
	<false/>
	<key>Find</key>
	<data>
	gflSqgAAdSk=
	</data>
	<key>Name</key>
	<string>AirPortBrcm4360</string>
	<key>Replace</key>
	<data>
	gflSqgAAZpA=
	</data>
	</dict>
<dict>
```
