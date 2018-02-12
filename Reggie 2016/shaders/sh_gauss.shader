//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float sigma;     
uniform float blurSize;

const float pii = 3.14159265;
const float numBlurPixelsPerSide = 4.0;
const vec2  blurMultiplyVecX = vec2(1.0, 0.0);
const vec2  blurMultiplyVecY = vec2(0.0, 1.0);

void main()
{
  // Incremental Gaussian Coefficent Calculation (See GPU Gems 3 pp. 877 - 889)
  vec3 incrementalGaussian;
  incrementalGaussian.x = 1.0 / (sqrt(2.0 * pii) * sigma);
  incrementalGaussian.y = exp(-0.5 / (sigma * sigma));
  incrementalGaussian.z = incrementalGaussian.y * incrementalGaussian.y;

  vec4 avgValue = vec4(0.0, 0.0, 0.0, 0.0);
  float coefficientSum = 0.0;

  // Take the central sample first...
  avgValue += texture2D(gm_BaseTexture, v_vTexcoord.xy) * incrementalGaussian.x;
  coefficientSum += incrementalGaussian.x;
  incrementalGaussian.xy *= incrementalGaussian.yz;
  
  // Go through the remaining 8 vertical samples (4 on each side of the center)
  for (float i = 1.5; i <= numBlurPixelsPerSide; i+=2.0)
   { 
        avgValue += texture2D(gm_BaseTexture, v_vTexcoord.xy - i * blurSize * blurMultiplyVecX) * incrementalGaussian.x;         
        avgValue += texture2D(gm_BaseTexture, v_vTexcoord.xy + i * blurSize * blurMultiplyVecX) * incrementalGaussian.x;         
        coefficientSum += 2.0 * incrementalGaussian.x;
        incrementalGaussian.xy *= incrementalGaussian.yz;
   }
   
   for (float i = 1.5; i <= numBlurPixelsPerSide; i+=2.0)
   { 
        avgValue += texture2D(gm_BaseTexture, v_vTexcoord.xy - i * blurSize * blurMultiplyVecY) * incrementalGaussian.x;         
        avgValue += texture2D(gm_BaseTexture, v_vTexcoord.xy + i * blurSize * blurMultiplyVecY) * incrementalGaussian.x;         
        coefficientSum += 2.0 * incrementalGaussian.x;
        incrementalGaussian.xy *= incrementalGaussian.yz;
   }

    gl_FragColor = avgValue / coefficientSum;

}
