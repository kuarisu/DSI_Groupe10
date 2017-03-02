// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33636,y:32203,varname:node_3138,prsc:2|emission-956-OUT,clip-4572-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32430,y:31729,ptovrint:False,ptlb:ColorFull,ptin:_ColorFull,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.9002028,c3:0.09558821,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:1866,x:31114,y:32140,ptovrint:False,ptlb:AmmoMax,ptin:_AmmoMax,varname:node_1866,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:4517,x:31114,y:32061,ptovrint:False,ptlb:AmmoCurrent,ptin:_AmmoCurrent,varname:node_4517,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:5998,x:31547,y:32621,varname:node_5998,prsc:2,uv:0;n:type:ShaderForge.SFN_Divide,id:2462,x:31783,y:32287,varname:node_2462,prsc:2|A-6177-OUT,B-6100-OUT;n:type:ShaderForge.SFN_OneMinus,id:7969,x:32004,y:32157,varname:node_7969,prsc:2|IN-2462-OUT;n:type:ShaderForge.SFN_Lerp,id:956,x:32714,y:32027,varname:node_956,prsc:2|A-7241-RGB,B-2370-RGB,T-7969-OUT;n:type:ShaderForge.SFN_Color,id:2370,x:32414,y:31916,ptovrint:False,ptlb:ColorEmpty,ptin:_ColorEmpty,varname:node_2370,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Set,id:6584,x:31332,y:32051,varname:__Current_Ammo,prsc:2|IN-4517-OUT;n:type:ShaderForge.SFN_Set,id:4571,x:31332,y:32140,varname:__Max_Ammor,prsc:2|IN-1866-OUT;n:type:ShaderForge.SFN_Get,id:6177,x:31556,y:32235,varname:node_6177,prsc:2|IN-6584-OUT;n:type:ShaderForge.SFN_Get,id:6100,x:31556,y:32318,varname:node_6100,prsc:2|IN-4571-OUT;n:type:ShaderForge.SFN_Add,id:86,x:32480,y:32478,varname:node_86,prsc:2|A-6245-OUT,B-6610-OUT;n:type:ShaderForge.SFN_RemapRange,id:6245,x:32169,y:32324,varname:node_6245,prsc:2,frmn:0,frmx:1,tomn:-0.5,tomx:0.5|IN-2462-OUT;n:type:ShaderForge.SFN_OneMinus,id:6610,x:31902,y:32624,varname:node_6610,prsc:2|IN-5998-U;n:type:ShaderForge.SFN_Multiply,id:1435,x:32117,y:32715,varname:node_1435,prsc:2|A-6610-OUT,B-2223-OUT,C-5987-OUT;n:type:ShaderForge.SFN_Sin,id:5171,x:32327,y:32715,varname:node_5171,prsc:2|IN-1435-OUT;n:type:ShaderForge.SFN_Get,id:2223,x:31867,y:32801,varname:node_2223,prsc:2|IN-4571-OUT;n:type:ShaderForge.SFN_Round,id:4657,x:32689,y:32478,varname:node_4657,prsc:2|IN-86-OUT;n:type:ShaderForge.SFN_Clamp01,id:9674,x:32892,y:32478,varname:node_9674,prsc:2|IN-4657-OUT;n:type:ShaderForge.SFN_Clamp01,id:4983,x:32908,y:32715,varname:node_4983,prsc:2|IN-9821-OUT;n:type:ShaderForge.SFN_Vector1,id:5987,x:31911,y:32922,varname:node_5987,prsc:2,v1:3.14159;n:type:ShaderForge.SFN_Add,id:9821,x:32689,y:32715,varname:node_9821,prsc:2|A-9893-OUT,B-9468-OUT;n:type:ShaderForge.SFN_Abs,id:9893,x:32480,y:32715,varname:node_9893,prsc:2|IN-5171-OUT;n:type:ShaderForge.SFN_Round,id:2211,x:33116,y:32715,varname:node_2211,prsc:2|IN-4983-OUT;n:type:ShaderForge.SFN_Multiply,id:4572,x:33344,y:32546,varname:node_4572,prsc:2|A-9674-OUT,B-2211-OUT;n:type:ShaderForge.SFN_Slider,id:9468,x:32283,y:33013,ptovrint:False,ptlb:Graduation_Thickness,ptin:_Graduation_Thickness,varname:node_9468,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-0.5,cur:0,max:0.5;proporder:7241-2370-9468;pass:END;sub:END;*/

Shader "Shader Forge/SH_BulletCount" {
    Properties {
        _ColorFull ("ColorFull", Color) = (1,0.9002028,0.09558821,1)
        _ColorEmpty ("ColorEmpty", Color) = (1,0,0,1)
        _Graduation_Thickness ("Graduation_Thickness", Range(-0.5, 0.5)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _ColorFull;
            uniform float _AmmoMax;
            uniform float _AmmoCurrent;
            uniform float4 _ColorEmpty;
            uniform float _Graduation_Thickness;
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
                float __Current_Ammo = _AmmoCurrent;
                float __Max_Ammor = _AmmoMax;
                float node_2462 = (__Current_Ammo/__Max_Ammor);
                float node_6610 = (1.0 - i.uv0.r);
                clip((saturate(round(((node_2462*1.0+-0.5)+node_6610)))*round(saturate((abs(sin((node_6610*__Max_Ammor*3.14159)))+_Graduation_Thickness)))) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = lerp(_ColorFull.rgb,_ColorEmpty.rgb,(1.0 - node_2462));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float _AmmoMax;
            uniform float _AmmoCurrent;
            uniform float _Graduation_Thickness;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float __Current_Ammo = _AmmoCurrent;
                float __Max_Ammor = _AmmoMax;
                float node_2462 = (__Current_Ammo/__Max_Ammor);
                float node_6610 = (1.0 - i.uv0.r);
                clip((saturate(round(((node_2462*1.0+-0.5)+node_6610)))*round(saturate((abs(sin((node_6610*__Max_Ammor*3.14159)))+_Graduation_Thickness)))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
