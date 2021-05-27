
# Roblox Lockbox

This is a wrapper around [lua-lockbox](https://github.com/somesocks/lua-lockbox).

This module:
* Only modifies lua-lockbox in automatic ways
* Includes linux shell scripts to update lockbox and perform automatic modifications
* Includes lockbox's source in the repository to make it easy to use this module from rojo
* Includes a rojo project that runs lockbox's tests (all pass!)
* Doesn't modify the Lua files at runtime

## API

See [lua-lockbox](https://github.com/somesocks/lua-lockbox) for their API documentation (mostly just read the source code).

To access modules from `lua-lockbox`:
1. Require `roblox-lockbox` (e.g. as `lockbox`)
2. Access items from `lua-lockbox` using normal table indices.
   e.g. `local hmac = lockbox.mac.hmac`
3. If you need to use an insecure function, use `lockbox.insecure` instead.
   e.g. `local md2 = lockbox.insecure.digest.md2`

## Adding to Your Game

Option 1: download the latest release as an `rbxm` from [the releases page](https://github.com/Corecii/roblox-lockbox/releases)

Option 2: use a rotriever-compatible package manager to add `roblox-lockbox` as a dependency

---

## Updating a Local Copy

Make sure you have the lockbox git submodule initialized:
```sh
git submodule init
git submodule update
```

In a linux shell, run:
* `sh scripts/update-lockbox.sh` to pull the latest commit for the lockbox submodule
* `sh scripts/setup-local-copy.sh` to copy lockbox into the right directories and add automatic modifications

Then you're up to date!

## Releasing a New Version

After updating, run `rojo build -o lockbox.rbxm` to build the release model.