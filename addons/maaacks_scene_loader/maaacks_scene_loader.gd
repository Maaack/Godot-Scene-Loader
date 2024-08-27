@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("SceneLoader", "res://addons/maaacks_scene_loader/base/scenes/autoloads/scene_loader.tscn")

func _exit_tree():
	remove_autoload_singleton("SceneLoader")
