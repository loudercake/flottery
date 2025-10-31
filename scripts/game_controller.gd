extends Node

signal reveal_number(number: int, style: LabelSettings)

func get_lottery_node():
	return $Lottery

func get_blessings_node():
	return $Blessings

func get_ticket_node():
	return $Ticket

func update_loto(resource: Loto):
	globals.loto = resource

func _ready() -> void:
	pass

func _on_lottery_lottery() -> void:
	await get_tree().create_timer(0.01).timeout
	get_blessings_node().reveal_numbers()

func _on_blessings_reveal_number(number: int, style: LabelSettings) -> void:
	reveal_number.emit(number, style)
