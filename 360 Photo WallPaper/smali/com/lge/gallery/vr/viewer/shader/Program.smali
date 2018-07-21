.class public abstract Lcom/lge/gallery/vr/viewer/shader/Program;
.super Ljava/lang/Object;
.source "Program.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Program"


# instance fields
.field private mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

.field private mHandle:I

.field private mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createProgram()I
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 22
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v1

    .line 23
    .local v1, "programHandle":I
    if-eqz v1, :cond_54

    .line 24
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/shader/Program;->onCreateVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    move-result-object v2

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    .line 25
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getHandle()I

    move-result v2

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 26
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/shader/Program;->onCreateFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    move-result-object v2

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    .line 27
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getHandle()I

    move-result v2

    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 28
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->bindAttribute(I)V

    .line 29
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->bindAttribute(I)V

    .line 30
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 31
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->onProgramLinked(I)V

    .line 32
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->onProgramLinked(I)V

    .line 33
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 34
    .local v0, "linkStatus":[I
    const v2, 0x8b82

    invoke-static {v1, v2, v0, v3}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 35
    aget v2, v0, v3

    if-nez v2, :cond_54

    .line 36
    const-string v2, "Program"

    const-string v3, "link program error"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 38
    const/4 v1, 0x0

    .line 41
    .end local v0    # "linkStatus":[I
    :cond_54
    iput v1, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mHandle:I

    .line 42
    if-nez v1, :cond_60

    .line 43
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Error creating program."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 45
    :cond_60
    return v1
.end method

.method public getFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mFragmentShader:Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    return-object v0
.end method

.method public getHandle()I
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mHandle:I

    return v0
.end method

.method public getVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mVertextShader:Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    return-object v0
.end method

.method protected abstract onCreateFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
.end method

.method protected abstract onCreateVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;
.end method

.method public useProgram()V
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mHandle:I

    if-lez v0, :cond_9

    .line 50
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/Program;->mHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 52
    :cond_9
    return-void
.end method
