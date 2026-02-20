shader_type canvas_item;
uniform float level;
uniform float max_level;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 purple = vec4(102.0/255.0, 50.0/255.0, 113.0/255.0, 1.0);
	vec3 tinted = mix(COLOR.rgb, purple.rgb, (level / max_level));
	COLOR = vec4(tinted, COLOR.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
