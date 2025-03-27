extends Node
pass
	
func _on_button_down() -> void:
	if $"../AudioStreamPlayer2D".playing:
		$"../AudioStreamPlayer2D".stop()
	else:
		$"../AudioStreamPlayer2D".play()
