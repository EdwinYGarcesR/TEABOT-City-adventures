extends CharacterBody2D

@onready var clothes_sprite: Sprite2D = $Sprite2D/ClothesSprite
@onready var face_sprite: Sprite2D = $Sprite2D/FaceSprite
@onready var hair_sprite: Sprite2D = $Sprite2D/HairSprite
@onready var robot_sprite: Sprite2D = $Sprite2D/RobotSprite

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	clothes_sprite.frame = Global.clothes_frame
	face_sprite.frame = Global.face_frame
	hair_sprite.frame = Global.hair_frame
	robot_sprite.frame = Global.bot_frame
	animation_player.play("idle_animation")

#Control de la animación del personaje
func animation_control(activate: bool)-> void:
	if activate:
		animation_player.play("walk_animation")
	else:
		animation_player.play("idle_animation")
	
