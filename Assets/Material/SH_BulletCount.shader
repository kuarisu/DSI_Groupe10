// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:6,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:34590,y:32142,varname:node_3138,prsc:2|emission-6225-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31476,y:31133,ptovrint:False,ptlb:ColorFull,ptin:_ColorFull,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9002028,c3:0.09558821,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:1866,x:29174,y:32151,ptovrint:False,ptlb:AmmoMax,ptin:_AmmoMax,varname:node_1866,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:4517,x:29174,y:32072,ptovrint:False,ptlb:AmmoCurrent,ptin:_AmmoCurrent,varname:node_4517,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:5998,x:30217,y:33053,varname:node_5998,prsc:2,uv:0;n:type:ShaderForge.SFN_Divide,id:2462,x:30224,y:32751,varname:node_2462,prsc:2|A-6177-OUT,B-6100-OUT;n:type:ShaderForge.SFN_OneMinus,id:7969,x:30560,y:31814,varname:node_7969,prsc:2|IN-2462-OUT;n:type:ShaderForge.SFN_Lerp,id:956,x:31810,y:31666,varname:node_956,prsc:2|A-7241-RGB,B-2370-RGB,T-2636-OUT;n:type:ShaderForge.SFN_Color,id:2370,x:31263,y:31265,ptovrint:False,ptlb:ColorEmpty,ptin:_ColorEmpty,varname:node_2370,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Set,id:6584,x:29471,y:32045,varname:__Current_Ammo,prsc:2|IN-4517-OUT;n:type:ShaderForge.SFN_Set,id:4571,x:29471,y:32134,varname:__Max_Ammor,prsc:2|IN-1866-OUT;n:type:ShaderForge.SFN_Get,id:6177,x:29997,y:32699,varname:node_6177,prsc:2|IN-6584-OUT;n:type:ShaderForge.SFN_Get,id:6100,x:29997,y:32782,varname:node_6100,prsc:2|IN-4571-OUT;n:type:ShaderForge.SFN_Add,id:86,x:31150,y:32910,varname:node_86,prsc:2|A-6245-OUT,B-6610-OUT;n:type:ShaderForge.SFN_RemapRange,id:6245,x:30610,y:32788,varname:node_6245,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-2462-OUT;n:type:ShaderForge.SFN_OneMinus,id:6610,x:30572,y:33056,varname:node_6610,prsc:2|IN-5998-U;n:type:ShaderForge.SFN_Multiply,id:1435,x:30787,y:33147,varname:node_1435,prsc:2|A-6610-OUT,B-2223-OUT,C-5987-OUT;n:type:ShaderForge.SFN_Sin,id:5171,x:30997,y:33147,varname:node_5171,prsc:2|IN-1435-OUT;n:type:ShaderForge.SFN_Get,id:2223,x:30537,y:33233,varname:node_2223,prsc:2|IN-4571-OUT;n:type:ShaderForge.SFN_Round,id:4657,x:31359,y:32910,varname:node_4657,prsc:2|IN-86-OUT;n:type:ShaderForge.SFN_Clamp01,id:9674,x:31562,y:32910,varname:node_9674,prsc:2|IN-4657-OUT;n:type:ShaderForge.SFN_Vector1,id:5987,x:30581,y:33354,varname:node_5987,prsc:2,v1:3.14159;n:type:ShaderForge.SFN_Add,id:9821,x:31359,y:33147,varname:node_9821,prsc:2|A-9893-OUT,B-9468-OUT;n:type:ShaderForge.SFN_Abs,id:9893,x:31150,y:33147,varname:node_9893,prsc:2|IN-5171-OUT;n:type:ShaderForge.SFN_Slider,id:9468,x:30953,y:33445,ptovrint:False,ptlb:Graduation_Thickness,ptin:_Graduation_Thickness,varname:node_9468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.5,cur:-0.2983998,max:0.5;n:type:ShaderForge.SFN_Sin,id:4932,x:30204,y:31278,varname:node_4932,prsc:2|IN-9399-OUT;n:type:ShaderForge.SFN_Time,id:3211,x:29670,y:31286,varname:node_3211,prsc:2;n:type:ShaderForge.SFN_Lerp,id:2636,x:31337,y:31724,varname:node_2636,prsc:2|A-4339-OUT,B-4274-OUT,T-7969-OUT;n:type:ShaderForge.SFN_Ceil,id:4034,x:30437,y:31261,varname:node_4034,prsc:2|IN-4932-OUT;n:type:ShaderForge.SFN_RemapRange,id:4238,x:30409,y:31404,varname:node_4238,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4932-OUT;n:type:ShaderForge.SFN_Lerp,id:4274,x:31041,y:31387,varname:node_4274,prsc:2|A-4238-OUT,B-4034-OUT,T-6872-OUT;n:type:ShaderForge.SFN_Power,id:6872,x:30805,y:31557,varname:node_6872,prsc:2|VAL-7969-OUT,EXP-913-OUT;n:type:ShaderForge.SFN_Vector1,id:913,x:30589,y:31633,varname:node_913,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:9399,x:29957,y:31317,varname:node_9399,prsc:2|A-3211-T,B-7588-OUT,C-7969-OUT;n:type:ShaderForge.SFN_Vector1,id:7588,x:29755,y:31463,varname:node_7588,prsc:2,v1:20;n:type:ShaderForge.SFN_Multiply,id:2343,x:32958,y:32201,varname:node_2343,prsc:2|A-956-OUT,B-384-OUT;n:type:ShaderForge.SFN_RemapRange,id:4231,x:31504,y:33422,varname:node_4231,prsc:2,frmn:0.45,frmx:0.55,tomn:0,tomx:1|IN-86-OUT;n:type:ShaderForge.SFN_RemapRange,id:7627,x:30555,y:33622,varname:node_7627,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5998-V;n:type:ShaderForge.SFN_OneMinus,id:6144,x:30995,y:33622,varname:node_6144,prsc:2|IN-1291-OUT;n:type:ShaderForge.SFN_Clamp01,id:744,x:31610,y:33609,varname:node_744,prsc:2|IN-6144-OUT;n:type:ShaderForge.SFN_Clamp01,id:544,x:31674,y:33267,varname:node_544,prsc:2|IN-9821-OUT;n:type:ShaderForge.SFN_Abs,id:1291,x:30777,y:33622,varname:node_1291,prsc:2|IN-7627-OUT;n:type:ShaderForge.SFN_Clamp01,id:1589,x:31674,y:33423,varname:node_1589,prsc:2|IN-4231-OUT;n:type:ShaderForge.SFN_Clamp01,id:384,x:32967,y:32509,varname:node_384,prsc:2|IN-5220-OUT;n:type:ShaderForge.SFN_Add,id:1771,x:32325,y:33510,varname:node_1771,prsc:2|A-2949-OUT,B-2818-OUT;n:type:ShaderForge.SFN_Multiply,id:5220,x:32618,y:33310,varname:node_5220,prsc:2|A-9674-OUT,B-1771-OUT;n:type:ShaderForge.SFN_Blend,id:7828,x:31899,y:33351,varname:node_7828,prsc:2,blmd:0,clmp:True|SRC-544-OUT,DST-1589-OUT;n:type:ShaderForge.SFN_Blend,id:2949,x:32068,y:33416,varname:node_2949,prsc:2,blmd:0,clmp:True|SRC-7828-OUT,DST-744-OUT;n:type:ShaderForge.SFN_Multiply,id:2818,x:32162,y:33644,varname:node_2818,prsc:2|A-2949-OUT,B-8607-OUT;n:type:ShaderForge.SFN_Vector1,id:8607,x:32010,y:33718,varname:node_8607,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4339,x:31054,y:31867,varname:node_4339,prsc:2|A-7969-OUT,B-7243-OUT;n:type:ShaderForge.SFN_OneMinus,id:7243,x:32061,y:32805,varname:node_7243,prsc:2|IN-2949-OUT;n:type:ShaderForge.SFN_Lerp,id:2121,x:33047,y:31872,varname:node_2121,prsc:2|A-9851-OUT,B-2343-OUT,T-5699-OUT;n:type:ShaderForge.SFN_Ceil,id:5699,x:30694,y:32566,varname:node_5699,prsc:2|IN-2462-OUT;n:type:ShaderForge.SFN_Multiply,id:6608,x:33291,y:31913,varname:node_6608,prsc:2|A-2121-OUT,B-2865-OUT;n:type:ShaderForge.SFN_Multiply,id:9851,x:32465,y:31644,varname:node_9851,prsc:2|A-1285-OUT,B-956-OUT;n:type:ShaderForge.SFN_Vector3,id:1285,x:32207,y:31450,varname:node_1285,prsc:2,v1:0.8235294,v2:0.4420415,v3:0.5247451;n:type:ShaderForge.SFN_Add,id:1083,x:31157,y:34198,varname:node_1083,prsc:2|A-4197-OUT,B-8993-OUT;n:type:ShaderForge.SFN_Time,id:5399,x:30637,y:34278,varname:node_5399,prsc:2;n:type:ShaderForge.SFN_Sin,id:2411,x:31402,y:34198,varname:node_2411,prsc:2|IN-1083-OUT;n:type:ShaderForge.SFN_Multiply,id:4197,x:30889,y:34082,varname:node_4197,prsc:2|A-6610-OUT,B-1841-OUT;n:type:ShaderForge.SFN_Vector1,id:1841,x:30545,y:34151,varname:node_1841,prsc:2,v1:5;n:type:ShaderForge.SFN_Multiply,id:8993,x:30912,y:34333,varname:node_8993,prsc:2|A-5399-TTR,B-8095-OUT;n:type:ShaderForge.SFN_Vector1,id:8095,x:30697,y:34477,varname:node_8095,prsc:2,v1:10;n:type:ShaderForge.SFN_RemapRange,id:4863,x:31625,y:34198,varname:node_4863,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2411-OUT;n:type:ShaderForge.SFN_Add,id:9883,x:33782,y:33826,varname:node_9883,prsc:2|A-6608-OUT,B-2583-OUT;n:type:ShaderForge.SFN_Multiply,id:5210,x:32122,y:34180,varname:node_5210,prsc:2|A-2865-OUT,B-4863-OUT;n:type:ShaderForge.SFN_RemapRange,id:2457,x:30555,y:33782,varname:node_2457,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-5998-U;n:type:ShaderForge.SFN_OneMinus,id:2348,x:31382,y:33770,varname:node_2348,prsc:2|IN-2080-OUT;n:type:ShaderForge.SFN_Clamp01,id:100,x:31610,y:33770,varname:node_100,prsc:2|IN-2348-OUT;n:type:ShaderForge.SFN_Abs,id:5614,x:30777,y:33782,varname:node_5614,prsc:2|IN-2457-OUT;n:type:ShaderForge.SFN_Power,id:2080,x:31180,y:33783,varname:node_2080,prsc:2|VAL-5614-OUT,EXP-9544-OUT;n:type:ShaderForge.SFN_Vector1,id:9544,x:30989,y:33860,varname:node_9544,prsc:2,v1:30;n:type:ShaderForge.SFN_Multiply,id:2865,x:31783,y:33642,varname:node_2865,prsc:2|A-744-OUT,B-100-OUT;n:type:ShaderForge.SFN_Set,id:1629,x:31706,y:31150,varname:_CollorFull,prsc:2|IN-7241-RGB;n:type:ShaderForge.SFN_Set,id:4659,x:31706,y:31312,varname:_ColorEmpty,prsc:2|IN-2370-RGB;n:type:ShaderForge.SFN_Clamp01,id:6441,x:32419,y:34196,varname:node_6441,prsc:2|IN-5210-OUT;n:type:ShaderForge.SFN_Lerp,id:3280,x:32806,y:34041,varname:node_3280,prsc:2|A-8610-OUT,B-2739-OUT,T-6441-OUT;n:type:ShaderForge.SFN_Vector3,id:2739,x:32555,y:33818,varname:node_2739,prsc:2,v1:1,v2:0.9332657,v3:0.6544118;n:type:ShaderForge.SFN_Vector3,id:8610,x:32555,y:33916,varname:node_8610,prsc:2,v1:1,v2:0.7241379,v3:0;n:type:ShaderForge.SFN_Multiply,id:2583,x:33014,y:34134,varname:node_2583,prsc:2|A-3280-OUT,B-6441-OUT,C-1506-OUT;n:type:ShaderForge.SFN_Clamp01,id:6225,x:34127,y:33470,varname:node_6225,prsc:2|IN-9883-OUT;n:type:ShaderForge.SFN_Slider,id:1506,x:32638,y:34356,ptovrint:False,ptlb:Refill,ptin:_Refill,varname:node_1506,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:7241-2370-9468-1506;pass:END;sub:END;*/

