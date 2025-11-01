extends Node

@export var loto: Loto = load("res://resources/lotos/default.tres")

@onready var lottery = $"../Lottery"

signal reveal_number(number: int, style: LabelSettings)

func reset_numbers():
	globals.ticket_numbers = []

func add_number(num: int):
	if num not in globals.ticket_numbers and len(globals.ticket_numbers) < loto.numbers:
		globals.ticket_numbers.append(num)

func check_against(loto_numbers: Array) -> int:
	var correct_numbers := 0
	for i in loto_numbers:
		if globals.ticket_numbers.has(i):
			correct_numbers += 1
	return correct_numbers

func earn_award(numbers_gotten: int):
	globals.money += loto.prizes[numbers_gotten]
