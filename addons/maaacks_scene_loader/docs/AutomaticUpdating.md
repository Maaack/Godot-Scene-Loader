# Automatic Updating

This plugin supports automatic updating with the [Godot Plugin Updater](https://github.com/Maaack/Godot-Plugin-Updater). The Plugin Updater must be installed in `/addons/` and enabled in **Project Settings > Plugins** to function.

## Starting an Update

> [!IMPORTANT]  
> Save the state of the project, and close all open scenes and scripts.

If an update is available, then the option to update will be available at **Project > Tools > Update Plugins... > Maaack's Scene Loader to v...**.

Selecting the option will make a window pop-up, confirming the choice to update to the latest release. Select *OK*.

Another window will show progress through downloading, saving, and extracting.

This effectively deletes the current `addons/maaacks_scene_loader/` folder and replaces it with a new one. Nothing outside of `addons/` should be affected.

After extracting finishes, a window should appear confirming a successful update.

## Disabling Automatic Checking

You can disable the automatic update checks entirely by disabling the Plugin Updater in Project Settings.

To disable automatic updates by plugin, go into the Project Settings, and remove the entries in the `plugin_updater/plugins` setting (ex. `"maaacks_scene_loader"`). You can then close the window.

## Issues

If the option to update does not appear, try restarting the editor, or re-enabling Godot Plugin Updater.