Chrysalis-Firmware-Bundle 0.92.7
================================
Released on 2025-07-08

The first Chrysalis firmware bundle with Preonic firmware. (And a variety of general Kaleidoscope bugfixes)

Chrysalis-Firmware-Bundle 0.92.6
================================
Released on 2024-03-08

Thanks to Nabi Yang, we caught another case that the previous bugfixes
didn't address. 0.92.5 and earlier could, after a "factory reset"
result in some settings (including mouse keys and sticky keys) to default
to incorrect values. After this update, you may need to either change your
'sticky keys' and 'mouse keys' settings in Chrysalis' preferences or 
(if you'd prefer) do a 'factory reset' on your keyboard to return those
settings to their default values.  If you need a hand, please don't hesitate
to reach out to us at help@keyboard.io.

Chrysalis-Firmware-Bundle 0.92.5
================================
Released on 2024-03-07

This release is, somewhat embarassingly, a bugfix to the bugfix. 
0.92.3 and 0.92.4 had trouble loading your on-keyboard settings
after a reboot or after you disconnected and reconnected your keyboard.

This could manifest as things like the "Space Cadet Shift" function
mysteriously turning back on or other plugin changes not persisting.


Chrysalis-Firmware-Bundle 0.92.4
================================
Released on 2024-03-06


0.92.3 introduced regressions that may have set your LED brightness to
0 upon upgrade and may have unintentionally enabled the "SpaceCadet"
shift mode (where your shift keys will generate ( and ) when tapped.

0.92.4 better protects against these issues, but you may need to 
use Chrysalis' "My Keyboard" settings to change those preferences to you
preferred settings if you updated to 0.92.3.


Chrysalis-Firmware-Bundle 0.92.3
================================
Released on 2024-03-04

Numerous fixes for error-checking issues that could cause a keyboard
to lock up if invalid configuration data ended up in on-device storage.

Updates to our USB device descriptor configuration from Taylor Yu
<code@argon.blue>


Chrysalis-Firmware-Bundle 0.92.2
================================
Released on 2024-02-29

If on-device storage was corruported, DynamicMacros could loop 
forever while calculating macro metadata, making the keyboard 
unusable.

Switch to a hybrid keyboard report format, which @tlyu has built
out and several end users have tested as performing better on a
variety of temperamental operating systems that don't support NKRO.

Adjust USBQuirks to switch between always Boot Protocol and the
hybrid report.

Bugfixes for the 'Prefix Layer' functionality from iliana etaoin.

A bugfix to the Stalker LED effect that keeps the LED bright 
while a key is held from Bart Nagel.

Small memory optimizations in the Macros system

Internal changes which shouldn't be visible to users flashing
updated firmware from Chrysalis.

Bugfixes for ZLP flow control in serial communcations on AVR based 
keyboards like the Model 01 and Atreus from Taylor Yu
<code@argon.blue>

Chrysalis-Firmware-Bundle 0.92.1
================================
Released 2023-12-18


Kaleidoscope has a new "ActiveLayerKeys" plugin from Evy Bongers
<evy@evybongers.nl>

USB protocol Fixes for both AVR-based and GD32-based keyboards that
may eliminate "communications timeout" issues when talking to
Chrysalis from Taylor Yu <code@argon.blue>

Remove the Focus Serial XON/XOFF flow-control that turns out to not
help in the way we thought it did.

Discontinued new firmware builds for non-Keyboardio keyboards. These
builds were untested and unsupported. If you're an active user of
one of these builds and are interested in providing ongoing support
for them, please get in touch with jesse@keyboard.io


Chrysalis-Firmware-Bundle 0.92.0
================================
Released on 2023-08-25 (then pulled and later republished)

The big changes in this release are robustness improvements to the
Focus protocol that lets your keyboard talk to Chrysalis. These
changes include the addition of XON/XOFF flow control and fixes for
a few parsing issues that could cause protocol deadlocks leading
to the dreaded "Communications timeout" error.


Chrysalis-Firmware-Bundle 0.91.1
================================
Released on 2023-05-05

This release brings a large set of bugfixes, for every keyboard. Upgrading is
highly recommended.

A number of fixes were implemented to make Kaleidoscope-powered keyboards work
better with some UEFIs and BIOSes, and to conform to the HID specification more
closely. This should make the keyboards work in - hopefully - all BIOSes and
UEFIs, and other situations where N-key rollover isn't usable.

Also fixed an issue where events were occasionally dropped when using secondary
actions, causing all kinds of weird issues, including - but not limited to -
stuck keys.

During Macro playback, OneShot keys are no longer released prematurely.

Improved how locked and shifted layers interact, making it possible to put a
lock layer key on a layer that is accessed by a momentary layer shift (as
opposed to a layer lock or toggle). Previously, toggling the locked layer on
worked, but it couldn't be toggled off with a single tap, because the shifted
layer would be on top when the locked one was enabled. This now works properly,
and the locked layer can be toggled off with a single tap.

Keyboardio Model 100
--------------------

Rearranged the order of plugins, so that SpaceCadet and secondary actions play
nicely together.

Chrysalis-Firmware-Bundle 0.91.0
================================
Released on 2022-10-26

Keyboardio Model 100
--------------------

A number of firmware fixes have been implemented that attempt to mitigate
Windows issues with missing or held keystrokes after a resume event.

Keyboardio Atreus
-----------------

The firmware now correctly sets up the desired `SpaceCadet` mode, and no longer
forces it off every time it is plugged in.

Chrysalis-Firmware-Bundle 0.90.6
================================
Released on 2022-10-22

Keyboardio Model 100 & Model 01
-------------------------------

When the host is going to sleep, turn the LEDs off. Previously, we only turned
them off when the host was going through the suspended state, which *should*
have been enough to turn them off on sleep too, but it wasn't. Now we explicitly
turn it off during sleep too, just in case.

Keyboardio Model 100
--------------------

Enabled the `OneShotConfig` plugin, which will let a future version of Chrysalis
configure a number of settings related to the `OneShot` plugin, which implements
the Sticky keys.

The `LEDBrightnessConfig` plugin was also enabled, allowing Chrysalis to aid you
in controlling the brightness of the LEDs present on the keyboard.

The brightness of the rainbow LED effects were toned down a little, to mitigate
the audible whine from the keyboard some users have been reporting.

The `MouseKeysConfig` plugin received updates, and it now lets you configure the
Warp grid size through Chrysalis.

Keyboardio Atreus
-----------------

Enabled the `SpaceCadetConfig`, `MouseKeysConfig`, and `OneShotConfig` plugins.
With these enabled, Chrysalis is able to turn SpaceCadet on and off, configure
mouse key speeds, and various sticky key related settings.

Chrysalis-Firmware-Bundle 0.90.5
================================
Released on 2022-10-09

Keyboardio Model 100
--------------------

We have enabled the `MouseKeysConfig` plugin in the default firmware, which will
allow Chrysalis to configure the plugin. At the time of this writing, Chrysalis
can't do it yet, but the firmware will be ready for it once it does.

The keyboard is now able to wake up a sleeping computer too.

Chrysalis-Firmware-Bundle 0.90.4
================================
Released on 2022-10-08

There are two major changes in this release, both of them affecting every
keyboard, and both of them aimed at improving existing functionality, making
them more straightforward to use.

The first big change is a complete rewrite of the MouseKeys system. With the new
code, mouse cursor movement is smoother, and easier to configure. The
configuration is not yet exposed to Chrysalis by the default firmware, that will
be coming in a later update. But the improved behaviour of mouse keys are
already here.

The other one is a change to the layer switching logic: layer key handling has
been updated to be more consistent with activation ordering. While in most cases
there will be no obvious differences, there will be subtle - or not so subtle -
differences in how the firmware handles edge cases. For more information about
these changes, see the [official documentation][docs:layer-changes].

 [docs:layer-changes]: https://kaleidoscope.readthedocs.io/en/latest/NEWS.html#layer-changes-updated

Chrysalis-Firmware-Bundle 0.90.3
================================
Released on 2022-10-03

Keyboardio Model 100
--------------------

The firmware now correctly recognizes when the host is suspended or goes to
sleep, and will turn LEDs off accordingly.

Chrysalis-Firmware-Bundle 0.90.2
================================
Released on 2022-09-28

Keyboardio Model 100
--------------------

Fixed a bug that prevented SpaceCadet from functioning properly. Once enabled
(either via Chrysalis, or the SpaceCadet On key), it will now work as expected
when tapped, and input the appropriate parenthesis.

The LEDs now have gamma correction applied to them, to make the color
distribution smoother.

Chrysalis-Firmware-Bundle 0.90.1
================================
Released on 2022-09-24

We have fixed a bug in the Arduino core used by the Keyboardio Model 100 which
often led to data loss and/or data corruption when using the keyboard with
Chrysalis.

Keyboardio Model 100 owners are highly encouraged to upgrade to this version.
Other keyboards are unaffected.

Chrysalis-Firmware-Bundle 0.90.0
================================
Released on 2022-09-23

We are decoupling the firmware version from Chrysalis, to make it more
straightforward to update them independently of each other. As such, the
firmware version has been bumped to 0.90.0.

Bugfixes
--------

We fixed a bug in the `LayerNames` plugin that would lead to data corruption
when setting custom layer names with Chrysalis. Even if not using custom layer
names, we strongly recommend upgrading your firmware if you are using the
Keyboardio Model 100, or the Keyboardio Atreus (where the plugin is enabled).

Keyboardio Model 100
--------------------

The Keyboardio Model 100 firmware had the following plugins added:

- [DefaultLEDModeConfig][plugin:default-led-mode-config], which lets Chrysalis
  configure a default LED mode for the keyboard to start up with.
- [Steno][plugin:steno], making it possible to create a Steno layer via
  Chrysalis, and use it with [Plover][plover].
- [SpaceCadetConfig][plugin:spacecadet], that makes it possible to permanently
  enable the SpaceCadet feature via Chrysalis, making it practical to use the
  plugin which has been included with the firmware for a while.

 [plugin:default-led-mode-config]: https://kaleidoscope.readthedocs.io/en/latest/plugins/Kaleidoscope-DefaultLEDModeConfig.html
 [plugin:steno]: https://kaleidoscope.readthedocs.io/en/latest/plugins/Kaleidoscope-Steno.html
 [plover]: https://www.openstenoproject.org/plover/
 [plugin:spacecadet]: https://kaleidoscope.readthedocs.io/en/latest/plugins/Kaleidoscope-SpaceCadet.html

Chrysalis-Firmware-Bundle 0.11.1
================================
Released on 2022-09-09

No changes in the sketches themselves, but all of them have been rebuilt with
current Kaleidoscope.

Known issues
------------

We are aware of an as of yet unsolved issue with the Model 100 firmware, where
sending data over Focus to it too fast can result in the keyboard locking up,
and becoming unresponsive. Chrysalis 0.11.1 has a workaround for this, but
saving anything to the keyboard will be a substantially longer process than
necessary.

Chrysalis-Firmware-Bundle 0.11.0
================================
Released on 2022-07-28

Keyboardio Model 100 & Atreus
-----------------------------

The Keyboardio Model 100 and Atreus firmwares now ships with the `LayerNames`
plugin enabled, allowing Chrysalis to set custom layer names.

**NOTE**: In case of the Keyboardio Atreus, this required us to reduce the
number of layers in the default firmware from 10 to 9, to free up some EEPROM
space. This is a breaking change.

Keyboardio Model 100
--------------------

The Arduino Core underpinning the Model 100 firmware has been updated to a new
version, which further improves its serial communication. Model 100 owners are
encouraged to upgrade their firmware.

Chrysalis-Firmware-Bundle 0.10.4
================================
Released on 2022-07-07

We have fixed a bug in the Arduino core used by the Keyboardio Model 100, which
could result in high-speed serial traffic completely locking up the keyboard to
the point of it needing a reboot. This deadlock has been observed during normal
use of Chrysalis, too.

A bug in the Keyboardio Atreus firmware, which made it try to allocate more
storage space than what is available, has also been fixed. The bug manifested
itself in Chrysalis accidentally overwriting the first 32 keys of the first
layer upon saving an updated keymap. We fixed the issue by decreasing the amount
of space reserved for Dynamic Macros from 128 bytes to 48.

Keyboardio Model 100 and Atreus owners are strongly encouraged to upgrade their
firmware. Other keyboards are not affected.

Chrysalis-Firmware-Bundle 0.10.3
================================
Released on 2022-07-06

In this release, we're shipping one firmware per keyboard only. The former
"default" and "experimental" distinction is gone. In the new versions, the goal
was to be a strict superset of the former default firmware, and in most cases,
that goal has been achieved. In most cases, the new sketches are closer to the
former "experimental" ones, too, as far as included functionality goes.

There have been cases (like in the case of the Keyboardio Model 01), where we
could not enable all the plugins the former "experimental" firmware had, due to
firmware size limitations, and our primary goal of not removing features
compared to the former default sketches.

On top of the reorganization, the firmware will now switch to the default layer
(if any has been configured) when the keyboard starts up. A new Focus command
(`version`) was also added to the sketches, which allows Chrysalis to query the
version of the firmware running on the keyboard.

For a full comparison for every keyboard, see the tables listing and comparing
plugins enabled in each firmware below.

Keyboardio Model100
-------------------

| Plugin                 | current | default | experimental |
|------------------------|---------|---------|--------------|
| Colormap               | ✔       | ✔       | ✔            |
| DynamicMacros          | ✔       | ✔       | ✔            |
| EEPROMSettings         | ✔       | ✔       | ✔            |
| EEPROMKeymap           | ✔       | ✔       | ✔            |
| FocusSerial            | ✔       | ✔       | ✔            |
| HardwareTestMode       | ✔       | ✔       | ✔            |
| HostPowerManagement    | ✔       | ✔       | ✔            |
| IdleLEDs               | ✔       | ✔       | ✔            |
| LEDControl             | ✔       | ✔       | ✔            |
| LED-AlphaSquare        | ✔       | ✔       | ✔            |
| LED-Stalker            | ✔       | ✔       | ✔            |
| LEDEffect-BootGreeting | ✔       | ✔       | ✔            |
| LEDEffect-Breathe      | ✔       | ✔       | ✔            |
| LEDEffect-Chase        | ✔       | ✔       | ✔            |
| LEDEffect-Rainbow      | ✔       | ✔       | ✔            |
| LEDEffect-SolidColor   | ✔       | ✔       | ✔            |
| LEDPaletteTheme        | ✔       | ✔       | ✔            |
| Macros                 | ✔       | ✔       | ✔            |
| MagicCombos            | ✔       | ✔       | ✔            |
| MouseKeys              | ✔       | ✔       | ✔            |
| NumPad                 | ✔       | ✔       | ✔            |
| OneShot                | ✔       | ✔       | ✔            |
| Qukeys                 | ✔       | ✔       | ✔            |
| SpaceCadet             | ✔       | :x:     | ✔            |
| USBQuirks              | ✔       | ✔       | ✔            |

In the current firmware, there's enough space reserved for 5 layers (both for
the keymap, and for colormap), and 1024 bytes for Dynamic Macros.

Additionally, pressing `Left Fn + Prog + Esc` together will now toggle between
the built-in and custom keymaps.

Keyboardio Model01
------------------

| Plugin                 | current | default | experimental |
|------------------------|---------|---------|--------------|
| Colormap               | ✔       | ✔       | ✔            |
| DynamicMacros          | ✔       | :x:     | :x:          |
| EEPROMSettings         | ✔       | ✔       | ✔            |
| EEPROMKeymap           | ✔       | ✔       | ✔            |
| FocusSerial            | ✔       | ✔       | ✔            |
| HardwareTestMode       | ✔       | ✔       | :x:          |
| HostPowerManagement    | ✔       | ✔       | ✔            |
| LEDControl             | ✔       | ✔       | ✔            |
| LED-ActiveModColor     | :x:     | :x:     | ✔            |
| LED-AlphaSquare        | :x:     | ✔       | :x:          |
| LED-Stalker            | :x:     | ✔       | :x:          |
| LEDEffect-BootGreeting | ✔       | ✔       | :x:          |
| LEDEffect-Breathe      | ✔       | ✔       | :x:          |
| LEDEffect-Chase        | ✔       | ✔       | :x:          |
| LEDEffect-Rainbow      | ✔       | ✔       | (partial)    |
| LEDEffect-SolidColor   | ✔       | ✔       | :x:          |
| LEDPaletteTheme        | ✔       | ✔       | ✔            |
| Macros                 | ✔       | ✔       | ✔            |
| MagicCombos            | ✔       | ✔       | ✔            |
| MouseKeys              | ✔       | ✔       | ✔            |
| NumPad                 | ✔       | ✔       | :x:          |
| OneShot                | ✔       | :x:     | ✔            |
| Qukeys                 | ✔       | :x:     | ✔            |
| SpaceCadet             | ✔       | :x:     | :x:          |
| USBQuirks              | ✔       | ✔       | ✔            |

The Model01 firmware had a number of plugins enabled in the former
"experimental" sketch which we can no longer include, due to limitations in
firmware size. Previously, we could only do so by not including plugins that
were present in the default firmware.

As we strive to be a strict superset of the default, we can no longer remove a
substantial amount of plugins to make space for others.

With that said, compared to the former default firmware, our current one does
not include `AlphaSquare` and `LEDStalker` plugins, because while they were
pretty, they did not add much functionality, and we deemed `Qukeys` and
`DynamicMacros` more important to have.

The current firmware ships with 128 bytes of space reserved for Dynamic Macros,
and enough space reserved for 5 layers (for both keymap and colormap).

Keyboardio Atreus
-----------------

| Plugin         | current | default | experimental |
|----------------|---------|---------|--------------|
| DynamicMacros  | ✔       | :x:     | ✔            |
| EEPROMSettings | ✔       | ✔       | ✔            |
| EEPROMKeymap   | ✔       | ✔       | ✔            |
| FocusSerial    | ✔       | ✔       | ✔            |
| Macros         | ✔       | ✔       | ✔            |
| MouseKeys      | ✔       | ✔       | ✔            |
| OneShot        | ✔       | :x:     | ✔            |
| Qukeys         | ✔       | ✔       | ✔            |
| SpaceCadet     | ✔       | :x:     | ✔            |

In addition to these changes, the former "experimental" firmware for the
Keyboardio Atreus shipped with 5 layers enabled, and 512 bytes for Dynamic
Macros. To remain a strict superset of the default firmware, the current sketch
has 10 layers like the former default, and only 128 bytes of space for Dynamic
Macros.

Original Atreus
---------------

| Plugin         | current | default | experimental |
|----------------|---------|---------|--------------|
| DynamicMacros  | ✔       | :x:     | :x:          |
| EEPROMSettings | ✔       | ✔       | ✔            |
| EEPROMKeymap   | ✔       | ✔       | ✔            |
| FocusSerial    | ✔       | ✔       | ✔            |
| Macros         | ✔       | ✔       | ✔            |
| MouseKeys      | ✔       | :x:     | ✔            |
| OneShot        | ✔       | :x:     | ✔            |
| Qukeys         | ✔       | :x:     | ✔            |
| SpaceCadet     | ✔       | :x:     | ✔            |

The current firmware has 256 bytes reserved for Dynamic Macros, and enough space
for 5 layers.

ErgoDox EZ
----------

| Plugin         | current | default | experimental |
|----------------|---------|---------|--------------|
| DynamicMacros  | ✔       | :x:     | :x:          |
| EEPROMSettings | ✔       | ✔       | ✔            |
| EEPROMKeymap   | ✔       | ✔       | ✔            |
| FocusSerial    | ✔       | ✔       | ✔            |
| MouseKeys      | ✔       | ✔       | ✔            |
| OneShot        | ✔       | :x:     | ✔            |
| Qukeys         | ✔       | ✔       | ✔            |
| SpaceCadet     | ✔       | :x:     | ✔            |

The current firmware has 256 bytes reserved for Dynamic Macros, and enough space
for 5 layers.

SOFT/HRUF Splitography
----------------------

| Plugin         | current | default | experimental |
|----------------|---------|---------|--------------|
| DynamicMacros  | ✔       | :x:     | :x:          |
| EEPROMSettings | ✔       | ✔       | ✔            |
| EEPROMKeymap   | ✔       | ✔       | ✔            |
| FocusSerial    | ✔       | ✔       | ✔            |
| MouseKeys      | ✔       | :x:     | ✔            |
| OneShot        | ✔       | :x:     | ✔            |
| Qukeys         | ✔       | :x:     | ✔            |
| SpaceCadet     | ✔       | :x:     | ✔            |
| Steno          | ✔       | ✔       | ✔            |

The current firmware has 256 bytes reserved for Dynamic Macros, and enough space
for 6 layers.
