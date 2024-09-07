extends Node
class_name SceneChanger



func change_scene(file_path:String):
	
	get_tree().change_scene_to_file(file_path)
	
