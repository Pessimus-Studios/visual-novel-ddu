extends Control
# Code for the first cutscene. 
func _on_video_stream_player_finished() -> void:
	GameManager.change_game_stage("start_timeline") # Cues the next stage once video is finished.
	pass # Replace with function body.
