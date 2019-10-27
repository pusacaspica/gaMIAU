extends GridContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var slots_full : bool

onready var CardBase = load("res://Scenes/CardBase.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for card in CardsDB.Cards:
		var new_card = CardBase.instance()
		new_card.texture = load(CardsDB.Cards[card]["Art"])
		add_child(new_card)
		new_card.card_name = CardsDB.Cards[card]["Title"]
	#	print(new_card.card_name)
		
	for card in CardsDB.Cards:
		var new_card = CardBase.instance()
		new_card.texture = load(CardsDB.Cards[card]["Art"])
		add_child(new_card)
		new_card.card_name = CardsDB.Cards[card]["Title"]
	#	print(new_card.card_name)
		
	for card in CardsDB.Cards:
		var new_card = CardBase.instance()
		new_card.texture = load(CardsDB.Cards[card]["Art"])
		add_child(new_card)
		new_card.card_name = CardsDB.Cards[card]["Title"]
	#	print(new_card.card_name)

func _input(event):
	if Input.is_action_just_pressed("inv_grab"):
		for child in get_children():
			if child.get_global_rect().has_point(get_global_mouse_position()) and get_parent().get_global_rect().has_point(get_global_mouse_position()):
				if child.modulate != Color(1, 1, 1, 0):
					slots_full = true
					for slot in get_node("../..").slots:
						if !slot.item:
							slots_full = false 
					if !slots_full:
						child.modulate = Color(1, 1, 1, 0)
						#remove_child(child)
					#	print("hi")
						get_node("../..").pickup_item(child.card_name)
					
# Called every frame. 'delta' is the elapsed time since the previous frame.

