extends CanvasLayer

func _on_quit_button_down() -> void:
	Engine.time_scale = 1
	Dialogic.end_timeline()
	DialogicEndTimelineEvent
	GameManager.allowOverlay = false
	GameManager.pauseMenu.hide()
	
	GameManager.enable_desaturation()
	await get_tree().create_timer(3.0).timeout
	GameManager.disable_desaturation()
	
	GameManager.change_game_stage("start")
	
