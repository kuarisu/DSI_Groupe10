// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33127,y:32709,varname:node_4795,prsc:2|emission-4247-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32635,y:32557,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:32866,y:31431,ptovrint:True,ptlb:Color_01,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_TexCoord,id:2142,x:30199,y:31918,varname:node_2142,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:7478,x:30360,y:31918,varname:node_7478,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2142-UVOUT;n:type:ShaderForge.SFN_ArcTan2,id:6779,x:30725,y:32981,varname:node_6779,prsc:2,attp:0|A-2224-G,B-2224-R;n:type:ShaderForge.SFN_ComponentMask,id:2224,x:30534,y:31918,varname:node_2224,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7478-OUT;n:type:ShaderForge.SFN_Length,id:6893,x:30708,y:31555,varname:node_6893,prsc:2|IN-2224-OUT;n:type:ShaderForge.SFN_Sin,id:6023,x:31131,y:32981,varname:node_6023,prsc:2|IN-7154-OUT;n:type:ShaderForge.SFN_Multiply,id:7154,x:30926,y:32981,varname:node_7154,prsc:2|A-6779-OUT,B-2805-OUT;n:type:ShaderForge.SFN_Vector1,id:2805,x:30926,y:33137,varname:node_2805,prsc:2,v1:5;n:type:ShaderForge.SFN_RemapRange,id:9821,x:31313,y:32981,varname:node_9821,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6023-OUT;n:type:ShaderForge.SFN_Subtract,id:5239,x:31614,y:32898,varname:node_5239,prsc:2|A-9821-OUT,B-2409-OUT;n:type:ShaderForge.SFN_Set,id:2473,x:32868,y:32578,varname:_Vcols,prsc:2|IN-2053-R;n:type:ShaderForge.SFN_Get,id:2409,x:31245,y:33213,varname:node_2409,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Ceil,id:1468,x:31804,y:32978,varname:node_1468,prsc:2|IN-5239-OUT;n:type:ShaderForge.SFN_Clamp01,id:7428,x:31985,y:32906,varname:node_7428,prsc:2|IN-1468-OUT;n:type:ShaderForge.SFN_Power,id:6082,x:30897,y:31466,varname:node_6082,prsc:2|VAL-6893-OUT,EXP-8215-OUT;n:type:ShaderForge.SFN_Multiply,id:2178,x:31098,y:31447,varname:node_2178,prsc:2|A-6893-OUT,B-6082-OUT;n:type:ShaderForge.SFN_Vector1,id:8215,x:30711,y:31469,varname:node_8215,prsc:2,v1:2;n:type:ShaderForge.SFN_OneMinus,id:5169,x:31276,y:31447,varname:node_5169,prsc:2|IN-2178-OUT;n:type:ShaderForge.SFN_Add,id:5864,x:31464,y:31447,varname:node_5864,prsc:2|A-5169-OUT,B-5144-OUT;n:type:ShaderForge.SFN_Get,id:5144,x:30774,y:31907,varname:node_5144,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Power,id:5120,x:30982,y:32034,varname:node_5120,prsc:2|VAL-5144-OUT,EXP-4654-OUT;n:type:ShaderForge.SFN_Multiply,id:56,x:31195,y:31975,varname:node_56,prsc:2|A-5144-OUT,B-5120-OUT;n:type:ShaderForge.SFN_Vector1,id:4654,x:30795,y:32037,varname:node_4654,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9103,x:31474,y:31966,varname:node_9103,prsc:2|A-56-OUT,B-5169-OUT;n:type:ShaderForge.SFN_Floor,id:8444,x:31654,y:31417,varname:node_8444,prsc:2|IN-5864-OUT;n:type:ShaderForge.SFN_Floor,id:5448,x:31661,y:31945,varname:node_5448,prsc:2|IN-9103-OUT;n:type:ShaderForge.SFN_OneMinus,id:7362,x:31832,y:31966,varname:node_7362,prsc:2|IN-5448-OUT;n:type:ShaderForge.SFN_Multiply,id:862,x:32232,y:31609,varname:node_862,prsc:2|A-746-OUT,B-9141-OUT,C-7428-OUT;n:type:ShaderForge.SFN_Add,id:7894,x:32582,y:31882,varname:node_7894,prsc:2|A-862-OUT,B-1601-OUT,C-7298-OUT;n:type:ShaderForge.SFN_Multiply,id:1601,x:32334,y:31919,varname:node_1601,prsc:2|A-6702-OUT,B-5051-OUT,C-5560-OUT;n:type:ShaderForge.SFN_Clamp01,id:746,x:31836,y:31447,varname:node_746,prsc:2|IN-8444-OUT;n:type:ShaderForge.SFN_Clamp01,id:9141,x:32023,y:31966,varname:node_9141,prsc:2|IN-7362-OUT;n:type:ShaderForge.SFN_Get,id:7073,x:30774,y:32166,varname:node_7073,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Power,id:6142,x:30982,y:32257,varname:node_6142,prsc:2|VAL-7073-OUT,EXP-6645-OUT;n:type:ShaderForge.SFN_Multiply,id:4345,x:31195,y:32154,varname:node_4345,prsc:2|A-7073-OUT,B-6142-OUT;n:type:ShaderForge.SFN_Vector1,id:6645,x:30795,y:32260,varname:node_6645,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:4098,x:31474,y:32145,varname:node_4098,prsc:2|A-4345-OUT,B-5169-OUT;n:type:ShaderForge.SFN_Floor,id:2309,x:31661,y:32124,varname:node_2309,prsc:2|IN-4098-OUT;n:type:ShaderForge.SFN_OneMinus,id:1641,x:31832,y:32145,varname:node_1641,prsc:2|IN-2309-OUT;n:type:ShaderForge.SFN_Clamp01,id:5560,x:32023,y:32145,varname:node_5560,prsc:2|IN-1641-OUT;n:type:ShaderForge.SFN_Ceil,id:1638,x:31832,y:33204,varname:node_1638,prsc:2|IN-4531-OUT;n:type:ShaderForge.SFN_Clamp01,id:5051,x:32048,y:33193,varname:node_5051,prsc:2|IN-1638-OUT;n:type:ShaderForge.SFN_Subtract,id:4531,x:31639,y:33204,varname:node_4531,prsc:2|A-9821-OUT,B-5432-OUT;n:type:ShaderForge.SFN_Multiply,id:5865,x:31441,y:33246,varname:node_5865,prsc:2|A-2409-OUT,B-2315-OUT;n:type:ShaderForge.SFN_Vector1,id:2315,x:31284,y:33454,varname:node_2315,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Power,id:5432,x:31607,y:33395,varname:node_5432,prsc:2|VAL-2409-OUT,EXP-2315-OUT;n:type:ShaderForge.SFN_Get,id:9803,x:30774,y:32404,varname:node_9803,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Power,id:9942,x:30982,y:32495,varname:node_9942,prsc:2|VAL-9803-OUT,EXP-9945-OUT;n:type:ShaderForge.SFN_Multiply,id:7401,x:31195,y:32392,varname:node_7401,prsc:2|A-9803-OUT,B-9942-OUT;n:type:ShaderForge.SFN_Vector1,id:9945,x:30795,y:32498,varname:node_9945,prsc:2,v1:7;n:type:ShaderForge.SFN_Add,id:6083,x:31474,y:32383,varname:node_6083,prsc:2|A-7401-OUT,B-5169-OUT;n:type:ShaderForge.SFN_Floor,id:4156,x:31661,y:32362,varname:node_4156,prsc:2|IN-6083-OUT;n:type:ShaderForge.SFN_Clamp01,id:7024,x:32023,y:32383,varname:node_7024,prsc:2|IN-4156-OUT;n:type:ShaderForge.SFN_Get,id:9386,x:30774,y:32628,varname:node_9386,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Power,id:9576,x:30982,y:32719,varname:node_9576,prsc:2|VAL-9386-OUT,EXP-7786-OUT;n:type:ShaderForge.SFN_Multiply,id:6152,x:31195,y:32616,varname:node_6152,prsc:2|A-9386-OUT,B-9576-OUT;n:type:ShaderForge.SFN_Vector1,id:7786,x:30795,y:32722,varname:node_7786,prsc:2,v1:8;n:type:ShaderForge.SFN_Add,id:4720,x:31474,y:32607,varname:node_4720,prsc:2|A-6152-OUT,B-5169-OUT;n:type:ShaderForge.SFN_Floor,id:7995,x:31661,y:32586,varname:node_7995,prsc:2|IN-4720-OUT;n:type:ShaderForge.SFN_OneMinus,id:4483,x:31832,y:32607,varname:node_4483,prsc:2|IN-7995-OUT;n:type:ShaderForge.SFN_Clamp01,id:4582,x:32041,y:32607,varname:node_4582,prsc:2|IN-4483-OUT;n:type:ShaderForge.SFN_Multiply,id:7298,x:32258,y:32398,varname:node_7298,prsc:2|A-7024-OUT,B-4582-OUT;n:type:ShaderForge.SFN_Color,id:4798,x:32866,y:31601,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_4798,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Lerp,id:2360,x:33193,y:31557,varname:node_2360,prsc:2|A-797-RGB,B-4798-RGB,T-7378-OUT;n:type:ShaderForge.SFN_Get,id:3607,x:32866,y:31746,varname:node_3607,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Multiply,id:4247,x:33151,y:32046,varname:node_4247,prsc:2|A-2360-OUT,B-8965-OUT;n:type:ShaderForge.SFN_Clamp01,id:8965,x:32755,y:31880,varname:node_8965,prsc:2|IN-7894-OUT;n:type:ShaderForge.SFN_Relay,id:7843,x:31110,y:31233,varname:node_7843,prsc:2|IN-6893-OUT;n:type:ShaderForge.SFN_Relay,id:1301,x:32578,y:31270,varname:node_1301,prsc:2|IN-7843-OUT;n:type:ShaderForge.SFN_Multiply,id:7378,x:32626,y:31479,varname:node_7378,prsc:2|A-1301-OUT,B-3607-OUT;n:type:ShaderForge.SFN_Get,id:5062,x:30774,y:31712,varname:node_5062,prsc:2|IN-2473-OUT;n:type:ShaderForge.SFN_Power,id:8332,x:30982,y:31839,varname:node_8332,prsc:2|VAL-5062-OUT,EXP-3773-OUT;n:type:ShaderForge.SFN_Multiply,id:9952,x:31195,y:31780,varname:node_9952,prsc:2|A-5062-OUT,B-8332-OUT;n:type:ShaderForge.SFN_Vector1,id:3773,x:30795,y:31842,varname:node_3773,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Add,id:2775,x:31474,y:31771,varname:node_2775,prsc:2|A-9952-OUT,B-5169-OUT;n:type:ShaderForge.SFN_Floor,id:7708,x:31661,y:31750,varname:node_7708,prsc:2|IN-2775-OUT;n:type:ShaderForge.SFN_Clamp01,id:6702,x:32023,y:31771,varname:node_6702,prsc:2|IN-7708-OUT;proporder:797-4798;pass:END;sub:END;*/

