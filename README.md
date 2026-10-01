# DNScale Homebrew tap

Install the [DNScale CLI](https://github.com/dnscaleou/dnscale-cli) on macOS or Linux:

```sh
brew install dnscaleou/tap/dnscale
dnscale --version
```

The formula installs the official release binary for Apple Silicon or Intel
macOS, or ARM64/AMD64 Linux. Go is not required. Archive SHA-256 checksums are
pinned in the formula. Bash, Zsh, and Fish completions are installed automatically.

## Upgrade or uninstall

```sh
brew update
brew upgrade dnscale
brew uninstall dnscale
```

Uninstalling the CLI does not revoke API keys. Use `dnscale auth logout
--profile NAME` before uninstalling to remove a saved profile's keychain
credential, and revoke keys in the DNScale dashboard when they are no longer needed.

## First commands

```sh
dnscale --help
dnscale records create example.com --name www --type A --content 192.0.2.10 --ttl 300 --dry-run
```

The dry-run example is offline and needs no credentials. To use the API, supply
`DNSCALE_API_KEY` from your secret manager or use a saved profile. See the
[CLI reference](https://github.com/dnscaleou/dnscale-cli#authentication) and
[DNS quickstart](https://github.com/dnscaleou/dnscale-cli/blob/main/QUICKSTART.md).

For Windows or manual installation, use the
[release downloads](https://github.com/dnscaleou/dnscale-cli/releases).
Report CLI issues in [dnscale-cli](https://github.com/dnscaleou/dnscale-cli/issues)
and packaging issues in [this tap](https://github.com/dnscaleou/homebrew-tap/issues).
