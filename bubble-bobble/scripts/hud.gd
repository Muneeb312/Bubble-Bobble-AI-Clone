extends CanvasLayer

@onready var score_label = $MainControl/ScoreLabel
@onready var lives_container = $MainControl/LivesContainer

# Use a preloaded texture for the heart/life icon
var heart_texture = preload("res://assets/sprites/heart.png") 

func _process(delta):
	# 1. Update Score Text
	score_label.text = "SCORE: " + str(GameManager.score)
	
	# 2. Update Lives (Visuals)
	update_lives_display()

func update_lives_display():
	# Get current number of heart icons
	var current_hearts = lives_container.get_child_count()
	var target_lives = GameManager.lives
	
	# If we have too many hearts, remove them
	if current_hearts > target_lives:
		for i in range(current_hearts - target_lives):
			lives_container.get_child(0).queue_free()
			
	# If we have too few hearts, add them
	elif current_hearts < target_lives:
		for i in range(target_lives - current_hearts):
			var heart = TextureRect.new()
			heart.texture = heart_texture
			heart.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			lives_container.add_child(heart)
