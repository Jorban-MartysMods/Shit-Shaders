// ----------------------------------------------------------------------//
// Written by: 
//             Jordan Brady (Jorban)
// ----------------------------------------------------------------------//
// Thanks to:  
//             Zenteon
//             MartyMcFly (Pascal Gilcher)
//             Gordi
// ----------------------------------------------------------------------//
// Summary:    
//             Started out as a very simple Shadertoy color grading shader
//             that I wanted to port to ReShade specifically for the UI
//             elements that don't exist on ShaderToy.
// ----------------------------------------------------------------------//
// TODO: 
//             
// ----------------------------------------------------------------------//

//----------------------------- |--------| -----------------------------//
// ---------------------------- |  INCS  | -----------------------------//
//----------------------------- |--------| -----------------------------//

#include "ReShade.fxh"

//----------------------------- |--------| -----------------------------//
// ---------------------------- |   UI   | -----------------------------//
//----------------------------- |--------| -----------------------------//

uniform float3 colorMul 
<
    ui_type = "drag";
    ui_min = 0.0; ui_max = 2.0;
    ui_label = "Brightness R | G | B";

> = 1.0;

uniform float colorSat 
<
    ui_type = "drag";
    ui_min = 0.0; ui_max = 2.0;
    ui_label = "Saturation";

> = 1.0;

uniform float colorCon 
<
    ui_type = "drag";
    ui_min = 0.50; ui_max = 1.5;
    ui_label = "Contrast";

> = 1.0;

//----------------------------- |--------| -----------------------------//
//----------------------------- |  DEFS  | -----------------------------//
//----------------------------- |--------| -----------------------------//

#define lumaWeight float3(0.2126, 0.7152, 0.0722)

//----------------------------- |--------| -----------------------------//
//----------------------------- |  FUNC  | -----------------------------//
//----------------------------- |--------| -----------------------------//

/* Currently Unused
float3 rgb2hsv (float3 rgb)
{
	float3 color = rgb;
	
	// color max is the max of red green and blue channels
	float colorMax = max(color.r, color.g);
		  colorMax = max(colorMax, color.b);
		  
	// same as above but with colorMin
	float colorMin = min(color.r, color.g);
	      colorMin = min(colorMin, color.b);
			  
	// difference is equal to max color - min color
	float colorDiff = (colorMax - colorMin);
		
	//set up for hue
	float hsvHue = 0;
		if (colorMax == color.r) hsvHue = (60 * ((color.g - color.b) / colorDiff) + 360) % 360;
		if (colorMax == color.g) hsvHue = (60 * ((color.b - color.r) / colorDiff) + 120) % 360;
		if (colorMax == color.b) hsvHue = (60 * ((color.r - color.g) / colorDiff) + 240) % 360;
			
	//set up for sat
	float hsvSat = 0;
		if (colorMax == 0);
			else hsvSat = (colorDiff / colorMax * 100);
	
	//set up for value
	float hsvValue = (colorMax * 100);
	
	return float3 (hsvHue, hsvSat, hsvValue) / 360; 
}
*/


void ColorShit(float4 position : SV_Position, float2 texCoord : TEXCOORD0, out float4 color : SV_Target)
{
	
	

	
	color = tex2D(ReShade::BackBuffer, texCoord).rgba;

    // Brightning of color by Multiplication.
    color.rgb = color.rgb * colorMul;
    // Maniplulating contrast on each color channel via Exponent.
    // sqrt on colorCon is to provide a curve on the contrast user input value.
    color = pow(color, sqrt(colorCon));
    // Manipulating saturation for all colors.
    // sqrt on colorSat is to provide a curve on the saturation user input value.
    float grey = (color.r * lumaWeight.r + color.g * lumaWeight.g + color.b * lumaWeight.b);
    color = lerp(grey, color, sqrt(colorSat));

}

//----------------------------- |--------| -----------------------------//
//----------------------------- |   OUT  | -----------------------------//
//----------------------------- |--------| -----------------------------//

technique ShitGrading
<

    ui_label = "ShitGrading";
    ui_tooltip = "Jordan made this, and isn't quite proud of it.\nFuck you";

>

{

    pass
	{

		VertexShader = PostProcessVS;
		PixelShader = ColorShit;

    }

}
