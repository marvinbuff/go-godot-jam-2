extends CanvasLayer

export var WORLD: PackedScene

onready var viewport1 = $"MarginContainer/GridContainer/Container 1/Viewport"
onready var grid = $"MarginContainer/GridContainer"

signal GameFinished(num)

func _ready():
	var world = WORLD.instance()
	viewport1.add_child(world, true)
	
	for i in range(1,grid.get_child_count() + 1):
		var container: ViewportContainer = get_node("MarginContainer/GridContainer/Container " + str(i))
		if(container != null):
			
			var player = get_node("MarginContainer/GridContainer/Container 1/Viewport/Arena 4 Players/Players/Player" + str(i))
			container.initialize(viewport1.world_2d, player)
	
	world.connect("GameFinished", self, "_propagate_game_finished")


func _propagate_game_finished(player_num: int):
	emit_signal("GameFinished", player_num)
