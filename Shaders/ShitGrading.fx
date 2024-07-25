// ----------------------------------------------------------------------//
// Written by: 
//             Jordan
// ----------------------------------------------------------------------//
// Thanks to:  
//             Zenteon
//             Marty
//             Gordi
// ----------------------------------------------------------------------//
// Summary:    
//             Started out as a very simple Shadertoy color grading shader
//             that I wanted to port to ReShade specifically for the UI
//             elements that don't exist on ShaderToy. There will likely
//             be more to come, but I have no idea. Already really
//             exhausted myself with the little amount that I did here.
// ----------------------------------------------------------------------//
// TODO: 
//             HUE Control of all colors (Hoping RGBA)
//             Unsure...
// ----------------------------------------------------------------------//

//----------------------------- |--------| -----------------------------//
// ---------------------------- |  INCS  | -----------------------------//
//----------------------------- |--------| -----------------------------//

#include "ReShade.fxh"

//----------------------------- |--------| -----------------------------//
// ---------------------------- |   UI   | -----------------------------//
//----------------------------- |--------| -----------------------------//

uniform float4 colorAdd <
    ui_type = "drag";
    ui_min = 0.0; ui_max = 1.0;
    ui_label = "Addition";
> = 0.0;

uniform float4 colorMul <
    ui_type = "drag";
    ui_min = 0.0; ui_max = 2.0;
    ui_label = "Multiply";
> = 1.0;

uniform float colorSat <
    ui_type = "drag";
    ui_min = 0.0; ui_max = 2.0;
    ui_label = "Saturation";
> = 1.0;

uniform float colorCon <
    ui_type = "drag";
    ui_min = 0.50; ui_max = 1.5;
    ui_label = "Contrast";
> = 1.0;

//----------------------------- |--------| -----------------------------//
//----------------------------- |  FUNC  | -----------------------------//
//----------------------------- |--------| -----------------------------//

void ColorShit(float4 position : SV_Position, float2 texCoord : TEXCOORD0, out float4 color : SV_Target)
{
	color = tex2D(ReShade::BackBuffer, texCoord).rgba;

    // Brightning of color by Multiplication.
    color = color * colorMul;
    // Brightning of color by Addition.
    color = color + colorAdd;
    // Maniplulating contrast on each color channel via Exponent.
    // sqrt on colorCon is to provide a curve on the contrast user input value.
    color = pow(color, sqrt(colorCon));
    // Manipulating saturation for all colors.
    // sqrt on colorSat is to provide a curve on the saturation user input value.
    float grey = (color.r * 0.2126 + color.g * 0.7152 + color.b * 0.0722);
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