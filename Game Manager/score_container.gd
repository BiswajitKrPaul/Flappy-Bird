extends HBoxContainer

var index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_increase_score.connect(_on_increase_score)
	# It's called since for the 1st time the score is zero and it should be displayed before increase score signal emitted
	_on_increase_score()


func _on_increase_score() -> void:
	var score = str(GameManager.score)
	while get_child_count() < score.length():
		_add_texture_rect()
	for i in get_children():
		i.texture = load("res://sprites/" + score[index] + ".png")
		index = index + 1
	index = 0


func _add_texture_rect():
	var textureRect = TextureRect.new()
	add_child(textureRect)
