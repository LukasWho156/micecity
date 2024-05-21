shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform sampler2D artwork;

void fragment() {
	float art = texture(artwork, UV).a;
	vec4 template = texture(TEXTURE, UV);
	COLOR = vec4(art * template.r, art * template.g, 0.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
