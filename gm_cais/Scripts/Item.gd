extends Node2D

var is_colli: bool = false

@export var point_map:float = 0.0
@export var id_station = 1
@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D


const GLOW = preload("res://Assets/Shaders/glow.gdshader")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_glow(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	is_colli = true
	higlight_station(true)

func _on_area_2d_mouse_exited() -> void:
	is_colli = false
	higlight_station(false)

func higlight_station(hovered):
	if hovered:
		self.scale = Vector2(1.05, 1.05)
		#self.z_index = 2
	else:
		self.scale = Vector2(1, 1)
		#card.z_index = 1 

func _input(event: InputEvent) -> void:
	if is_colli:
		if area_2d.monitoring:
			if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
				if event.pressed:
					set_glow(false)
					get_parent().move_to_path(point_map, id_station, 2)

func set_glow(enabled: bool):
	if enabled:
		monitoring_area(true)
		var shader_material = ShaderMaterial.new()
		shader_material.shader = GLOW
		$Sprite2D.material = shader_material
		match Global.glow_color:
			1:
				shader_material.set_shader_parameter("glow_color", Color(0, 0, 1, 1))
			2:
				shader_material.set_shader_parameter("glow_color", Color(1, 1, 0, 1))
			3:
				shader_material.set_shader_parameter("glow_color", Color(1, 0, 0, 1))
			4:
				shader_material.set_shader_parameter("glow_color", Color(0, 1, 0, 1))
	else:
		monitoring_area(false)
		$Sprite2D.material = null
		
func monitoring_area (enabled: bool) -> void:
	if enabled:
		area_2d.set_monitoring(true)
	else:
		area_2d.set_monitoring(false)
