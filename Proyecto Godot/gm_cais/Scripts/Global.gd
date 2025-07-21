extends Node

var estacion_actual: int = 1
var audio_actual
var dialogue_audio: bool = false
var lvl_actual: int = 1
var lvl: int = 1

var hair_frame: int = 0
var face_frame: int = 0
var clothes_frame: int = 0

var bot_gender: int = 0
var bot_frame: int = 0
var glow_color: int = 1

var audios_tiendalvl1_m = [
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S1L1.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S2L1.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L1.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L2.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L4O1.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L4O2.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L5.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S4L1.mp3")
	]

var audios_tiendalvl1_f = [
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E1L1_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E2L1_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L1_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L2_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L4O1_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L4O2_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L5_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E4L1_F.mp3")
	]

var audios_tiendalvl2_m = [
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E1D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E1D2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E2D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E2D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E2D1_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E2D2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E3D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E3D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E3D1_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E4D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E4D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E4D2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E5D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Masculino/E6D1.mp3"),
]

var audios_tiendalvl2_f = [
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E1D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E1D2G.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E2D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E2D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E2D1G_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E2D2G.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E3D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E3D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E3D1G_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E4D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/STienda/E4D1SR_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E4D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E4D2G.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E5D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl2/Femenino/E6D1G.mp3"),
]

var audios_tiendalvl3_m = [
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E1D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E1D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E1D1_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E2D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E3D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E3D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E3D1_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E3D1_4.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E4D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E4D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E4D1_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E5D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E5D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E6D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E7D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/STienda/E8D1SR_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/STienda/E8D1SR_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D1_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D1_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D2_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D2_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D3_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D3_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D4_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D4_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E8D5.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E9D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E10D1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Masculino/E12D1.mp3")
]

var audios_tiendalvl3_f = [
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E1D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E1D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E1D1G_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E2D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E3D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E3D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E3D1G_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E3D1G_4.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E4D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E4D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E4D1G_3.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E5D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E5D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E6D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E7D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/STienda/E8D1SR_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/STienda/E8D1SR_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D1G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D1G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D2G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D2G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D3G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D3G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D4G_1.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D4G_2.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E8D5G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E9D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E10D1G.mp3"),
	preload("res://Assets/Narrador_tiendalvl3/Femenino/E12D1G.mp3")
]

var audios_loop_tienda_m = [ 
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S1L2B.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S2L2B.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L3B.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L4O1B.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S3L4O2B.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Masculino/S4L2B.mp3")
]

var audios_loop_tienda_f = [
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E1L2B_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E2L2B_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L3B_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L4O1B_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L4O2B_F.mp3"),
	preload("res://Assets/Narrador_tiendalvl1/Femenino/E3L6B_F.mp3")
]

var text_loop_tienda = [ 
	"Para salir de casa, dale a la puerta",
	"Para ir a la tienda, dale a la casita roja",
	"Selecciona lo que te gustaría comprar",
	"Dale al estante para tomar  una galleta",
	"Dale a la nevera para tomar una caja de jugo",
	"Para regresar, dale a la casa azul",
	"Dale a la caja registradora para hablar con el señor de la tienda",
	"Dale al mostrador para tomar una manzana"
]
# Called when the node enters the scene tree for the first time.

var audios_menu_m = [
	preload("res://Assets/Narrador_menu/Masculino/Teabot1.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot2.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot3.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot4.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot5.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot6.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot7.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot8.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot9.mp3")
	]

var audios_menu_f = [
	preload("res://Assets/Narrador_menu/Masculino/Teabot1.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot2.mp3"),
	preload("res://Assets/Narrador_menu/Masculino/Teabot3.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl4.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl5.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl6.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl7.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl8.mp3"),
	preload("res://Assets/Narrador_menu/Femenino/Teagirl9.mp3"),
]
	
	
func _ready() -> void:
	pass # Replace with function body.

func load_mp3(id: int)-> void:
	match bot_gender:
		0:
			audio_actual = audios_tiendalvl1_m[id]
		1:
			audio_actual = audios_tiendalvl1_f[id]

func load_mp3_lvl2(id: int)-> void:
	match bot_gender:
		0:
			audio_actual = audios_tiendalvl2_m[id]
		1:
			audio_actual = audios_tiendalvl1_f[id]

func load_mp3_lvl3(id: int)-> void:
	match bot_gender:
		0:
			audio_actual = audios_tiendalvl3_m[id]
		1:
			audio_actual = audios_tiendalvl3_f[id]

func load_mp3_menu(id: int)-> void:
	match bot_gender:
		0:
			audio_actual = audios_menu_m[id]
		1:
			audio_actual = audios_menu_f[id]

func load_loop(id: int)-> void:
	match bot_gender:
		0:
			audio_actual = audios_loop_tienda_m[id]
		1:
			audio_actual = audios_loop_tienda_f[id]
 
func load_loop_text(id: int):
	return text_loop_tienda[id]
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
			get_tree().change_scene_to_file("res://Scenes/level_selector.tscn")
