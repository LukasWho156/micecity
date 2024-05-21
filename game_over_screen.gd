extends Node2D

signal open_submit
signal close_submit
signal open_leaderboard
signal close_leaderboard

const API_URL = "https://mice-city-leaderboard.up.railway.app"

const TIMER = 0.5
var cooldown = 0
var submitting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(2).set_type("share")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(cooldown > 0):
		cooldown -= delta
		if(cooldown <= 0):
			visible = true

func _on_game_die():
	cooldown = TIMER

func _on_restart_button_clicked():
	visible = false

func _on_share_button_clicked():
	visible = false
	open_submit.emit()

func _on_score_submit_cancel():
	close_submit.emit()
	visible = true

func _on_score_submit_submit(username):
	if(submitting):
		return
	submitting = true
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(_on_request_complete)
	var ctx = HashingContext.new()
	var cleartext = "{name}TheTurtle{score}".format({"name": username, "score": Globals.score})
	var body = JSON.new().stringify({
		"name": username,
		"score": Globals.score,
		"hash": cleartext.sha256_text()
	})
	var error = http_request.request(API_URL + "/submitscore", ["Content-Type: application/json"], HTTPClient.METHOD_POST, body)
	if(error != OK):
		print("Error with HTTP request")
		submitting = false

func _on_request_complete(result, response_code, headers, body):
	submitting = false
	if(response_code != 200):
		return
	close_submit.emit()
	open_leaderboard.emit()
