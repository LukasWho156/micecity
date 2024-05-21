extends Node2D

signal die
signal reset
signal crash
signal spawn_power_box
signal jump_tut

const MIN_COOLDOWN = 1000
const VAR_COOLDOWN = 3000

var cooldown
var next_power_box = 0
var dead = false

var first_obstacle_entered = false

var obstacle_scenes = [
	preload("res://obstacle_dogpile.tscn"),
	preload("res://obstacle_banana.tscn"),
	preload("res://obstacle_coffee.tscn"),
	preload("res://obstacle_hat.tscn"),
	preload("res://obstacle_shoe.tscn"),
	preload("res://obstacle_bird.tscn"),
	preload("res://obstacle_wc.tscn"),
	preload("res://obstacle_tissue.tscn"),
	preload("res://obstacle_gum.tscn"),
	preload("res://obstacle_newspaper.tscn"),
	preload("res://obstacle_pizza.tscn"),
]

func on_reset():
	dead = false
	set_cooldown()
	reset.emit()
	Globals.reset()

func set_cooldown():
	cooldown = MIN_COOLDOWN + randf() * VAR_COOLDOWN
	if(next_power_box == 0):
		next_power_box = randi_range(4, 8)

# Called when the node enters the scene tree for the first time.
func _ready():
	on_reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.cat_dist <= 0 and !dead):
		Globals.cat_dist = 0
		on_hit(true)
	if(cooldown > 0):
		cooldown -= delta * 1000 * Globals.speed
	else:
		next_power_box -= 1
		if(next_power_box == 0):
			spawn_power_box.emit()
		else:
			var scene = obstacle_scenes.pick_random()
			var obstacle = scene.instantiate()
			reset.connect(obstacle.queue_free)
			obstacle.hit.connect(on_hit)
			add_child(obstacle)
			if(!first_obstacle_entered):
				first_obstacle_entered = true
				jump_tut.emit()
		set_cooldown()

func on_hit(by_cat = false):
	if(dead):
		return
	dead = true
	Globals.brake()
	die.emit()
	if(!by_cat):
		crash.emit()
