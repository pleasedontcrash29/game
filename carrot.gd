extends Area2D

@export var min_pos: Vector2 = Vector2(-700, -700)
@export var max_pos: Vector2 = Vector2(800, 700)

var score: int = 0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	move_to_random_point()  

func pick_random_point() -> Vector2:
	var x = randf_range(min_pos.x, max_pos.x)
	var y = randf_range(min_pos.y, max_pos.y)
	return Vector2(x, y)

func move_to_random_point() -> void:
	position = pick_random_point()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("bunny"):
		score += 1	
		print("Score: ", score)
		move_to_random_point()
		update_label()

func update_label() -> void:
	%ScoreLabel.text = "Score+ " + str(score)
