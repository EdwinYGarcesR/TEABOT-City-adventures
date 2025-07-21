extends Node2D


var dialogue

var target_ratio: float = 0.0
var moving: bool = false
var speed: float = 0.5
var target_station:int = 0
var end_path_action: int = 0

@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var path: PathFollow2D = $Path2D/PathFollow2D

@onready var change_station: Node2D = $ChangeStation
@onready var wallet: Node2D = $Wallet


@onready var character: CharacterBody2D = $Path2D/PathFollow2D/Character
@onready var mensajeloop: CanvasLayer = $Mensajeloop


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character.animation_control(false)
	wallet.set_visible(false)
	
	#Ajusta la escena en su estado inicial, cargando la casa y diálogos establecidos para el nivel de dificultad
	match Global.lvl_actual:
		1:
			match Global.estacion_actual:
				1:
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl1.dialogue"), "escena1")
		2:
			match Global.estacion_actual:
				1:
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena1")
		3:
			wallet.set_visible(true)
			match Global.estacion_actual:
				1:
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena1")

#Movimiento del personaje
func _process(delta: float) -> void:
	if moving:
		path.progress_ratio = move_toward(path.progress_ratio, target_ratio, speed * delta)
		if is_equal_approx(path.progress_ratio, target_ratio):
			moving = false
			character.animation_control(false)
			match end_path_action:
				1:
					changes_stations()
				2:
					show_dialog()

func show_dialog()->void:
	match Global.lvl_actual:
		3:
			DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena2")

#Método que ajusta el destino del movimiento del personaje dentro del camino
func move_to_path(point_map: float, id_station: int, end_action: int)-> void:
	mensajeloop.stop()
	target_ratio = point_map
	target_station = id_station
	end_path_action = end_action
	moving = true
	character.animation_control(true)

#Método que cambia de estación
func changes_stations()-> void:
	match target_station:
		1:
			change_station.change_scene()

func play_audio():
	Global.dialogue_audio = true
	audio_stream.stream = Global.audio_actual
	print("Juan Carlos Bodoque")
	audio_stream.play()

func _on_audio_stream_player_2d_finished() -> void:
	Global.dialogue_audio = false
