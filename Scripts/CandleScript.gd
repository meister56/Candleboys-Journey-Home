extends Node2D

# Variable to track if the candle is lit
var is_lit = false

func _ready():
	$Particles2D.emitting = false  # Start with particles off

# Function to light the candle
func light_candle():
	if not is_lit:
		is_lit = true
		$Particles2D.emitting = true  # Emit particles (flame)
		print("Candle lit!")
