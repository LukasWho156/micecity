shader_type canvas_item;

uniform float progress = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float pos = UV.x + abs(0.5 - UV.y);
	if(pos > progress) {
		COLOR = vec4(0.0, 0.0, 0.0, 0.0);
	} else {
		COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	}	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
