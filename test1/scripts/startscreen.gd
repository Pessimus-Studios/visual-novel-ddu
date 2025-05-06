extends Control

func _ready() -> void:
	hide_buttons([$SaveSlot1, $deleteSlot1, $SaveSlot2, $deleteSlot2, $back])
	
# Hides buttons when called
func hide_buttons(buttons: Array):
	for button in buttons:
		button.hide()
		button.disabled = true
		
# Shows buttons when called
func show_buttons(buttons: Array):
	for button in buttons:
		button.show()
		button.disabled = false
		
func _on_start_button_down() -> void:
	# Only shows the delete button for saves if they have data on.
	if Dialogic.Save.has_slot("1"):
		show_buttons([$deleteSlot1])
	if Dialogic.Save.has_slot("2"):
		show_buttons([$deleteSlot2])
	
	# Shows the save slots and the back buttons, while hiding the start, settings and quit buttons
	show_buttons([$SaveSlot1, $SaveSlot2, $back])
	hide_buttons([$Start, $Settings, $Quit])
	pass
	
# Script for the setting button on the startscreen.
func _on_settings_button_down() -> void:
	pass 

# Script for the quit button on the startscreen.
func _on_quit_button_down() -> void:
	get_tree().quit()

# Start Panel stuff Below
func _on_back_button_down() -> void:
	hide_buttons([$SaveSlot1, $deleteSlot1, $SaveSlot2, $deleteSlot2, $back])
	show_buttons([$Start, $Settings, $Quit])
	pass

# Code for save button 1
func _on_save_slot_1_button_down() -> void:
	if Dialogic.Save.has_slot("1"):
		GameManager.game_save_slot("1")
		Dialogic.Save.load("1")
	else:
		GameManager.game_save_slot("1")
		GameManager.change_game_stage("intro_cutScene")

# Code for save button 2
func _on_save_slot_2_button_down() -> void:
	if Dialogic.Save.has_slot("2"):
		GameManager.game_save_slot("2")
		Dialogic.Save.load("2")
	else:
		GameManager.game_save_slot("2")
		GameManager.change_game_stage("intro_cutScene")
		
# Code for deleting save slot 1
func _on_delete_slot_1_button_down() -> void:
	Dialogic.Save.delete_slot("1") 
	hide_buttons([$deleteSlot1])
	pass 

# Code for deleting save slot 2
func _on_delete_slot_2_button_down() -> void:
	Dialogic.Save.delete_slot("2")
	hide_buttons([$deleteSlot2])
