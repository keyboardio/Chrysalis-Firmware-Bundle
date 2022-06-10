Chrysalis Firmware Bundle
=========================

This is a collection of sketches for all the boards [Chrysalis][chrysalis]
supports. These are the "Factory Firmware" sketches Chrysalis offers to flash.
All of them are based on the layout the keyboards usually ship with, but built
with [Kaleidoscope][kaleidoscope], and with enough support for Chrysalis to
work.

 [chrysalis]: https://github.com/keyboardio/chrysalis-bundle-keyboardio
 [kaleidoscope]: https://github.com/keyboardio/Kaleidoscope

While all sketches try to follow the original firmware each particular keyboard
came with, they have additional - non-intrusive - plugins enabled, whenever
circumstances permit.

To get a list of plugins used by each firmware, run the
`tools/collect-build-info` script, which will create a file called
`output/build-info.yml`, which in turn will contain the plugin list per
keyboard.

For guidelines about how we build these sketches, which plugins we enable, and
so on, have a look at the [Chrysalis-enalbed
Firmware](docs/chrysalis-enabled-firmware.md) documentation.
