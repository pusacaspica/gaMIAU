
extends Node

onready var potions : Dictionary = PotionsDB.Potions
onready var cards : Dictionary = CardsDB.Cards
onready var inventory = $"../Inventario" 
onready var deck = get_tree().get_nodes_in_group("Card")

var slots : Dictionary
var ingredients: Dictionary
var slots_amount = 4
var recipes : Dictionary
var result : Array
var taste

signal potion_brewed

func _ready():
	_set_recipes()

func _load_inventory():
	for card in deck:
		pass
	pass
	
func _set_recipes():
	for potion in potions:
		recipes[potion] = potions[potion]["Ingredients"]
	#print(recipes)


func add_to_slots(id):
	#print(id)
	if slots.size() < slots_amount:
	#	var current_card = id
	#	var current_card_type = current_card.get("Type")
		if(cards[id]["Type"] != "neutral"):
			ingredients[id] = cards[id]
			#taste += cards[id]["Flavour"]
			print(ingredients[id])
		#else:
		#	taste += cards[id]["Flavour"]
		slots[id] = cards[id]
		

func _clear_slots():
	slots.clear()
	ingredients.clear()

func _match_recipe(ingredients):
	var is_current_recipe : bool
	for recipe in recipes:
		is_current_recipe = true
		if is_current_recipe:
			for ingredient in recipes[recipe]:
				if !ingredients.has(ingredient):
					is_current_recipe = false
		
			if is_current_recipe:
				return recipe
	
	return "gibberish"


func _on_Button_Mix_pressed():
	print(slots.size())
	var slot_types : Array
	if slots.size() == slots_amount:
		for card in slots:
			if(cards[card]["Type"] != "neutral"):
				slot_types.append(slots[card]["Type"])
				slot_types.sort()
				print(slot_types)
		result.append(_match_recipe(slot_types)) # + )
		emit_signal("potion_brewed", _match_recipe(slot_types))
		_clear_slots()
		slot_types.clear()


func _on_Inventario_card_dropped(card_name):
	add_to_slots(card_name)
