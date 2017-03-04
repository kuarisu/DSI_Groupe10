// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:4,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32724,y:32693,varname:node_4795,prsc:2|emission-4230-OUT,clip-9221-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31702,y:32186,varname:_MainTex,prsc:2,tex:fa6cbd82b16809b46b01cd3bc6b8628b,ntxv:0,isnm:False|UVIN-5962-OUT,TEX-2632-TEX;n:type:ShaderForge.SFN_VertexColor,id:2053,x:33177,y:32523,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:31975,y:32503,ptovrint:True,ptlb:Color_01,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1172414,c2:0,c3:1,c4:1;n:type:ShaderForge.SFN_Set,id:5140,x:33657,y:32457,varname:__Vcols,prsc:2|IN-5811-OUT;n:type:ShaderForge.SFN_TexCoord,id:1911,x:30165,y:32209,varname:node_1911,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:8388,x:30715,y:32412,varname:node_8388,prsc:2|A-8743-OUT,B-1185-OUT,C-8804-OUT;n:type:ShaderForge.SFN_Vector1,id:1185,x:30486,y:32562,varname:node_1185,prsc:2,v1:2;n:type:ShaderForge.SFN_Sin,id:3936,x:30904,y:32420,varname:node_3936,prsc:2|IN-8388-OUT;n:type:ShaderForge.SFN_Vector1,id:8804,x:30486,y:32618,varname:node_8804,prsc:2,v1:3.14159;n:type:ShaderForge.SFN_Append,id:5962,x:31405,y:32187,varname:node_5962,prsc:2|A-1911-U,B-1487-OUT;n:type:ShaderForge.SFN_Lerp,id:7532,x:30902,y:31952,varname:node_7532,prsc:2|A-7702-OUT,B-453-OUT,T-1505-OUT;n:type:ShaderForge.SFN_Vector1,id:1505,x:30698,y:32021,varname:node_1505,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Vector1,id:7702,x:30708,y:31932,varname:node_7702,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:1487,x:31141,y:32032,varname:node_1487,prsc:2|A-7532-OUT,B-1911-V;n:type:ShaderForge.SFN_Add,id:8743,x:30486,y:32412,varname:node_8743,prsc:2|A-1911-U,B-4056-OUT;n:type:ShaderForge.SFN_Time,id:2624,x:29931,y:32574,varname:node_2624,prsc:2;n:type:ShaderForge.SFN_Get,id:6836,x:31773,y:31939,varname:node_6836,prsc:2|IN-5140-OUT;n:type:ShaderForge.SFN_Ceil,id:5468,x:32306,y:32069,varname:node_5468,prsc:2|IN-2835-OUT;n:type:ShaderForge.SFN_Subtract,id:2835,x:32118,y:32069,varname:node_2835,prsc:2|A-6836-OUT,B-6074-R;n:type:ShaderForge.SFN_OneMinus,id:5331,x:32490,y:32069,varname:node_5331,prsc:2|IN-5468-OUT;n:type:ShaderForge.SFN_Color,id:3850,x:31975,y:32670,ptovrint:False,ptlb:Color_02,ptin:_Color_02,varname:node_3850,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:1731,x:32240,y:32563,varname:node_1731,prsc:2|A-797-RGB,B-3850-RGB,T-6074-R;n:type:ShaderForge.SFN_Multiply,id:4230,x:32690,y:32220,varname:node_4230,prsc:2|A-5331-OUT,B-1731-OUT,C-6074-G;n:type:ShaderForge.SFN_Add,id:5811,x:33462,y:32381,varname:node_5811,prsc:2|A-2053-R,B-360-OUT;n:type:ShaderForge.SFN_Vector1,id:360,x:33464,y:32667,varname:node_360,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Tex2d,id:5374,x:30369,y:32816,varname:node_5374,prsc:2,tex:fa6cbd82b16809b46b01cd3bc6b8628b,ntxv:0,isnm:False|TEX-2632-TEX;n:type:ShaderForge.SFN_Add,id:453,x:31411,y:32440,varname:node_453,prsc:2|A-665-OUT,B-3936-OUT;n:type:ShaderForge.SFN_Multiply,id:8960,x:31158,y:32694,varname:node_8960,prsc:2|A-3936-OUT,B-7465-OUT;n:type:ShaderForge.SFN_RemapRange,id:7465,x:30943,y:32724,varname:node_7465,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-2698-OUT;n:type:ShaderForge.SFN_Multiply,id:2698,x:30768,y:32724,varname:node_2698,prsc:2|A-5374-R,B-5374-G;n:type:ShaderForge.SFN_Add,id:6285,x:31341,y:32694,varname:node_6285,prsc:2|A-8960-OUT,B-5374-R;n:type:ShaderForge.SFN_Vector1,id:1836,x:31382,y:32905,varname:node_1836,prsc:2,v1:2;n:type:ShaderForge.SFN_Divide,id:665,x:31586,y:32733,varname:node_665,prsc:2|A-6285-OUT,B-1836-OUT;n:type:ShaderForge.SFN_Divide,id:4056,x:30241,y:32584,varname:node_4056,prsc:2|A-2624-T,B-3994-OUT;n:type:ShaderForge.SFN_Vector1,id:3994,x:30020,y:32792,varname:node_3994,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Tex2dAsset,id:2632,x:30571,y:33090,ptovrint:False,ptlb:node_2632,ptin:_node_2632,varname:node_2632,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:fa6cbd82b16809b46b01cd3bc6b8628b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9221,x:32485,y:32950,varname:node_9221,prsc:2|A-5331-OUT,B-6074-G;proporder:797-3850-2632;pass:END;sub:END;*/

Shader "Shader Forge/SH_AvatarTrail" {
    Properties {
        _TintColor ("Color_01", Color) = (0.1172414,0,1,1)
        _Color_02 ("Color_02", Color) = (1,0,0,1)
        _node_2632 ("node_2632", 2D) = "white" {}
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
            Blend DstColor Zero
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _TintColor;
            uniform float4 _Color_02;
            uniform sampler2D _node_2632; uniform float4 _node_2632_ST;
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
                float __Vcols = (i.vertexColor.r+0.01);
                float4 node_2624 = _Time + _TimeEditor;
                float node_3936 = sin(((i.uv0.r+(node_2624.g/1.5))*2.0*3.14159));
                float4 node_5374 = tex2D(_node_2632,TRANSFORM_TEX(i.uv0, _node_2632));
                float2 node_5962 = float2(i.uv0.r,(lerp(0.0,((((node_3936*((node_5374.r*node_5374.g)*2.0+-1.0))+node_5374.r)/2.0)+node_3936),0.05)+i.uv0.g));
                float4 _MainTex = tex2D(_node_2632,TRANSFORM_TEX(node_5962, _node_2632));
                float node_5331 = (1.0 - ceil((__Vcols-_MainTex.r)));
                clip((node_5331*_MainTex.g) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = (node_5331*lerp(_TintColor.rgb,_Color_02.rgb,_MainTex.r)*_MainTex.g);
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
