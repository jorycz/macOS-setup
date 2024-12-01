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
./macOS/setupUsingGUI.sh ./macOS/InitialSetup/Finder.scpt
```

* See it in action on YouTube https://youtu.be/1Gs5NAhzs3M

# macOS version

* macOS 15 Sequoia

