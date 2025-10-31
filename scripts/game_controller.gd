extends Node

@export var loto: Loto = load("res://resources/lotos/default.tres")

func get_lottery_node():
	return $Lottery

func get_blessings_node():
	return $Blessings

func get_ticket_node():
	return $Ticket

func update_loto(resource: Loto):
	$Lottery.update_loto(resource)
	$Ticket.update_loto(resource)

func _ready() -> void:
	update_loto(loto)


func _on_lottery_lottery(numbers: Array) -> void:
	print(numbers)
