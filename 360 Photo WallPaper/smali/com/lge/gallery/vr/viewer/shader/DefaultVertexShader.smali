.class public Lcom/lge/gallery/vr/viewer/shader/DefaultVertexShader;
.super Lcom/lge/gallery/vr/viewer/shader/VertexShader;
.source "DefaultVertexShader.java"


# static fields
.field private static final KEY_ATTR_POSITION:Ljava/lang/String; = "a_Position"

.field private static final KEY_ATTR_TEX_COORD:Ljava/lang/String; = "a_TextureCoord"

.field private static final KEY_UNIFORM_MVP:Ljava/lang/String; = "u_MVPMatrix"

.field private static final SADER_STR_PREFIX:Ljava/lang/String; = "attribute vec4 a_Position;\nuniform mat4 u_MVPMatrix;\nattribute vec2 a_TextureCoord;\nvarying vec2 v_TexCoord;\nvoid main() \n{ \n"

.field private static final SHADER_STR_CONTENT_NORMAL:Ljava/lang/String; = "     v_TexCoord = a_TextureCoord;\n"

.field private static final SHADER_STR_CONTENT_REVERSE:Ljava/lang/String; = "     v_TexCoord = vec2(a_TextureCoord.x, 1.0 - a_TextureCoord.y);\n"

.field private static final SHADER_STR_NORMAL:Ljava/lang/String; = "attribute vec4 a_Position;\nuniform mat4 u_MVPMatrix;\nattribute vec2 a_TextureCoord;\nvarying vec2 v_TexCoord;\nvoid main() \n{ \n     v_TexCoord = a_TextureCoord;\n     gl_Position = u_MVPMatrix * a_Position;\n} \n"

.field private static final SHADER_STR_REVERSE:Ljava/lang/String; = "attribute vec4 a_Position;\nuniform mat4 u_MVPMatrix;\nattribute vec2 a_TextureCoord;\nvarying vec2 v_TexCoord;\nvoid main() \n{ \n     v_TexCoord = vec2(a_TextureCoord.x, 1.0 - a_TextureCoord.y);\n     gl_Position = u_MVPMatrix * a_Position;\n} \n"

.field private static final SHADER_STR_SUFFIX:Ljava/lang/String; = "     gl_Position = u_MVPMatrix * a_Position;\n} \n"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lge/gallery/vr/viewer/shader/DefaultVertexShader;-><init>(Z)V

    .line 37
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 4
    .param p1, "isReverse"    # Z

    .prologue
    .line 40
    sget-object v1, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->VERTEX:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    if-eqz p1, :cond_a

    const-string v0, "attribute vec4 a_Position;\nuniform mat4 u_MVPMatrix;\nattribute vec2 a_TextureCoord;\nvarying vec2 v_TexCoord;\nvoid main() \n{ \n     v_TexCoord = vec2(a_TextureCoord.x, 1.0 - a_TextureCoord.y);\n     gl_Position = u_MVPMatrix * a_Position;\n} \n"

    :goto_6
    invoke-direct {p0, v1, v0}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;-><init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V

    .line 41
    return-void

    .line 40
    :cond_a
    const-string v0, "attribute vec4 a_Position;\nuniform mat4 u_MVPMatrix;\nattribute vec2 a_TextureCoord;\nvarying vec2 v_TexCoord;\nvoid main() \n{ \n     v_TexCoord = a_TextureCoord;\n     gl_Position = u_MVPMatrix * a_Position;\n} \n"

    goto :goto_6
.end method


# virtual methods
.method public bindAttribute(I)V
    .registers 4
    .param p1, "programHandle"    # I

    .prologue
    .line 45
    const/4 v0, 0x0

    const-string v1, "a_Position"

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 46
    const/4 v0, 0x1

    const-string v1, "a_TextureCoord"

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 47
    return-void
.end method

.method public onProgramLinked(I)V
    .registers 3
    .param p1, "programHandle"    # I

    .prologue
    .line 51
    const-string v0, "u_MVPMatrix"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/shader/DefaultVertexShader;->mMVPHandle:I

    .line 52
    return-void
.end method
