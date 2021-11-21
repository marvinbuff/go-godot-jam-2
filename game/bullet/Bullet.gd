extends RigidBody2D


func initialize(color: Color, velocity: Vector2):
	apply_impulse(Vector2.ZERO, velocity * mass)
	$AnimatedSprite.modulate = color


func _on_Hitbox_entered(area):
	area.deal_damage(100)
	queue_free()


func _on_body_entered(body):
	queue_free()
