extends Blessing

func _modify_range(number_range: Array, index: int) -> Array:
	if index == 1:
		modified_range.emit(name, index)
		if (!number_range.has(1) and !number_range.has(11)) or (number_range.has(1) and number_range.has(11)):
			return [[1,11].pick_random()]
		elif number_range.has(1):
			return [1]
		else:
			return [11]
	else:
		return number_range
