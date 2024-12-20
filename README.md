# macOS setup

* install git, clone, run initial, reboot, run afterReboot and let all apps sync

```
### Clone private repository (note only for me - not needed in general)

xcode-select --install
git clone https://github.com/jorycz/macOS-setup
cd macOS-setup
./initialSetup.sh

### REBOOT

./afterRebootSetup.sh
```

In case you need to run one Apple Script, run:
```
./macOS/guiSetup.sh ./macOS/InitialSetup/Finder.applescript
```

* See it in action on YouTube https://youtu.be/NtREW4gOSgs

# macOS version

* macOS 15 Sequoia

