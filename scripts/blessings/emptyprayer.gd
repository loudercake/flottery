extends Blessing

var style = load("res://resources/number_style/gambling.tres")

func _reveal_number_ticket(number_range: Array):
	var local_numbers := number_range
	local_numbers.shuffle()
	var counter := 0
	for number in local_numbers:
		if not number in globals.drawn_numbers:
			reveal_number.emit(number, style)
			counter += 1
		if counter >= globals.loto.numbers:
			break
		
