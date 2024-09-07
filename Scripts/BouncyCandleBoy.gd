extends Node2D
class_name BouncyCandleBoy



var move_speed:float = 1

@export var start:Node2D

@export var end:Node2D

var dir:bool = false

func _physics_process(delta: float) -> void:
	if dir:
		position.x = lerp(position.x, start.position.x, move_speed * delta)
	else:
		position.x = lerp(position.x, end.position.x, move_speed * delta)

	# When close enough to the target, switch direction
	if abs(position.x - start.position.x) < 25:
		dir = false  # Move towards 'end'
	elif abs(position.x - end.position.x) <25:
		dir = true  # Move towards 'start'
