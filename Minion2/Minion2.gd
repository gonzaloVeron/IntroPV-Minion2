extends Node

onready var violeta = $Violeta
var portalEnabled = false

func _ready():	
	violeta.targets = get_tree().get_nodes_in_group("Box")

func _on_Portal_area_entered(area):
	if portalEnabled:
		print("Ganaste !!")

func _on_Area2D_area_entered(area):
	portalEnabled = true
