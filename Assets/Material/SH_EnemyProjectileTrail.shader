// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32724,y:32693,varname:node_4795,prsc:2|emission-2393-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31820,y:32706,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4625b8e7008af9c469f84b056718038b,ntxv:0,isnm:False|UVIN-9703-OUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32080,y:32898,varname:node_2393,prsc:2|A-6074-RGB,B-2053-RGB,C-797-RGB,D-9248-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31820,y:32877,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:31820,y:33035,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Vector1,id:9248,x:31820,y:33186,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:3976,x:30328,y:32709,varname:node_3976,prsc:2,tex:9436b1473171dea4bb080f6de9e72150,ntxv:0,isnm:False|UVIN-933-OUT,TEX-4985-TEX;n:type:ShaderForge.SFN_Append,id:974,x:31193,y:32839,varname:node_974,prsc:2|A-7424-R,B-7424-G;n:type:ShaderForge.SFN_TexCoord,id:5750,x:31205,y:32394,varname:node_5750,prsc:2,uv:0;n:type:ShaderForge.SFN_ScreenPos,id:258,x:29217,y:32756,varname:node_258,prsc:2,sctp:1;n:type:ShaderForge.SFN_Lerp,id:2332,x:31490,y:32587,varname:node_2332,prsc:2|A-5750-UVOUT,B-5741-OUT,T-8006-OUT;n:type:ShaderForge.SFN_Slider,id:8006,x:30926,y:32657,ptovrint:False,ptlb:Difrom_Int,ptin:_Difrom_Int,varname:node_8006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6462371,max:1;n:type:ShaderForge.SFN_Tex2d,id:9799,x:30328,y:32915,varname:node_9799,prsc:2,tex:9436b1473171dea4bb080f6de9e72150,ntxv:0,isnm:False|UVIN-3339-OUT,TEX-4985-TEX;n:type:ShaderForge.SFN_Multiply,id:933,x:29966,y:32700,varname:node_933,prsc:2|A-3117-UVOUT,B-9502-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9502,x:29684,y:32922,ptovrint:False,ptlb:Diform_Tile_01,ptin:_Diform_Tile_01,varname:node_9502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1823,x:29684,y:33065,ptovrint:False,ptlb:Diform_Tile_02,ptin:_Diform_Tile_02,varname:node_1823,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:3339,x:29966,y:32921,varname:node_3339,prsc:2|A-3117-UVOUT,B-1823-OUT;n:type:ShaderForge.SFN_Add,id:5296,x:30570,y:32839,varname:node_5296,prsc:2|A-3976-RGB,B-9799-RGB;n:type:ShaderForge.SFN_Divide,id:8331,x:30751,y:32839,varname:node_8331,prsc:2|A-5296-OUT,B-8321-OUT;n:type:ShaderForge.SFN_Vector1,id:8321,x:30654,y:33012,varname:node_8321,prsc:2,v1:2;n:type:ShaderForge.SFN_ComponentMask,id:7424,x:30975,y:32839,varname:node_7424,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8331-OUT;n:type:ShaderForge.SFN_Lerp,id:9703,x:31596,y:32416,varname:node_9703,prsc:2|A-5750-UVOUT,B-2332-OUT,T-1223-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:4985,x:30104,y:33118,ptovrint:False,ptlb:Diform,ptin:_Diform,varname:node_4985,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9436b1473171dea4bb080f6de9e72150,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:3117,x:29539,y:32505,varname:node_3117,prsc:2,spu:-1,spv:0.5|UVIN-6763-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6763,x:29211,y:32496,varname:node_6763,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:6188,x:31305,y:31903,varname:node_6188,prsc:2|A-53-OUT,B-5750-U;n:type:ShaderForge.SFN_Vector1,id:53,x:30957,y:31942,varname:node_53,prsc:2,v1:2;n:type:ShaderForge.SFN_Power,id:5558,x:31601,y:31897,varname:node_5558,prsc:2|VAL-6188-OUT,EXP-9960-OUT;n:type:ShaderForge.SFN_Vector1,id:9960,x:31416,y:31971,varname:node_9960,prsc:2,v1:2;n:type:ShaderForge.SFN_RemapRange,id:5741,x:31409,y:32800,varname:node_5741,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-974-OUT;n:type:ShaderForge.SFN_Clamp01,id:1223,x:31835,y:31980,varname:node_1223,prsc:2|IN-5558-OUT;proporder:6074-797-8006-9502-1823-4985;pass:END;sub:END;*/

Shader "Shader Forge/SH_EnemyProjectileTrail" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _TintColor ("Color", Color) = (0.5,0.5,0.5,1)
        _Difrom_Int ("Difrom_Int", Range(0, 1)) = 0.6462371
        _Diform_Tile_01 ("Diform_Tile_01", Float ) = 1
        _Diform_Tile_02 ("Diform_Tile_02", Float ) = 2
        _Diform ("Diform", 2D) = "white" {}
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
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _TintColor;
            uniform float _Difrom_Int;
            uniform float _Diform_Tile_01;
            uniform float _Diform_Tile_02;
            uniform sampler2D _Diform; uniform float4 _Diform_ST;
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
                float4 node_2492 = _Time + _TimeEditor;
                float2 node_3117 = (i.uv0+node_2492.g*float2(-1,0.5));
                float2 node_933 = (node_3117*_Diform_Tile_01);
                float4 node_3976 = tex2D(_Diform,TRANSFORM_TEX(node_933, _Diform));
                float2 node_3339 = (node_3117*_Diform_Tile_02);
                float4 node_9799 = tex2D(_Diform,TRANSFORM_TEX(node_3339, _Diform));
                float2 node_7424 = ((node_3976.rgb+node_9799.rgb)/2.0).rg;
                float2 node_9703 = lerp(i.uv0,lerp(i.uv0,(float2(node_7424.r,node_7424.g)*2.0+-1.0),_Difrom_Int),saturate(pow((2.0*i.uv0.r),2.0)));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_9703, _MainTex));
                float3 emissive = (_MainTex_var.rgb*i.vertexColor.rgb*_TintColor.rgb*2.0);
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
