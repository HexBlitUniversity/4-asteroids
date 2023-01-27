extends Node

## Credits to Sp33dy for the wrapping code
## https://github.com/sp33dy/Godot-v3-Tutorials-Competent/tree/master/Screen%20Wrap%20Node
## ive just converted it to Godot 4.0

@export var wrapArea: Rect2
@export var horizontalWrapping: bool = true
@export var verticalWrapping: bool = true


#dictionary of axis directions
const AXIS = {
	HORIZONTAL = "x",
	VERTICAL = "y"
}

func initWrapArea():
	print(wrapArea )
	if wrapArea.size == Vector2.ZERO:
		wrapArea = Rect2(Vector2(), get_viewport().size)

# Recalculate the wrap area again. 
func recalculate_wrap_area():
	wrapArea = Rect2(Vector2(), get_viewport().size)
	
func _ready():
	initWrapArea()
	add_to_group("wrap_around")

# check whether the parent object is not in the wrap area
# call the wrap function if it isnt 
func _process(delta):
	if !wrapArea.has_point(get_parent().global_position):
		wrapScreen()

# The parent node is NOT in wrap area, so it must be 
# wrapped around until it is
func wrapScreen():	
	if horizontalWrapping:
		wrapBy(AXIS.HORIZONTAL)	
	if verticalWrapping:
		wrapBy(AXIS.VERTICAL)
		
func getAxisWrapDirection(axis):
	if get_parent().global_position[axis] < wrapArea.position[axis]:
		return 1
	elif get_parent().global_position[axis] > wrapArea.size[axis]:
		return -1
	return 0
	
func wrapBy(axis):
	var adjust = getAxisWrapDirection(axis) * wrapArea.size[axis]
	get_parent().position[axis] += adjust
