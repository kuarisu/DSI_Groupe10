// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33334,y:32661,varname:node_4795,prsc:2|emission-2935-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31033,y:32832,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9f71eb140ab501347a9997a11c9ab52c,ntxv:0,isnm:False|UVIN-5134-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:33428,y:32367,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Set,id:9944,x:33935,y:32377,varname:_Vcols,prsc:2|IN-8902-OUT;n:type:ShaderForge.SFN_Add,id:8762,x:31854,y:32437,varname:node_8762,prsc:2|A-6946-OUT,B-6074-R,C-4037-OUT;n:type:ShaderForge.SFN_Get,id:6593,x:31343,y:32316,varname:node_6593,prsc:2|IN-9944-OUT;n:type:ShaderForge.SFN_Get,id:6851,x:31343,y:32513,varname:node_6851,prsc:2|IN-9944-OUT;n:type:ShaderForge.SFN_Add,id:8287,x:31806,y:32706,varname:node_8287,prsc:2|A-4040-OUT,B-6074-R;n:type:ShaderForge.SFN_Power,id:4040,x:31576,y:32577,varname:node_4040,prsc:2|VAL-6851-OUT,EXP-7595-OUT;n:type:ShaderForge.SFN_Vector1,id:7595,x:31305,y:32613,varname:node_7595,prsc:2,v1:1;n:type:ShaderForge.SFN_OneMinus,id:5752,x:32211,y:32503,varname:node_5752,prsc:2|IN-8762-OUT;n:type:ShaderForge.SFN_Power,id:6946,x:31606,y:32316,varname:node_6946,prsc:2|VAL-6593-OUT,EXP-4198-OUT;n:type:ShaderForge.SFN_Vector1,id:4198,x:31294,y:32388,varname:node_4198,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6181,x:32494,y:32721,varname:node_6181,prsc:2|A-5752-OUT,B-237-OUT,C-6074-B,D-1700-OUT;n:type:ShaderForge.SFN_Floor,id:7472,x:32797,y:32742,varname:node_7472,prsc:2|IN-6181-OUT;n:type:ShaderForge.SFN_Color,id:1368,x:32401,y:31544,ptovrint:False,ptlb:Color_01,ptin:_Color_01,varname:node_1368,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:9698,x:32401,y:31718,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_9698,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1586208,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:6528,x:32697,y:31638,varname:node_6528,prsc:2|A-1368-RGB,B-9698-RGB,T-8009-OUT;n:type:ShaderForge.SFN_Multiply,id:2935,x:33026,y:32578,varname:node_2935,prsc:2|A-6528-OUT,B-7472-OUT;n:type:ShaderForge.SFN_Clamp01,id:9414,x:32470,y:32348,varname:node_9414,prsc:2|IN-5752-OUT;n:type:ShaderForge.SFN_Relay,id:2816,x:32076,y:32232,varname:node_2816,prsc:2|IN-6074-R;n:type:ShaderForge.SFN_OneMinus,id:5387,x:32300,y:32232,varname:node_5387,prsc:2|IN-2816-OUT;n:type:ShaderForge.SFN_Lerp,id:3845,x:32755,y:32252,varname:node_3845,prsc:2|A-9414-OUT,B-5387-OUT,T-3144-OUT;n:type:ShaderForge.SFN_Vector1,id:3144,x:32699,y:32425,varname:node_3144,prsc:2,v1:0.5;n:type:ShaderForge.SFN_TexCoord,id:8211,x:30333,y:32827,varname:node_8211,prsc:2,uv:0;n:type:ShaderForge.SFN_OneMinus,id:3605,x:30572,y:32697,varname:node_3605,prsc:2|IN-8211-U;n:type:ShaderForge.SFN_Append,id:5134,x:30806,y:32849,varname:node_5134,prsc:2|A-3605-OUT,B-8211-V;n:type:ShaderForge.SFN_RemapRange,id:237,x:32026,y:32706,varname:node_237,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8287-OUT;n:type:ShaderForge.SFN_Vector1,id:4037,x:31680,y:32509,varname:node_4037,prsc:2,v1:-0.8;n:type:ShaderForge.SFN_Add,id:6757,x:32014,y:33272,varname:node_6757,prsc:2|A-9570-OUT,B-9908-OUT,C-4782-OUT;n:type:ShaderForge.SFN_Get,id:8306,x:31503,y:33151,varname:node_8306,prsc:2|IN-9944-OUT;n:type:ShaderForge.SFN_Power,id:9570,x:31729,y:33210,varname:node_9570,prsc:2|VAL-8306-OUT,EXP-7374-OUT;n:type:ShaderForge.SFN_Vector1,id:7374,x:31454,y:33223,varname:node_7374,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:4782,x:31729,y:33369,varname:node_4782,prsc:2,v1:-0.8;n:type:ShaderForge.SFN_OneMinus,id:9908,x:31670,y:33007,varname:node_9908,prsc:2|IN-6074-G;n:type:ShaderForge.SFN_Clamp01,id:1700,x:32397,y:32979,varname:node_1700,prsc:2|IN-5813-OUT;n:type:ShaderForge.SFN_OneMinus,id:5813,x:32245,y:33272,varname:node_5813,prsc:2|IN-6757-OUT;n:type:ShaderForge.SFN_Multiply,id:8902,x:33688,y:32290,varname:node_8902,prsc:2|A-3693-OUT,B-2053-RGB;n:type:ShaderForge.SFN_Vector1,id:3693,x:33292,y:32113,varname:node_3693,prsc:2,v1:0.85;n:type:ShaderForge.SFN_Clamp01,id:8009,x:32697,y:31765,varname:node_8009,prsc:2|IN-8710-OUT;n:type:ShaderForge.SFN_Multiply,id:8710,x:32755,y:32128,varname:node_8710,prsc:2|A-3845-OUT,B-830-OUT;n:type:ShaderForge.SFN_OneMinus,id:7397,x:31293,y:32074,varname:node_7397,prsc:2|IN-6074-G;n:type:ShaderForge.SFN_Power,id:830,x:31544,y:32074,varname:node_830,prsc:2|VAL-7397-OUT,EXP-6462-OUT;n:type:ShaderForge.SFN_Vector1,id:6462,x:31378,y:32205,varname:node_6462,prsc:2,v1:0.2;proporder:6074-1368-9698;pass:END;sub:END;*/

Shader "Shader Forge/SH_LightningSpark" {
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
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
                float3 _Vcols = (0.85*i.vertexColor.rgb);
                float2 node_5134 = float2((1.0 - i.uv0.r),i.uv0.g);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_5134, _MainTex));
                float3 node_5752 = (1.0 - (pow(_Vcols,2.0)+_MainTex_var.r+(-0.8)));
                float node_5387 = (1.0 - _MainTex_var.r);
                float3 emissive = (lerp(_Color_01.rgb,_Color_02.rgb,saturate((lerp(saturate(node_5752),float3(node_5387,node_5387,node_5387),0.5)*pow((1.0 - _MainTex_var.g),0.2))))*floor((node_5752*((pow(_Vcols,1.0)+_MainTex_var.r)*2.0+-1.0)*_MainTex_var.b*saturate((1.0 - (pow(_Vcols,2.0)+(1.0 - _MainTex_var.g)+(-0.8)))))));
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
