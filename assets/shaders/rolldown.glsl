extern number bend_factor;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec2 anchor = vec2(0.5, 1.0);
    vec2 warp_coords = vec2(texture_coords.x, texture_coords.y);
    
    number anchor_disp_x = (texture_coords.x - anchor.x);
    number anchor_disp_y = (texture_coords.y - anchor.y);

    warp_coords.x += ((anchor_disp_x) * ((anchor_disp_y)*bend_factor));

    vec4 texturecolor = Texel(texture, warp_coords);

    return texturecolor * color;
}