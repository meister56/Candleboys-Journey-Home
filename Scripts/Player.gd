extends CharacterBody2D


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
	else:
		current_state = State.IDLE
	play_footstep_sounds()
	
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





func play_footstep_sounds():
	if current_state == State.WALK:
		footstep_time += get_physics_process_delta_time()
		if footstep_time >= footstep_rate:
			footstep_time = 0
			footstep_player.play()
