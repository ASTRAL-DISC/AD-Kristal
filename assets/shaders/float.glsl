extern float factor;
extern float displacement;
vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc) {
    float s = sin((tc.x) * 3.1415926535897932384626433832795);
    
    //float dx = mod((tc.x + displacement), 1.0);
    //float dy = tc.y - s * s * factor;
    
    float dx = mod((tc.x + displacement), 1.0);
    //texture_coords.y * (0.8 + s * 0.2) - s * 0.1 + 0.1;
    float dy = tc.y * (0.8 + s * factor) - s * 0.1 + 0.1;
    
    vec2 newpos = vec2(dx, dy);
    
    return Texel(tex, newpos) * color;
}