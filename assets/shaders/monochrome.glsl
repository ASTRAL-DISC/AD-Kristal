uniform vec4 target_color;
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 texcolor = Texel(texture, texture_coords);
    if (texcolor.r > 0.3 || texcolor.g > 0.3 || texcolor.b > 0.3) {
        return target_color * color;
    } else {
        return vec4(0, 0, 0, texcolor.a) * color;
    }
}