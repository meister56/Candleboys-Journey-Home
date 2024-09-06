extends CharacterBody2D


const speed = 300.0
var is_interacting: bool = false

var current_state: State = State.IDLE # Default to IDLE STATE


enum State {
	IDLE,
	INTERACT
}

	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = (input_direction * speed)

func _physics_process(delta: float) -> void:
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
