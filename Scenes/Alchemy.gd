
extends Node

onready var potions : Dictionary = PotionsDB.Potions
onready var cards : Dictionary = CardsDB.Cards

var slots : Dictionary
var slots_amount = 4
var recipes : Dictionary

var inventory : Dictionary = {
	"CardTest" : 4,
	"CardTest2" : 4
}

func _ready():
	_update_inventory()
	_set_recipes()

func _set_recipes():
	for potion in potions:
		recipes[potion] = potions[potion]["Ingredients"]
	print(recipes)

func _update_inventory():
	var label_1 : Label = $Button_Type1/Amount_Label 
	var label_2 : Label = $Button_Type2/Amount_Label 
	
	label_1.text = "Quantidade : " + str(inventory["CardTest"])
	label_2.text = "Quantidade : " + str(inventory["CardTest2"])
	
func add_to_slots(id):
	var occupied_slots = $Slots.get_child_count()
	if occupied_slots < slots_amount:
		var current_card = Label.new()
		current_card.text = id
		$Slots.add_child(current_card)
		slots[occupied_slots - 1] = cards[id]
		print(slots[occupied_slots - 1])
		inventory[id] -= 1
		_update_inventory()
	else:
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
		
	#	else:
	#		print("Deu nao, mals") 
	
	
	
func _on_Button_Type1_pressed():
	add_to_slots("CardTest")
	


func _on_Button_Type2_pressed():
	add_to_slots("CardTest2")



func _on_Button_Mix_pressed():
	var slot_types : Array
	for card in slots:
		slot_types.append(slots[card]["Type"])
		slot_types.sort()
	print(_match_recipe(slot_types))
