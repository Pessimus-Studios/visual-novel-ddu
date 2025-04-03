extends Control
# Code for main menu.
func _on_button_button_down() -> void: # Button that cues cutscene.
	GameManager.change_game_stage("cutScene1") 
	pass
	
