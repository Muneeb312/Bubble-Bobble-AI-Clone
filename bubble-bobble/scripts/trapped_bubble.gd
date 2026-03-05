extends Area2D

func _physics_process(delta):
	position.y -= 50 * delta

func _on_body_entered(body):
	if body.name == "Player":
		SfxManager.get_node("PopSound").play()
		GameManager.score += 100
		print("Score: ", GameManager.score)
		queue_free()
