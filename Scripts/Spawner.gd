extends Node2D


@export var scene:PackedScene




func instance_scene():
	var instance = scene.instantiate()
	get_tree().current_scene.add_child(instance)
	if "global_position" in instance:
		instance.global_position = global_position
