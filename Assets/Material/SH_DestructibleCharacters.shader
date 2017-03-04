// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:5985,x:33269,y:32687,varname:node_5985,prsc:2|emission-8879-OUT,clip-9689-OUT;n:type:ShaderForge.SFN_Tex2d,id:9510,x:31896,y:32682,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9510,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7902-OUT;n:type:ShaderForge.SFN_Lerp,id:3213,x:32514,y:32311,varname:node_3213,prsc:2|A-8458-OUT,B-697-OUT,T-9510-RGB;n:type:ShaderForge.SFN_Lerp,id:8879,x:32761,y:32837,varname:node_8879,prsc:2|A-9510-RGB,B-3213-OUT,T-3988-OUT;n:type:ShaderForge.SFN_Tex2d,id:5281,x:30526,y:32796,ptovrint:False,ptlb:Diform,ptin:_Diform,varname:node_5281,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9436b1473171dea4bb080f6de9e72150,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Subtract,id:4036,x:32728,y:32998,varname:node_4036,prsc:2|A-9510-A,B-2498-OUT;n:type:ShaderForge.SFN_Add,id:9331,x:32180,y:33217,varname:node_9331,prsc:2|A-5281-R,B-6787-OUT,C-844-OUT;n:type:ShaderForge.SFN_Vector1,id:844,x:31992,y:33362,varname:node_844,prsc:2,v1:-1;n:type:ShaderForge.SFN_Clamp01,id:2498,x:32360,y:33217,varname:node_2498,prsc:2|IN-9331-OUT;n:type:ShaderForge.SFN_Clamp01,id:3988,x:32375,y:32917,varname:node_3988,prsc:2|IN-6787-OUT;n:type:ShaderForge.SFN_Lerp,id:7902,x:31512,y:32178,varname:node_7902,prsc:2|A-8645-UVOUT,B-4535-OUT,T-3748-OUT;n:type:ShaderForge.SFN_TexCoord,id:8645,x:30922,y:32163,varname:node_8645,prsc:2,uv:0;n:type:ShaderForge.SFN_Append,id:4535,x:31303,y:32300,varname:node_4535,prsc:2|A-8645-U,B-9789-OUT;n:type:ShaderForge.SFN_OneMinus,id:9789,x:30974,y:32420,varname:node_9789,prsc:2|IN-5281-R;n:type:ShaderForge.SFN_Subtract,id:3534,x:31055,y:33227,varname:node_3534,prsc:2|A-6787-OUT,B-2414-OUT;n:type:ShaderForge.SFN_Vector1,id:2414,x:30860,y:33261,varname:node_2414,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Clamp01,id:3748,x:31221,y:33227,varname:node_3748,prsc:2|IN-3534-OUT;n:type:ShaderForge.SFN_Multiply,id:6787,x:30714,y:33477,varname:node_6787,prsc:2|A-3168-OUT,B-1900-OUT;n:type:ShaderForge.SFN_Vector1,id:1900,x:30529,y:33570,varname:node_1900,prsc:2,v1:1.5;n:type:ShaderForge.SFN_TexCoord,id:9385,x:31323,y:33786,varname:node_9385,prsc:2,uv:0;n:type:ShaderForge.SFN_ComponentMask,id:9738,x:31713,y:33786,varname:node_9738,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3587-OUT;n:type:ShaderForge.SFN_RemapRange,id:3587,x:31523,y:33786,varname:node_3587,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-9385-UVOUT;n:type:ShaderForge.SFN_Length,id:3496,x:31913,y:33786,varname:node_3496,prsc:2|IN-9738-OUT;n:type:ShaderForge.SFN_Multiply,id:9689,x:33009,y:33422,varname:node_9689,prsc:2|A-4036-OUT,B-56-OUT;n:type:ShaderForge.SFN_Add,id:4899,x:32152,y:33786,varname:node_4899,prsc:2|A-3496-OUT,B-3528-OUT;n:type:ShaderForge.SFN_Vector1,id:3528,x:31959,y:33959,varname:node_3528,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:8048,x:32392,y:33786,varname:node_8048,prsc:2|A-4899-OUT,B-6787-OUT;n:type:ShaderForge.SFN_Clamp01,id:56,x:32870,y:33631,varname:node_56,prsc:2|IN-6016-OUT;n:type:ShaderForge.SFN_OneMinus,id:7202,x:32189,y:34128,varname:node_7202,prsc:2|IN-3496-OUT;n:type:ShaderForge.SFN_Subtract,id:9868,x:32486,y:34300,varname:node_9868,prsc:2|A-7202-OUT,B-1615-OUT;n:type:ShaderForge.SFN_Multiply,id:6016,x:32695,y:33905,varname:node_6016,prsc:2|A-8048-OUT,B-9868-OUT;n:type:ShaderForge.SFN_Subtract,id:1615,x:31960,y:34210,varname:node_1615,prsc:2|A-6787-OUT,B-8010-OUT;n:type:ShaderForge.SFN_Vector1,id:8010,x:31675,y:34445,varname:node_8010,prsc:2,v1:1.9;n:type:ShaderForge.SFN_ValueProperty,id:9189,x:30275,y:33390,ptovrint:False,ptlb:Destroy,ptin:_Destroy,varname:node_9189,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Clamp01,id:3168,x:30493,y:33408,varname:node_3168,prsc:2|IN-9189-OUT;n:type:ShaderForge.SFN_Vector3,id:697,x:32161,y:32187,varname:node_697,prsc:2,v1:1,v2:0,v3:0;n:type:ShaderForge.SFN_Vector3,id:8458,x:32161,y:32095,varname:node_8458,prsc:2,v1:1,v2:1,v3:1;proporder:9510-5281-9189;pass:END;sub:END;*/

Shader "Custom/SH_DestructibleCharacters" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Diform ("Diform", 2D) = "white" {}
        _Destroy ("Destroy", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
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
            uniform sampler2D _Diform; uniform float4 _Diform_ST;
            uniform float _Destroy;
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
                float4 _Diform_var = tex2D(_Diform,TRANSFORM_TEX(i.uv0, _Diform));
                float node_6787 = (saturate(_Destroy)*1.5);
                float2 node_7902 = lerp(i.uv0,float2(i.uv0.r,(1.0 - _Diform_var.r)),saturate((node_6787-0.5)));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_7902, _MainTex));
                float node_3496 = length((i.uv0*2.0+-1.0).rg);
                clip(((_MainTex_var.a-saturate((_Diform_var.r+node_6787+(-1.0))))*saturate((((node_3496+1.0)-node_6787)*((1.0 - node_3496)-(node_6787-1.9))))) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = lerp(_MainTex_var.rgb,lerp(float3(1,1,1),float3(1,0,0),_MainTex_var.rgb),saturate(node_6787));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Diform; uniform float4 _Diform_ST;
            uniform float _Destroy;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _Diform_var = tex2D(_Diform,TRANSFORM_TEX(i.uv0, _Diform));
                float node_6787 = (saturate(_Destroy)*1.5);
                float2 node_7902 = lerp(i.uv0,float2(i.uv0.r,(1.0 - _Diform_var.r)),saturate((node_6787-0.5)));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_7902, _MainTex));
                float node_3496 = length((i.uv0*2.0+-1.0).rg);
                clip(((_MainTex_var.a-saturate((_Diform_var.r+node_6787+(-1.0))))*saturate((((node_3496+1.0)-node_6787)*((1.0 - node_3496)-(node_6787-1.9))))) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
