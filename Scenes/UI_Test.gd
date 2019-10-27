extends Control

onready var CardBase = preload("res://Scenes/CardBase.tscn")
onready var ClientDialog = $Cliente/Panel/Label
onready var Clients = ClientDB.Level1

var current_client
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	current_client = Clients[randi() % Clients.size()]
	ClientDialog.text = current_client["Fala"]
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Moedas/Label.text = str(CurrentInvent.money)
	

func _on_Alchemy_potion_brewed(potion):
	if potion == current_client["Potion"]:
		CurrentInvent.money += 60
	else:
		CurrentInvent.money += 40
	_enter_client()

func _enter_client():
	Clients.remove(Clients.bsearch(current_client))
	if !Clients.empty():
		randomize()
		current_client = Clients[randi() % Clients.size()]
		ClientDialog.text = current_client["Fala"]
	else:
		get_tree().change_scene("res://Scenes/DeckSelection.tscn")


func _on_Button_Mix_pressed():
	pass # Replace with function body.
