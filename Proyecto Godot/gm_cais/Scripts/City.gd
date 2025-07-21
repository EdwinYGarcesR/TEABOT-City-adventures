extends Node2D

var step: int = 0

var target_ratio = 0
var moving: bool = false
var speed: float = 0.5
var target_station:int = 0
var end_path_action: int = 0 

@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D

@onready var path: PathFollow2D = $Path2D/PathFollow2D

@onready var tienda: Node2D = $Tienda
@onready var casa: Node2D = $Casa
@onready var semaforo: Node2D = $Item
@onready var semaforo2: Node2D = $Item2


@onready var character: CharacterBody2D = $Path2D/PathFollow2D/Character
@onready var mensajeloop: CanvasLayer = $Mensajeloop

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var tile_map_layer_3: TileMapLayer = $TileMapLayer3

##traffic control
@onready var path_car1: PathFollow2D = $Traffic/Path2D/PathFollow2D
@onready var path_car2: PathFollow2D = $Traffic/Path2D2/PathFollow2D
@onready var path_car3: PathFollow2D = $Traffic/Path2D3/PathFollow2D

@onready var car_1: Sprite2D = $Traffic/Path2D/PathFollow2D/Carro
@onready var car_2: Sprite2D = $Traffic/Path2D2/PathFollow2D/Sprite2D
@onready var car_3: Sprite2D = $Traffic/Path2D3/PathFollow2D/Sprite2D

@onready var traffic: Node2D = $Traffic

var tween = create_tween()
var tween2 = create_tween()
var tween3 = create_tween()

var t1_pause: bool = false
var t3_pause: bool = false

var stopped_traffic: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_along_path()
	tile_map_layer.set_visible(false)
	tile_map_layer_2.set_visible(false)
	tile_map_layer_3.set_visible(false)
	traffic.set_visible(false)
	
	semaforo.set_visible(false)
	semaforo2.set_visible(false)
	
	character.animation_control(false)
	#Ajusta la escena en su estado inicial, cargando la ciudad y diálogos establecidos para el nivel de dificultad
	match Global.lvl_actual:
		1:
			tile_map_layer.set_visible(true)
			match Global.estacion_actual:
				1:
					path.progress_ratio = 0
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl1.dialogue"), "escena2")
				4:
					path.progress_ratio = 1
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl1.dialogue"), "escena4")
		2:
			tile_map_layer_2.set_visible(true)
			match Global.estacion_actual:
				1:
					path.progress_ratio = 0
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena2")
				4:
					path.progress_ratio = 1
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl2.dialogue"), "escena6")
		3:
			tile_map_layer_3.set_visible(true)
			traffic.set_visible(true)
			semaforo.set_visible(true)
			semaforo2.set_visible(true)
			
			match Global.estacion_actual:
				1:
					path.progress_ratio = 0
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena3")
				4:
					path.progress_ratio = 1
					await get_tree().create_timer(1.5).timeout
					DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena10")

func _process(delta: float) -> void:
	if Global.lvl_actual >= 3:
		if path_car2.progress_ratio < 0.4:
			car_2.frame = 1
			car_2.scale.x = 0.5
		else:
			car_2.frame = 0
			car_2.scale.x = -0.5
		
		if path_car1.progress_ratio < 0.51:
			car_1.scale.x = -0.5
		else:
			car_1.scale.x = 0.5
		
		match stopped_traffic:
			true:
				if not t1_pause and path_car1.progress_ratio >= 0.4 and path_car1.progress_ratio <= 0.5:
					tween.pause()
					t1_pause = true
				
				if not t3_pause and path_car3.progress_ratio >= 0.3 and path_car3.progress_ratio <= 0.4:
					tween3.pause()
					t3_pause = true
			false:
				tween.play()
				tween3.play()
				t1_pause = false
				t3_pause = false
		
	if moving:
		path.progress_ratio = move_toward(path.progress_ratio, target_ratio, speed * delta)
		if is_equal_approx(path.progress_ratio, target_ratio):
			moving = false
			character.animation_control(false)
			match end_path_action:
				1:
					changes_stations()
				2:
					step = step + 1
					show_dialog()

#Método que ajusta movimiento del personaje dentro del camino
func move_to_path(point_map: float, id_station: int, end_action: int)-> void:
	mensajeloop.stop()
	target_ratio = point_map
	target_station = id_station
	end_path_action = end_action
	moving = true
	character.animation_control(true)

func changes_stations()-> void:
	match target_station:
		0:
			casa.change_scene()
		1:
			tienda.change_scene()

func play_audio():
	Global.dialogue_audio = true
	audio_stream.stream = Global.audio_actual
	audio_stream.play()

func _on_audio_stream_player_2d_finished() -> void:
	Global.dialogue_audio = false

func zoom_to(target_zoom: float, duration: float = 0.5):
	var tween := create_tween()
	tween.tween_property(self, "scale", Vector2(target_zoom, target_zoom), duration)

#Método que mueve los automóviles
func move_along_path():
	tween.tween_property(path_car1, "progress_ratio", 1.0, 2.0)
	tween.tween_property(path_car1, "progress_ratio", 0.0, 0.0)
	tween.set_loops()
	
	tween2.tween_property(path_car2, "progress_ratio", 1.0, 2.0)
	tween2.tween_property(path_car2, "progress_ratio", 0.0, 0.0)
	tween2.set_loops()

	tween3.tween_property(path_car3, "progress_ratio", 1.0, 2.0)
	tween3.tween_property(path_car3, "progress_ratio", 0.0, 0.0)
	tween3.set_loops()
	tween3.set_loops()

#Carga el diálogo según el estado del juego
func show_dialog()->void:
	match Global.lvl_actual:
		3:
			match Global.estacion_actual:
				1:
					match step:
						1:
							DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena4")
						2:
							DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena5")
				4:
					match step:
						1:
							DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena11")
						2:
							DialogueManager.show_dialogue_balloon(load("res://Dialogues/tiendalvl3.dialogue"), "escena12")

#Método de la señal de semáforo
func set_stop_traffic(enabled: bool)-> void:
	if enabled:
		semaforo.sprite_2d.frame = 1
		semaforo2.sprite_2d.frame = 1
		stopped_traffic = true
	else:
		semaforo.sprite_2d.frame = 0
		semaforo2.sprite_2d.frame = 0
		stopped_traffic = false
