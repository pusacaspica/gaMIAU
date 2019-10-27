extends Control

const CARDS_JSON_PATH = "res://TextResources/Cards.json"

var Cards : Dictionary

func _ready():
	var CardsJsonFile = File.new()
	CardsJsonFile.open(CARDS_JSON_PATH, File.READ)
	 
	var CardsJsonAsText = CardsJsonFile.get_as_text()
	
	Cards = parse_json(CardsJsonAsText)
	
#func get_item(item_id):
 #     return Cards[item_id]
 #   else:
 #       return ITEMS["error"]