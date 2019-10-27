extends Node

const POTIONS_JSON_PATH = "res://TextResources/Potions.json"

var Potions : Dictionary

func _ready():
	var PotionsJsonFile = File.new()
	PotionsJsonFile.open(POTIONS_JSON_PATH, File.READ)
	
	var PotionsJsonAsText = PotionsJsonFile.get_as_text()
	Potions = parse_json(PotionsJsonAsText) 

#func _process(delta):
#	if Input.is_action_pressed("ui_accept"):
#		for i in Potions:
#			print(Potions[i])
			