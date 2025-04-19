extends Node 
# Changed from Control to Node for a singleton
var gameStage: String = "start"


func _ready() -> void:
	handle_scene_change()
	pass

# Function that changes the gameStage to the string it recieves and updates the game stage.
# Call the function by: GameManager.change_game_stage("")
func change_game_stage(new_stage: String) -> void:
	gameStage = new_stage
	handle_scene_change()
 
func handle_scene_change() -> void: 
	# Switch statement for changing game stage
	match GameManager.gameStage:
		"start": 	# This is the starting phase.
			get_tree().change_scene_to_file("res://scenes/startGame.tscn")
		"cutScene1": # Naming convention is a little shoddy rn - L
			get_tree().change_scene_to_file("res://scenes/cutScene1.tscn")
		"beginning": # "beginning" means the start of the game
			Dialogic.start("res://timelines/mainTimeline.dtl")
		"cutScene2TheRoad": # "beginning" means the start of the game
			get_tree().change_scene_to_file("res://scenes/cutScene2.tscn")
		"theRoad": # "beginning" means the start of the game
			Dialogic.start("res://timelines/theRoad.dtl")
