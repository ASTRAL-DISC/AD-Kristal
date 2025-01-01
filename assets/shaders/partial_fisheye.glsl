vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec2 anchor = vec2(0.5, 1.0);
    vec2 warp_coords = vec2(0.0, texture_coords.y);
    
    number anchor_disp_x = (texture_coords.x - anchor.x);
    number anchor_disp_y = (texture_coords.y - anchor.y);
    number bend_factor = 1;

    number time = abs(anchor_disp_y);
    number start = 0;
    number end = 1;
    number bend_mult = (-end * sqrt(1-pow(time, 2))+start) * bend_factor;

    number x_converge = (abs(anchor_disp_x))/bend_mult*sign(anchor_disp_x);

    warp_coords.x = ((texture_coords.x/32)+0.25+0.25/2+0.25/4+0.25/8+0.25/16+0.25/32) + x_converge;
    while (warp_coords.x > 1) {
        warp_coords.x -= 1;
    }
    while (warp_coords.x < 0) {
        warp_coords.x += 1;
    } 

    number bend_bonus_start_height = 0.7;
    number bend_bonus = abs(anchor_disp_y+bend_bonus_start_height)*4;
    bend_bonus *= max(0, abs(anchor_disp_y)-bend_bonus_start_height);

    number time2 = abs(anchor_disp_x*2);
    number start2 = 0.02;
    number end2 = 0.2 + bend_bonus;
    number lines_bend = (-end2 * sqrt(1-pow(time2, 2))+start);

    warp_coords.y = texture_coords.y + lines_bend;
    while (warp_coords.y > 1) {
        warp_coords.y -= 1;
    }
    while (warp_coords.y < 0) {
        warp_coords.y += 1;
    }

    vec4 texturecolor = Texel(texture, warp_coords);

    return texturecolor * color;
}