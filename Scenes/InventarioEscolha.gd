extends Control
 
onready var CardBase = preload("res://Scenes/CardBase.tscn")
onready var gridContainer = $ScrollContainer/GridContainer
onready var slots = get_tree().get_nodes_in_group("InvSlot") 
#onready var Caldeirao : = $Caldeirao



var item_held = null
var item_offset = Vector2()
var last_container = null
var last_pos = Vector2()
 
func _ready():

	pass
   
 
func _process(delta):
	pass
 
func return_item(cursor_pos):
	var c = get_container_under_cursor(cursor_pos)
	if c != null and c.has_method("grab_item"):
		item_held = c.item
		if c.item:
			gridContainer.slots_full = false
			gridContainer.return_item(item_held, item_held.card_name)
			c.item = null
			drop_item()

	pass
func grab(cursor_pos):
	var c = get_container_under_cursor(cursor_pos)
	#print(c)
	if c != null and c.has_method("grab_item"):
		item_held = c.grab_item(cursor_pos)
		if item_held != null:
			last_container = c
			last_pos = item_held.rect_global_position
			item_offset = item_held.rect_global_position - cursor_pos
			move_child(item_held, get_child_count())
 
func get_container_under_cursor(cursor_pos):
	var containers = slots
	for c in containers:
		if c.get_global_rect().has_point(cursor_pos):
		#	print(c)
			return c
	return null

func pickup_item(item_id):
	var already_there = false
	for slot in slots:
		if slot.item != null:
			if slot.item.card_name == CardsDB.Cards[item_id]["Title"]:
				slot.item.amount += 1
				already_there = true
		
	var inserted = false
	for slot in slots:
		if !inserted and !slot.item and !already_there:
			var item = CardBase.instance()
			item.set_meta("id", item_id)
			item.texture = load(CardsDB.Cards[item_id]["Art"])
			if slot.insert_item(item):
				inserted = true
				item.card_name = CardsDB.Cards[item_id]["Title"]
				slot.item.amount += 1
				add_child(item)
			
       		
    return true
	
func drop_item():
    item_held.queue_free()
    item_held = null

func _on_Button_pressed():
	var slots_full = true
	for slot in slots:
		if !slot.item:
			slots_full = false
	if slots_full:
		for slot in slots:
			CurrentInvent.inventory.append(slot.item.card_name)
		
	#	print(CurrentInvent.inventory)
		get_tree().change_scene("res://Scenes/UI_Test.tscn")
		pass # Replace with function body.
