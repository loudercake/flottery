extends Node

@onready var blessings = $"../Blessings"

signal lottery()


func _ready() -> void:
	full_lottery(globals.loto.numbers, globals.loto.get_number_range())

func draw_random(number_range: Array, index: int) -> int:
	var local_numbers = blessings.modify_range(number_range, index)
	var num = local_numbers.pick_random()
	if blessings.reroll_number(num):
		print("alas")
		var new_numbers = number_range
		new_numbers.erase(num)
		return draw_random(new_numbers, index)
	return num

func full_lottery(draws: int, number_range: Array):
	var local_range := number_range
	var lottery_numbers := []
	for i in range(1,draws+1):
		var drawn_number = draw_random(local_range, i)
		lottery_numbers.append(drawn_number)
		local_range.erase(drawn_number)
	globals.drawn_numbers = lottery_numbers
	lottery.emit()
