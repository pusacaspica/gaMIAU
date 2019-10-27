extends Control

onready var potions : Dictionary = PotionsDB.Potions
onready var liquid = $LiquidTexture

var color_values : Dictionary = {
	"Pink" : "ff00b4",
	"Gold" : "ffc300" ,
	"Red" : "#ff0000",
	"Light Purple" : "ff00ff",
	"Purple" : "b900ff",
	"Green" :"00ff00",
	"Light Blue" : "00ffff" ,
	"Yellow" : "ffff00",
	"Blue" : "0000ff",
	"Gray" : "7b6372",
}

func get_potion_color(potion):
	return potions[potion]["Color"]

func set_potion_color(color):
	var color_value = color_values.get(color)
	
	if color == "Rainbow":
		$AnimationPlayer.play("rainbow")
	else:
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop()
			print(color_value)
			liquid.set_self_modulate(color_value);
		print(color_value)
		liquid.set_self_modulate(color_value);  
	
