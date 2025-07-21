shader_type canvas_item;

uniform float radius : hint_range(0.0, 2.0) = 1.5; // tamaño del círculo
uniform vec2 center = vec2(0.5, 0.5); // centro relativo (0-1)
uniform float softness : hint_range(0.0, 1.0) = 0.05; // borde suave

void fragment() {
    vec2 uv = UV;
    float dist = distance(uv, center);
    float edge = smoothstep(radius, radius - softness, dist);
    COLOR = vec4(0.0, 0.0, 0.0, edge);
}
