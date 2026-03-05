extends Control

func _on_button_pressed():
	GameManager.reset_game() # Reset score/lives back to 3
	get_tree().change_scene_to_file("res://scenes/world/main.tscn")
