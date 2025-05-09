extends Node 
# Changed from Control to Node for a singleton
var gameStage: String = "start"
var saveSlot: String
var currentMood: int = 10
var desaturationOverlay: CanvasLayer
var overlayScene = preload("res://scenes/saturatrionDrain.tscn")
var allowOverlay: bool
var paused: bool = false
var pauseMenu


func _ready() -> void:
	var pause_menu_scene = preload("res://scenes/pausedMenu.tscn")
	pauseMenu = pause_menu_scene.instantiate()
	pauseMenu.layer = 127
	add_child(pauseMenu)
	pauseMenu.hide()
	handle_scene_change()

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if allowOverlay:
			pause_menu()
		else:
			pass

func pause_menu() -> void:
	if pauseMenu == null:
		push_error("PauseMenu is null! Cannot toggle pause menu.")
		return
	
	if paused:
		pauseMenu.hide()
		Engine.time_scale = 1
		restore_audio()
	else:
		pauseMenu.show()
		mute_audio()
		Engine.time_scale = 0
	
	paused = !paused

func mute_audio() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -20.0)
	 
func restore_audio() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0.0)
	

func enable_desaturation(intensity: float = 1.0):
	if not is_instance_valid(desaturationOverlay):
		var overlay_scene = preload("res://scenes/saturatrionDrain.tscn")
		desaturationOverlay = overlay_scene.instantiate()
		desaturationOverlay.set_meta("_persist", true)
		get_tree().root.call_deferred("add_child", desaturationOverlay)
		desaturationOverlay.layer = 128

	# Always set intensity, even if overlay already exists
	var color_rect = desaturationOverlay.get_node("ColorRect")
	color_rect.material.set_shader_parameter("intensity", intensity)
	
func disable_desaturation() -> void:
	if not is_instance_valid(desaturationOverlay):
		var overlay_scene = preload("res://scenes/saturatrionDrain.tscn")
		desaturationOverlay = overlayScene.instantiate()
		# Make it persist through scene changes
		desaturationOverlay.set_meta("_persist", true)
		get_tree().root.call_deferred("add_child", desaturationOverlay)
		desaturationOverlay.layer = 128
		
	var color_rect = desaturationOverlay.get_node("ColorRect")
	color_rect.material.set_shader_parameter("intensity", 0)
		
# Function that changes the gameStage to the string it recieves and updates the game stage.
# Call the function by: GameManager.change_game_stage("")
func change_game_stage(new_stage: String) -> void:
	if paused:
		paused = !paused
		Engine.time_scale = 1
		restore_audio()
	
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
			allowOverlay = false
			GameManager.pauseMenu.hide()
			get_tree().change_scene_to_file("res://scenes/startGame.tscn")
			
		"intro_cutScene": # Naming convention is a little shoddy rn - L
			allowOverlay = false
			get_tree().change_scene_to_file("res://scenes/cutScene1.tscn")
			
		"start_timeline": # "beginning" means the start of the game
			allowOverlay = true
			Dialogic.start("res://timelines/start.dtl")
			
		"MrC1_timeline": #MrC1 in Twine
			allowOverlay = true
			Dialogic.start("res://timelines/MrC1.dtl")
			
		"MrC2_timeline": #MrC2 in Twine
			allowOverlay = true
			Dialogic.start("res://timelines/MrC2.dtl")
			
		"MrC3_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/MrC3.dtl")
		
		"MrC4_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/MrC4.dtl")
		
		"MrC5_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/MrC5.dtl")
		
		"act1_cutScene": # Refer to cutScene2.tscn. Plays video, goes to theRoad1_timeline
			allowOverlay = false
			get_tree().change_scene_to_file("res://scenes/cutScene2.tscn")
			
		"gonnadie": # Refer to cutScene2.tscn. Plays video, goes to theRoad1_timeline
			allowOverlay = false
			get_tree().change_scene_to_file("res://scenes/gonnadie.tscn")
		
		"theRoad1_timeline": #TheRoad1 in Twine
			allowOverlay = true
			Dialogic.start("res://timelines/TheRoad1.dtl")
			
		"theRoad2_timeline": #TheRoad2 in Twine
			allowOverlay = true
			Dialogic.start("res://timelines/TheRoad2.dtl")
			
		"Curious3_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/Forest1.dtl")

		"Cold3_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/Cold3.dtl")
			
		"Joke2.1_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/Joke21.dtl")
			
		"Conflict1_timeline":
			allowOverlay = true
			
			Dialogic.start("res://timelines/conflict1.dtl")
			
		"Conflict2_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/conflict2.dtl")
			
		"Alone1_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/Alone1.dtl")
			
		"Sky1_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/Sky1.dtl")
			
		"LeaveC_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/LeaveC.dtl")
			
		"SaveC_timeline":
			allowOverlay = true
			Dialogic.start("res://timelines/SaveC.dtl")
		"Thanks":
			allowOverlay = true
			get_tree().change_scene_to_file("res://scenes/ThanksForDemo.tscn")
