# Tips for Using the University of Florida HiPerGator Supercomputer

This GitHub repo is to offer tips on using HiPerGator (HPG) for research.
The tips here *may not be suitable* for a new beginner as these tips develop workflows that make substantial use of the terminal.

This is maintained by Sasank Desaraju.
Please see the [official website](https://help.rc.ufl.edu/doc/UFRC_Help_and_Documentation) of the UF Research Computing (UFRC) team for official documentation.

## Intro

This repo contains recommendations in prose as well as scripts that you can place in your own HiPerGator account or local computer and run with little modification.

>*Please always check scripts that you download from the internet and run.*

## Tips and Scripts

### Log into HPG quickly (Linux/MacOS)

See [this guide](https://help.rc.ufl.edu/doc/SSH_Multiplexing) by the UFRC team
For a template `~/.ssh/config` file, copy from [here](template_config).

### Launch GPU-enabled session from terminal

Copy [this file](interactive.sh) to your home directory on HPG and edit it to fit your needs.
Then, from your home directory, you can just enter `./interactive.sh` to spawn a GPU-enable interactive session.

This script was created based on [this documentation](https://help.rc.ufl.edu/doc/Development_and_Testing#SLURM_Development_Session).

### Launch VSCode Tunnel

Copy [this file](vscode_tunnel.sh) to your home directory on HPG and edit it to fit your needs.
Then, from your home directory, you can just enter `./vscode_tunnel.sh` to start a "tunnel" that you can connect to with your local VSCode install.

This script was created based on [this documentation](https://help.rc.ufl.edu/doc/VS_Code_Remote_Development).

> The above UFRC documentation actually recommends submitting a SLURM job that requests compute resources and spawns the VSCode Tunnel together.
> While that has advantages, I prefer starting an interactive job, starting Tmux, and then starting a Tunnel so that I can also access those resources through the normal command line if I want.

### Tmux

Tmux is a "Terminal Multiplexer" that splits your terminal instance into multiple sessions, windows, and panes.
Tmux has changed how I work. Here are some of my favorite resources on it:
- [typecraft video](https://www.youtube.com/watch?v=niuOc02Rvrc&ab_channel=typecraft)
- [Dreams of Code video](https://www.youtube.com/watch?v=DzNmUNvnB04&ab_channel=DreamsofCode).

[Here](https://github.com/sasank-desaraju/dotfiles/tree/main/.config/tmux/tmux.conf) is my personal tmux configuration.

### Vim/Neovim

Vim is a terminal-based text editor that can allow you to quickly edit files on HPG.
It is noteable for its unique keybindings and "modal" functionality that make it a little challenging to learn but very efficient once you do.
It (and its modern fork Neovim) can also be configured for a more rich development experience.
Additionally, most editors (including VSCode) come with a Vim mode which uses Vim's unique keybindings.
I highly recommend this.

Neovim is also an integral part of my workflow.
Some resources:
- [Robo voice but good intro](https://www.youtube.com/watch?v=lWTzqPfy1gE&ab_channel=Dispatch)
- [Comprehensive](https://www.youtube.com/watch?v=80mWp6H4zEw&ab_channel=JoseanMartinez)

At first, I just used Vim (`vi`) on HPG to make small edits, such as syntax errors.
The configuration file I used is [here](.vimrc).
It is rather minimal.

[Here](https://github.com/sasank-desaraju/nvim) is my personal Neovim configuration.
I use this for everything besides Python notebooks (.ipynb).

### cuda_check

I use PyTorch accelerated with CUDA for machine learning projects on HPG's NVIDIA GPUs.
I often need to set up new Conda environments and often find that PyTorch is not installed with CUDA properly.
As I try to get it installed properly, I need to run
```{python}
import torch

print(torch.cuda.is_available())
```
many times (the last bit is `True` if PyTorch can access CUDA and `False` otherwise).

The file `cuda_check` simplifies this with a little bash script that you are encouraged to open and look at.
Once you place it in `~/.local/bin/` and enter `source ~/.bashrc` to reload your shell, you can just run `cuda_check` anywhere.
This will use the Python env that you are currently in and will run those lines of Python for you so you don't have to open a Python interpreter everytime to check.

### Pixi Python Package Manager

[Pixi](https://prefix.dev/) is a package management solution for Python (and other languages).
See my tips for using pixi [here](pixi.md).


For a cheat sheet of terminal commands you may need (Terminal, Git, HPG), see [common commands](common_commands.md).


### Shell GPT

[Shell GPT](https://github.com/TheR1D/shell_gpt) is command line tool that gives you LLM assistance directly in the terminal.
This can be **super useful** for anyone using the terminal - whether beginner or wizard.
It can generate shell commands, explain them in detail, and more.

**If you are a UF faculty, student, or staff, you can get $5 per month API credits for free through [Navigator](https://it.ufl.edu/ai/navigator-toolkit/)**.
Otherwise, it does require you to pay for OpenAI/Anthropic/etc. API credits but it might cost you $2 a semester even if you use it a lot.
Very worth in my opinion.
(They have a local LLM version but it's not as robust and may be not worth to set up.)

See my tips [here](sgpt.md).
