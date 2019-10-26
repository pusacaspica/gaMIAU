extends Control

const CARD_ARTS_PATH = "res://Assets/Cards/"
const CARDS_JSON_PATH = "res://TextResources/Cards.json"

var Cards : Dictionary

func _ready():
	var CardsJsonFile = File.new()
	CardsJsonFile.open(CARDS_JSON_PATH, File.READ)
	 
	var CardsJsonAsText = CardsJsonFile.get_as_text()
	
	Cards = parse_json(CardsJsonAsText)
