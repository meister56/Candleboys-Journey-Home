extends Node2D
class_name Candle

@export var color_type = "RED"
@export var is_lit = false
@onready var flame_renderer:Node2D = $FlameRenderer


func _ready():
	add_to_group("Candle")
	
	 
# Function to light the candle
func light_candle():
	if not is_lit:
		is_lit = true
		flame_renderer.visible = true # Emit particles (flame)
		print("Candle lit!")
