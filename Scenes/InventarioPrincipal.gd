extends Control
 
onready var CardBase = preload("res://Scenes/CardBase.tscn")
 
onready var slots = get_tree().get_nodes_in_group("InvSlot")
 
onready var Caldeirao : = $Caldeirao

var item_held = null
var item_offset = Vector2()
var last_container = null
var last_pos = Vector2()
 
func _ready():
	pickup_item("Mature Apple")

	pass
   
 
func _process(delta):
    var cursor_pos = get_global_mouse_position()
    if Input.is_action_just_pressed("inv_grab"):
        grab(cursor_pos)
    if Input.is_action_just_released("inv_grab"):
        release(cursor_pos)
    if item_held != null:
        item_held.rect_global_position = cursor_pos + item_offset
 
func grab(cursor_pos):
	var c = get_container_under_cursor(cursor_pos)
	print(c)
	if c != null and c.has_method("grab_item"):
		item_held = c.grab_item(cursor_pos)
		if item_held != null:
			print("haaa")
			last_container = c
			last_pos = item_held.rect_global_position
			item_offset = item_held.rect_global_position - cursor_pos
			move_child(item_held, get_child_count())
 
func release(cursor_pos):
	if item_held == null:
		return
	
	if Caldeirao.get_global_rect().has_point(cursor_pos):
		drop_item()
	else:
		return_item()
	

   
 
func get_container_under_cursor(cursor_pos):
    var containers = slots
    for c in containers:
        if c.get_global_rect().has_point(cursor_pos):
            return c
    return null
	
 
func drop_item():
    item_held.queue_free()
    item_held = null
 
func return_item():
    item_held.rect_global_position = last_pos
    last_container.insert_item(item_held)
    item_held = null
 
func pickup_item(item_id):
	var item = CardBase.instance()
	item.set_meta("id", item_id)
	item.texture = load(CardsDB.Cards[item_id]["Art"])
	add_child(item)
	var inserted = false
	for slot in slots:
		if !inserted:
			if slot.insert_item(item):
				inserted = true
       # item.queue_free()
       # return false
    return true