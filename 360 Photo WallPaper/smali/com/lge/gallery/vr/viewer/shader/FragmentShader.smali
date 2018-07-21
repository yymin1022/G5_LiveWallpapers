.class public abstract Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
.super Lcom/lge/gallery/vr/viewer/shader/Shader;
.source "FragmentShader.java"


# instance fields
.field protected mColorUniformHandle:I

.field protected mIsTextureSetHandle:I

.field protected mTextureSampler:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .param p2, "shaderString"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/vr/viewer/shader/Shader;-><init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V

    .line 18
    return-void
.end method


# virtual methods
.method public getColorUniformHandle()I
    .registers 2

    .prologue
    .line 25
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->mColorUniformHandle:I

    return v0
.end method

.method public getTextureFlagUniformHandle()I
    .registers 2

    .prologue
    .line 29
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->mIsTextureSetHandle:I

    return v0
.end method

.method public getTextureSamplerHandle()I
    .registers 2

    .prologue
    .line 21
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->mTextureSampler:I

    return v0
.end method
