// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33919,y:32350,varname:node_4795,prsc:2|emission-1486-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:33105,y:32236,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:548,x:30744,y:32830,varname:node_548,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:4788,x:30951,y:32830,varname:node_4788,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-548-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:2268,x:31139,y:32830,varname:node_2268,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4788-OUT;n:type:ShaderForge.SFN_Length,id:5730,x:31330,y:32830,varname:node_5730,prsc:2|IN-2268-R;n:type:ShaderForge.SFN_Length,id:6484,x:31330,y:32953,varname:node_6484,prsc:2|IN-2268-G;n:type:ShaderForge.SFN_Multiply,id:8166,x:31845,y:32795,varname:node_8166,prsc:2|A-1301-OUT,B-1709-OUT;n:type:ShaderForge.SFN_Floor,id:8754,x:31635,y:32035,varname:node_8754,prsc:2|IN-9594-OUT;n:type:ShaderForge.SFN_Length,id:3049,x:31346,y:32498,varname:node_3049,prsc:2|IN-2268-OUT;n:type:ShaderForge.SFN_OneMinus,id:925,x:31812,y:32035,varname:node_925,prsc:2|IN-8754-OUT;n:type:ShaderForge.SFN_Clamp01,id:4182,x:32040,y:32047,varname:node_4182,prsc:2|IN-925-OUT;n:type:ShaderForge.SFN_Multiply,id:1486,x:33368,y:32499,varname:node_1486,prsc:2|A-4182-OUT,B-2997-OUT,C-2053-RGB;n:type:ShaderForge.SFN_Floor,id:7753,x:32714,y:32642,varname:node_7753,prsc:2|IN-172-OUT;n:type:ShaderForge.SFN_Multiply,id:1301,x:31531,y:32830,varname:node_1301,prsc:2|A-5730-OUT,B-2473-OUT;n:type:ShaderForge.SFN_Vector1,id:2473,x:31349,y:33133,varname:node_2473,prsc:2,v1:4;n:type:ShaderForge.SFN_Multiply,id:1709,x:31546,y:32985,varname:node_1709,prsc:2|A-6484-OUT,B-2473-OUT;n:type:ShaderForge.SFN_Multiply,id:172,x:32558,y:32812,varname:node_172,prsc:2|A-9470-OUT,B-5862-OUT,C-4628-OUT;n:type:ShaderForge.SFN_Clamp01,id:5862,x:31812,y:33049,varname:node_5862,prsc:2|IN-1709-OUT;n:type:ShaderForge.SFN_Clamp01,id:9470,x:31812,y:32931,varname:node_9470,prsc:2|IN-1301-OUT;n:type:ShaderForge.SFN_Lerp,id:4628,x:32316,y:32700,varname:node_4628,prsc:2|A-8166-OUT,B-2330-OUT,T-1695-OUT;n:type:ShaderForge.SFN_Vector1,id:2330,x:31900,y:32533,varname:node_2330,prsc:2,v1:1;n:type:ShaderForge.SFN_Clamp01,id:7457,x:32918,y:32598,varname:node_7457,prsc:2|IN-7753-OUT;n:type:ShaderForge.SFN_OneMinus,id:7543,x:33130,y:32598,varname:node_7543,prsc:2|IN-7457-OUT;n:type:ShaderForge.SFN_Multiply,id:9594,x:31395,y:32151,varname:node_9594,prsc:2|A-3049-OUT,B-5906-OUT;n:type:ShaderForge.SFN_Vector1,id:3394,x:31531,y:32341,varname:node_3394,prsc:2,v1:4;n:type:ShaderForge.SFN_Clamp01,id:1695,x:31888,y:32251,varname:node_1695,prsc:2|IN-6892-OUT;n:type:ShaderForge.SFN_Power,id:6892,x:31730,y:32409,varname:node_6892,prsc:2|VAL-3049-OUT,EXP-3394-OUT;n:type:ShaderForge.SFN_Vector1,id:5906,x:31122,y:32239,varname:node_5906,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Add,id:1209,x:33345,y:32759,varname:node_1209,prsc:2|A-7543-OUT,B-667-OUT;n:type:ShaderForge.SFN_OneMinus,id:3070,x:32839,y:33003,varname:node_3070,prsc:2|IN-426-OUT;n:type:ShaderForge.SFN_Multiply,id:5742,x:32276,y:33267,varname:node_5742,prsc:2|A-5730-OUT,B-6484-OUT;n:type:ShaderForge.SFN_Power,id:2216,x:33109,y:33138,varname:node_2216,prsc:2|VAL-3070-OUT,EXP-1041-OUT;n:type:ShaderForge.SFN_Vector1,id:1041,x:32784,y:33282,varname:node_1041,prsc:2,v1:5;n:type:ShaderForge.SFN_Subtract,id:667,x:33363,y:33138,varname:node_667,prsc:2|A-2216-OUT,B-1059-OUT;n:type:ShaderForge.SFN_Vector1,id:1059,x:33181,y:33333,varname:node_1059,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Clamp01,id:2997,x:33546,y:32712,varname:node_2997,prsc:2|IN-1209-OUT;n:type:ShaderForge.SFN_OneMinus,id:3663,x:32289,y:33114,varname:node_3663,prsc:2|IN-5862-OUT;n:type:ShaderForge.SFN_Subtract,id:9146,x:32501,y:33114,varname:node_9146,prsc:2|A-5742-OUT,B-3663-OUT;n:type:ShaderForge.SFN_OneMinus,id:4197,x:32289,y:32947,varname:node_4197,prsc:2|IN-9470-OUT;n:type:ShaderForge.SFN_Subtract,id:426,x:32636,y:33003,varname:node_426,prsc:2|A-9146-OUT,B-4197-OUT;pass:END;sub:END;*/

Shader "Shader Forge/SH_PlusSymbol" {
    Properties {
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
                float2 node_2268 = (i.uv0*2.0+-1.0).rg;
                float node_3049 = length(node_2268);
                float node_5730 = length(node_2268.r);
                float node_2473 = 4.0;
                float node_1301 = (node_5730*node_2473);
                float node_9470 = saturate(node_1301);
                float node_6484 = length(node_2268.g);
                float node_1709 = (node_6484*node_2473);
                float node_5862 = saturate(node_1709);
                float node_5742 = (node_5730*node_6484);
                float3 emissive = (saturate((1.0 - floor((node_3049*1.2))))*saturate(((1.0 - saturate(floor((node_9470*node_5862*lerp((node_1301*node_1709),1.0,saturate(pow(node_3049,4.0)))))))+(pow((1.0 - ((node_5742-(1.0 - node_5862))-(1.0 - node_9470))),5.0)-0.5)))*i.vertexColor.rgb);
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
