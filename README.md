# Workstation <!-- omit in toc -->

My desktop/laptop setup, now with more Comtrya

- [Prerequisites](#prerequisites)
- [Run Setup](#run-setup)
- [After Comtrya](#after-comtrya)
  - [Setup Keybase PGP](#setup-keybase-pgp)

## Prerequisites

- [Comtrya](https://github.com/comtrya/comtrya)
  - `curl -fsSL https://get.comtrya.dev | sh`

## Run Setup

- From project root `comtrya`

## After Comtrya

### Setup Keybase PGP

```shell
# List Keys in Keybase
keybase pgp export
keybase pgp export -q $KEY | gpg --import
keybase pgp export -q $KEY --secret | gpg --allow-secret-key-import --import

# List Keys in Keyring
gpg --list-secret-keys --keyid-format LONG
# Use sec Key
git config --global user.signingkey $KEY
git config --global commit.gpgsign true
```
