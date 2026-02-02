extends Node2D

func _on_stomp_area_body_entered(body):
	if body.name == "Player":
		body.stomp_bounce()
		die()

	var stomp_area: Area2D = $StompArea

	stomp_area.monitoring = true

func die():
	queue_free()

const SPEED = 60

var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
