# Debugging

Connect your machine to the board using debug USB cable.

Accessing the Morello console to
troubleshoot/reboot/shutdown: https://ctsrd-cheri.github.io/cheribsd-getting-started/morello-console/index.html

Currently, ace is connected to `tegan.dos.cit.tum.de`. On tegan, run the following commands.
Please note that the exact tty device may vary, depending on which other machines are connected.

```shell
sudo tio /dev/ttyUSB0
# press enter to see if you're on the correct device
# if you are, you should see something like "Cmd>"
? # for help
REBOOT
```

Usually, `ttyUSB0` serves as the M1SDP MCC console, which allows you to
perform tasks like rebooting. On the other hand, `ttyUSB2` is the console
for the application processor, used to access the bootloader or log in.

