extends Resource
class_name Blessing

@export var name := "default"
@export var description := "does default"
@export var texture: Texture2D

@export_enum("Common", "Uncommon", "Rare") var rarity := 0

signal modified_range(name: String, index: int)
signal reveal_number(number: int, style: LabelSettings)

var activated := false
var activation_amount := 1

func _modify_range(number_range: Array, index: int) -> Array:
	return number_range

func _reveal_number_ticket(number_range: Array):
	print(number_range)
	return

func _reset():
	activated = false
