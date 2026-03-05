extends Node

var score = 0
var lives = 3

func reset_game():
	score = 0
	lives = 3
	
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		# Reset score/lives if using GameManager
		if GameManager: GameManager.reset_game()

		# Reload the current scene
		get_tree().reload_current_scene()
