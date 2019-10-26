extends Control

const CONFIG_JSON_PATH = "res://TextResources/Config.json"

var ConfigDict : Dictionary
func _ready():
	var ConfigJsonFile = File.new()
	
	ConfigJsonFile.open(CONFIG_JSON_PATH, File.READ)
	 
	var ConfigJsonAsText = ConfigJsonFile.get_as_text()
	
	ConfigDict = parse_json(ConfigJsonAsText)