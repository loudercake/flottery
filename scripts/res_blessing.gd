extends Resource
class_name Blessing

@export var name := "default"
@export var description := "does default"
@export var texture: Texture2D

@export_enum("Common", "Uncommon", "Rare") var rarity := 0

signal modified_range(name: String, index: int)

var activated := false
var activation_amount := 1

func _modify_range(number_range: Array, index: int) -> Array:
	print(number_range)
	return number_range

func _reset():
	activated = false
