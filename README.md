# dotfiles

Manage dotfiles seamlessly using GNU Stow.

## The Core Concept

This repository acts as my absolute **source of truth**.
Actual configuration structures and script assets live permanently inside this repository, while my `$HOME` directory contains only symbolic links pointing back here.

_Note: Stow does NOT import or clone files automatically. I must manually structure and migrate my configurations into this tree first._

## Package Blueprint

Each top-level directory inside an OS folder represents a self-contained, deployable **Stow package**. The internal folder structure inside a package must explicitly mirror my target paths relative to my `$HOME` directory.

### Example Architecture (i3wm on Arch):

- **Original System Location**: `~/.config/i3/config`
- **Mirror Structure in Repository**: `arch/i3wm/.config/i3/config`

## Repository Tree Overview

My directory tree must follow this multi-OS structure to segregate configs while keeping deployments safe:

```text
.
├── .stowrc               # My global target management rules
├── README.md
├── arch/                 # My Arch Linux specific package directory
│   ├── i3wm
│   │   └── .config/i3/config
│   └── zed
│       └── .config/zed/settings.json
└── debian/               # My Debian specific package directory
    └── i3wm
        └── .config/i3/config
```

## Setup & Rules Configuration (`.stowrc`)

To prevent Stow from polluting paths, skipping hidden assets, or miscalculating deep target scopes, I keep a `.stowrc` configuration file directly in the root of this repository:

```text
--target=/home/msi
--ignore=README.md
--ignore=hooks
--ignore=LICENSE
--ignore=.git
```

## How I Manage Packages

_I always execute stow commands strictly from the root of this repository. I use the `--dir` flag to target my specific operating system environment._

### 1. Deploying Packages

To safely mount my packages to my home path without triggering aggressive tree-folding bugs, I pick the matching OS subfolder:

**For Arch Linux:**

```bash
stow --dir=arch i3wm zed scripts wallpapers
```

**For Debian:**

```bash
stow --dir=debian i3wm scripts
```

### 2. Adding a New Application Configuration

1. **Initialize the matching target structure inside my OS directory**:
   ```bash
   mkdir -p arch/<package_name>/.config/
   ```
2. **Migrate the physical directory into my repository package**:
   ```bash
   mv ~/.config/<app_name> arch/<package_name>/.config/
   ```
3. **Link it safely using the matching directory context**:
   ```bash
   stow --dir=arch <package_name>
   ```

### 3. Tearing Down Links (Unstow)

If I want to break symbolic hooks and remove a package layout completely from my user space:

```bash
stow --dir=arch -D <package_name>
```

### 4. Overwriting or Forcing Syncs (Restow)

If I modify files inside the target destination directly or need to force-refresh stale cache layouts:

```bash
stow --dir=arch -R <package_name>
```

## My Pro-Tips for System Integrity

- **Check Link Anchors Manually**: I always verify where my configurations point by executing a targeted long-list check: `ls -la ~/.config/zed`
- **Pre-create Shared Directories**: Before stowing low-level directories like `scripts/` into `~/.local/bin/`, I ensure that the target directory physically exists on a fresh machine (`mkdir -p ~/.local/bin`). This forces Stow to map individual files into place rather than claiming ownership of the entire system directory path.
