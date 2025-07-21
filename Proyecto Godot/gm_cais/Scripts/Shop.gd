extends Node2D

var step: int = 0

var target_ratio = 0
var moving: bool = false
var speed: float = 0.5
var target_station:int = 0
var end_path_action:int = 0

@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var item: Node2D = $Item
@onready var item_2: Node2D = $Item2
@onready var item_3: Node2D = $Item3
@onready var item_4: Node2D = $Item4

@onready var puerta: Node2D = $Puerta
@onready var path: PathFollow2D = $Path2D/PathFollow2D
@onready var character: CharacterBody2D = $Path2D/PathFollow2D/Character

@onready var mensajeloop: CanvasLayer = $Mensajeloop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path.progress_ratio = 0.2
	character.animation_control(false)
	Global.estacion_actual = 4
	match Global.lvl_actual:
		1:
			await get_tree().create_timer(1.5).timeout
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl1.dialogue"), "escena3")
		2:
			await get_tree().create_timer(1.5).timeout
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena3")
		3:
			await get_tree().create_timer(1.5).timeout
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena6")
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		path.progress_ratio = move_toward(path.progress_ratio, target_ratio, speed * delta)
		if is_equal_approx(path.progress_ratio, target_ratio):
			moving = false
			character.animation_control(true)
			match end_path_action:
				1:
					changes_stations()
				2:
					step = step + 1
					show_dialog()

func move_to_path(point_map: float, id_station: int, end_action: int)-> void:
	mensajeloop.stop()
	target_ratio = point_map
	target_station = id_station
	end_path_action = end_action
	character.animation_control(true)
	moving = true

func changes_stations()-> void:
	match target_station:
		1:
			puerta.change_scene()

func show_dialog()->void:
	match Global.lvl_actual:
		1:
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl1.dialogue"), "escena3_2")
		2:
			match step:
				1:
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena4")
				2:
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena5")
		3:
			match step:
				1:
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena7")
				2:
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena8")
				3:
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena9")

func set_glow_items(id_item: int)-> void:
	match id_item:
		1:
			item.set_glow(true)
		2:
			item_2.set_glow(true)
		3:
			item_3.set_glow(true)
		4:
			item_4.set_glow(true)

func set_step(new_step:int)->void:
	step = new_step
	
func play_audio():
	Global.dialogue_audio = true
	audio_stream.stream = Global.audio_actual
	audio_stream.play()

func _on_audio_stream_player_2d_finished() -> void:
	Global.dialogue_audio = false
