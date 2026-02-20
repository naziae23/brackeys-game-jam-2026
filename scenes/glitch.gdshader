shader_type canvas_item;

uniform float glitch_intensity : hint_range(0.0, 0.1) = 0.12;
uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = SCREEN_UV;
    
    // Create a horizontal shift based on time and vertical position
    float x_offset = sin(TIME * 20.0 + uv.y * 100.0) * glitch_intensity;
    
    // Apply shift only to the X axis
    vec4 color = texture(screen_texture, vec2(uv.x + x_offset, uv.y));
    
    COLOR = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
