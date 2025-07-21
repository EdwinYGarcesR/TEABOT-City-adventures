extends Control
@onready var transition: CanvasLayer = $Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Mision_tienda/GridContainer/1_lvl1".set_visible(false)
	$"Mision_tienda/GridContainer/1_lvl2".set_visible(false)
	$"Mision_tienda/GridContainer/1_lvl3".set_visible(false)
	match Global.lvl:
		1:
			$"Mision_tienda/GridContainer/1_lvl1".set_visible(true)
		2:
			$"Mision_tienda/GridContainer/1_lvl1".set_visible(true)
			$"Mision_tienda/GridContainer/1_lvl2".set_visible(true)
		3:
			$"Mision_tienda/GridContainer/1_lvl1".set_visible(true)
			$"Mision_tienda/GridContainer/1_lvl2".set_visible(true)
			$"Mision_tienda/GridContainer/1_lvl3".set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on__lvl_1_pressed() -> void:
	Global.lvl_actual = 1
	Global.estacion_actual = 1
	transition.close_and_change("res://Scenes/house.tscn")

func _on__lvl_2_pressed() -> void:
	Global.lvl_actual = 2
	Global.estacion_actual = 1
	transition.close_and_change("res://Scenes/house.tscn")

func _on__lvl_3_pressed() -> void:
	Global.lvl_actual = 3
	Global.estacion_actual = 1
	transition.close_and_change("res://Scenes/house.tscn")

func _on_bck_button_pressed() -> void:
	transition.close_and_change("res://Scenes/character_settings.tscn")
