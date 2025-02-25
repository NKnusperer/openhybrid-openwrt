# openhybrid-openwrt
OpenWrt package for OpenHybrid

## Build using Dockerfile
`docker build --rm --build-arg ARCH=<target>-<subtarget> --build-arg VERSION=-<branch|tag|version> -v "$(pwd)"/bin/:/builder/bin -t openhybrid-build .`

- `ARCH`: The OpenWrt architecture you are targeting.
The easiest way to find this out is to use the [OpenWrt Firmware Selector](https://firmware-selector.openwrt.org/).
Enter the Model you are using and use the `Platform` value but replace `/` with `-`. For example:
    - Model: `Generic x86/64` Platform: `x86/64` ARCH: `x86-64`
    - Model: `Raspberry Pi 4B/400/CM4 (64bit)` Platform: `bcm27xx/bcm2711` ARCH: `bcm27xx-bcm2711`
- `VERSION`: The OpenWrt version you are targeting, for example `24.10.0` or `main`.

Once the build is complete, you'll find the ready-to-use OpenWrt packages (`.ipk`) in `bin/packages/ARCH/openhybrid`. You can install them using the web interface via `System` => `Software` => `Upload Package...`. Install `busybox-openhybrid` first and then `openhybrid`.