# Releasing Chrysalis Firmware Builds


## Creating a new snapshot after a release

`make create-snapshot`

## Publishing a release

### Make sure the Kaleidoscope submodule is pulled up to the version you expect

#. `make pull-kaleidoscope` (If you want Kaleidoscope master)
#. Update NEWS.md with any changes in this release
#. 'git commit -a -s -m "A description of what you're changing"
#. 'git push'
#. Visit https://github.com/keyboardio/Chrysalis-Firmware-Bundle/actions to verify that the build succeeded
#. Visit https://github.com/keyboardio/Chrysalis-Firmware-Bundle/releases to download your unpublished snapshot
#. * TEST THE BUILT SNAPSHOT ON HARDWARE*
#. `make finalize-release`
#. Visit https://github.com/keyboardio/Chrysalis-Firmware-Bundle/actions to verify that the build succeeded
#. Visit https://github.com/keyboardio/Chrysalis-Firmware-Bundle/releases to download your unpublished release
#. Test it again
#. Promote it to the latest release on GitHub.


