# env-setup

My macOS bootstrap scripts for rebuilding my developer workstation. It installs core tooling via Homebrew, applies my dotfiles, and sets a handful of system defaults.

## How it works

- `run` discovers and executes the executable scripts in `runs/` in order.
- Each script is idempotent where possible (it skips work if it’s already done).

Current run order:

1. `01_xcode.sh` – installs Xcode Command Line Tools (waits until complete)
2. `02_zsh.sh` – ensures `zsh` is my default shell and installs oh-my-zsh
3. `03_homebrew.sh` – installs Homebrew and sets up PATH for the current run
4. `04_brewfile.sh` – installs packages and casks from `Brewfile`
5. `05_dotfiles.sh` – clones my dotfiles repo and stows into `$HOME`
6. `06_system_config.sh` – applies my macOS defaults and configures the Dock

## Usage

```bash
./run
```

Optional filter (runs only scripts whose filename contains the filter):

```bash
./run brew
```

Dry run (prints what would run):

```bash
./run --dry
```

## Notes

- `05_dotfiles.sh` expects my dotfiles repo at `git@github.com:wiigg/dotfiles.git` and uses `stow` to apply it.
- `06_system_config.sh` uses `dockutil` and skips missing apps when populating the Dock.
