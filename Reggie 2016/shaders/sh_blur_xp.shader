attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec4 v_vColour;
varying vec2 v_texCoord;
varying vec2 v_blurTexCoords[6];

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
       
    float sigmaSize = 1.0 / 640.0;
    
    v_blurTexCoords[ 0] = in_TextureCoord + vec2(-sigmaSize * 5.5, 0.0);
    v_blurTexCoords[ 1] = in_TextureCoord + vec2(-sigmaSize * 3.5, 0.0);
    v_blurTexCoords[ 2] = in_TextureCoord + vec2(-sigmaSize * 1.5, 0.0);
    v_blurTexCoords[ 3] = in_TextureCoord + vec2( sigmaSize * 1.5, 0.0);
    v_blurTexCoords[ 4] = in_TextureCoord + vec2( sigmaSize * 3.5, 0.0);
    v_blurTexCoords[ 5] = in_TextureCoord + vec2( sigmaSize * 5.5, 0.0);
    
    v_vColour = in_Colour;
    v_texCoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec4 v_vColour;
varying vec2 v_texCoord;
varying vec2 v_blurTexCoords[6];

void main()
{
    gl_FragColor = vec4(0.0);
    
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 0]) * 0.031661676749617831625;
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 1]) * 0.123150233891477831625;
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 2]) * 0.264292155252377831625;
    gl_FragColor += texture2D(gm_BaseTexture, v_texCoord         ) * 0.16179186821375566325;
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 3]) * 0.264292155252377831625;
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 4]) * 0.123150233891477831625;
    gl_FragColor += texture2D(gm_BaseTexture, v_blurTexCoords[ 5]) * 0.031661676749617831625;
}
