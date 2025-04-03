extends Node 
# Changed from Control to Node for a singleton
var gameStage: String = "start"

func _ready() -> void:
	handle_scene_change()
	pass

func change_game_stage(new_stage: String) -> void: # ngl idk what this does - L
	gameStage = new_stage
	handle_scene_change()

func handle_scene_change() -> void: # Changes scenes, kinda works like a switch statement
	match GameManager.gameStage:
		"start": # This is the starting phase.
			get_tree().change_scene_to_file("res://scenes/startGame.tscn")
		"cutScene1": # Naming convention is a little shoddy rn - L
			get_tree().change_scene_to_file("res://scenes/cutScene1.tscn")
		"beginning": # "beginning" means the start of the gmae
			Dialogic.start("res://timelines/mainTimeline.dtl")

	
