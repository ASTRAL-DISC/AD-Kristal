vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec2 anchor = vec2(0.5, 0.0);
    vec2 warp_coords = vec2(0.0, texture_coords.y);
    warp_coords.x = texture_coords.x + ((texture_coords.x - anchor.x) / (anchor.y - texture_coords.y));
    vec4 texturecolor = Texel(texture, warp_coords);
    return texturecolor * color;
}