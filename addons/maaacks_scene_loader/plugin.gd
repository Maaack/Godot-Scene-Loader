@tool
class_name MaaacksSceneLoaderPlugin
extends EditorPlugin

const PLUGIN_NAME = "Maaack's Scene Loader"
const PROJECT_SETTINGS_PATH = "maaacks_scene_loader/"
const PLUGIN_REPO_URL = "https://github.com/Maaack/Godot-Scene-Loader"
const SCENE_LOADER_RELATIVE_PATH = "base/nodes/autoloads/scene_loader/scene_loader.tscn"
const LOADING_SCREEN_SCENE_RELATIVE_PATH = "base/nodes/loading_screen/loading_screen.tscn"
const LOADING_SCENE_PATH_KEY = "loading_scene_path"
const SCENE_PATHS : Dictionary[String, String] = {
	LOADING_SCENE_PATH_KEY : LOADING_SCREEN_SCENE_RELATIVE_PATH,
}
static func get_plugin_name() -> String:
	return PLUGIN_NAME

static func get_loading_scene_path(override_path : String = "") -> String:
	if (not override_path.is_empty()) and FileAccess.file_exists(override_path):
		return override_path
	return ProjectSettings.get_setting(PROJECT_SETTINGS_PATH + LOADING_SCENE_PATH_KEY, override_path)

func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir() + "/"

func get_scene_loader_path() -> String:
	return get_plugin_path() + SCENE_LOADER_RELATIVE_PATH

func set_project_paths(target_path : String, overwrite : bool = true) -> void:
	for key in SCENE_PATHS:
		if (not overwrite) and ProjectSettings.get_setting(PROJECT_SETTINGS_PATH + key) != null:
			continue
		var relative_path = SCENE_PATHS[key]
		var full_path = ""
		if not relative_path.is_empty():
			full_path = target_path + relative_path
		ProjectSettings.set_setting(PROJECT_SETTINGS_PATH + key, full_path)

func _add_to_auto_update_list() -> void:
	var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
	plugin_repos[get_plugin_path()] = PLUGIN_REPO_URL
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

func _remove_from_auto_update_list() -> void:
	var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
	plugin_repos.erase(get_plugin_path())
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

func _enable_plugin():
	set_project_paths(get_plugin_path())
	_add_to_auto_update_list()
	add_autoload_singleton("SceneLoader", get_scene_loader_path())

func _disable_plugin():
	_remove_from_auto_update_list()
	remove_autoload_singleton("SceneLoader")
