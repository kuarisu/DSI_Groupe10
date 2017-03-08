// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:33386,y:32747,varname:node_4795,prsc:2|emission-7214-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31463,y:32866,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bafbc822942ce8f48820ef1af26d27ad,ntxv:0,isnm:False|UVIN-1659-OUT;n:type:ShaderForge.SFN_Tex2d,id:1231,x:32225,y:32709,ptovrint:False,ptlb:Gradient,ptin:_Gradient,varname:node_1231,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:67e30369e022c234f9deb24bb7380cfc,ntxv:0,isnm:False|UVIN-9836-OUT;n:type:ShaderForge.SFN_Vector1,id:3876,x:31689,y:32792,varname:node_3876,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:9836,x:31907,y:32704,varname:node_9836,prsc:2|A-6074-R,B-3876-OUT;n:type:ShaderForge.SFN_Multiply,id:7449,x:32447,y:32910,varname:node_7449,prsc:2|A-1231-RGB,B-3582-OUT;n:type:ShaderForge.SFN_Ceil,id:3582,x:32037,y:32989,varname:node_3582,prsc:2|IN-8082-OUT;n:type:ShaderForge.SFN_Subtract,id:8082,x:31808,y:32989,varname:node_8082,prsc:2|A-6074-R,B-3178-OUT;n:type:ShaderForge.SFN_Vector1,id:3178,x:31623,y:33096,varname:node_3178,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Tex2d,id:4825,x:30649,y:33249,ptovrint:False,ptlb:Diform,ptin:_Diform,varname:node_4825,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e069a468d23da854bb29e51cfd86b2d7,ntxv:0,isnm:False|UVIN-1866-OUT;n:type:ShaderForge.SFN_TexCoord,id:39,x:30005,y:32744,varname:node_39,prsc:2,uv:0;n:type:ShaderForge.SFN_Time,id:7325,x:29727,y:33242,varname:node_7325,prsc:2;n:type:ShaderForge.SFN_Subtract,id:9531,x:30194,y:33230,varname:node_9531,prsc:2|A-39-U,B-9803-OUT;n:type:ShaderForge.SFN_Append,id:1866,x:30419,y:33211,varname:node_1866,prsc:2|A-9531-OUT,B-39-V;n:type:ShaderForge.SFN_Append,id:5419,x:30952,y:32869,varname:node_5419,prsc:2|A-4825-RGB,B-39-V;n:type:ShaderForge.SFN_Lerp,id:1659,x:31196,y:32781,varname:node_1659,prsc:2|A-39-UVOUT,B-5419-OUT,T-8620-OUT;n:type:ShaderForge.SFN_Vector1,id:2741,x:30974,y:33062,varname:node_2741,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Multiply,id:8620,x:31153,y:33009,varname:node_8620,prsc:2|A-39-U,B-2741-OUT;n:type:ShaderForge.SFN_Multiply,id:1610,x:32447,y:33070,varname:node_1610,prsc:2|A-1231-RGB,B-3582-OUT,C-3142-OUT;n:type:ShaderForge.SFN_Add,id:7804,x:31982,y:33192,varname:node_7804,prsc:2|A-4825-R,B-4825-G;n:type:ShaderForge.SFN_Divide,id:3142,x:32231,y:33192,varname:node_3142,prsc:2|A-7804-OUT,B-7523-OUT;n:type:ShaderForge.SFN_Vector1,id:7523,x:32002,y:33334,varname:node_7523,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:8985,x:32707,y:32980,varname:node_8985,prsc:2|A-7449-OUT,B-1610-OUT;n:type:ShaderForge.SFN_Clamp01,id:6282,x:32887,y:32980,varname:node_6282,prsc:2|IN-8985-OUT;n:type:ShaderForge.SFN_Vector1,id:8521,x:29794,y:33382,varname:node_8521,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:9803,x:29972,y:33286,varname:node_9803,prsc:2|A-7325-TTR,B-8521-OUT;n:type:ShaderForge.SFN_OneMinus,id:5282,x:32023,y:32251,varname:node_5282,prsc:2|IN-39-U;n:type:ShaderForge.SFN_RemapRange,id:5071,x:32262,y:32251,varname:node_5071,prsc:2,frmn:0.01,frmx:0.1,tomn:0,tomx:1|IN-5282-OUT;n:type:ShaderForge.SFN_Clamp01,id:6958,x:32450,y:32251,varname:node_6958,prsc:2|IN-5071-OUT;n:type:ShaderForge.SFN_Multiply,id:7214,x:33064,y:32980,varname:node_7214,prsc:2|A-6282-OUT,B-6958-OUT;proporder:6074-1231-4825;pass:END;sub:END;*/

Shader "Shader Forge/SH_AvatarTrail_08032017" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Gradient ("Gradient", 2D) = "white" {}
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Gradient; uniform float4 _Gradient_ST;
            uniform sampler2D _Diform; uniform float4 _Diform_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_7325 = _Time + _TimeEditor;
                float2 node_1866 = float2((i.uv0.r-(node_7325.a*2.0)),i.uv0.g);
                float4 _Diform_var = tex2D(_Diform,TRANSFORM_TEX(node_1866, _Diform));
                float4 node_1659 = lerp(float4(i.uv0,0.0,0.0),float4(_Diform_var.rgb,i.uv0.g),(i.uv0.r*0.2));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_1659, _MainTex));
                float2 node_9836 = float2(_MainTex_var.r,0.0);
                float4 _Gradient_var = tex2D(_Gradient,TRANSFORM_TEX(node_9836, _Gradient));
                float node_3582 = ceil((_MainTex_var.r-0.01));
                float3 emissive = (saturate(((_Gradient_var.rgb*node_3582)+(_Gradient_var.rgb*node_3582*((_Diform_var.r+_Diform_var.g)/2.0))))*saturate(((1.0 - i.uv0.r)*11.11111+-0.1111111)));
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
