shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;
uniform float pixel_size : hint_range(1.0, 10.0) = 4.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 screen_size = vec2(textureSize(screen_texture, 0));
    
    vec2 size = pixel_size / screen_size;
    
    vec2 pixelated_uv = floor(SCREEN_UV / size) * size;
    
    vec4 color = texture(screen_texture, pixelated_uv);
    
    COLOR = color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
