extends Camera2D

onready var parent = $"../../"

func _physics_process(delta):
	var target: Player = parent.target
	
	if target and is_instance_valid(target):
		var direction = target.get_aim_direction()
		position = target.position + (direction * 300)
