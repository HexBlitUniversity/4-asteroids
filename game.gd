extends Node2D

func _ready():
	get_tree().get_root().connect("size_changed", call_wrap_around)

func call_wrap_around():
	get_tree().call_group("wrap_around", "recalculate_wrap_area")
