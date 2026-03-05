extends CharacterBody2D
var speed = 50.0
var direction = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_wall():
		direction *= -1 # Turn around if we hit a wall

	velocity.x = direction * speed
	move_and_slide()


#func _on_hitbox_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
	
func _on_hitbox_body_entered(body):
	if body.name == "Player":
		body.take_damage() # We will write this function next!
