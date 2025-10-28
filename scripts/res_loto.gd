extends Resource
class_name Loto

@export var name := "default"

@export var num_min: int = 1
@export var num_max: int = 60

@export var numbers = 5
@export var prizes : Dictionary[int,int]= {
	1: 100,
	2: 500,
	3: 1000,
	4: 10000,
	5: 50000
}

func get_number_range():
	return range(num_min, num_max+1)
