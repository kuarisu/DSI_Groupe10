// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33344,y:32642,varname:node_4795,prsc:2|emission-5313-OUT,clip-1731-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31340,y:32566,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7d608543e5fa7ac4182f4fed98c6e463,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:2053,x:33440,y:32252,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:32061,y:32202,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.8482759,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:7952,x:32061,y:32038,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_7952,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:3379,x:32389,y:32261,varname:node_3379,prsc:2|A-7952-RGB,B-797-RGB,T-3545-OUT;n:type:ShaderForge.SFN_OneMinus,id:6362,x:31817,y:32681,varname:node_6362,prsc:2|IN-6074-R;n:type:ShaderForge.SFN_Vector1,id:4778,x:31323,y:32411,varname:node_4778,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Add,id:3661,x:31506,y:32251,varname:node_3661,prsc:2|A-1627-OUT,B-4778-OUT;n:type:ShaderForge.SFN_Clamp01,id:8107,x:31985,y:32417,varname:node_8107,prsc:2|IN-3661-OUT;n:type:ShaderForge.SFN_Multiply,id:7626,x:32798,y:32462,varname:node_7626,prsc:2|A-3379-OUT,B-8107-OUT,C-6622-OUT;n:type:ShaderForge.SFN_Power,id:1627,x:31323,y:32251,varname:node_1627,prsc:2|VAL-6074-G,EXP-8736-OUT;n:type:ShaderForge.SFN_Vector1,id:8736,x:31090,y:32328,varname:node_8736,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Subtract,id:8850,x:31862,y:33049,varname:node_8850,prsc:2|A-6362-OUT,B-1595-OUT;n:type:ShaderForge.SFN_OneMinus,id:7238,x:32107,y:33049,varname:node_7238,prsc:2|IN-8850-OUT;n:type:ShaderForge.SFN_Vector1,id:3486,x:31403,y:33338,varname:node_3486,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Ceil,id:9669,x:32120,y:33247,varname:node_9669,prsc:2|IN-9355-OUT;n:type:ShaderForge.SFN_Subtract,id:9355,x:31862,y:33215,varname:node_9355,prsc:2|A-6362-OUT,B-8278-OUT;n:type:ShaderForge.SFN_Multiply,id:8278,x:31603,y:33184,varname:node_8278,prsc:2|A-1595-OUT,B-3486-OUT;n:type:ShaderForge.SFN_Multiply,id:6622,x:32512,y:33089,varname:node_6622,prsc:2|A-7275-OUT,B-9669-OUT;n:type:ShaderForge.SFN_Multiply,id:1595,x:31388,y:33052,varname:node_1595,prsc:2|A-510-OUT,B-1889-OUT;n:type:ShaderForge.SFN_Vector1,id:1889,x:31185,y:33156,varname:node_1889,prsc:2,v1:2;n:type:ShaderForge.SFN_TexCoord,id:6874,x:30108,y:31496,varname:node_6874,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:4943,x:30339,y:31496,varname:node_4943,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:2|IN-6874-UVOUT;n:type:ShaderForge.SFN_Length,id:3109,x:30553,y:31496,varname:node_3109,prsc:2|IN-4943-OUT;n:type:ShaderForge.SFN_OneMinus,id:577,x:31078,y:31495,varname:node_577,prsc:2|IN-7919-OUT;n:type:ShaderForge.SFN_Floor,id:8422,x:31541,y:31495,varname:node_8422,prsc:2|IN-5809-OUT;n:type:ShaderForge.SFN_Add,id:5809,x:31305,y:31495,varname:node_5809,prsc:2|A-577-OUT,B-6737-OUT;n:type:ShaderForge.SFN_Get,id:510,x:30913,y:33040,varname:node_510,prsc:2|IN-2517-OUT;n:type:ShaderForge.SFN_Set,id:2517,x:33681,y:32288,varname:__VertexColor,prsc:2|IN-2053-G;n:type:ShaderForge.SFN_Get,id:6737,x:30727,y:31698,varname:node_6737,prsc:2|IN-2517-OUT;n:type:ShaderForge.SFN_Floor,id:2914,x:31689,y:31739,varname:node_2914,prsc:2|IN-7012-OUT;n:type:ShaderForge.SFN_OneMinus,id:9227,x:31899,y:31739,varname:node_9227,prsc:2|IN-2914-OUT;n:type:ShaderForge.SFN_Multiply,id:4918,x:32081,y:31596,varname:node_4918,prsc:2|A-8422-OUT,B-9227-OUT,C-4745-OUT;n:type:ShaderForge.SFN_Multiply,id:2192,x:31170,y:31738,varname:node_2192,prsc:2|A-6737-OUT,B-2871-OUT;n:type:ShaderForge.SFN_Add,id:7012,x:31342,y:31738,varname:node_7012,prsc:2|A-2192-OUT,B-577-OUT;n:type:ShaderForge.SFN_Power,id:2871,x:30971,y:31761,varname:node_2871,prsc:2|VAL-6737-OUT,EXP-4836-OUT;n:type:ShaderForge.SFN_Vector1,id:4836,x:30766,y:31774,varname:node_4836,prsc:2,v1:0.5;n:type:ShaderForge.SFN_ArcTan2,id:658,x:31024,y:31188,varname:node_658,prsc:2,attp:0|A-9156-R,B-9156-G;n:type:ShaderForge.SFN_ComponentMask,id:9156,x:30767,y:31245,varname:node_9156,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4943-OUT;n:type:ShaderForge.SFN_Sin,id:1881,x:31441,y:31190,varname:node_1881,prsc:2|IN-8136-OUT;n:type:ShaderForge.SFN_Multiply,id:8136,x:31226,y:31190,varname:node_8136,prsc:2|A-658-OUT,B-6562-OUT;n:type:ShaderForge.SFN_Vector1,id:6562,x:31138,y:31339,varname:node_6562,prsc:2,v1:10;n:type:ShaderForge.SFN_RemapRange,id:2965,x:31638,y:31190,varname:node_2965,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-1881-OUT;n:type:ShaderForge.SFN_Ceil,id:9657,x:32272,y:31219,varname:node_9657,prsc:2|IN-5677-OUT;n:type:ShaderForge.SFN_Get,id:7065,x:31583,y:31388,varname:node_7065,prsc:2|IN-2517-OUT;n:type:ShaderForge.SFN_OneMinus,id:8907,x:31803,y:31367,varname:node_8907,prsc:2|IN-7065-OUT;n:type:ShaderForge.SFN_Subtract,id:5677,x:32000,y:31076,varname:node_5677,prsc:2|A-2965-OUT,B-8907-OUT;n:type:ShaderForge.SFN_Clamp01,id:5381,x:32466,y:31344,varname:node_5381,prsc:2|IN-9657-OUT;n:type:ShaderForge.SFN_Multiply,id:7919,x:30826,y:31426,varname:node_7919,prsc:2|A-3109-OUT,B-9772-OUT;n:type:ShaderForge.SFN_Power,id:9772,x:30727,y:31547,varname:node_9772,prsc:2|VAL-3109-OUT,EXP-2751-OUT;n:type:ShaderForge.SFN_Vector1,id:2751,x:30553,y:31659,varname:node_2751,prsc:2,v1:2;n:type:ShaderForge.SFN_OneMinus,id:4745,x:32338,y:31462,varname:node_4745,prsc:2|IN-5381-OUT;n:type:ShaderForge.SFN_Lerp,id:3642,x:32438,y:31843,varname:node_3642,prsc:2|A-797-RGB,B-7952-RGB,T-3109-OUT;n:type:ShaderForge.SFN_Multiply,id:3493,x:32648,y:31741,varname:node_3493,prsc:2|A-1068-OUT,B-3642-OUT;n:type:ShaderForge.SFN_Clamp01,id:1068,x:32326,y:31637,varname:node_1068,prsc:2|IN-4918-OUT;n:type:ShaderForge.SFN_Lerp,id:5313,x:32909,y:32080,varname:node_5313,prsc:2|A-7626-OUT,B-3493-OUT,T-1068-OUT;n:type:ShaderForge.SFN_Add,id:1731,x:33006,y:32895,varname:node_1731,prsc:2|A-1068-OUT,B-6074-B;n:type:ShaderForge.SFN_Add,id:6160,x:32250,y:32495,varname:node_6160,prsc:2|A-6074-G,B-9355-OUT,C-3115-OUT;n:type:ShaderForge.SFN_Clamp01,id:3545,x:32250,y:32378,varname:node_3545,prsc:2|IN-6160-OUT;n:type:ShaderForge.SFN_Vector1,id:3399,x:32117,y:32663,varname:node_3399,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:3115,x:31817,y:32508,varname:node_3115,prsc:2|VAL-676-OUT,EXP-7679-OUT;n:type:ShaderForge.SFN_Vector1,id:7679,x:31601,y:32593,varname:node_7679,prsc:2,v1:5;n:type:ShaderForge.SFN_OneMinus,id:676,x:31634,y:32448,varname:node_676,prsc:2|IN-6074-R;n:type:ShaderForge.SFN_Floor,id:7275,x:32291,y:32978,varname:node_7275,prsc:2|IN-7238-OUT;proporder:6074-797-7952;pass:END;sub:END;*/

