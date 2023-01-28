extends Area2D

var direction = Vector2(0,-1)
var projectile_speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	self.position += direction * projectile_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if !self.is_queued_for_deletion() && body.is_in_group("asteroids"):
		body.call_deferred("explode")
		get_parent().remove_child(self)
		queue_free()
