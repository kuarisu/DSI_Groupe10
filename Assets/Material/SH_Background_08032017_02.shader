// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:3138,x:36129,y:30007,varname:node_3138,prsc:2|emission-484-OUT;n:type:ShaderForge.SFN_Tex2d,id:196,x:32415,y:30980,varname:node_196,prsc:2,tex:41c961b80b2c9d24f97e39367354a093,ntxv:0,isnm:False|UVIN-1845-OUT,TEX-4115-TEX;n:type:ShaderForge.SFN_ScreenParameters,id:5354,x:36287,y:32024,varname:node_5354,prsc:2;n:type:ShaderForge.SFN_Append,id:8519,x:31562,y:30990,varname:node_8519,prsc:2|A-4005-R,B-1084-OUT;n:type:ShaderForge.SFN_Divide,id:2420,x:36547,y:32039,varname:node_2420,prsc:2|A-5354-PXH,B-5354-PXW;n:type:ShaderForge.SFN_Tex2d,id:937,x:33287,y:30974,varname:node_937,prsc:2,tex:75813878781319f4c81b5bb2cc61d2ae,ntxv:0,isnm:False|UVIN-8924-OUT,TEX-4703-TEX;n:type:ShaderForge.SFN_Append,id:8924,x:33066,y:30974,varname:node_8924,prsc:2|A-424-OUT,B-8680-OUT;n:type:ShaderForge.SFN_Vector1,id:8680,x:32860,y:31021,varname:node_8680,prsc:2,v1:0;n:type:ShaderForge.SFN_ComponentMask,id:4005,x:30860,y:30964,varname:node_4005,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1138-OUT;n:type:ShaderForge.SFN_Time,id:1873,x:36083,y:30519,varname:node_1873,prsc:2;n:type:ShaderForge.SFN_Set,id:3603,x:36463,y:30519,varname:_Time,prsc:2|IN-3794-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1139,x:36086,y:30785,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:node_1139,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Relay,id:3575,x:34165,y:30981,varname:node_3575,prsc:2|IN-5439-OUT;n:type:ShaderForge.SFN_Relay,id:1845,x:31750,y:30990,cmnt:Relay,varname:node_1845,prsc:2|IN-8519-OUT;n:type:ShaderForge.SFN_Relay,id:5439,x:33634,y:30976,varname:node_5439,prsc:2|IN-937-RGB;n:type:ShaderForge.SFN_Set,id:5534,x:36636,y:30874,varname:__Offset,prsc:2|IN-4648-OUT;n:type:ShaderForge.SFN_ScreenPos,id:6607,x:35987,y:31681,varname:node_6607,prsc:2,sctp:2;n:type:ShaderForge.SFN_Set,id:3492,x:37186,y:31711,varname:__Scrn_UV,prsc:2|IN-3061-OUT;n:type:ShaderForge.SFN_Append,id:3061,x:36951,y:31711,varname:node_3061,prsc:2|A-6607-U,B-5168-OUT;n:type:ShaderForge.SFN_Get,id:1138,x:30585,y:30967,varname:node_1138,prsc:2|IN-3492-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2028,x:36587,y:31738,ptovrint:False,ptlb:Invert_V,ptin:_Invert_V,varname:node_2028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6607-V,B-84-OUT;n:type:ShaderForge.SFN_OneMinus,id:84,x:36415,y:31789,varname:node_84,prsc:2|IN-6607-V;n:type:ShaderForge.SFN_Color,id:7451,x:34999,y:30092,ptovrint:False,ptlb:Overall_Color,ptin:_Overall_Color,varname:node_7451,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3529412,c2:0.350346,c3:0.350346,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9347,x:30652,y:29073,ptovrint:False,ptlb:Distort03,ptin:_Distort03,varname:node_9347,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-191-UVOUT;n:type:ShaderForge.SFN_Slider,id:6810,x:30477,y:29269,ptovrint:False,ptlb:Distort_03_Int,ptin:_Distort_03_Int,varname:node_6810,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.369702,max:1;n:type:ShaderForge.SFN_Tex2dAsset,id:4115,x:31742,y:31584,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4115,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:41c961b80b2c9d24f97e39367354a093,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2dAsset,id:4703,x:32273,y:31611,ptovrint:False,ptlb:Gradient_02,ptin:_Gradient_02,varname:node_4703,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:75813878781319f4c81b5bb2cc61d2ae,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:7483,x:36547,y:32182,varname:node_7483,prsc:2,v1:0.3125;n:type:ShaderForge.SFN_Add,id:1084,x:31303,y:31076,varname:node_1084,prsc:2|A-4005-G,B-2234-OUT;n:type:ShaderForge.SFN_Get,id:8775,x:30871,y:31219,varname:node_8775,prsc:2|IN-5534-OUT;n:type:ShaderForge.SFN_Multiply,id:5168,x:36786,y:31923,varname:node_5168,prsc:2|A-2420-OUT,B-7483-OUT,C-2028-OUT;n:type:ShaderForge.SFN_Append,id:3978,x:31559,y:30586,varname:node_3978,prsc:2|A-1172-R,B-9451-OUT;n:type:ShaderForge.SFN_Append,id:7360,x:33066,y:30646,varname:node_7360,prsc:2|A-9405-OUT,B-4036-OUT;n:type:ShaderForge.SFN_Vector1,id:4036,x:32860,y:30693,varname:node_4036,prsc:2,v1:0;n:type:ShaderForge.SFN_ComponentMask,id:1172,x:30857,y:30560,varname:node_1172,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8930-OUT;n:type:ShaderForge.SFN_Relay,id:9180,x:31748,y:30586,cmnt:Relay,varname:node_9180,prsc:2|IN-3978-OUT;n:type:ShaderForge.SFN_Relay,id:993,x:33624,y:30631,varname:node_993,prsc:2|IN-3637-RGB;n:type:ShaderForge.SFN_Get,id:8930,x:30582,y:30563,varname:node_8930,prsc:2|IN-3492-OUT;n:type:ShaderForge.SFN_Add,id:9451,x:31300,y:30671,varname:node_9451,prsc:2|A-1172-G,B-120-OUT;n:type:ShaderForge.SFN_Tex2d,id:8989,x:32358,y:30610,varname:node_8989,prsc:2,tex:41c961b80b2c9d24f97e39367354a093,ntxv:0,isnm:False|UVIN-9180-OUT,TEX-4115-TEX;n:type:ShaderForge.SFN_Tex2d,id:3637,x:33283,y:30629,varname:node_3637,prsc:2,tex:e6c654b403877bc4db17c4e35e07fc5d,ntxv:0,isnm:False|UVIN-7360-OUT,TEX-3798-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:3798,x:32689,y:31650,ptovrint:False,ptlb:Gradient_01,ptin:_Gradient_01,varname:node_3798,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e6c654b403877bc4db17c4e35e07fc5d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Get,id:8424,x:30873,y:30803,varname:node_8424,prsc:2|IN-5534-OUT;n:type:ShaderForge.SFN_Multiply,id:120,x:31115,y:30733,varname:node_120,prsc:2|A-65-OUT,B-8424-OUT;n:type:ShaderForge.SFN_Relay,id:8581,x:34149,y:30640,varname:node_8581,prsc:2|IN-993-OUT;n:type:ShaderForge.SFN_Append,id:264,x:31539,y:30138,varname:node_264,prsc:2|A-8262-R,B-6931-OUT;n:type:ShaderForge.SFN_Append,id:3025,x:33045,y:30198,varname:node_3025,prsc:2|A-4906-OUT,B-5190-OUT;n:type:ShaderForge.SFN_Vector1,id:5190,x:32839,y:30245,varname:node_5190,prsc:2,v1:0;n:type:ShaderForge.SFN_ComponentMask,id:8262,x:30837,y:30112,varname:node_8262,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8285-OUT;n:type:ShaderForge.SFN_Relay,id:3619,x:31728,y:30138,cmnt:Relay,varname:node_3619,prsc:2|IN-264-OUT;n:type:ShaderForge.SFN_Relay,id:351,x:33610,y:30200,varname:node_351,prsc:2|IN-4851-RGB;n:type:ShaderForge.SFN_Get,id:8285,x:30562,y:30115,varname:node_8285,prsc:2|IN-3492-OUT;n:type:ShaderForge.SFN_Add,id:6931,x:31280,y:30223,varname:node_6931,prsc:2|A-8262-G,B-65-OUT;n:type:ShaderForge.SFN_Get,id:702,x:30856,y:30310,varname:node_702,prsc:2|IN-5534-OUT;n:type:ShaderForge.SFN_Multiply,id:65,x:31095,y:30284,varname:node_65,prsc:2|A-702-OUT,B-2958-OUT;n:type:ShaderForge.SFN_Tex2d,id:805,x:32315,y:30129,varname:node_805,prsc:2,tex:41c961b80b2c9d24f97e39367354a093,ntxv:0,isnm:False|UVIN-3619-OUT,TEX-4115-TEX;n:type:ShaderForge.SFN_Tex2d,id:4851,x:33269,y:30198,varname:node_4851,prsc:2,tex:75813878781319f4c81b5bb2cc61d2ae,ntxv:0,isnm:False|UVIN-3025-OUT,TEX-4703-TEX;n:type:ShaderForge.SFN_Append,id:4933,x:31512,y:29640,varname:node_4933,prsc:2|A-723-R,B-2807-OUT;n:type:ShaderForge.SFN_Append,id:8523,x:33018,y:29700,varname:node_8523,prsc:2|A-6034-OUT,B-2344-OUT;n:type:ShaderForge.SFN_Vector1,id:2344,x:32812,y:29747,varname:node_2344,prsc:2,v1:0;n:type:ShaderForge.SFN_ComponentMask,id:723,x:30810,y:29614,varname:node_723,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8284-OUT;n:type:ShaderForge.SFN_Relay,id:398,x:31701,y:29640,cmnt:Relay,varname:node_398,prsc:2|IN-4933-OUT;n:type:ShaderForge.SFN_Relay,id:3502,x:33571,y:29702,varname:node_3502,prsc:2|IN-1646-RGB;n:type:ShaderForge.SFN_Get,id:8284,x:30535,y:29617,varname:node_8284,prsc:2|IN-3492-OUT;n:type:ShaderForge.SFN_Add,id:2807,x:31253,y:29725,varname:node_2807,prsc:2|A-723-G,B-2958-OUT,C-9851-OUT;n:type:ShaderForge.SFN_Tex2d,id:798,x:32271,y:29644,varname:node_798,prsc:2,tex:41c961b80b2c9d24f97e39367354a093,ntxv:0,isnm:False|UVIN-398-OUT,TEX-4115-TEX;n:type:ShaderForge.SFN_Tex2d,id:1646,x:33267,y:29697,varname:node_1646,prsc:2,tex:75813878781319f4c81b5bb2cc61d2ae,ntxv:0,isnm:False|UVIN-8523-OUT,TEX-4703-TEX;n:type:ShaderForge.SFN_Multiply,id:9851,x:30915,y:29181,varname:node_9851,prsc:2|A-9347-R,B-6810-OUT;n:type:ShaderForge.SFN_TexCoord,id:513,x:30085,y:29070,varname:node_513,prsc:2,uv:0;n:type:ShaderForge.SFN_Relay,id:2877,x:34129,y:30196,varname:node_2877,prsc:2|IN-351-OUT;n:type:ShaderForge.SFN_Relay,id:3720,x:34108,y:29696,varname:node_3720,prsc:2|IN-3502-OUT;n:type:ShaderForge.SFN_Add,id:7430,x:34690,y:30272,varname:node_7430,prsc:2|A-3720-OUT,B-2877-OUT,C-8581-OUT,D-3575-OUT;n:type:ShaderForge.SFN_Divide,id:3518,x:34999,y:30277,varname:node_3518,prsc:2|A-7430-OUT,B-4965-OUT;n:type:ShaderForge.SFN_Panner,id:191,x:30392,y:29073,varname:node_191,prsc:2,spu:0,spv:0.2|UVIN-513-UVOUT,DIST-6461-OUT;n:type:ShaderForge.SFN_Multiply,id:6034,x:32544,y:29667,varname:node_6034,prsc:2|A-798-R,B-3360-OUT;n:type:ShaderForge.SFN_Slider,id:3360,x:32282,y:29861,ptovrint:False,ptlb:Layer_3_Int,ptin:_Layer_3_Int,varname:node_3360,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:4906,x:32536,y:30172,varname:node_4906,prsc:2|A-805-G,B-1021-OUT;n:type:ShaderForge.SFN_Slider,id:1021,x:32263,y:30330,ptovrint:False,ptlb:Layer_2_Int,ptin:_Layer_2_Int,varname:node_1021,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:9405,x:32580,y:30681,varname:node_9405,prsc:2|A-8989-B,B-9236-OUT;n:type:ShaderForge.SFN_Slider,id:9236,x:32234,y:30792,ptovrint:False,ptlb:Layer_1_Int,ptin:_Layer_1_Int,varname:node_9236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:424,x:32628,y:31001,varname:node_424,prsc:2|A-196-R,B-5136-OUT;n:type:ShaderForge.SFN_Slider,id:5136,x:32269,y:31146,ptovrint:False,ptlb:Layer_0_Int,ptin:_Layer_0_Int,varname:node_5136,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Add,id:5627,x:33301,y:31535,varname:node_5627,prsc:2|A-3360-OUT,B-1021-OUT,C-9236-OUT,D-5136-OUT;n:type:ShaderForge.SFN_Relay,id:4965,x:34434,y:31241,varname:node_4965,prsc:2|IN-5627-OUT;n:type:ShaderForge.SFN_Multiply,id:484,x:35266,y:30257,varname:node_484,prsc:2|A-7451-RGB,B-3518-OUT;n:type:ShaderForge.SFN_Multiply,id:3794,x:36291,y:30519,varname:node_3794,prsc:2|A-1873-TSL,B-1139-OUT;n:type:ShaderForge.SFN_Get,id:8765,x:29895,y:29256,varname:node_8765,prsc:2|IN-3603-OUT;n:type:ShaderForge.SFN_Get,id:2958,x:30810,y:29799,varname:node_2958,prsc:2|IN-3603-OUT;n:type:ShaderForge.SFN_Multiply,id:2234,x:31114,y:31120,varname:node_2234,prsc:2|A-120-OUT,B-8775-OUT;n:type:ShaderForge.SFN_Slider,id:4648,x:36068,y:30924,ptovrint:False,ptlb:Parallax_Distance,ptin:_Parallax_Distance,varname:node_4648,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Get,id:3535,x:29895,y:29311,varname:node_3535,prsc:2|IN-5534-OUT;n:type:ShaderForge.SFN_Multiply,id:6461,x:30129,y:29275,varname:node_6461,prsc:2|A-8765-OUT,B-3535-OUT;proporder:1139-2028-7451-9347-6810-4115-4703-3798-3360-1021-9236-5136-4648;pass:END;sub:END;*/

