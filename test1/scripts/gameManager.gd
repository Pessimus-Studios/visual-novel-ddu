extends Node 
# Changed from Control to Node for a singleton
var gameStage: String = "start"
var saveSlot: String
var currentMood: int = 10
var desaturation_overlay: CanvasLayer
var overlay_scene = preload("res://scenes/saturatrionDrain.tscn")

func _ready() -> void:
	handle_scene_change()
	# Preload but don't instantiate yet
	preload("res://scenes/saturatrionDrain.tscn")

func enable_desaturation(intensity: float = 1.0) -> void:
	if not desaturation_overlay:
		var overlay_scene = preload("res://scenes/saturatrionDrain.tscn")
		desaturation_overlay = overlay_scene.instantiate()
		get_tree().root.add_child(desaturation_overlay)
		# Move it to the top (in case other CanvasLayers exist)
		desaturation_overlay.layer = 128  # High number to ensure it's on top
	
	var color_rect = desaturation_overlay.get_node("ColorRect")
	color_rect.material.set_shader_parameter("intensity", intensity)

# Function that changes the gameStage to the string it recieves and updates the game stage.
# Call the function by: GameManager.change_game_stage("")
func change_game_stage(new_stage: String) -> void:
	gameStage = new_stage
	handle_scene_change()

func game_save_slot(newSave: String) -> void:
	saveSlot = newSave

func save_Game() -> void:
	Dialogic.Save.save(saveSlot)
	
func choice_mood(choiceMood: int) -> void:
	currentMood += choiceMood

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
