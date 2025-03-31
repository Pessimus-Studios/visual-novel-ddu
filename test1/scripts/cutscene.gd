extends Control

func _on_video_stream_player_finished() -> void:
	Dialogic.start("res://timelines/mainTimeline.dtl")
	pass 
