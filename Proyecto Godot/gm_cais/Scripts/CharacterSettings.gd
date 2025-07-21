extends Control

var actual_menu:int = 1
var bot_gender: int = 0

@onready var bot_sprite_2d: Sprite2D = $ColorSelection/Panel/BotSprite2D

@onready var clothes_sprite: Sprite2D = $SkinSelection/Panel/ClothesSprite
@onready var face_sprite: Sprite2D = $SkinSelection/Panel/FaceSprite
@onready var hair_sprite: Sprite2D = $SkinSelection/Panel/HairSprite


@onready var animation_menu: AnimationPlayer = $AnimationMenu

@onready var robot_selection: Control = $RobotSelection
@onready var color_selection: Control = $ColorSelection
@onready var skin_selection: Control = $SkinSelection
@onready var glow_selection: Control = $GlowSelection

@onready var item_muestra: Node2D = $GlowSelection/Panel/Item_muestra
@onready var back_bttn: Button = $BackBttn

@onready var transition: CanvasLayer = $Transition
@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D

var BALLON_PANEL = preload("res://Assets/ballon_panel.tres")
const BALLOON_DESING = preload("res://Assets/balloon_desing.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	robot_selection.visible = false
	color_selection.visible = false
	skin_selection.visible = false
	glow_selection.visible = false
	
	back_bttn.set_visible(false)
	
	BALLON_PANEL.bg_color = Color(0,0.32,0.59,1)
	BALLON_PANEL.border_color = Color(0.45,0.68,0.98,1)
	BALLON_PANEL.shadow_color = Color(0.0,0.02,0.21,1)
	DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena1")
	#animation_menu.play("Show_m1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_bot_male_pressed() -> void:
	bot_gender = 0
	bot_sprite_2d.frame = 0
	actual_menu = actual_menu + 1
	Global.bot_gender = 0
	Global.bot_frame = 0
	animation_menu.play("Hide_m1")
	back_bttn.set_visible(true)

func _on_bot_female_pressed() -> void:
	bot_gender = 1
	bot_sprite_2d.frame = 4
	actual_menu = actual_menu + 1
	Global.bot_gender = 1
	Global.bot_frame = 4
	animation_menu.play("Hide_m1")
	back_bttn.set_visible(true)

func change_scene() -> void:
	match actual_menu:
		1:
			animation_menu.play("Show_m1")
		2:
			animation_menu.play("Show_m2")
		3:
			animation_menu.play("Show_m3")
		4:
			animation_menu.play("Show_m4")
		5:
			set_character_sprites()
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena6")
			

func _on_back_bttn_pressed() -> void:
	if actual_menu > 1:
		match actual_menu:
			1:
				actual_menu = actual_menu - 1
				animation_menu.play("Hide_m1")
				back_bttn.set_visible(false)
			2:
				actual_menu = actual_menu - 1
				animation_menu.play("Hide_m2")
				Global.bot_gender = 0
				Global.bot_frame = 0
				BALLON_PANEL.bg_color = Color(0,0.32,0.59,1)
				BALLON_PANEL.border_color = Color(0.45,0.68,0.98,1)
				BALLON_PANEL.shadow_color = Color(0.0,0.02,0.21,1)
			3:
				actual_menu = actual_menu - 1
				animation_menu.play("Hide_m3")
			4:
				actual_menu = actual_menu - 1
				animation_menu.play("Hide_m4")

func _on_next_bttn_pressed() -> void:
	if actual_menu < 5:
		match actual_menu:
			1:
				actual_menu = actual_menu + 1
				animation_menu.play("Hide_m1")
				
			2:
				actual_menu = actual_menu + 1
				animation_menu.play("Hide_m2")
			3:
				actual_menu = actual_menu + 1
				animation_menu.play("Hide_m3")
			4:
				actual_menu = actual_menu + 1
				animation_menu.play("Hide_m4")
			
func set_color_robot(color:int)-> void:
	bot_sprite_2d.frame = color

func _on_blue_bttn_pressed() -> void:
	match actual_menu:
		2:
			BALLON_PANEL.bg_color = Color(0,0.32,0.59,1)
			BALLON_PANEL.border_color = Color(0.45,0.68,0.98,1)
			BALLON_PANEL.shadow_color = Color(0.0,0.02,0.21,1)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
			match bot_gender:
				0:
					set_color_robot(0)
					Global.bot_frame = 0
				1:
					set_color_robot(4)
					Global.bot_frame = 4
		4:
			Global.glow_color = 1
			item_muestra.set_glow(true)
			item_muestra.monitoring_area(false)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
		
func _on_yellow_bttn_pressed() -> void:
	match actual_menu:
		2:
			BALLON_PANEL.bg_color = Color(0.64,0.43,0.05,1)
			BALLON_PANEL.border_color = Color(0.98,0.84,0.24,1)
			BALLON_PANEL.shadow_color = Color(0.27,0.2,0.03,1)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
			match bot_gender:
				0:
					set_color_robot(1)
					Global.bot_frame = 1
				1:
					set_color_robot(5)
					Global.bot_frame = 5
		4:
			Global.glow_color = 2
			item_muestra.set_glow(true)
			item_muestra.monitoring_area(false)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
			
func _on_red_bttn_pressed() -> void:
	match actual_menu:
		2:
			BALLON_PANEL.bg_color = Color(0.87,0.41,0.41,1)
			BALLON_PANEL.border_color = Color(0.80,0.39,0.30,1)
			BALLON_PANEL.shadow_color = Color(0.22,0.03,0.0,1)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
			match bot_gender:
				0:
					set_color_robot(2)
					Global.bot_frame = 2
				1:
					set_color_robot(6)
					Global.bot_frame = 6
		4:
			Global.glow_color = 3
			item_muestra.set_glow(true)
			item_muestra.monitoring_area(false)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")

func _on_green_bttn_pressed() -> void:
	match actual_menu:
		2:
			BALLON_PANEL.bg_color = Color(0.2,0.56,0.32,1)
			BALLON_PANEL.border_color = Color(0.89,0.94,0.79,1)
			BALLON_PANEL.shadow_color = Color(0.0,0.14,0.08,1)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")
			match bot_gender:
				0:
					set_color_robot(3)
					Global.bot_frame = 3
				1:
					set_color_robot(7)
					Global.bot_frame = 7
		4:
			Global.glow_color = 4
			item_muestra.set_glow(true)
			item_muestra.monitoring_area(false)
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3_1")

func _on_animation_menu_animation_started(anim_name: StringName) -> void:
	match  anim_name:
		"Show_m1":
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena2")
		"Show_m2":
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena3")
		"Show_m3":
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena4")
		"Show_m4":
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/menu_inicial.dialogue"), "escena5")

func _on_animation_menu_animation_finished(anim_name: StringName) -> void:
	match  anim_name:
		"Hide_m1":
			#robot_selection.hide()
			change_scene()
		"Hide_m2":
			#color_selection.hide()
			change_scene()
		"Hide_m3":
			#skin_selection.hide()
			change_scene()
		"Hide_m4":
			#skin_selection.hide()
			change_scene()

func _on_left_hair_pressed() -> void:
	if hair_sprite.frame > 0:
		hair_sprite.frame = hair_sprite.frame - 1
	else:
		hair_sprite.frame = 7
		
func _on_left_face_pressed() -> void:
	if face_sprite.frame > 0:
		face_sprite.frame = face_sprite.frame - 1
	else:
		face_sprite.frame = 7
		
func _on_left_clothes_pressed() -> void:
	if clothes_sprite.frame > 0:
		clothes_sprite.frame = clothes_sprite.frame - 1
	else:
		clothes_sprite.frame = 7
		
func _on_right_hair_pressed() -> void:
	if hair_sprite.frame < 7:
		hair_sprite.frame = hair_sprite.frame + 1
	else:
		hair_sprite.frame = 0

func _on_right_face_pressed() -> void:
	if face_sprite.frame < 7:
		face_sprite.frame = face_sprite.frame + 1
	else:
		face_sprite.frame = 0

func _on_right_clothes_pressed() -> void:
	if clothes_sprite.frame < 7:
		clothes_sprite.frame = clothes_sprite.frame + 1
	else:
		clothes_sprite.frame = 0

func play_audio():
	Global.dialogue_audio = true
	audio_stream.stream = Global.audio_actual
	audio_stream.play()

func set_character_sprites() -> void:
	Global.clothes_frame = clothes_sprite.frame
	Global.face_frame = face_sprite.frame
	Global.hair_frame = hair_sprite.frame
	
func _on_audio_stream_player_2d_finished() -> void:
	Global.dialogue_audio = false
