extends TextureRect

var card_name : String
var old_texture

func _ready():
	rect_size.x = Config.ConfigDict["CardSize"]["x"]
	rect_size.y = Config.ConfigDict["CardSize"]["y"]
	rect_min_size.x = Config.ConfigDict["CardSize"]["x"]
	rect_min_size.y = Config.ConfigDict["CardSize"]["y"]
	pass