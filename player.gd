extends CharacterBody2D


const SPEED = 150.0



var ship_dir = Vector2.ZERO
var inputs = {
		"left": Vector2.LEFT,
		"right": Vector2.RIGHT,
		"down": Vector2.DOWN,
		"up": Vector2.UP
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			ship_dir = inputs[dir]
		if event.is_action_released(dir):
			ship_dir = Vector2.ZERO
		

func _physics_process(delta):
 
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = ship_dir * SPEED	
	velocity = direction * SPEED * delta
	

	move_and_slide()
