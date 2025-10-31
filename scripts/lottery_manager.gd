extends Node

@onready var blessings = $"../Blessings"

@export var loto: Loto = load("res://resources/lotos/default.tres")

signal lottery(numbers: Array)

var numbers := []

func update_loto(resource: Resource):
	loto = resource

func _ready() -> void:
	full_lottery(loto.numbers, loto.get_number_range())

func draw_random(number_range: Array, index: int) -> int:
	var local_numbers = blessings.modify_range(number_range, index)
	var num = local_numbers.pick_random()
	return num

func full_lottery(draws: int, number_range: Array):
	var local_range := number_range
	var lottery_numbers := []
	for i in range(1,draws+1):
		var drawn_number = draw_random(local_range, i)
		lottery_numbers.append(drawn_number)
		local_range.erase(drawn_number)
	numbers = lottery_numbers
	lottery.emit(lottery_numbers)
