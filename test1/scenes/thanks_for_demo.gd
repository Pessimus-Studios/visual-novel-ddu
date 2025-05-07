extends Control


func _on_main_menu_button_down() -> void:
	Engine.time_scale = 1
	Dialogic.end_timeline()
	DialogicEndTimelineEvent
	GameManager.allowOverlay = false
	GameManager.pauseMenu.hide()
	
	GameManager.enable_desaturation()
	GameManager.change_game_stage("start")
	GameManager.disable_desaturation()
