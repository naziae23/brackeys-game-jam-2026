shader_type canvas_item;
uniform float level;
uniform float max_level;
uniform bool gravityOn;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 pink = vec4(237.0/255.0, 133.0/255.0, 202.0/255.0, 1.0);
	vec4 purple = vec4(102.0/255.0, 50.0/255.0, 113.0/255.0, 1.0);
	
	vec3 tinted_purple = mix(COLOR.rgb, purple.rgb, (level / max_level));
	vec3 final_tinted;
	if (gravityOn) {
		final_tinted = mix(tinted_purple.rgb, pink.rgb, 0.5);
	} else {
		final_tinted = tinted_purple;
	}
	COLOR = vec4(final_tinted, COLOR.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