Shader "Shader Forge/SH_BulletImpact" {
    Properties {
        _TintColor ("Color_01", Color) = (1,0,0,1)
        _Color_02 ("Color_02", Color) = (0,0,1,1)
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
////// Lighting:
////// Emissive:
                float2 node_2224 = (i.uv0*2.0+-1.0).rg;
                float node_6893 = length(node_2224);
                float _Vcols = i.vertexColor.r;
                float node_5169 = (1.0 - (node_6893*pow(node_6893,2.0)));
                float node_5144 = _Vcols;
                float node_9821 = (sin((atan2(node_2224.g,node_2224.r)*5.0))*0.5+0.5);
                float node_2409 = _Vcols;
                float node_5062 = _Vcols;
                float node_2315 = 0.1;
                float node_7073 = _Vcols;
                float node_9803 = _Vcols;
                float node_9386 = _Vcols;
                float3 emissive = (lerp(_TintColor.rgb,_Color_02.rgb,(node_6893*_Vcols))*saturate(((saturate(floor((node_5169+node_5144)))*saturate((1.0 - floor(((node_5144*pow(node_5144,0.5))+node_5169))))*saturate(ceil((node_9821-node_2409))))+(saturate(floor(((node_5062*pow(node_5062,1.5))+node_5169)))*saturate(ceil((node_9821-pow(node_2409,node_2315))))*saturate((1.0 - floor(((node_7073*pow(node_7073,2.0))+node_5169)))))+(saturate(floor(((node_9803*pow(node_9803,7.0))+node_5169)))*saturate((1.0 - floor(((node_9386*pow(node_9386,8.0))+node_5169))))))));
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
