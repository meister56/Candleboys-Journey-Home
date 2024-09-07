extends CharacterBody2D

var flame_color: Color   
@export var is_lit: bool = true

# Reference to the nearby candle
var nearby_candle: Node = null

const speed = 300.0
var is_interacting: bool = false

var current_state: State = State.IDLE # Default to IDLE STATE


#FOOTSTEP LOGIC
@export var footstep_rate:float = 0.4
@onready var footstep_player:AudioStreamPlayer2D = $FootSteps
var footstep_time:float 

var input_direction

enum State {
	IDLE,
	WALK,
	INTERACT
}

	
func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = (input_direction * speed)
	

func _physics_process(delta: float) -> void:
	if input_direction != Vector2.ZERO:
		current_state = State.WALK
		play_footstep_sounds()
	else:
		current_state = State.IDLE
		# Check if the 'E' key is pressed and a candle is nearby
	if Input.is_action_just_pressed("interact") and nearby_candle:
		nearby_candle.light_candle()  # Light the candle

	
	get_input()
	
	move_and_slide()
	
	# Handle animation 
	match current_state:
		State.INTERACT:
			#Play Ineraction animations
			pass
	match current_state:
		State.IDLE:
			pass
			


func interact():
	current_state = State.INTERACT 
	is_interacting = true


# Detect when a candle enters the player's area
func _on_candle_detection_radius_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("light_candle"):
		nearby_candle = area.get_parent()  # Store the nearby candle reference

# Detect when the candle leaves the player's area
func _on_candle_detection_radius_area_exited(area: Area2D) -> void:
	if area.get_parent() == nearby_candle:
		nearby_candle = null  # Clear the candle reference when out of range


func play_footstep_sounds():
	if current_state == State.WALK:
		footstep_time += get_physics_process_delta_time()
		if footstep_time >= footstep_rate:
			footstep_time = 0
			footstep_player.play()
