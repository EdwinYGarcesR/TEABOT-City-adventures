extends Control

@onready var transition: CanvasLayer = $Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_next_bttn_pressed() -> void:
	transition.close_and_change("res://Scenes/level_selector.tscn")
