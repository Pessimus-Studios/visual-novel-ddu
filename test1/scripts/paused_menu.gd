extends CanvasLayer


func _on_quit_button_down() -> void:
	Dialogic.end_timeline()
	Dialogic.clear()
	GameManager.pauseMenu.hide()
	GameManager.change_game_stage("start")
	pass # Replace with function body.
