
extends Node

onready var potions : Dictionary = PotionsDB.Potions
onready var cards : Dictionary = CardsDB.Cards
onready var inventory = $"../Inventario" 
onready var deck = get_tree().get_nodes_in_group("Card")

var slots : Dictionary
var slots_amount = 4
var recipes : Dictionary



func _ready():
	_set_recipes()

func _load_inventory():
	for card in deck:
		pass
	pass
	
func _set_recipes():
	for potion in potions:
		recipes[potion] = potions[potion]["Ingredients"]
	print(recipes)


func add_to_slots(id):
	if slots.size() < slots_amount:
		var current_card = id
		var current_card_type = current_card.get("Type")
		slots[id] = cards[id]
	pass

func _match_recipe(slots):
	var is_current_recipe : bool
	for recipe in recipes:
		is_current_recipe = true
		if is_current_recipe:
			for ingredient in recipes[recipe]:
				if !slots.has(ingredient):
					is_current_recipe = false
		
			if is_current_recipe:
				return recipe
				
	return null


func _on_Button_Mix_pressed():
	var slot_types : Array
	if slots.size() == slots_amount:
		for card in slots:
			slot_types.append(slots[card]["Type"])
			slot_types.sort()
		print(_match_recipe(slot_types))


func _on_Inventario_card_dropped(card_name):
	add_to_slots(card_name)
