# dotfiles

This repository is used to store my configuration files with a quick installation guide for my personal needs. You probably don't want the full configuration, feel free to check only the configuration files you are interested in.

## Installation

1. Install minimum required dependencies:

    ```bash
    sudo pacman -S --needed --noconfirm git make
    ```

2. Clone this repository:

    ```bash
    git clone https://github.com/hugofresnel/dotfiles.git && cd dotfiles
    ```

3. Run installation script:

    ```bash
    make install
    ```

4. Create symbolic links in your home directory:

    ```bash
    make links
    ```

5. If necessary, you can cancel changes to force usage of the configuration of this repository:

    ```bash
    git restore .
    ```
