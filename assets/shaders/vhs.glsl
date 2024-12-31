uniform float time;

const float range = 0.05;
const float noiseQuality = 350.0;
const float noiseIntensity = 0.003;
const float offsetIntensity = 0.005;
const float colorOffsetIntensity = 0.4;

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float verticalBar(float pos, float uvY, float offset)
{
    float edge0 = (pos - range);
    float edge1 = (pos + range);

    float x = smoothstep(edge0, pos, uvY) * offset;
    x -= smoothstep(pos, edge1, uvY) * offset;
    return x;
}

vec4 effect( vec4 color, Image texture, vec2 uv, vec2 screen_coords )
{
    for (float i = 0.0; i < 0.71; i += 0.1313)
    {
        float d = mod(time * i, 1.5);
        float o = sin(1.0 - tan(time * 0.2 * i));
        o *= offsetIntensity;
        uv.x += verticalBar(d, uv.y, o);
    }
    
    float uvY = uv.y;
    uvY *= noiseQuality;
    uvY = float(int(uvY)) * (1.0 / noiseQuality);
    float noise = rand(vec2(time * 0.00001, uvY));
    uv.x += noise * noiseIntensity;

    vec2 offsetR = vec2(0.006 * sin(time), 0.0) * colorOffsetIntensity;
    vec2 offsetG = vec2(0.0064 * (cos(time * 0.97)), 0.0) * colorOffsetIntensity;
    
    float r = Texel(texture, uv + offsetR).r;
    float g = Texel(texture, uv + offsetG).g;
    float b = Texel(texture, uv).b;
    float a = Texel(texture, uv).a;

    vec4 tex = vec4(r, g, b, a);
    return tex;
}