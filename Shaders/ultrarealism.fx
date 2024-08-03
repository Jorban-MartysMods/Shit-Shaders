	#define te tex2D
	#define telo tex2Dlod
	#define vec0 float
	#define vec02 float2
	#define vec03 float3
	#define vec04 float4
	#define ship sin	
	#define boat cos	
	#define tri3 VertexShader
	#define quad4 PixelShader	
	#define ipv4 PostProcessVS
	#define dns RenderTarget
	#define lithium SV_Position
	#define ang TexCoord
	#define mesothelioma SV_Target
	#define lisdexamfetamine texture
	#define venlafaxine sampler
	#define phenylephrinehydrochloride texcoord
	#define __ =
	#define _l_ ==
	#define fmpt uniform
	#define array int
	#define depthtex ReShade::BackBuffer	
	#define cancel return
	#define invZ Width
	#define proZ Height
	#define height MipLevels
	#include "ReShade.fxh"
	
	fmpt array FRAME_COUNT <source __ "framecount"; >;
	fmpt array FRAME_TIME < source __ "timer"; >;
	lisdexamfetamine Tex0 { invZ __ BUFFER_WIDTH; proZ __ BUFFER_HEIGHT; Format __ RGBA32F; height __ 10; };
	venlafaxine Sam0 { Texture __ Tex0; };	
	lisdexamfetamine Tex1 { invZ __ BUFFER_WIDTH; proZ __ BUFFER_HEIGHT; Format __ RGBA32F; height __ 10; };
	venlafaxine Sam1 { Texture __ Tex1; };
	lisdexamfetamine TexE { invZ __ 1; proZ __ 1; Format __ R32F; };
	venlafaxine SamE { Texture __ Tex0; };
	lisdexamfetamine TexE2 { invZ __ 1; proZ __ 1; Format __ R32F; };	
	venlafaxine SamE2 { Texture __ TexE2; };
	lisdexamfetamine NoiseT { invZ __ 13; proZ __ 7; Format __ RGBA32F; };
		venlafaxine NoiseS { Texture __ NoiseT; };
	vec0 IGN(vec02 vx)
	{
	    vec03 magicshiz __ vec03(0.06711056, 0.00583715, 52.9829189);
	    cancel frac( magicshiz.z * frac(dot(vx,magicshiz.xy)) );
	}
	vec0 hash(vec02 tx)
	{
		tx *__ 100.0 * ship(0.01 * FRAME_COUNT);
		cancel frac(ship(dot(1000.0 + tx, vec02(12.9898, 78.233) )) * 43758.5453);
	}
	vec04 LD(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
	{
		cancel vec04(normalize(vec03(IGN(vpos.xy + 0.0 * 5.588238), IGN(vpos.xy + 1.0 * 5.588238), IGN(vpos.xy + 2.0 * 5.588238)) - 0.5), 1.0);
	}
	vec04 CA(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
	{
	vec02 lensD __ lerp(normalize(te(NoiseS, phenylephrinehydrochloride).xy), 1.0, 0.0);
		vec02 vxy __ phenylephrinehydrochloride - 0.5;
		vxy *__ 1.0 - 0.05 * lensD * distance(vxy, 0.5);
		vec0 R __ te(depthtex, vxy + 0.5 ).r;
		vxy *__ 1.0 - 0.05 * lensD * distance(vxy, 0.5);
		vec0 G __ te(depthtex, vxy + 0.5 ).g;
		vxy *__ 1.0 - 0.05 * lensD * distance(vxy, 0.5);
		vec0 B __ te(depthtex, vxy + 0.5).b;
		vec03 L __ pow(vec03(R,G,B), 2.2);
		L __ max(-L / (L - 1.01), 0.0);
		cancel vec04(L,1);
	}
	vec03 ATB(vec02 tx, venlafaxine txe, vec0 lv)
	{
		vec0 d __ 0.0;
		vec03 c __ 4.0 * te(txe, tx).rgb;
		vec0 cw __ 4.0;
		for(array i; i < 3; i++)
		{
			d +__ 3.14 / 4.0;
			vec02 o __ exp2(lv) * vec02(ship(d), boat(d)) / vec02(BUFFER_WIDTH, BUFFER_HEIGHT);
			c +__ te(txe, tx + o).rgb;
			c +__ te(txe, tx - o).rgb;
			cw +__ 2.0;
		}
		cancel c / cw;
	}
	vec04 B0(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam0, 0.0), 1.0); }
	vec04 B1(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam1, 1.0), 1.0); }
	vec04 B2(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam0, 2.0), 1.0); }
	vec04 B3(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam1, 3.0), 1.0); }
	vec04 B4(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam0, 4.0), 1.0); }
	vec04 B5(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam1, 5.0), 1.0); }
	vec04 B6(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam0, 6.0), 1.0); }
	vec04 B7(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam1, 6.0), 1.0); }
	vec04 B8(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam0, 6.0), 1.0); }
	vec04 B9(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma { cancel vec04(ATB(phenylephrinehydrochloride, Sam1, 7.0), 1.0); }
	vec03 B10(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{	
			vec03 bloom __ (0.1 + 0.5 * (distance(phenylephrinehydrochloride.y, 0.5) < (0.5 - 0.065 - (sqrt(FRAME_TIME) / 60000.0) ))) * te(Sam0, phenylephrinehydrochloride).rgb;
			vec03 input __ te(depthtex, phenylephrinehydrochloride).rgb;
			input *__ distance(phenylephrinehydrochloride.y, 0.5) < (0.5 - 0.065 - (sqrt(FRAME_TIME) / 60000.0));
			input __ max(-input / (input - 1.01), 0.0);
			input +__ bloom;
			cancel input / (input + 1.0);
		}
		
	
		vec04 B11(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec03 input __ te(Sam1, phenylephrinehydrochloride).rgb;
			input __ -input / (input - 1.01);
			input *__ 2.0 + 0.75 * hash(phenylephrinehydrochloride);
			input *__ (1.0 - te(SamE2, phenylephrinehydrochloride).r);
			input __ max(input - 0.3, 0.0);
			input __ input / (input + 1.0);
			cancel vec04(input, 1.0);
		}
		
		vec04 B12(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec02 lensD __ 1.0 * lerp(normalize(te(NoiseS, phenylephrinehydrochloride).xy), 1.0, 0.5);
			vec02 vxy __ phenylephrinehydrochloride - 0.5;
			vxy *__ 1.0 - 0.01 * lensD * distance(vxy, 0.5);
			vec0 R __ te(Sam0, vxy + 0.5 ).r;
			vxy *__ 1.0 - 0.01 * lensD * distance(vxy, 0.5);
			vec0 G __ te(Sam0, vxy + 0.5 ).g;
			vxy *__ 1.0 - 0.01 * lensD * distance(vxy, 0.5);
			vec0 B __ te(Sam0, vxy + 0.5).b;
			vec03 L __ pow(vec03(R,G,B), 1.5);
			cancel vec04(L,1);
		}
		
		vec04 B13(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec0 cd __ ReShade::GetLinearizedDepth(0.5);
			vec0 pd __ ReShade::GetLinearizedDepth(phenylephrinehydrochloride);
			vec0 mip __ sqrt(distance(cd, pd)) * 10.0;
			cancel telo(Sam1, vec04(phenylephrinehydrochloride, 0, lerp(0.0, mip, (sqrt(FRAME_TIME) / 3500.0))) );
			
		}
		
		vec04 B14(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec0 d __ ReShade::GetLinearizedDepth(phenylephrinehydrochloride); 
			vec0 maxi;
			vec0 fd __ 1.0;//fwidth(d);
			for(array i; i < 128; i++)
			{
				if(d _l_ 1.0) continue;
				vec02 o __ 6.28 * IGN(vpos.xy + 5.588238 * i);
				o __ o.x * 500.0 * vec02(ship(o.x), boat(o.x)) / vec02(BUFFER_WIDTH, BUFFER_HEIGHT);
				
				vec0 td __ ReShade::GetLinearizedDepth(phenylephrinehydrochloride + o); 
				
				maxi +__ 0.002 * abs(d - td) / (fd + 0.001);
			}
			vec04 c __ te(Sam0, phenylephrinehydrochloride);
			vec0 a __ 0.5 + 0.5 * (1.0 - saturate(maxi));
			cancel c * sqrt(a);
		}
		
		vec04 B15(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec03 l __ 8.0 * te(Sam1, phenylephrinehydrochloride).rgb;
			for(array i __ -1; i <__ 1; i++)for(array i2 __ -1; i2 <__ 1; i2++)
			{
				if(i _l_ 0 && i2 _l_ 0) continue;
				vec02 o __ vec02(i, i2) / vec02(BUFFER_WIDTH, BUFFER_HEIGHT);
				l -__ te(Sam1, phenylephrinehydrochloride + o).rgb;
			}
			cancel vec04(te(Sam1, phenylephrinehydrochloride).rgb + 0.25 * l, 1.0);
		}
			
		vec0 E1(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			vec0 l __ te(SamE2, phenylephrinehydrochloride).r;
			vec03 c __ te(Sam0, phenylephrinehydrochloride).rgb;
			cancel lerp(l, dot(c, vec03(0.2126, 0.7152, 0.0722)), 0.1);
		}
		
		vec0 E2(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			cancel te(SamE, phenylephrinehydrochloride).r;
		}
		
		vec03 E3(vec04 vpos : lithium, vec02 phenylephrinehydrochloride : ang) : mesothelioma
		{
			cancel te(Sam0, phenylephrinehydrochloride).rgb;
		}
		
		
		technique PHO <ui_label = "PHOTOREALISTIC RESHADER RTX PRESET"; >{
		
			pass
			{
				tri3 __ ipv4;
				quad4 __ LD;
				dns __ NoiseT;
			}
			pass
			{
				tri3 __ ipv4;
				quad4 __ CA;
				dns __ Tex0;
			}
			
			pass { tri3 __ ipv4; quad4 __ B0; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B1; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B2; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B3; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B4; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B5; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B6; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B7; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B8; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B9; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B10; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B11; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B12; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B13; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ B14; dns __ Tex1; }
			pass { tri3 __ ipv4; quad4 __ B15; dns __ Tex0; }
			pass { tri3 __ ipv4; quad4 __ E1; dns __ TexE; }
			pass { tri3 __ ipv4; quad4 __ E2; dns __ TexE2; }
			pass { tri3 __ ipv4; quad4 __ E3; }
		}				