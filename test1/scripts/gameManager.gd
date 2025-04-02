extends Node  # Changed from Control to Node for a singleton
var gameStage: String = "start"

func change_game_stage(new_stage: String) -> void:
	gameStage = new_stage
	handle_scene_change()

func handle_scene_change() -> void:
	match GameManager.gameStage:
		"start":
			get_tree().change_scene_to_file("res://scenes/startGame.tscn")
		"cutScene1":
			get_tree().change_scene_to_file("res://scenes/cutScene1.tscn")
		"beginning":
			Dialogic.start_timeline("res://timelines/mainTimeline.dtl")
func _ready() -> void:
	handle_scene_change()
	pass
	
