extends Control
# Code for main menu.


# Script for the start button on the startscreen.
func _on_start_button_down() -> void:
	GameManager.change_game_stage("cutScene1") 
	
# Script for the setting button on the startscreen.
func _on_settings_button_down() -> void:
	pass 

# Script for the quit button on the startscreen.
func _on_quit_button_down() -> void:
	get_tree().quit()
