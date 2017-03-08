// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-70-OUT,clip-5789-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31538,y:31884,ptovrint:False,ptlb:Color_01,ptin:_Color_01,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9852941,c2:0.4688641,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6223,x:30545,y:32640,ptovrint:False,ptlb:Text,ptin:_Text,varname:node_6223,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fb936a2ae77563d4b88d7ddf7a8dc51b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Ceil,id:9056,x:31318,y:32415,varname:node_9056,prsc:2|IN-314-OUT;n:type:ShaderForge.SFN_Subtract,id:314,x:31083,y:32401,varname:node_314,prsc:2|A-6498-OUT,B-9766-OUT;n:type:ShaderForge.SFN_VertexColor,id:7922,x:32600,y:32326,varname:node_7922,prsc:2;n:type:ShaderForge.SFN_Set,id:419,x:33097,y:32349,varname:__Vcols,prsc:2|IN-4888-OUT;n:type:ShaderForge.SFN_Get,id:7404,x:30413,y:32312,varname:node_7404,prsc:2|IN-419-OUT;n:type:ShaderForge.SFN_Multiply,id:5789,x:31607,y:32632,varname:node_5789,prsc:2|A-9056-OUT,B-6223-R,C-4132-OUT;n:type:ShaderForge.SFN_Get,id:7414,x:30236,y:32918,varname:node_7414,prsc:2|IN-419-OUT;n:type:ShaderForge.SFN_OneMinus,id:9766,x:30789,y:32606,varname:node_9766,prsc:2|IN-6223-G;n:type:ShaderForge.SFN_Subtract,id:63,x:31080,y:32710,varname:node_63,prsc:2|A-9766-OUT,B-8738-OUT;n:type:ShaderForge.SFN_Ceil,id:4132,x:31331,y:32758,varname:node_4132,prsc:2|IN-63-OUT;n:type:ShaderForge.SFN_Clamp01,id:6498,x:30829,y:32354,varname:node_6498,prsc:2|IN-7404-OUT;n:type:ShaderForge.SFN_Subtract,id:9535,x:30629,y:32913,varname:node_9535,prsc:2|A-7414-OUT,B-6715-OUT;n:type:ShaderForge.SFN_Vector1,id:6715,x:30415,y:33081,varname:node_6715,prsc:2,v1:1;n:type:ShaderForge.SFN_Clamp01,id:8738,x:30806,y:32913,varname:node_8738,prsc:2|IN-9535-OUT;n:type:ShaderForge.SFN_Color,id:2096,x:31538,y:32061,ptovrint:False,ptlb:Coor_02,ptin:_Coor_02,varname:node_2096,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.913996,c3:0.2205882,c4:1;n:type:ShaderForge.SFN_Lerp,id:4619,x:31799,y:32009,varname:node_4619,prsc:2|A-7241-RGB,B-2096-RGB,T-7766-OUT;n:type:ShaderForge.SFN_Multiply,id:4888,x:32884,y:32385,varname:node_4888,prsc:2|A-7922-RGB,B-6133-OUT;n:type:ShaderForge.SFN_Vector1,id:6133,x:32693,y:32534,varname:node_6133,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6379,x:31232,y:32206,varname:node_6379,prsc:2|A-6223-G,B-9632-OUT;n:type:ShaderForge.SFN_Get,id:542,x:29905,y:32081,varname:node_542,prsc:2|IN-419-OUT;n:type:ShaderForge.SFN_Multiply,id:70,x:32100,y:32516,varname:node_70,prsc:2|A-4619-OUT,B-5789-OUT;n:type:ShaderForge.SFN_RemapRange,id:9682,x:30283,y:32080,varname:node_9682,prsc:2,frmn:0,frmx:2,tomn:-1,tomx:1|IN-542-OUT;n:type:ShaderForge.SFN_Abs,id:5232,x:30490,y:32080,varname:node_5232,prsc:2|IN-9682-OUT;n:type:ShaderForge.SFN_Add,id:9632,x:30927,y:32063,varname:node_9632,prsc:2|A-5853-OUT,B-6541-OUT;n:type:ShaderForge.SFN_Vector1,id:5853,x:30748,y:31985,varname:node_5853,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Clamp01,id:7766,x:31418,y:32206,varname:node_7766,prsc:2|IN-6379-OUT;n:type:ShaderForge.SFN_OneMinus,id:6541,x:30706,y:32090,varname:node_6541,prsc:2|IN-5232-OUT;proporder:7241-6223-2096;pass:END;sub:END;*/

Shader "Shader Forge/SH_TextPopUp" {
    Properties {
        _Color_01 ("Color_01", Color) = (0.9852941,0.4688641,0,1)
        _Text ("Text", 2D) = "white" {}
        _Coor_02 ("Coor_02", Color) = (1,0.913996,0.2205882,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color_01;
            uniform sampler2D _Text; uniform float4 _Text_ST;
            uniform float4 _Coor_02;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 __Vcols = (i.vertexColor.rgb*2.0);
                float4 _Text_var = tex2D(_Text,TRANSFORM_TEX(i.uv0, _Text));
                float node_9766 = (1.0 - _Text_var.g);
                float3 node_5789 = (ceil((saturate(__Vcols)-node_9766))*_Text_var.r*ceil((node_9766-saturate((__Vcols-1.0)))));
                clip(node_5789 - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = (lerp(_Color_01.rgb,_Coor_02.rgb,saturate((_Text_var.g*(0.1+(1.0 - abs((__Vcols*1.0+-1.0)))))))*node_5789);
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _Text; uniform float4 _Text_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float3 __Vcols = (i.vertexColor.rgb*2.0);
                float4 _Text_var = tex2D(_Text,TRANSFORM_TEX(i.uv0, _Text));
                float node_9766 = (1.0 - _Text_var.g);
                float3 node_5789 = (ceil((saturate(__Vcols)-node_9766))*_Text_var.r*ceil((node_9766-saturate((__Vcols-1.0)))));
                clip(node_5789 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
