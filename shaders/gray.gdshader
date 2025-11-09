shader_type canvas_item;

uniform bool gray_mode = false;
uniform float desaturation : hint_range(0.0, 1.0) = 0.5;
uniform float progress: hint_range(0.0, 1.0) = 0.0;
uniform bool invert = false;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    if (color.a > 0.0) {
		float transition_progress = invert ? progress: 1.0 - progress;
		float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
		gray = mix(gray, 0.3, desaturation);
		color.rgb = mix(color.rgb, vec3(gray), progress);
	}

    COLOR = color;
}