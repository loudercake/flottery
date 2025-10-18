extends Resource
class_name Loto

@export var name := "default"

@export var num_min: int = 1
@export var num_max: int = 60

@export var numbers = 5
@export var prizes : Dictionary[int,int]= {
	1: 10,
	2: 20,
	3: 100,
	4: 1000,
	5: 5000
}

func get_number_range():
	return range(num_min, num_max+1)
