extends Node2D
class_name Candle

# Variable to track if the candle is lit
@export var color:Color = Color.ORANGE
var is_lit = false

func _ready():
	add_to_group("Candle")
	$Flames.emitting = false  # Start with particles off
	$Flames.visible = false
	 
# Function to light the candle
func light_candle():
	$Flames.modulate =color
	if not is_lit:
		is_lit = true
		$Flames.emitting = true 
		$Flames.visible = true # Emit particles (flame)
		print("Candle lit!")
