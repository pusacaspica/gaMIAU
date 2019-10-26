extends Node

onready var recipes : Dictionary = PotionsDB.Potions
onready var cards : Dictionary = CardsDB.Cards

var slots : Dictionary
var slots_amount = 4

var inventory : Dictionary = {
	"CardTest" : 4,
	"CardTest2" : 4
}

func _ready():
	_update_inventory()

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
		inventory[id] -= 1
		_update_inventory()
	else:
		pass

func _on_Button_Type1_pressed():
	add_to_slots("CardTest")
	


func _on_Button_Type2_pressed():
	add_to_slots("CardTest2")



func _on_Button_Mix_pressed():
	pass # Replace with function body.
