extends Node2D

# Variable to track if the candle is lit
var is_lit = false

func _ready():
	add_to_group("Candle")
	$Flames.emitting = false  # Start with particles off
	$Flames.visible = false
	 
# Function to light the candle
func light_candle():
	if not is_lit:
		is_lit = true
		$Flames.emitting = true 
		$Flames.visible = true # Emit particles (flame)
		print("Candle lit!")
