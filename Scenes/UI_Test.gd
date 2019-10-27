extends Control

onready var CardBase = preload("res://Scenes/CardBase.tscn")

var ClientOrder = [
	{ "Potion" : "happy_potion", "Fala" : "Blablabla" }
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Moedas/Label.text = str(CurrentInvent.money)

