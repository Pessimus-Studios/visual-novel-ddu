extends Node 
# Changed from Control to Node for a singleton
var gameStage: String = "start"
var saveSlot: int = 0

func _ready() -> void:
	handle_scene_change()
	pass

# Function that changes the gameStage to the string it recieves and updates the game stage.
# Call the function by: GameManager.change_game_stage("")
func change_game_stage(new_stage: String) -> void:
	gameStage = new_stage
	handle_scene_change()

func game_save_slot(newSave: int) -> void:
	saveSlot = newSave
 
func handle_scene_change() -> void: 
	# Switch statement for changing game stage
	match GameManager.gameStage:
		"start": 	# This is the starting phase.
			get_tree().change_scene_to_file("res://scenes/startGame.tscn")
			
		"intro_cutScene": # Naming convention is a little shoddy rn - L
			get_tree().change_scene_to_file("res://scenes/cutScene1.tscn")
			
		"start_timeline": # "beginning" means the start of the game
			Dialogic.start("res://timelines/start.dtl")
			
		"MrC1_timeline": #MrC1 in Twine
			Dialogic.start("res://timelines/MrC1.dtl")
			
		"MrC2_timeline": #MrC2 in Twine
			Dialogic.start("res://timelines/MrC2.dtl")
			
		"act1_cutScene": # Refer to cutScene2.tscn. Plays video, goes to theRoad1_timeline
			get_tree().change_scene_to_file("res://scenes/cutScene2.tscn")
		
		"theRoad1_timeline": #TheRoad1 in Twine
			Dialogic.start("res://timelines/TheRoad1.dtl")
