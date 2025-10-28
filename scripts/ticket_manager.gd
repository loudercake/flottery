extends Node

@export var loto: Loto = load("res://resources/lotos/default.tres")

@onready var lottery = $"../Lottery"

var numbers: Array

func update_loto(resource: Resource):
	loto = resource

func check_against(loto_numbers: Array, ticket_numbers: Array) -> int:
	var correct_numbers := 0
	for i in loto_numbers:
		if ticket_numbers.has(i):
			correct_numbers += 1
	return correct_numbers

func earn_award(numbers_gotten: int):
	Money.money += loto.prizes[numbers_gotten]
