extends CanvasLayer

func _on_quit_button_down() -> void:
	Engine.time_scale = 1
	Dialogic.end_timeline()
	DialogicEndTimelineEvent
	GameManager.allowOverlay = false
	GameManager.pauseMenu.hide()
	
	GameManager.enable_desaturation()
	GameManager.change_game_stage("start")
	await get_tree().create_timer(2.5).timeout
	GameManager.disable_desaturation()

func _on_settings_button_down() -> void:
	var current_mode = DisplayServer.window_get_mode()
	if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
