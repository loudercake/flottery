extends TextureButton

@export var number := 0

signal number_checked(number: int)

func _ready() -> void:
	$CenterContainer/label.text = str(number)

func _on_pressed() -> void:
	emit_signal("number_checked", number)

func change_style(style: LabelSettings):
	$CenterContainer/label.label_settings = style
