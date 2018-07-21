.class public Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;
.super Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
.source "DefaultFragmentShader.java"


# static fields
.field private static final SHADER_STR:Ljava/lang/String; = "precision mediump float;\nvarying vec2 v_TexCoord;\nuniform sampler2D uTexture;\nuniform vec4 uColor;\nuniform int uIsInit;\nvoid main()  \n{            \n    if (uIsInit == 1) { \n        gl_FragColor = texture2D(uTexture, v_TexCoord);\n    } else { \n        gl_FragColor = uColor;\n    } \n}    \n"

.field private static final TEXTURE_SAMPLER:Ljava/lang/String; = "uTexture"

.field private static final UNIFORM_COLOR:Ljava/lang/String; = "uColor"

.field private static final UNIFORM_INIT_FLAG:Ljava/lang/String; = "uIsInit"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 34
    sget-object v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->FRAGMENT:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    const-string v1, "precision mediump float;\nvarying vec2 v_TexCoord;\nuniform sampler2D uTexture;\nuniform vec4 uColor;\nuniform int uIsInit;\nvoid main()  \n{            \n    if (uIsInit == 1) { \n        gl_FragColor = texture2D(uTexture, v_TexCoord);\n    } else { \n        gl_FragColor = uColor;\n    } \n}    \n"

    invoke-direct {p0, v0, v1}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;-><init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V

    .line 35
    return-void
.end method


# virtual methods
.method public bindAttribute(I)V
    .registers 2
    .param p1, "programHandle"    # I

    .prologue
    .line 39
    return-void
.end method

.method public onProgramLinked(I)V
    .registers 3
    .param p1, "programHandle"    # I

    .prologue
    .line 43
    const-string v0, "uTexture"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;->mTextureSampler:I

    .line 44
    const-string v0, "uColor"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;->mColorUniformHandle:I

    .line 45
    const-string v0, "uIsInit"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;->mIsTextureSetHandle:I

    .line 46
    return-void
.end method
