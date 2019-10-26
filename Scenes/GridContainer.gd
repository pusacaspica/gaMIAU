extends GridContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		#var cursor_pos = get_global_mouse_position()
		for child in get_children():
			if child.get_global_rect().has_point(get_global_mouse_position()) and get_parent().get_global_rect().has_point(get_global_mouse_position()):
				if child.visible == true:
					print("Haaa")
					print (child)
					child.visible = false
					get_node("../..").pickup_item("CardTest")
# Called every frame. 'delta' is the elapsed time since the previous frame.
