extends Control

func _on_video_stream_player_finished() -> void:
	GameManager.change_game_stage("beginning")
	pass # Replace with function body.
