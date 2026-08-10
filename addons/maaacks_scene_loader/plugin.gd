@tool
class_name MaaacksSceneLoaderPlugin
extends EditorPlugin

const PLUGIN_NAME = "Maaack's Scene Loader"
const PROJECT_SETTINGS_PATH = "maaacks_scene_loader/"
const PLUGIN_REPO_URL = "https://github.com/Maaack/Godot-Scene-Loader"
const SCENE_LOADER_RELATIVE_PATH = "base/nodes/autoloads/scene_loader/scene_loader.tscn"

static func get_plugin_name() -> String:
	return PLUGIN_NAME

func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir()

func get_scene_loader_path() -> String:
	return get_plugin_path() + SCENE_LOADER_RELATIVE_PATH

func _enable_plugin():
	add_autoload_singleton("SceneLoader", get_scene_loader_path())

func _disable_plugin():
	remove_autoload_singleton("SceneLoader")

func _add_to_auto_update_list() -> void:
	var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
	plugin_repos[get_plugin_path()] = PLUGIN_REPO_URL
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

func _remove_from_auto_update_list() -> void:
	var plugin_repos:Dictionary = ProjectSettings.get_setting("plugin_updater/plugins", {})
	plugin_repos.erase(get_plugin_path())
	ProjectSettings.set_setting("plugin_updater/plugins", plugin_repos)

func _enter_tree() -> void:
	_add_to_auto_update_list()

func _exit_tree() -> void:
	_remove_from_auto_update_list()
