# Godot Scene Loader
For Godot 4.6 (4.3+ compatible)

A scene loader with loading screen, progress bar, and error handling.

[Example on itch.io](https://maaack.itch.io/godot-game-template)  
_Example is of [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template), which includes additional features._


![Loading 33%](/addons/maaacks_scene_loader/media/screenshot-6-loading-screen-1.png)  
![Still Loading 69%](/addons/maaacks_scene_loader/media/screenshot-6-loading-screen-3.png)  
![Stalled Loaded 69%](/addons/maaacks_scene_loader/media/screenshot-6-loading-screen-4.png)  
[More Screenshots](/addons/maaacks_scene_loader/docs/Screenshots.md)  

## Objective

For quickly adding a loading screen with a progress bar in-between your scene changes.

[Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template) is recommended for first time users, especially those new to Godot.  

## Features

* Asynchronous resource loading.
* Loading screen with progress bar.
* Error handling.

### Extras or Components

Users that want additional features can try [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template) or other options from the [plugin suite](/addons/maaacks_scene_loader/docs/PluginSuite.md).  


### How it Works
- `SceneLoader.tscn` is set as the autoload.  It can load scenes in the background or with a loading screen (`LoadingScreen.tscn` by default).   

## Installation

### Godot Asset Library
This package is available as a plugin, meaning it can be added to an existing project. 

![Package Icon](/addons/maaacks_scene_loader/media/scene_loader-icon-black-transparent-256x256.png)  

When editing an existing project:

1.  Go to the `AssetLib` tab.
2.  Search for "Maaack's Scene Loader".
3.  Click on the result to open the plugin details.
4.  Click to Download.
5.  Check that contents are getting installed to `addons/` and there are no conflicts.
6.  Click to Install.
7.  Reload the project (you may see errors before you do this).
8.  Enable the plugin from the Project Settings > Plugins tab.


### GitHub


1.  Download the latest release version from [GitHub](https://github.com/Maaack/Godot-Scene-Loader/releases/latest).  
2.  Extract the contents of the archive.
3.  Move the `addons/maaacks_scene_loader` folder into your project's `addons/` folder.  
4.  Open/Reload the project.  
5.  Enable the plugin from the Project Settings > Plugins tab.  


## Usage

Change scenes in your project using paths by calling `SceneLoader.load_scene(_path_to_scene_)`.

### More Documentation

[Loading Scenes](/addons/maaacks_scene_loader/docs/LoadingScenes.md)  
[Automatic Updating](/addons/maaacks_scene_loader/docs/AutomaticUpdating.md)  

---

## Featured Games

| Baking Godium | Spud Customs | Rent Seek Kill |  
| :-------:| :-------: | :-------: |
| ![Baking Godium](/addons/maaacks_scene_loader/media/thumbnail-game-baking-godium.png) | ![Spud Customs](/addons/maaacks_scene_loader/media/thumbnail-game-spud-customs.png) | ![Rent-Seek-Kill](/addons/maaacks_scene_loader/media/thumbnail-game-rent-seek-kill.png) |
|  [Play on itch.io](https://maaack.itch.io/baking-godium) | [Find on Steam](https://store.steampowered.com/app/3291880/Spud_Customs/) | [Play on itch.io](https://xandruher.itch.io/rent-seek-kill)  |


[All Shared Games](/addons/maaacks_scene_loader/docs/GamesMade.md)  


## Community

Join the [Discord server](https://discord.gg/AyZrJh5AMp ) and share your work with others. It's also a space for getting or giving feedback, and asking for help. 
 

## Links
[Attribution](/addons/maaacks_scene_loader/ATTRIBUTION.md)  
[License](/addons/maaacks_scene_loader/LICENSE.txt)  
[Godot Asset Library](https://godotengine.org/asset-library/asset/2896)  