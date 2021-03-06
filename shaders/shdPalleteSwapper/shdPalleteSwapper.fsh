varying vec2 v_vTexcoord;
varying vec4 v_vColour;
#define Transparent vec4(0.0, 0.0, 0.0, 0.0)
#define Tolerance 0.004 
uniform sampler2D u_palTexture;
uniform vec4 u_Uvs;
uniform float u_paletteId;
uniform vec2 u_pixelSize;
vec4 findAltColor(vec4 inCol, vec2 corner)
{
    if (inCol.a == 0.0) { return Transparent; }
    for (float i = corner.y; i < 1.0; i += u_pixelSize.y)
    {
        vec2 testPos = vec2(corner.x, i);
        vec4 leftCol = texture2D(u_palTexture, testPos);
        float dist = distance(leftCol, inCol);
        if (dist < Tolerance)
        {
            testPos = vec2(corner.x += u_pixelSize.x * u_paletteId, i);
            return texture2D(u_palTexture, testPos);
        }
    }
    return inCol;
}

void main()
{
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = v_vColour * findAltColor(col, u_Uvs.xy);
}