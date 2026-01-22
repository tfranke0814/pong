extends HBoxContainer

@onready var score_p1: Label = $ScoreP1
@onready var score_p2: Label = $ScoreP2

func _process(_delta: float) -> void:
	score_p1.text = "%d" % GameManager.score_p1
	score_p2.text = "%d" % GameManager.score_p2
