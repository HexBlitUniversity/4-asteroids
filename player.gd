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
	
	if event.is_action_pressed("shoot"):
		$LaserWeapon.shoot()
		

func _physics_process(delta):
 
	var direction = ship_dir * SPEED	
	velocity = direction * SPEED * delta
	
	move_and_slide()


func _on_hitbox_body_entered(body):
	if !self.is_queued_for_deletion() && body.is_in_group("asteroids"):
		queue_free()
