.class public Lcom/lge/gallery/vr/viewer/util/GLHelper;
.super Ljava/lang/Object;
.source "GLHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GLHelper"

.field private static sMaxTextureSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    const/4 v0, 0x0

    sput v0, Lcom/lge/gallery/vr/viewer/util/GLHelper;->sMaxTextureSize:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bindTexture(ILandroid/graphics/Bitmap;)V
    .registers 5
    .param p0, "id"    # I
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/16 v2, 0xde1

    const/4 v1, 0x0

    .line 45
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 46
    invoke-static {v2, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 47
    invoke-static {v2, v1, p1, v1}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 48
    return-void
.end method

.method public static checkGLError(Ljava/lang/String;)V
    .registers 5
    .param p0, "label"    # Ljava/lang/String;

    .prologue
    .line 60
    const/4 v0, 0x0

    .line 61
    .local v0, "error":I
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-eqz v0, :cond_40

    .line 62
    const-string v1, "GLHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": glError "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_40
    return-void
.end method

.method public static createTexture(Landroid/graphics/Bitmap;)I
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->createTexture(Landroid/graphics/Bitmap;Z)I

    move-result v0

    return v0
.end method

.method public static createTexture(Landroid/graphics/Bitmap;Z)I
    .registers 8
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "recycle"    # Z

    .prologue
    const v3, 0x812f

    const/4 v2, 0x1

    const/4 v5, 0x0

    const/16 v4, 0xde1

    .line 29
    new-array v1, v2, [I

    .line 30
    .local v1, "textureId":[I
    invoke-static {p0}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->getSuitableBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 31
    .local v0, "b":Landroid/graphics/Bitmap;
    invoke-static {v2, v1, v5}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 32
    aget v2, v1, v5

    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 33
    const/16 v2, 0x2802

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 34
    const/16 v2, 0x2803

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 35
    const/16 v2, 0x2801

    const/high16 v3, 0x46180000    # 9728.0f

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 36
    const/16 v2, 0x2800

    const v3, 0x46180400    # 9729.0f

    invoke-static {v4, v2, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 37
    invoke-static {v4, v5, v0, v5}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 38
    if-eqz p1, :cond_36

    .line 39
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 41
    :cond_36
    aget v2, v1, v5

    return v2
.end method

.method public static getMaxTextureSize()I
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 69
    sget v1, Lcom/lge/gallery/vr/viewer/util/GLHelper;->sMaxTextureSize:I

    if-lez v1, :cond_8

    .line 70
    sget v1, Lcom/lge/gallery/vr/viewer/util/GLHelper;->sMaxTextureSize:I

    .line 76
    .local v0, "size":[I
    :goto_7
    return v1

    .line 72
    .end local v0    # "size":[I
    :cond_8
    const/4 v1, 0x1

    new-array v0, v1, [I

    .line 73
    .restart local v0    # "size":[I
    const/16 v1, 0xd33

    invoke-static {v1, v0, v4}, Landroid/opengl/GLES20;->glGetIntegerv(I[II)V

    .line 74
    const-string v1, "GLHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Max side : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    aget v1, v0, v4

    sput v1, Lcom/lge/gallery/vr/viewer/util/GLHelper;->sMaxTextureSize:I

    .line 76
    sget v1, Lcom/lge/gallery/vr/viewer/util/GLHelper;->sMaxTextureSize:I

    goto :goto_7
.end method

.method private static getSuitableBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 80
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 90
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_8
    :goto_8
    return-object p0

    .line 83
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_9
    invoke-static {}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->getMaxTextureSize()I

    move-result v1

    .line 84
    .local v1, "maxTextureSize":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 85
    .local v0, "largeSide":I
    if-ge v1, v0, :cond_8

    .line 88
    invoke-static {p0, v1}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->getScaledBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 89
    .local v2, "ret":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    move-object p0, v2

    .line 90
    goto :goto_8
.end method

.method public static makeFloatBuffer([F)Ljava/nio/FloatBuffer;
    .registers 4
    .param p0, "arr"    # [F

    .prologue
    .line 51
    array-length v2, p0

    mul-int/lit8 v2, v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 52
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 53
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    .line 54
    .local v1, "fb":Ljava/nio/FloatBuffer;
    invoke-virtual {v1, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 55
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 56
    return-object v1
.end method
