extends Node2D

signal win




func _on_body_entered(body: Node2D) -> void:
	print("fhuuu")
	win.emit()
