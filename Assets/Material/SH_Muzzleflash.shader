// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33334,y:32661,varname:node_4795,prsc:2|emission-2935-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31356,y:32760,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0969ee6301dd3b845ad117dbab47938a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:2053,x:33235,y:32367,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Set,id:9944,x:33529,y:32388,varname:_Vcols,prsc:2|IN-2053-RGB;n:type:ShaderForge.SFN_Add,id:8762,x:31809,y:32429,varname:node_8762,prsc:2|A-6946-OUT,B-6074-R;n:type:ShaderForge.SFN_Get,id:6593,x:31343,y:32316,varname:node_6593,prsc:2|IN-9944-OUT;n:type:ShaderForge.SFN_Multiply,id:1091,x:32097,y:32803,varname:node_1091,prsc:2|A-8287-OUT,B-6074-G,C-8287-OUT;n:type:ShaderForge.SFN_Get,id:6851,x:31343,y:32513,varname:node_6851,prsc:2|IN-9944-OUT;n:type:ShaderForge.SFN_Add,id:8287,x:31809,y:32656,varname:node_8287,prsc:2|A-4040-OUT,B-6074-R;n:type:ShaderForge.SFN_Power,id:4040,x:31592,y:32566,varname:node_4040,prsc:2|VAL-6851-OUT,EXP-7595-OUT;n:type:ShaderForge.SFN_Vector1,id:7595,x:31305,y:32613,varname:node_7595,prsc:2,v1:1;n:type:ShaderForge.SFN_OneMinus,id:5752,x:32322,y:32502,varname:node_5752,prsc:2|IN-8762-OUT;n:type:ShaderForge.SFN_Power,id:6946,x:31606,y:32316,varname:node_6946,prsc:2|VAL-6593-OUT,EXP-4198-OUT;n:type:ShaderForge.SFN_Vector1,id:4198,x:31391,y:32398,varname:node_4198,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6181,x:32614,y:32665,varname:node_6181,prsc:2|A-5752-OUT,B-1091-OUT,C-950-OUT;n:type:ShaderForge.SFN_Floor,id:7472,x:32946,y:32754,varname:node_7472,prsc:2|IN-6181-OUT;n:type:ShaderForge.SFN_Vector1,id:950,x:32452,y:32973,varname:node_950,prsc:2,v1:5;n:type:ShaderForge.SFN_Color,id:1368,x:32432,y:31813,ptovrint:False,ptlb:Color_01,ptin:_Color_01,varname:node_1368,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:9698,x:32432,y:31987,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_9698,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1586208,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:6528,x:32728,y:31907,varname:node_6528,prsc:2|A-1368-RGB,B-9698-RGB,T-3845-OUT;n:type:ShaderForge.SFN_Multiply,id:2935,x:33026,y:32578,varname:node_2935,prsc:2|A-6528-OUT,B-7472-OUT;n:type:ShaderForge.SFN_Clamp01,id:9414,x:32549,y:32309,varname:node_9414,prsc:2|IN-5752-OUT;n:type:ShaderForge.SFN_Relay,id:2816,x:32076,y:32232,varname:node_2816,prsc:2|IN-6074-R;n:type:ShaderForge.SFN_OneMinus,id:5387,x:32343,y:32302,varname:node_5387,prsc:2|IN-2816-OUT;n:type:ShaderForge.SFN_Lerp,id:3845,x:32755,y:32252,varname:node_3845,prsc:2|A-9414-OUT,B-5387-OUT,T-3144-OUT;n:type:ShaderForge.SFN_Vector1,id:3144,x:32699,y:32425,varname:node_3144,prsc:2,v1:0.5;proporder:6074-1368-9698;pass:END;sub:END;*/

Shader "Shader Forge/SH_Muzzleflash" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color_01 ("Color_01", Color) = (1,0,0,1)
        _Color_02 ("Color_02", Color) = (0.1586208,0,1,1)
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
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color_01;
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
////// Lighting:
////// Emissive:
                float3 _Vcols = i.vertexColor.rgb;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_5752 = (1.0 - (pow(_Vcols,2.0)+_MainTex_var.r));
                float node_5387 = (1.0 - _MainTex_var.r);
                float3 node_8287 = (pow(_Vcols,1.0)+_MainTex_var.r);
                float3 emissive = (lerp(_Color_01.rgb,_Color_02.rgb,lerp(saturate(node_5752),float3(node_5387,node_5387,node_5387),0.5))*floor((node_5752*(node_8287*_MainTex_var.g*node_8287)*5.0)));
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
