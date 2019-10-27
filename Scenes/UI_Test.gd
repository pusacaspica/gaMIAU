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
	


