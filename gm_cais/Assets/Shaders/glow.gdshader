shader_type canvas_item;

uniform bool enable_glow = true;
uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 0.0, 1.0);
uniform float glow_strength = 1.0;
uniform float speed = 3.0;

void fragment() {
    vec4 base_color = texture(TEXTURE, UV);

    if (enable_glow) {
        float pulse = sin(TIME * speed) * 0.5 + 0.5;
        base_color.rgb += glow_color.rgb * pulse * glow_strength;
    }

    COLOR = base_color;
}
