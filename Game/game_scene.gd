extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var game_over_label = $CanvasLayer/GameOverLabel
@onready var restart_label = $CanvasLayer/RestartLabel
@onready var button = $CanvasLayer/Button


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPipes()
	GameManager.on_game_end.connect(_on_game_over)


func spawnPipes() -> void:
	var newY = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipe = pipes_scene.instantiate()
	new_pipe.position = Vector2(spawn_l.position.x, newY)
	pipes_holder.add_child(new_pipe)


func _on_spawn_timer():
	spawnPipes()


func _on_game_over():
	game_over_label.show()
	restart_label.show()
	button.show()
	spawn_timer.stop()


func _on_restart():
	GameManager.changeToMainScene()
