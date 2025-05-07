extends Control
# Code for the second cutscene. 
func _on_video_stream_player_finished() -> void:
	GameManager.change_game_stage("Conflict2_timeline")
	
