## Overlayroot File-System for Jetson
Tested on:
| JetPack Version | Jetson Module Type | Carrier Board |
|-----------------|--------------------|---------------|
| JetPack-4.6.6   | Jetson TX2 NX      | DSBOARD-NX2   |
| JetPack-4.6.6   | Jetson Nano        | DSBOARD-NX2   |
| JetPack-4.6.3   | Jetson Nano        | DSBOARD-NX2   |
| JetPack-4.6.1   | Jetson TX2 NX      | DSBOARD-NX2   |
| JetPack-4.6     | Jetson AGX Xavier  | DSBOARD-XV2   |
| JetPack-4.5.1   | Jetson TX2 NX      | DSBOARD-NX2   |

### Setup
```
$ sudo apt update
$ sudo ./setup.sh
```

### Enabling the Overlayroot File-System
```
$ sudo ./enable_overlayroot.sh
$ reboot
```

### Disabling the Overlayroot File-System
```
$ sudo ./disable_overlayroot.sh
$ reboot
```

