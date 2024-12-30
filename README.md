<p align="center" width="100%">
<img src="https://astraldisc.com/assets/img/disc/logo_big.png" alt="ASTRAL DISC Logo"/>
</p>

# AD-Kristal (Kristal Fork)

This is a customized fork of the [Kristal Engine](https://github.com/KristalTeam/Kristal), specifically for use with the [ASTRAL DISC](https://github.com/ASTRAL-DISC) chapters.

## Setup 

The first step is to clone this repository. 

There are multiple ways of doing it, but a quick one is to open up a terminal (PowerShell, Command Prompt, etc) and paste this command: 
```bash
git clone "https://github.com/ASTRAL-DISC/AD-Kristal.git"
```

After cloning is done, you can launch the custom client through the next step below.

### Launching AD-Kristal via .bat file

This repository includes a [custom shell script](./start.bat) named ``start.bat``. The purpose of this script is to facilitate the process of starting the application. Every time you launch AD-Kristal, we recommend you do so using this file.

> [!NOTE]
> You need to have `.Git` installed in order to run the `.bat` file properly.

When executed, the script opens a console window and soon launches the custom client. Because this is your first time, there are no mods loaded, so an error will occur. Don't worry, this is expected. The client will still run some code and generate the necessary folders for the next step.

> [!NOTE]
> Additionally, you can add a `git pull` command in your `.bat` file. This will ensure AD-Kristal automatically updates every time you launch it through the `.bat`. While this is helpful if you often forget to pull updates, it may be inconvenient for some, so consider it optional.

### Cloning the Chapters

To run the ASTRAL DISC Chapters, you'll need to download a few mods and place them in the following directory:
```
C:\Users\user\AppData\Roaming\LOVE\ad\mods
```

> [!TIP]
> To find the `AppData` folder, press `Win + R`, type `%appdata%`, and hit Enter. Navigate to the `LOVE` folder, where you'll find the `ad` folder. Inside, you'll see `mods` and `saves` directories. Place all the following mods into the `mods` folder. 

- [Mod Loader](https://github.com/ASTRAL-DISC/astraldisc)
- [Chapter 3](https://github.com/ASTRAL-DISC/chapter3)
- [Chapter 4](https://github.com/ASTRAL-DISC/chapter4)
- [Chapter 5](https://github.com/ASTRAL-DISC/chapter5)
- [Chapter 6](https://github.com/ASTRAL-DISC/chapter6)
- [Chapter 7](https://github.com/ASTRAL-DISC/chapter7)

This setup allows you to run the chapters by selecting them in the Chapter Selector.

> [!IMPORTANT]
> It's necessary that you *clone* the aforementioned repositories to your computer instead of manually downloading their archives. This way, you can easily update your local copy of the mods by running `git pull` whenever updates are made.

---
<!-- ## More information about Kristal -->
<!-- https://github.com/KristalTeam/Kristal/blob/main/README.md -->

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
