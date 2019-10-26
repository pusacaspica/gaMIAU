extends GridContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	var cursor_pos = get_global_mouse_position()
	for child in get_children():
		if child.get_global_rect().has_point(
# Called every frame. 'delta' is the elapsed time since the previous frame.
