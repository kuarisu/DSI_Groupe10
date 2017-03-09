// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:34530,y:32582,varname:node_4795,prsc:2|emission-5492-OUT;n:type:ShaderForge.SFN_Vector4Property,id:9070,x:30334,y:32580,ptovrint:False,ptlb:MyPlayerPosition,ptin:_MyPlayerPosition,varname:node_9070,prsc:2,glob:True,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5,v2:0.5,v3:0.5,v4:1;n:type:ShaderForge.SFN_FragmentPosition,id:6324,x:30334,y:32749,varname:node_6324,prsc:2;n:type:ShaderForge.SFN_Distance,id:3117,x:31223,y:32665,varname:node_3117,prsc:2|A-2209-OUT,B-2134-OUT;n:type:ShaderForge.SFN_Divide,id:8480,x:31561,y:32688,varname:node_8480,prsc:2|A-3117-OUT,B-743-OUT;n:type:ShaderForge.SFN_ValueProperty,id:743,x:31251,y:32926,ptovrint:False,ptlb:Distance_Divide,ptin:_Distance_Divide,varname:node_743,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:2209,x:30909,y:32609,varname:node_2209,prsc:2|A-9070-X,B-9070-Y;n:type:ShaderForge.SFN_Append,id:2134,x:30909,y:32762,varname:node_2134,prsc:2|A-6324-X,B-6324-Y;n:type:ShaderForge.SFN_Tex2d,id:7075,x:32704,y:32553,varname:node_7075,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-4468-OUT,TEX-1239-TEX;n:type:ShaderForge.SFN_Append,id:4468,x:32010,y:32688,varname:node_4468,prsc:2|A-1388-OUT,B-8141-OUT;n:type:ShaderForge.SFN_ArcTan2,id:5842,x:31301,y:32241,varname:node_5842,prsc:2,attp:2|A-6304-OUT,B-1359-OUT;n:type:ShaderForge.SFN_Add,id:1388,x:31590,y:32245,varname:node_1388,prsc:2|A-5842-OUT,B-4966-OUT;n:type:ShaderForge.SFN_Subtract,id:6304,x:30909,y:32247,varname:node_6304,prsc:2|A-6324-X,B-9070-X;n:type:ShaderForge.SFN_Subtract,id:1359,x:30909,y:32373,varname:node_1359,prsc:2|A-9070-Y,B-6324-Y;n:type:ShaderForge.SFN_Add,id:8141,x:31782,y:32688,varname:node_8141,prsc:2|A-8163-OUT,B-8480-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1239,x:32314,y:32400,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1239,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2253,x:32704,y:32765,varname:node_2253,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-8139-UVOUT,TEX-1239-TEX;n:type:ShaderForge.SFN_TexCoord,id:9919,x:31419,y:33249,varname:node_9919,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:8903,x:31650,y:33249,varname:node_8903,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-9919-V;n:type:ShaderForge.SFN_Abs,id:9489,x:31859,y:33249,varname:node_9489,prsc:2|IN-8903-OUT;n:type:ShaderForge.SFN_OneMinus,id:7506,x:32035,y:33246,varname:node_7506,prsc:2|IN-9489-OUT;n:type:ShaderForge.SFN_Multiply,id:618,x:33580,y:32908,varname:node_618,prsc:2|A-5040-OUT,B-7506-OUT;n:type:ShaderForge.SFN_Multiply,id:7082,x:33224,y:32616,varname:node_7082,prsc:2|A-5710-OUT,B-9032-OUT,C-779-OUT;n:type:ShaderForge.SFN_OneMinus,id:5710,x:32957,y:32472,varname:node_5710,prsc:2|IN-5653-OUT;n:type:ShaderForge.SFN_OneMinus,id:9032,x:32935,y:32704,varname:node_9032,prsc:2|IN-2253-R;n:type:ShaderForge.SFN_OneMinus,id:5040,x:33419,y:32616,varname:node_5040,prsc:2|IN-7082-OUT;n:type:ShaderForge.SFN_Multiply,id:8163,x:31489,y:32442,varname:node_8163,prsc:2|A-4966-OUT,B-7158-OUT;n:type:ShaderForge.SFN_Vector1,id:7158,x:31324,y:32543,varname:node_7158,prsc:2,v1:10;n:type:ShaderForge.SFN_Round,id:1968,x:33960,y:32711,varname:node_1968,prsc:2|IN-1839-OUT;n:type:ShaderForge.SFN_Multiply,id:5492,x:34193,y:32909,varname:node_5492,prsc:2|A-1270-OUT,B-5197-OUT,C-7506-OUT;n:type:ShaderForge.SFN_Lerp,id:5197,x:33904,y:33328,varname:node_5197,prsc:2|A-7140-RGB,B-4673-RGB,T-8026-OUT;n:type:ShaderForge.SFN_Color,id:7140,x:33654,y:33144,ptovrint:False,ptlb:Color_01,ptin:_Color_01,varname:node_7140,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:4673,x:33654,y:33298,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_4673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8896551,c3:0,c4:1;n:type:ShaderForge.SFN_Distance,id:149,x:30645,y:33035,varname:node_149,prsc:2|A-9070-Y,B-6324-Y;n:type:ShaderForge.SFN_Relay,id:5489,x:31569,y:33017,varname:node_5489,prsc:2|IN-3866-OUT;n:type:ShaderForge.SFN_Relay,id:20,x:32334,y:32788,varname:node_20,prsc:2|IN-5489-OUT;n:type:ShaderForge.SFN_OneMinus,id:640,x:30993,y:33026,varname:node_640,prsc:2|IN-4939-OUT;n:type:ShaderForge.SFN_Clamp01,id:3866,x:31184,y:33057,varname:node_3866,prsc:2|IN-640-OUT;n:type:ShaderForge.SFN_Divide,id:4939,x:30827,y:33026,varname:node_4939,prsc:2|A-149-OUT,B-3279-OUT;n:type:ShaderForge.SFN_Vector1,id:3279,x:30674,y:33245,varname:node_3279,prsc:2,v1:7;n:type:ShaderForge.SFN_Multiply,id:4709,x:33832,y:33082,varname:node_4709,prsc:2|A-618-OUT,B-618-OUT;n:type:ShaderForge.SFN_Multiply,id:5653,x:32789,y:32313,varname:node_5653,prsc:2|A-20-OUT,B-7075-R;n:type:ShaderForge.SFN_Time,id:7492,x:34406,y:33262,varname:node_7492,prsc:2;n:type:ShaderForge.SFN_Set,id:2985,x:34805,y:33277,varname:_Time,prsc:2|IN-678-OUT;n:type:ShaderForge.SFN_Multiply,id:678,x:34608,y:33419,varname:node_678,prsc:2|A-7492-TSL,B-9128-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9128,x:34319,y:33541,ptovrint:False,ptlb:Vortex_Speed,ptin:_Vortex_Speed,varname:node_9128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Get,id:4966,x:31252,y:32416,varname:node_4966,prsc:2|IN-2985-OUT;n:type:ShaderForge.SFN_Add,id:1839,x:33772,y:32653,varname:node_1839,prsc:2|A-9510-OUT,B-618-OUT,C-718-OUT;n:type:ShaderForge.SFN_Vector1,id:9510,x:33635,y:32567,varname:node_9510,prsc:2,v1:0;n:type:ShaderForge.SFN_Relay,id:1962,x:32179,y:32063,varname:node_1962,prsc:2|IN-8480-OUT;n:type:ShaderForge.SFN_OneMinus,id:4425,x:32401,y:32029,varname:node_4425,prsc:2|IN-1962-OUT;n:type:ShaderForge.SFN_Multiply,id:9551,x:32745,y:32012,varname:node_9551,prsc:2|A-7790-OUT,B-4425-OUT;n:type:ShaderForge.SFN_Vector1,id:7790,x:32541,y:31977,varname:node_7790,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Relay,id:718,x:33369,y:32092,varname:node_718,prsc:2|IN-7171-OUT;n:type:ShaderForge.SFN_Clamp01,id:7171,x:33071,y:32025,varname:node_7171,prsc:2|IN-9551-OUT;n:type:ShaderForge.SFN_Add,id:1292,x:33399,y:33269,varname:node_1292,prsc:2|A-4709-OUT,B-8781-OUT;n:type:ShaderForge.SFN_Relay,id:6989,x:32869,y:33275,varname:node_6989,prsc:2|IN-8480-OUT;n:type:ShaderForge.SFN_Clamp01,id:5871,x:33008,y:33275,varname:node_5871,prsc:2|IN-6989-OUT;n:type:ShaderForge.SFN_OneMinus,id:8781,x:33217,y:33301,varname:node_8781,prsc:2|IN-5871-OUT;n:type:ShaderForge.SFN_Clamp01,id:8026,x:33449,y:33107,varname:node_8026,prsc:2|IN-1292-OUT;n:type:ShaderForge.SFN_Add,id:3065,x:34094,y:32562,varname:node_3065,prsc:2|A-1839-OUT,B-1968-OUT;n:type:ShaderForge.SFN_Clamp01,id:1270,x:34247,y:32665,varname:node_1270,prsc:2|IN-3065-OUT;n:type:ShaderForge.SFN_Tex2d,id:445,x:32704,y:32936,varname:node_445,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-9139-UVOUT,TEX-1239-TEX;n:type:ShaderForge.SFN_TexCoord,id:806,x:32129,y:32919,varname:node_806,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:8139,x:32334,y:32858,varname:node_8139,prsc:2,spu:0.4,spv:0|UVIN-806-UVOUT;n:type:ShaderForge.SFN_OneMinus,id:779,x:32935,y:32936,varname:node_779,prsc:2|IN-445-R;n:type:ShaderForge.SFN_OneMinus,id:905,x:32334,y:33006,varname:node_905,prsc:2|IN-806-UVOUT;n:type:ShaderForge.SFN_Panner,id:9139,x:32512,y:32974,varname:node_9139,prsc:2,spu:0.4,spv:0|UVIN-905-OUT;proporder:743-1239-7140-4673-9128;pass:END;sub:END;*/

