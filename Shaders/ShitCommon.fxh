// Commonly used variables for Shit-Shaders repository.

// Luma Weights

#define lumaWeight float3(0.2126, 0.7152, 0.0722)

// --- //

// RGB to HSV Conversion

// Notes: You do not need to divide by 255 due to ReShade (and shader language) already working with numbers between 0 and 1
// Taking the max of three variables. ReShadeFX is aids, so you need two different Max functions

float3 rgb2hsv (float3 rgb)
{

	float3 color = rgb;
	
    float colorMax = max(color.r, color.g);
    colorMax = max(colorMax, color.b);
    float colorMin = min(color.r, color.g);
    colorMin = min(colorMin, color.b);
    //This is a variable
    float diff = (colorMax - colorMin);

    float hsvHue = 0;
    if(colorMax == color.r) hsvHue = (60 * ((color.g - color.b) / diff) + 360) % 360;
    if(colorMax == color.g) hsvHue = (60 * ((color.b - color.r) / diff) + 120) % 360;
    if(colorMax == color.b) hsvHue = (60 * ((color.r - color.g) / diff) + 240) % 360;

	float hsvSat = 0;   
	if (colorMax == 0);
    else hsvSat = (diff / colorMax * 100);

    float hsvValue = (colorMax * 100);

    return float3(hsvHue, hsvSat, hsvValue) / 360;

}
// --- //