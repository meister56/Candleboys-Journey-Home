extends Node2D
class_name FlameRenderer




var flames:Array[Node2D]
@onready var parent = get_parent()

func _ready() -> void:
	visible = false
	flames.append(find_child("RED"))
	flames.append(find_child("BLUE"))
	if find_child("GREEN"):
		
		flames.append(find_child("GREEN"))



func _physics_process(delta: float) -> void:
	
	visible =parent.is_lit
	
	for flame_idx in range(flames.size()):
		
		flames[flame_idx].visible = flames[flame_idx].name == parent.color_type
	
