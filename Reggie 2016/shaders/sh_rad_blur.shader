attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
varying vec2 coord;

void main()
{
    coord = in_TextureCoord;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform vec2 uTexelSize;
uniform vec2 uParams;       // x: intensity; y: scale.
uniform vec4 uUvTexture;
varying vec2 coord;

void main()
{
    const float weight = 0.227027027;
    const float weight0 = 0.1945945946;
    const float weight1 = 0.1216216216;
    const float weight2 = 0.0540540541;
    const float weight3 = 0.0162162162;
    
    vec2 inner = (coord - uUvTexture.xy) / (uUvTexture.zw - uUvTexture.xy);
    vec4 col = texture2D(gm_BaseTexture, coord) * vec4(weight);
    vec2 normDist = normalize(inner - vec2(0.5)) * uTexelSize * length(inner - vec2(0.5)) * 2.0 * uParams.y;
    
    vec2 offset0p = clamp(coord + normDist, uUvTexture.xy, uUvTexture.zw);
    vec2 offset1p = clamp(coord + (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    vec2 offset2p = clamp(coord + (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    vec2 offset3p = clamp(coord + (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    vec2 offset0n = clamp(coord - normDist, uUvTexture.xy, uUvTexture.zw);
    vec2 offset1n = clamp(coord - (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    vec2 offset2n = clamp(coord - (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    vec2 offset3n = clamp(coord - (normDist * vec2(2.0)), uUvTexture.xy, uUvTexture.zw);
    
    col += texture2D(gm_BaseTexture, offset0p) * vec4(weight0);
    col += texture2D(gm_BaseTexture, offset1p) * vec4(weight1);
    col += texture2D(gm_BaseTexture, offset2p) * vec4(weight2);
    col += texture2D(gm_BaseTexture, offset3p) * vec4(weight3);
    col += texture2D(gm_BaseTexture, offset0n) * vec4(weight0);
    col += texture2D(gm_BaseTexture, offset1n) * vec4(weight1);
    col += texture2D(gm_BaseTexture, offset2n) * vec4(weight2);
    col += texture2D(gm_BaseTexture, offset3n) * vec4(weight3);
    
    gl_FragColor = col * vec4(uParams.x);
}
