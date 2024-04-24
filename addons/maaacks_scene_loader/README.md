# Godot Scene Loader
For Godot 4.2

A scene loader with loading screen, progress bar, and error handling.

[Example on itch.io](https://maaack.itch.io/godot-game-template)  
_Example is of [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template), which includes additional features._


![Main Menu](/addons/maaacks_scene_loader/media/Screenshot-1-1.png)  
![Key Rebinding](/addons/maaacks_scene_loader/media/Screenshot-1-2.png)  
![Audio Controls](/addons/maaacks_scene_loader/media/Screenshot-1-3.png)  
![Credits Screen](/addons/maaacks_scene_loader/media/Screenshot-1-4.png)  

## Use Case
For adding a loading screen with a progress bar in between your scene changes.

## Features

* Asynchronous resource loading.
* Loading screen with progress bar.
* Error handling.


### How it Works
- `SceneLoader.tscn` is set as the autoload.  It can load scenes in the background or with a loading screen (`LoadingScreen.tscn` by default).   

## Installation

### Godot Asset Library
This package is available as a plugin, meaning it can be added to an existing project. 

![Package Icon](/addons/maaacks_scene_loader/media/SceneLoader-Icon-black-transparent-256x256.png)  

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

#### Extras

Users that want additional features can try [Maaack's Game Template](https://github.com/Maaack/Godot-Game-Template).  

## Usage

Change scenes in your project using paths by calling `SceneLoader.load_scene(_path_to_scene_)`.
   


## Links
[Attribution](ATTRIBUTION.md)  
[License](LICENSE.txt)  