Shader "Shader Forge/SH_CheckpointEffect" {
    Properties {
        _Distance_Divide ("Distance_Divide", Float ) = 0
        _MainTex ("MainTex", 2D) = "white" {}
        _Color_01 ("Color_01", Color) = (1,0,0,1)
        _Color_02 ("Color_02", Color) = (1,0.8896551,0,1)
        _Vortex_Speed ("Vortex_Speed", Float ) = 1
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float4 _MyPlayerPosition;
            uniform float _Distance_Divide;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color_01;
            uniform float4 _Color_02;
            uniform float _Vortex_Speed;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_7492 = _Time + _TimeEditor;
                float _Time = (node_7492.r*_Vortex_Speed);
                float node_4966 = _Time;
                float node_8480 = (distance(float2(_MyPlayerPosition.r,_MyPlayerPosition.g),float2(i.posWorld.r,i.posWorld.g))/_Distance_Divide);
                float2 node_4468 = float2((((atan2((i.posWorld.r-_MyPlayerPosition.r),(_MyPlayerPosition.g-i.posWorld.g))/6.28318530718)+0.5)+node_4966),((node_4966*10.0)+node_8480));
                float4 node_7075 = tex2D(_MainTex,TRANSFORM_TEX(node_4468, _MainTex));
                float4 node_269 = _Time + _TimeEditor;
                float2 node_8139 = (i.uv0+node_269.g*float2(0.4,0));
                float4 node_2253 = tex2D(_MainTex,TRANSFORM_TEX(node_8139, _MainTex));
                float2 node_9139 = ((1.0 - i.uv0)+node_269.g*float2(0.4,0));
                float4 node_445 = tex2D(_MainTex,TRANSFORM_TEX(node_9139, _MainTex));
                float node_7506 = (1.0 - abs((i.uv0.g*2.0+-1.0)));
                float node_618 = ((1.0 - ((1.0 - (saturate((1.0 - (distance(_MyPlayerPosition.g,i.posWorld.g)/7.0)))*node_7075.r))*(1.0 - node_2253.r)*(1.0 - node_445.r)))*node_7506);
                float node_1839 = (0.0+node_618+saturate((0.5*(1.0 - node_8480))));
                float3 emissive = (saturate((node_1839+round(node_1839)))*lerp(_Color_01.rgb,_Color_02.rgb,saturate(((node_618*node_618)+(1.0 - saturate(node_8480)))))*node_7506);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
