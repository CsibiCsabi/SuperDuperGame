extends Area2D

signal hit

func _on_body_entered(body: Node2D) -> void:
	print("area2d s hit")
	hit.emit()
