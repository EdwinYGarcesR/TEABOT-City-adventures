extends CanvasLayer


@onready var mask := $ColorRect
@onready var material := mask.material as ShaderMaterial

func _ready() -> void:
	open()
	
func close_and_change(nueva_escena):
	var tween = create_tween()
	tween.tween_property(material, "shader_parameter/radius", 1.0, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(Callable(self, "_on_close_end").bind(nueva_escena))

func _on_close_end(nueva_escena):
	get_tree().change_scene_to_file(nueva_escena)

func open():
	material.set_shader_parameter("radius", 1.0)
	var tween = create_tween()
	tween.tween_property(material, "shader_parameter/radius", 0.0, 1.0) #.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
