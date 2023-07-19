extends Node


const group_plane:String = "Bird"


var currentScene : PackedScene
var gameScene: PackedScene = preload("res://Game/game_scene.tscn")
var mainScene: PackedScene= preload("res://Main/main.tscn")
var score: int = 0

signal on_game_end


func changeToGameScene()->void:
	get_tree().change_scene_to_packed(gameScene)


func changeToMainScene()->void:
	get_tree().change_scene_to_packed(mainScene)
	

func _reset_score() -> void:
	score=0

func _increase_score() -> void:
	score=score+1
	print(score)
