extends Node

var CUTSCENE : String = "res://scenes/Cutscene.tscn"

func _ready() -> void:
	get_tree().change_scene_to_file(CUTSCENE)
	pass 
