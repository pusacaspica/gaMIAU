extends Node

onready var recipes : Dictionary = PotionsDB.Potions
onready var cards : Dictionary = CardsDB.Cards

var slots : Array
var slots_amount = 4
var occupied_slots = 0

var inventory : Dictionary = {
	"CardTest" : 4,
	"CardTest2:" : 4
}

func add_to_slots(id):
	if occupied_slots < slots_amount:
		occupied_slots += 1
		var current_card = cards[id]
		slots.append(current_card)
	else:
		pass

