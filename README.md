## Overlayroot File-System (or OverlayFS) for Jetson
Tested on:
| JetPack Version | Jetson Module Type   | Carrier Board | Test Result |
|-----------------|----------------------|---------------|-------------|
| JetPack-6.1     | Jetson Orin Nano 4GB | DSBOARD-ORNX  | Passed      |
| JetPack-6.0     | Jetson Orin Nano 4GB | DSBOARD-ORNX  | **FAILED**  |
| JetPack-4.6.6   | Jetson TX2 NX        | DSBOARD-NX2   | Passed      |
| JetPack-4.6.6   | Jetson Nano          | DSBOARD-NX2   | Passed      |
| JetPack-4.6.3   | Jetson Nano          | DSBOARD-NX2   | Passed      |
| JetPack-4.6.1   | Jetson TX2 NX        | DSBOARD-NX2   | Passed      |
| JetPack-4.6     | Jetson AGX Xavier    | DSBOARD-XV2   | Passed      |
| JetPack-4.5.1   | Jetson TX2 NX        | DSBOARD-NX2   | Passed      |

### Setup
```
$ sudo apt update
$ sudo ./setup.sh
```

### Enabling the Overlayroot File-System (or OverlayFS)
```
$ sudo ./enable_overlayroot.sh
$ reboot
```

### Disabling the Overlayroot File-System (or OverlayFS)
```
$ sudo ./disable_overlayroot.sh
$ reboot
```