Shader "Shader Forge/SH_BulletCount" {
    Properties {
        _ColorFull ("ColorFull", Color) = (1,0.9002028,0.09558821,1)
        _ColorEmpty ("ColorEmpty", Color) = (1,0,0,1)
        _Graduation_Thickness ("Graduation_Thickness", Range(-0.5, 0.5)) = -0.2983998
        _Refill ("Refill", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZTest Always
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _ColorFull;
            uniform float _AmmoMax;
            uniform float _AmmoCurrent;
            uniform float4 _ColorEmpty;
            uniform float _Graduation_Thickness;
            uniform float _Refill;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float __Current_Ammo = _AmmoCurrent;
                float __Max_Ammor = _AmmoMax;
                float node_2462 = (__Current_Ammo/__Max_Ammor);
                float node_7969 = (1.0 - node_2462);
                float node_6610 = (1.0 - i.uv0.r);
                float node_86 = ((node_2462*1.0+-0.5)+node_6610);
                float node_744 = saturate((1.0 - abs((i.uv0.g*2.0+-1.0))));
                float node_2949 = saturate(min(saturate(min(saturate((abs(sin((node_6610*__Max_Ammor*3.14159)))+_Graduation_Thickness)),saturate((node_86*9.999998+-4.499999)))),node_744));
                float4 node_3211 = _Time + _TimeEditor;
                float node_4932 = sin((node_3211.g*20.0*node_7969));
                float3 node_956 = lerp(_ColorFull.rgb,_ColorEmpty.rgb,lerp((node_7969*(1.0 - node_2949)),lerp((node_4932*0.5+0.5),ceil(node_4932),pow(node_7969,2.0)),node_7969));
                float node_2865 = (node_744*saturate((1.0 - pow(abs((i.uv0.r*2.0+-1.0)),30.0))));
                float4 node_5399 = _Time + _TimeEditor;
                float node_6441 = saturate((node_2865*(sin(((node_6610*5.0)+(node_5399.a*10.0)))*0.5+0.5)));
                float3 emissive = saturate(((lerp((float3(0.8235294,0.4420415,0.5247451)*node_956),(node_956*saturate((saturate(round(node_86))*(node_2949+(node_2949*0.5))))),ceil(node_2462))*node_2865)+(lerp(float3(1,0.7241379,0),float3(1,0.9332657,0.6544118),node_6441)*node_6441*_Refill)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