Shader "Shader Forge/SH_Background_08032017_02" {
    Properties {
        _Speed ("Speed", Float ) = 2
        [MaterialToggle] _Invert_V ("Invert_V", Float ) = 0
        _Overall_Color ("Overall_Color", Color) = (0.3529412,0.350346,0.350346,1)
        _Distort03 ("Distort03", 2D) = "white" {}
        _Distort_03_Int ("Distort_03_Int", Range(0, 1)) = 0.369702
        _MainTex ("MainTex", 2D) = "white" {}
        _Gradient_02 ("Gradient_02", 2D) = "white" {}
        _Gradient_01 ("Gradient_01", 2D) = "white" {}
        _Layer_3_Int ("Layer_3_Int", Range(0, 1)) = 1
        _Layer_2_Int ("Layer_2_Int", Range(0, 1)) = 1
        _Layer_1_Int ("Layer_1_Int", Range(0, 1)) = 1
        _Layer_0_Int ("Layer_0_Int", Range(0, 1)) = 1
        _Parallax_Distance ("Parallax_Distance", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float _Speed;
            uniform fixed _Invert_V;
            uniform float4 _Overall_Color;
            uniform sampler2D _Distort03; uniform float4 _Distort03_ST;
            uniform float _Distort_03_Int;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Gradient_02; uniform float4 _Gradient_02_ST;
            uniform sampler2D _Gradient_01; uniform float4 _Gradient_01_ST;
            uniform float _Layer_3_Int;
            uniform float _Layer_2_Int;
            uniform float _Layer_1_Int;
            uniform float _Layer_0_Int;
            uniform float _Parallax_Distance;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
////// Lighting:
////// Emissive:
                float2 __Scrn_UV = float2(sceneUVs.r,((_ScreenParams.g/_ScreenParams.r)*0.3125*lerp( sceneUVs.g, (1.0 - sceneUVs.g), _Invert_V )));
                float2 node_723 = __Scrn_UV.rg;
                float4 node_1873 = _Time + _TimeEditor;
                float _Time = (node_1873.r*_Speed);
                float node_2958 = _Time;
                float __Offset = _Parallax_Distance;
                float2 node_191 = (i.uv0+(_Time*__Offset)*float2(0,0.2));
                float4 _Distort03_var = tex2D(_Distort03,TRANSFORM_TEX(node_191, _Distort03));
                float2 node_398 = float2(node_723.r,(node_723.g+node_2958+(_Distort03_var.r*_Distort_03_Int))); // Relay
                float4 node_798 = tex2D(_MainTex,TRANSFORM_TEX(node_398, _MainTex));
                float2 node_8523 = float2((node_798.r*_Layer_3_Int),0.0);
                float4 node_1646 = tex2D(_Gradient_02,TRANSFORM_TEX(node_8523, _Gradient_02));
                float2 node_8262 = __Scrn_UV.rg;
                float node_65 = (__Offset*node_2958);
                float2 node_3619 = float2(node_8262.r,(node_8262.g+node_65)); // Relay
                float4 node_805 = tex2D(_MainTex,TRANSFORM_TEX(node_3619, _MainTex));
                float2 node_3025 = float2((node_805.g*_Layer_2_Int),0.0);
                float4 node_4851 = tex2D(_Gradient_02,TRANSFORM_TEX(node_3025, _Gradient_02));
                float2 node_1172 = __Scrn_UV.rg;
                float node_120 = (node_65*__Offset);
                float2 node_9180 = float2(node_1172.r,(node_1172.g+node_120)); // Relay
                float4 node_8989 = tex2D(_MainTex,TRANSFORM_TEX(node_9180, _MainTex));
                float2 node_7360 = float2((node_8989.b*_Layer_1_Int),0.0);
                float4 node_3637 = tex2D(_Gradient_01,TRANSFORM_TEX(node_7360, _Gradient_01));
                float2 node_4005 = __Scrn_UV.rg;
                float2 node_1845 = float2(node_4005.r,(node_4005.g+(node_120*__Offset))); // Relay
                float4 node_196 = tex2D(_MainTex,TRANSFORM_TEX(node_1845, _MainTex));
                float2 node_8924 = float2((node_196.r*_Layer_0_Int),0.0);
                float4 node_937 = tex2D(_Gradient_02,TRANSFORM_TEX(node_8924, _Gradient_02));
                float3 emissive = (_Overall_Color.rgb*((node_1646.rgb+node_4851.rgb+node_3637.rgb+node_937.rgb)/(_Layer_3_Int+_Layer_2_Int+_Layer_1_Int+_Layer_0_Int)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
