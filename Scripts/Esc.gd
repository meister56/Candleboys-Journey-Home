extends Node
class_name Esc

signal escaped

var once:bool = false
func _input(event: InputEvent) -> void:
	
	
	
	if Input.is_key_pressed(KEY_ESCAPE) && once == false:
		
		
		escaped.emit()
		once = true
