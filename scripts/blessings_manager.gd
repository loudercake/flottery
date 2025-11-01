extends Node

@export var blessings: Array[Blessing]

enum BLESSING_TYPE {
	RANGE_MODIFIED,
	NUMBER_REVEALED
}

signal blessing_trigger(type: BLESSING_TYPE, name: String, index: int)
signal reveal_number(number: int, style: LabelSettings)
signal reroll(number: int)

func  _ready() -> void:
	add_blessing(load("res://resources/blessings/die.tres"))

func add_blessing(blessing: Blessing):
	blessings.append(blessing)
	blessing.connect("modified_range", _range_modified)
	blessing.connect("reveal_number", _reveal_number)

func remove_blessing(blessing: Blessing):
	blessings.erase(blessing)

func modify_range(numbers_range: Array, index: int) -> Array:
	var new_numbers := numbers_range
	for blessing in blessings:
		new_numbers = blessing._modify_range(new_numbers, index)
	return new_numbers

func _range_modified(blessing_name: String, index: int):
	print(blessing_name)
	print(index)
	blessing_trigger.emit(BLESSING_TYPE.RANGE_MODIFIED, blessing_name, index)

func reveal_numbers():
	for blessing in blessings:
		blessing._reveal_number_ticket(globals.loto.get_number_range())

func _reveal_number(number: int, style: LabelSettings):
	print("a")
	reveal_number.emit(number, style)

func reroll_number(number: int) -> bool:
	for blessing in blessings:
		var do_reroll = blessing._reroll(number)
		if do_reroll:
			return true
	return false
