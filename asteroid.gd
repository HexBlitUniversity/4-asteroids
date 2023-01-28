extends RigidBody2D

var is_exploded = false

func explode():
	if is_exploded:
		return
	
	is_exploded = true
	
	get_parent().remove_child(self)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
