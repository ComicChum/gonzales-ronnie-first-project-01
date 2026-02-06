extends Node

@onready var points_label: Label = %PointsLabel

var score = 0

func add_point():
	score += 1
	print(score)
	points_label.text = "G Apples: " + str (score)