Shader "Shader Forge/SH_Explosion" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _TintColor ("Color", Color) = (1,0.8482759,0,1)
        _Color_02 ("Color_02", Color) = (1,0,0,1)
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
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _TintColor;
            uniform float4 _Color_02;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_4943 = (i.uv0*4.0+-2.0);
                float node_3109 = length(node_4943);
                float node_577 = (1.0 - (node_3109*pow(node_3109,2.0)));
                float __VertexColor = i.vertexColor.g;
                float node_6737 = __VertexColor;
                float2 node_9156 = node_4943.rg;
                float node_1068 = saturate((floor((node_577+node_6737))*(1.0 - floor(((node_6737*pow(node_6737,0.5))+node_577)))*(1.0 - saturate(ceil(((sin((atan2(node_9156.r,node_9156.g)*10.0))*0.5+0.5)-(1.0 - __VertexColor)))))));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip((node_1068+_MainTex_var.b) - 0.5);
////// Lighting:
////// Emissive:
                float node_6362 = (1.0 - _MainTex_var.r);
                float node_1595 = (__VertexColor*2.0);
                float node_9355 = (node_6362-(node_1595*0.5));
                float3 emissive = lerp((lerp(_Color_02.rgb,_TintColor.rgb,saturate((_MainTex_var.g+node_9355+pow((1.0 - _MainTex_var.r),5.0))))*saturate((pow(_MainTex_var.g,0.3)+0.3))*(floor((1.0 - (node_6362-node_1595)))*ceil(node_9355))),(node_1068*lerp(_TintColor.rgb,_Color_02.rgb,node_3109)),node_1068);
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
