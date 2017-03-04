// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32724,y:32693,varname:node_4795,prsc:2|alpha-5473-OUT,refract-8403-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32490,y:32506,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Set,id:6332,x:32764,y:32539,varname:_Vcols,prsc:2|IN-2053-R;n:type:ShaderForge.SFN_Vector1,id:5473,x:31931,y:32751,varname:node_5473,prsc:2,v1:0;n:type:ShaderForge.SFN_Lerp,id:4471,x:31771,y:32852,varname:node_4471,prsc:2|A-8694-OUT,B-9255-RGB,T-3551-OUT;n:type:ShaderForge.SFN_Append,id:8403,x:32135,y:32862,varname:node_8403,prsc:2|A-5217-R,B-5217-G;n:type:ShaderForge.SFN_ComponentMask,id:5217,x:31945,y:32852,varname:node_5217,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4471-OUT;n:type:ShaderForge.SFN_Tex2d,id:9255,x:31441,y:32863,ptovrint:False,ptlb:Difform,ptin:_Difform,varname:node_9255,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2938b8f5b8fd1054d9c6c29893849d4c,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector1,id:8694,x:31536,y:32614,varname:node_8694,prsc:2,v1:0;n:type:ShaderForge.SFN_Get,id:3551,x:31519,y:33087,varname:node_3551,prsc:2|IN-6332-OUT;proporder:9255;pass:END;sub:END;*/

Shader "Shader Forge/SH_AvatarExplode" {
    Properties {
        _Difform ("Difform", 2D) = "bump" {}
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
            uniform sampler2D _Difform; uniform float4 _Difform_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
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
                float node_8694 = 0.0;
                float3 _Difform_var = UnpackNormal(tex2D(_Difform,TRANSFORM_TEX(i.uv0, _Difform)));
                float _Vcols = i.vertexColor.r;
                float2 node_5217 = lerp(float3(node_8694,node_8694,node_8694),_Difform_var.rgb,_Vcols).rg;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2(node_5217.r,node_5217.g);
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
