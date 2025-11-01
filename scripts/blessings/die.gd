extends Blessing

func _reroll(number: int) -> bool:
	if not number in globals.ticket_numbers:
		return true
	return false
