extends Node

@export var blessings: Array[Blessing]

func add_blessing(blessing: Blessing):
	blessings.append(blessing)

func modify_range(numbers_range: Array, index: int) -> Array:
	var new_numbers := numbers_range
	for blessing in blessings:
		new_numbers = blessing._modify_range(new_numbers, index)
	return new_numbers
