@tool
class_name MaaacksSceneLoaderPlugin
extends EditorPlugin

const PLUGIN_PATH = "res://addons/maaacks_scene_loader/"
const PLUGIN_NAME = "Maaack's Scene Loader"
const PROJECT_SETTINGS_PATH = "maaacks_scene_loader/"

const APIClient = preload(PLUGIN_PATH + "utilities/api_client.gd")
const DownloadAndExtract = preload(PLUGIN_PATH + "utilities/download_and_extract.gd")

const SCENE_LOADER_RELATIVE_PATH = "base/nodes/autoloads/scene_loader/scene_loader.tscn"

var update_plugin_tool_string : String

static func get_plugin_name() -> String:
	return PLUGIN_NAME

static func get_plugin_path() -> String:
	return PLUGIN_PATH

static func get_scene_loader_path() -> String:
	return get_plugin_path() + SCENE_LOADER_RELATIVE_PATH

func _open_check_plugin_version() -> void:
	if ProjectSettings.has_setting(PROJECT_SETTINGS_PATH + "disable_update_check"):
		if ProjectSettings.get_setting(PROJECT_SETTINGS_PATH + "disable_update_check"):
			return
	else:
		ProjectSettings.set_setting(PROJECT_SETTINGS_PATH + "disable_update_check", false)
		ProjectSettings.save()
	var check_version_scene : PackedScene = load(get_plugin_path() + "installer/check_plugin_version.tscn")
	var check_version_instance : Node = check_version_scene.instantiate()
	check_version_instance.auto_start = true
	check_version_instance.new_version_detected.connect(_add_update_plugin_tool_option)
	add_child(check_version_instance)

func _open_update_plugin() -> void:
	var update_plugin_scene : PackedScene = load(get_plugin_path() + "installer/update_plugin.tscn")
	var update_plugin_instance : Node = update_plugin_scene.instantiate()
	update_plugin_instance.auto_start = true
	update_plugin_instance.update_completed.connect(_remove_update_plugin_tool_option)
	add_child(update_plugin_instance)

func _add_update_plugin_tool_option(new_version : String) -> void:
	update_plugin_tool_string = "Update %s to v%s..." % [get_plugin_name(), new_version]
	add_tool_menu_item(update_plugin_tool_string, _open_update_plugin)

func _remove_update_plugin_tool_option() -> void:
	if update_plugin_tool_string.is_empty(): return
	remove_tool_menu_item(update_plugin_tool_string)
	update_plugin_tool_string = ""

func _enable_plugin():
	add_autoload_singleton("SceneLoader", get_scene_loader_path())

func _disable_plugin():
	remove_autoload_singleton("SceneLoader")

func _enter_tree() -> void:
	_open_check_plugin_version()

func _exit_tree() -> void:
	_remove_update_plugin_tool_option()
