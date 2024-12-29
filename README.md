<p align="center" width="100%">
<img src="https://astraldisc.com/assets/img/disc/logo.png" alt="ASTRAL DISC Logo" style="image-rendering:pixelated;" width="70%" />
</p>

# AD-Kristal (Kristal Fork)

This is a fork of the Kristal Engine made for the ASTRAL DISC project.

## Launching Kristal via .bat file

This repository includes a custom shell script named ``start.bat.`` The purpose of this script is to automatically merge updates from the original Kristal repository. Every time you launch Kristal-AD, we recommend you do so using this file.

```bash
@echo off
git fetch upstream main
git merge --no-ff upstream/main
pause
"C:\Program Files\LOVE/lovec" .
```

Additionally, if you're using Git to download Kristal updates, you can add a ``git pull`` line after the pause line in your ``.bat``, which will make Kristal-AD automatically update every time you launch it through the ``.bat`` file.

When you first clone this repository, you'll also need to run this git command to be able to access the most up to date commits:

```bash
git remote add upstream https://github.com/KristalTeam/Kristal.git
```

## Clone the Chapters

To run the ASTRAL DISC Chapters, you'll need to download a few mods and place them in the following directory:
`C:\Users\user\AppData\Roaming\LOVE\ad\mods`

You can quickly access the `AppData` folder by pressing `Win + R`, execute the `%appdata%` command, and navigate to the `LOVE` folder. Inside it, you'll find the `ad` folder, where you should add these mods:

- [Mod Loader](https://github.com/ASTRAL-DISC/astraldisc)
- [Chapter 3](https://github.com/ASTRAL-DISC/chapter3)
- [Chapter 4](https://github.com/ASTRAL-DISC/chapter4)
- [Chapter 5](https://github.com/ASTRAL-DISC/chapter5)
- [Chapter 6](https://github.com/ASTRAL-DISC/chapter6)
- [Chapter 7](https://github.com/ASTRAL-DISC/chapter7)

### Note for the development team:

It's recommended to clone the repository instead of manually downloading the mods. This way, you can easily update your local copy by running `git pull` whenever updates are made. This ensures you're always working with the latest changes.

> **Reminder:** You need to execute the `.bat` file at least once for the `ad` folder to be created.

# Kristal

Kristal is a powerful [DELTARUNE](https://deltarune.com/) fangame and battle engine, made with [LÖVE](https://love2d.org/). It allows you to make **custom DELTARUNE worlds, battles, and more!**

> [!WARNING]
> Make sure to read the **downloading section** of this README before attempting to download Kristal.

## Getting Started

The [wiki](https://kristal.cc/wiki/) should cover everything you need to know about Kristal. If there's something you think is missing, feel free to [open an issue, or even a pull request!](https://github.com/KristalTeam/Shadow)

## Downloading

For help with downloading the engine, visit the [downloading page](https://kristal.cc/wiki/downloading).

## Community

Our community resides on [Discord](https://discord.gg/8ZGuKXJE2C), so if you want to talk about Kristal, or just hang out, feel free to join!

We also have [a subreddit](https://reddit.com/r/Kristal/), but it's less active than the Discord server.

## Screenshots

![A screenshot of the main menu](https://kristal.cc/screenshots/main_menu.png)

<sup>Kristal's main menu</sup>

![A screenshot of the mod Kris and Susie's Wacky Dark World Adventures by TrashcatYT](https://kristal.cc/screenshots/kris_and_susies_wacky_dark_world_adventures.png)

<sup>[Kris and Susie's Wacky Dark World Adventures](https://gamejolt.com/games/deltarune-kris-and-susies-wacky-dark-world/852417) by [TrashcatYT](https://gamejolt.com/@TrashcatYT)</sup>

![A screenshot of the mod Godhome by Vitellary](https://kristal.cc/screenshots/godhome.png)

<sup>[Godhome](https://gamebanana.com/mods/376524) by Vitellary</sup>

![A screenshot of the mod Deoxynn by AcousticJamm](https://kristal.cc/screenshots/deoxynn.png)

<sup>[Deoxynn](https://kristal.cc/screenshots/deoxynn.png) by [AcousticJamm](https://www.guilded.gg/i/240D4G02)</sup>
