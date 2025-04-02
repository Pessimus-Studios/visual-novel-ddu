extends Control

func _ready():
	# Connect to the timeline_ended signal
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_video_stream_player_finished() -> void:
	Dialogic.start("res://timelines/mainTimeline.dtl")

func _on_timeline_ended() -> void:
	print("Timeline ended, changing scene...")  # Debug print
	get_tree().change_scene_to_file("res://scenes/control.tscn")
