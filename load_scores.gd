extends VBoxContainer

const API_URL = "https://mice-city-leaderboard.up.railway.app"
const ENTRY_SCENE = preload("res://leaderboard_entry.tscn")

var duration = "weekly"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_load_scores():
	for n in get_children():
		remove_child(n)
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(_on_request_complete)
	var error = http_request.request(API_URL + "/scores/" + duration)

func _on_request_complete(result, response_code, headers, body):
	var scores = JSON.parse_string(body.get_string_from_utf8())
	var i = 0
	for s in scores:
		var entry = ENTRY_SCENE.instantiate()
		entry.set_values(s.name, s.score)
		add_child(entry)
		i += 1
		if(i >= 10):
			return
