extends Node2D

var laser_scene = preload("res://objects/laser.tscn")

func shoot():
	var laser = laser_scene.instantiate()
	laser.global_position = self.global_position
	get_node("/root/game").add_child(laser)
