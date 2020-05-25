# standalone-wg
Run WireGuard without its kernel module

Use the scripts provided in this repo to run WireGuard sessions without having its kernel module installed on the system.

## Usage:
You will need to run the `setup.sh` script at least once to download all necessary dependencies from the internet.
```
$ ./setup.sh
```
After running `setup.sh` you shall see a folder named `bin` alongside with `setup.sh` and `run.sh`, and inside the `bin` folder you shall find 3 files: `wireguard-go`, `wg` and `wg-quick`.

You can now execute `run.sh` with elevated privilege to start a WireGuard VPN session.
```
# ./run.sh <path-to-wg-configuration-file>
```
To terminate the session, simply run the exact `run.sh` command again.
