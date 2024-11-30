# Pixi

## Intro
I have been using pixi to replace conda.

## Installation/Setup

1. Install pixi

2. Change your cache location
Home directories only have 40 GB of storage, which may be exceeded with many packages.
I symlinked my `~/.cache/` to my personal directory in my advisor's allocation.
Pixi also allows you to just change its cache directory using the PIXI_CACHE_DIR environment variable but I like the symlink since there are also other programs whose cache I want in a place with more storage (huggingface, etc.).

    1. Option 1: Symlink (recommended)
    Here, we will put your cache in the (presumably) large blue storage given by your allocation.
    If your PI is Dr. Smith and your name is Alber Gator, then you may have a directory "/blue/smith/albert.gator/".
    First, move your current cache to a new cache directory in your allocation with:
    `mv ~/.cache/ /blue/allocation/personal.directory/.cache`
    Then, create a symbolic link to your "~/.cache" from the place where your cache *really* lives:
    `ln -s /blue/allocation/personal.directory/.cache ~/.cache/`

    2. Option 2: Pixi Cache Environment Variable
    Set $PIXI_CACHE_DIR to a larger directory.
    In your "~/.bashrc", add to the bottom `export PIXI_CACHE_DIR="/blue/smith/albert.gator/.pixi_cache"` to set the pixi cache directory that.
    **WARNING:** Do not set the cache dir to a main directory itself (e.g. "/blue/smith/albert.gator"). If you do this and run `pixi clean cache`, it will delete the entirety of that main directory including any other projects there.

## Resources

(https://pixi.sh/latest/)[Official Documentation]