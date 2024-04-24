@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("SceneLoader", "res://addons/maaacks_scene_loader/base/scenes/Autoloads/SceneLoader.tscn")

func _exit_tree():
	remove_autoload_singleton("SceneLoader")
