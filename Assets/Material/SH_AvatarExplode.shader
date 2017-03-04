// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32724,y:32693,varname:node_4795,prsc:2|alpha-5473-OUT,refract-4471-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32490,y:32506,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Slider,id:6443,x:32412,y:32399,ptovrint:False,ptlb:node_6443,ptin:_node_6443,varname:node_6443,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Set,id:6332,x:32764,y:32539,varname:_Vcols,prsc:2|IN-6443-OUT;n:type:ShaderForge.SFN_TexCoord,id:7677,x:31121,y:32793,varname:node_7677,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:9824,x:31398,y:32796,varname:node_9824,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7677-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:16,x:31562,y:32796,varname:node_16,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-9824-OUT;n:type:ShaderForge.SFN_Length,id:8833,x:31750,y:32796,varname:node_8833,prsc:2|IN-16-OUT;n:type:ShaderForge.SFN_Vector1,id:5473,x:32490,y:32776,varname:node_5473,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector2,id:729,x:32063,y:33015,varname:node_729,prsc:2,v1:0,v2:0;n:type:ShaderForge.SFN_Append,id:3640,x:32063,y:32851,varname:node_3640,prsc:2|A-8833-OUT,B-8833-OUT;n:type:ShaderForge.SFN_Lerp,id:4471,x:32300,y:32942,varname:node_4471,prsc:2|A-6985-OUT,B-729-OUT,T-9452-OUT;n:type:ShaderForge.SFN_RemapRange,id:6985,x:32116,y:32626,varname:node_6985,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-3640-OUT;n:type:ShaderForge.SFN_Vector1,id:9452,x:32050,y:33165,varname:node_9452,prsc:2,v1:0.9;pass:END;sub:END;*/

Shader "Shader Forge/SH_AvatarExplode" {
    Properties {
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float node_8833 = length((i.uv0*2.0+-1.0).rg);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp((float2(node_8833,node_8833)*2.0+-1.0),float2(0,0),0.9);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
