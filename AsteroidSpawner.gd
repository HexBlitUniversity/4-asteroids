extends Node

var asteroid_scene = preload("res://asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_asteroid()

func _spawn_asteroid():
	var asteroid = asteroid_scene.instantiate()
	_set_asteroid_position(asteroid)
	_set_asteroid_trajectory(asteroid)
	add_child(asteroid)

func _set_asteroid_position(asteroid):
	var rect = get_viewport().size
	asteroid.position = Vector2(randi_range(0, rect.x), randi_range(0,rect.y))

func _set_asteroid_trajectory(asteroid):
	asteroid.angular_velocity = randf_range(-4,4)
	asteroid.angular_damp = 0
	asteroid.linear_velocity = Vector2(randi_range(-300,300),300)
	asteroid.linear_damp = 0

func _on_timer_timeout():
	_spawn_asteroid()
