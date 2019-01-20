Chrysalis Firmware Bundle
=========================

This is a collection of sketches for all the boards [Chrysalis][chrysalis]
supports. These are the "Factory Firmware" sketches Chrysalis offers to flash.
All of them are based on the layout the keyboards usually ship with, but built
with [Kaleidoscope][kaleidoscope], and with enough support for Chrysalis to
work.

 [chrysalis]: https://github.com/keyboardio/chrysalis-bundle-keyboardio
 [kaleidoscope]: https://github.com/keyboardio/Kaleidoscope

All of the experimental firmware sketches have at least the following plugins
enabled, and have five editable layers set up:

- [EEPROM-Keymap][plugin:EEPROM-Keymap]
- [EEPROM-Settings][plugin:EEPROM-Settings]
- [FocusSerial][plugin:FocusSerial]
- [MouseKeys][plugin:MouseKeys]
- [OneShot][plugin:OneShot]
- [Qukeys][plugin:Qukeys]
- [SpaceCadet][plugin:SpaceCadet]

The default firmware is kept as close to the original as possible, and only
those plugins are enabled in addition that are required for Chrysalis.

 [plugin:EEPROM-Keymap]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/EEPROM-Keymap.md#readme
 [plugin:EEPROM-Settings]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/EEPROM-Settings.md#readme
 [plugin:FocusSerial]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/FocusSerial.md#readme
 [plugin:MouseKeys]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/MouseKeys.md#readme
 [plugin:OneShot]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/OneShot.md#readme
 [plugin:Qukeys]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/Qukeys.md#readme
 [plugin:SpaceCadet]: https://github.com/keyboardio/Kaleidoscope/blob/master/doc/plugin/SpaceCadet.md#readme

Depending on the device, there may be other plugins enabled, please consult the
sources for now.
