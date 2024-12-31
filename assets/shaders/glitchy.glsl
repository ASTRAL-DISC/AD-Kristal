vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    float s = cos(screen_coords.x*3.14);
    vec2 uv = vec2(texture_coords.x*(0.8+s*0.2) - s*0.1 + 0.1,texture_coords.y*(0.6+s*0.4) - s*0.2 + 0.2);
    vec4 c = Texel(tex, uv);

    return c * color;
}