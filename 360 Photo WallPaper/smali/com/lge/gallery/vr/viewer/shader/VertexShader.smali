.class public abstract Lcom/lge/gallery/vr/viewer/shader/VertexShader;
.super Lcom/lge/gallery/vr/viewer/shader/Shader;
.source "VertexShader.java"


# static fields
.field protected static final ATTR_LOC_POSITION:I = 0x0

.field protected static final ATTR_LOC_TEXTCOORD:I = 0x1


# instance fields
.field protected mMVPHandle:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .param p2, "shaderString"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/vr/viewer/shader/Shader;-><init>(Lcom/lge/gallery/vr/viewer/shader/ShaderType;Ljava/lang/String;)V

    .line 19
    return-void
.end method


# virtual methods
.method public getAttrPosition()I
    .registers 2

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public getAttrTextCoord()I
    .registers 2

    .prologue
    .line 26
    const/4 v0, 0x1

    return v0
.end method

.method public getUniformMVP()I
    .registers 2

    .prologue
    .line 30
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->mMVPHandle:I

    return v0
.end method
