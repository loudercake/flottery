extends Node

@export var blessings: Array[Blessing]

enum BLESSING_TYPE {
	RANGE_MODIFIED
}

signal blessing_trigger(type: BLESSING_TYPE, name: String, index: int)

func  _ready() -> void:
	add_blessing(preload("res://resources/blessings/aceupsleeve.tres"))

func add_blessing(blessing: Blessing):
	blessings.append(blessing)
	blessing.connect("modified_range", _range_modified)

func modify_range(numbers_range: Array, index: int) -> Array:
	var new_numbers := numbers_range
	for blessing in blessings:
		new_numbers = blessing._modify_range(new_numbers, index)
	return new_numbers

func _range_modified(blessing_name: String, index: int):
	print("bleeeh")
	print(blessing_name)
	print(index)
	blessing_trigger.emit(BLESSING_TYPE.RANGE_MODIFIED, blessing_name, index)
