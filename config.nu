# config.nu
# Installed by:
# version = "0.105.1"
$env.GPG_TTY = (echo (tty))
$env.config.show_banner = false
$env.config.buffer_editor = "vim"

$env.RUSTUP_HOME = ($nu.home-path | path join ".rustup")
$env.CARGO_HOME = ($nu.home-path | path join ".cargo")
$env.VOLTA_HOME = ($nu.home-path | path join ".volta")
#$env.PNPM_HOME = ($nu.home-path | path join ".local/share/pnpm")

use std/util "path add"
path add "/opt/homebrew/bin"
path add ($env.CARGO_HOME | path join "bin")
path add ($env.VOLTA_HOME | path join "bin")
#path add ($env.PNPM_HOME)
