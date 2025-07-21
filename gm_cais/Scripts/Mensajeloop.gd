extends CanvasLayer

@onready var character_label: RichTextLabel = $Control/Panel/CharacterLabel
@onready var audio: AudioStreamPlayer2D = $Audio
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()

func set_dialogue(id_dialog: int)-> void:
	self.show()
	character_label.set_text("")
	character_label.add_text(Global.load_loop_text(id_dialog))
	Global.load_loop(id_dialog)
	audio.stream = Global.audio_actual
	audio.play()
	timer.start()

func set_dialogue_2(id_dialog: int)-> void:
	self.show()
	character_label.set_text("")
	character_label.add_text(Global.load_loop_text(id_dialog))

func stop() -> void:
	audio.stream = null
	self.hide()

func _on_timer_timeout() -> void:
	audio.play()
	timer.start()
