@tool
extends EditorPlugin

const PLUGIN_NAME = "Maaack's Scene Loader"
const PROJECT_SETTINGS_PATH = "maaacks_scene_loader/"

var update_plugin_tool_string : String

func _get_plugin_name() -> String:
	return PLUGIN_NAME

func get_plugin_path() -> String:
	return get_script().resource_path.get_base_dir() + "/"

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
	update_plugin_tool_string = "Update %s to v%s..." % [_get_plugin_name(), new_version]
	add_tool_menu_item(update_plugin_tool_string, _open_update_plugin)

func _remove_update_plugin_tool_option() -> void:
	if update_plugin_tool_string.is_empty(): return
	remove_tool_menu_item(update_plugin_tool_string)
	update_plugin_tool_string = ""

func _enter_tree() -> void:
	add_autoload_singleton("SceneLoader", get_plugin_path() + "base/scenes/autoloads/scene_loader.tscn")
	_open_check_plugin_version()

func _exit_tree() -> void:
	remove_autoload_singleton("SceneLoader")
	_remove_update_plugin_tool_option()
