.class public abstract Lcom/lge/gallery/vr/viewer/shader/Shader;
.super Ljava/lang/Object;
.source "Shader.java"


# static fields
.field protected static final END_LINE:Ljava/lang/String; = ";\n"


# instance fields
.field private mHandle:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V
    .registers 4
    .param p1, "type"    # Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .param p2, "shaderString"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/vr/viewer/shader/Shader;->createShader(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/shader/Shader;->mHandle:I

    .line 19
    return-void
.end method

.method private createShader(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)I
    .registers 7
    .param p1, "type"    # Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .param p2, "shaderString"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 22
    invoke-virtual {p1}, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->getTypeIndex()I

    move-result v2

    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v1

    .line 23
    .local v1, "shaderHandle":I
    if-eqz v1, :cond_22

    .line 24
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 25
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 26
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 27
    .local v0, "compileStatus":[I
    const v2, 0x8b81

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 28
    aget v2, v0, v3

    if-nez v2, :cond_22

    .line 29
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 30
    const/4 v1, 0x0

    .line 33
    .end local v0    # "compileStatus":[I
    :cond_22
    iput v1, p0, Lcom/lge/gallery/vr/viewer/shader/Shader;->mHandle:I

    .line 34
    if-nez v1, :cond_2e

    .line 35
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Error creating vertex shader."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 37
    :cond_2e
    return v1
.end method


# virtual methods
.method public abstract bindAttribute(I)V
.end method

.method public getHandle()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/Shader;->mHandle:I

    return v0
.end method

.method public abstract onProgramLinked(I)V
.end method
