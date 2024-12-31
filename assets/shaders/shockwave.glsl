extern number time;
extern vec2 center;
extern number wavelength;
extern number radius;
extern number speed;
extern number amplitude;
extern number brightness;

vec4 effect( vec4 color, Image tex, vec2 uv, vec2 screen_coords ) {
float halfWavelength = wavelength * 0.5 / love_ScreenSize.x;
float maxRadius = radius / love_ScreenSize.x;
float currentRadius = time * speed / love_ScreenSize.x;

float fade = 0.5;

if (maxRadius > 0.0) {
    if (currentRadius > maxRadius) {
        color = Texel(tex, uv);
        return color;
    }
    fade = 1.0 - pow(currentRadius / maxRadius, 2.0);
}

vec2 dir = vec2(uv - center / love_ScreenSize.xy);
dir.y *= love_ScreenSize.y / love_ScreenSize.x;
float dist = length(dir);

if (dist <= 0.0 || dist < currentRadius - halfWavelength || dist > currentRadius + halfWavelength) {
    color = Texel(tex, uv);
    return color;
}

vec2 diffUV = normalize(dir);

float diff = (dist - currentRadius) / halfWavelength;

float p = 1.0 - pow(abs(diff), 2.0);

//float powDiff = diff * pow(p, 2.0) * (amplitude * fade );
float powDiff = 1.25 * sin(diff * 3.14159) * p * (amplitude * fade );

vec2 offset = diffUV * powDiff / love_ScreenSize.xy;

//Do clamp
//vec2 coord = uv + offset;
//vec2 clampedCoord = clamp(coord, love_ScreenSize.xy, love_ScreenSize.zw);
//vec4 col = Texel(tex, clampedCoord);
//if (coord != clampedCoord) {
    //col *= max(0.0, 1.0 - length(coord - clampedCoord));
//}
//No clamp
color = Texel(tex, uv + offset);
color.rgb *= 1.0 + (brightness - 1.0) * p * fade;
return color;
}