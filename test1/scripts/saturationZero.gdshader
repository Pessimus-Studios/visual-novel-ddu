shader_type canvas_item;

uniform float intensity : hint_range(0, 1) = 0.0;
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    vec4 screen_color = textureLod(screen_texture, SCREEN_UV, 0.0);
    float gray = dot(screen_color.rgb, vec3(0.299, 0.587, 0.114));
    COLOR = vec4(mix(screen_color.rgb, vec3(gray), intensity), screen_color.a);
}