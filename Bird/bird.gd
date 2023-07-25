extends CharacterBody2D

const GRAVITY:float = 1900.0
const POWER:float = -400.0

@onready var animation_player = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player=$AudioStreamPlayer
@onready var player_hit_audio_player = $"Player Hit Audio"
@onready var player_die_audio_player = $"Player Die Audio"

var dead:bool = false

func _ready():
	pass


func _physics_process(delta):
	velocity.y+=delta*GRAVITY
	fly()
	move_and_slide()
	if is_on_floor()==true:
		die()


func fly() -> void :
	if Input.is_action_just_pressed("fly")==true:
		velocity.y=POWER
		animation_player.play("bird_angle_animation")
		audio_stream_player.play()

func  die() -> void:
	if(dead)==true:
		return
	dead=true
	GameManager.on_game_end.emit()
	player_hit_audio_player.play()
	player_die_audio_player.play()
	animated_sprite_2d.stop()
	set_physics_process(false)
