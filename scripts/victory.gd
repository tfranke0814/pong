extends Control

@onready var winner_label: Label = %WinnerLabel

func _ready() -> void:
	winner_label.text = "Player %d Wins!" % GameManager.most_recent_winner
