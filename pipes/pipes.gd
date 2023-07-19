extends Node2D

const SCROLL_SPEED:float = 150
var movePipes:bool = true

func _ready():
	movePipes=true
	GameManager.on_game_end.connect(_on_game_over)

func _process(delta):
	if(movePipes)==true:
		position.x-=delta*SCROLL_SPEED

func _on_screen_exited():
	queue_free()

func _on_game_over():
	movePipes=false


func _on_body_entered(body):
	if(body.is_in_group(GameManager.group_plane))==true:
		body.die()


func _on_body_exited(body):
	if(body.is_in_group(GameManager.group_plane))==true:
		GameManager._increase_score()
