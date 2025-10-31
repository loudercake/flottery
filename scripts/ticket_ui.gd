extends GridContainer

@onready var ticket_manager = $"../Controller".get_ticket_node()

var number_button = preload("res://scenes/number_button.tscn")

func _ready():
	populate_ticket(ticket_manager.loto)

func populate_ticket(loto: Loto):
	for i in range(loto.num_min, loto.num_max+1):
		var new_number = number_button.instantiate()
		new_number.number = i
		new_number.connect("number_checked", _pressed)
		add_child(new_number)

func _pressed(num: int):
	ticket_manager.add_number(num)

func get_numbers() -> Array[Node]:
	return get_children()

func change_number_style(number: int, style: LabelSettings):
	for node in get_numbers():
		if node.number == number:
			node.get_child(0).get_child(0).label_setting = style # i know this is bad please find it inyour heart to forgive me :(((((
