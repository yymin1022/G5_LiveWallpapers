.class public Lcom/lge/gallery/vr/viewer/ui/TiledTexture;
.super Ljava/lang/Object;
.source "TiledTexture.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "TiledTexture"


# instance fields
.field protected mCanvasRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentVertexOffset:I

.field private final mIndicCount:I

.field private mIndicesBuffer:Ljava/nio/ShortBuffer;

.field private final mNumberOfVertex:I

.field private final mPosition:I

.field private mTexCoordBuffer:Ljava/nio/FloatBuffer;

.field private mTextureIds:[I

.field private mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

.field private mVertexBuffer:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>(II)V
    .registers 16
    .param p1, "index"    # I
    .param p2, "tesselation"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v11, 0x1

    new-array v11, v11, [I

    iput-object v11, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    .line 39
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 42
    const/4 v11, 0x0

    iput v11, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCurrentVertexOffset:I

    .line 43
    iput p1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mPosition:I

    .line 44
    add-int/lit8 v1, p2, 0x1

    .line 45
    .local v1, "distance":I
    mul-int v11, v1, v1

    iput v11, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mNumberOfVertex:I

    .line 46
    add-int/lit8 v11, v1, -0x1

    add-int/lit8 v12, v1, -0x1

    mul-int/2addr v11, v12

    mul-int/lit8 v11, v11, 0x3

    mul-int/lit8 v11, v11, 0x2

    iput v11, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicCount:I

    .line 47
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->initialize()V

    .line 48
    const/4 v0, 0x0

    .line 49
    .local v0, "bufferIndex":I
    iget-object v8, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicesBuffer:Ljava/nio/ShortBuffer;

    .line 50
    .local v8, "shortbuffer":Ljava/nio/ShortBuffer;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_28
    if-ge v5, p2, :cond_69

    .line 51
    const/4 v6, 0x0

    .local v6, "jk":I
    :goto_2b
    if-ge v6, p2, :cond_66

    .line 52
    mul-int v11, v5, v1

    add-int v10, v11, v6

    .line 53
    .local v10, "vertexIndex":I
    add-int/lit8 v9, v0, 0x1

    .line 54
    .local v9, "tempPosition":I
    add-int/lit8 v11, v10, 0x0

    int-to-short v11, v11

    invoke-virtual {v8, v0, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 55
    add-int/lit8 v0, v9, 0x1

    .line 56
    add-int/lit8 v11, v10, 0x1

    int-to-short v11, v11

    invoke-virtual {v8, v9, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 57
    add-int/lit8 v9, v0, 0x1

    .line 58
    add-int v11, v10, v1

    int-to-short v11, v11

    invoke-virtual {v8, v0, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 59
    add-int/lit8 v0, v9, 0x1

    .line 60
    add-int v11, v10, v1

    int-to-short v11, v11

    invoke-virtual {v8, v9, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 61
    add-int/lit8 v9, v0, 0x1

    .line 62
    add-int/lit8 v11, v10, 0x1

    int-to-short v11, v11

    invoke-virtual {v8, v0, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 63
    add-int/lit8 v0, v9, 0x1

    .line 64
    add-int v11, v10, v1

    add-int/lit8 v11, v11, 0x1

    int-to-short v11, v11

    invoke-virtual {v8, v9, v11}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    .line 51
    add-int/lit8 v6, v6, 0x1

    goto :goto_2b

    .line 50
    .end local v9    # "tempPosition":I
    .end local v10    # "vertexIndex":I
    :cond_66
    add-int/lit8 v5, v5, 0x1

    goto :goto_28

    .line 67
    .end local v6    # "jk":I
    :cond_69
    const/4 v0, 0x0

    .line 68
    const/4 v5, 0x0

    :goto_6b
    if-ge v5, v1, :cond_93

    .line 69
    const/4 v6, 0x0

    .restart local v6    # "jk":I
    :goto_6e
    if-ge v6, v1, :cond_90

    .line 70
    int-to-float v11, v6

    add-int/lit8 v12, v1, -0x1

    int-to-float v12, v12

    div-float v2, v11, v12

    .line 71
    .local v2, "f1":F
    int-to-float v11, v5

    add-int/lit8 v12, v1, -0x1

    int-to-float v12, v12

    div-float v3, v11, v12

    .line 72
    .local v3, "f2":F
    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTexCoordBuffer:Ljava/nio/FloatBuffer;

    .line 73
    .local v4, "floatbuffer":Ljava/nio/FloatBuffer;
    add-int/lit8 v7, v0, 0x1

    .line 74
    .local v7, "l1":I
    invoke-virtual {v4, v0, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 75
    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTexCoordBuffer:Ljava/nio/FloatBuffer;

    .line 76
    add-int/lit8 v0, v7, 0x1

    .line 77
    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v11, v3

    invoke-virtual {v4, v7, v11}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 69
    add-int/lit8 v6, v6, 0x1

    goto :goto_6e

    .line 68
    .end local v2    # "f1":F
    .end local v3    # "f2":F
    .end local v4    # "floatbuffer":Ljava/nio/FloatBuffer;
    .end local v7    # "l1":I
    :cond_90
    add-int/lit8 v5, v5, 0x1

    goto :goto_6b

    .line 80
    .end local v6    # "jk":I
    :cond_93
    return-void
.end method

.method private initialize()V
    .registers 3

    .prologue
    .line 83
    iget v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mNumberOfVertex:I

    mul-int/lit8 v0, v0, 0x2

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTexCoordBuffer:Ljava/nio/FloatBuffer;

    .line 84
    iget v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicCount:I

    mul-int/lit8 v0, v0, 0x2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicesBuffer:Ljava/nio/ShortBuffer;

    .line 85
    return-void
.end method


# virtual methods
.method public draw(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;IIIII)V
    .registers 13
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "vertexLocation"    # I
    .param p3, "textureLocation"    # I
    .param p4, "textureID"    # I
    .param p5, "samplerId"    # I
    .param p6, "textureFlag"    # I

    .prologue
    const/16 v2, 0x1406

    const/4 v3, 0x0

    .line 95
    invoke-virtual {p0, p1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->isLoaded(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 129
    :goto_9
    return-void

    .line 98
    :cond_a
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 99
    const/16 v0, 0x405

    invoke-static {v0}, Landroid/opengl/GLES20;->glCullFace(I)V

    .line 100
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mVertexBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 101
    if-ltz p2, :cond_27

    .line 102
    const/4 v1, 0x3

    const/16 v4, 0xc

    iget-object v5, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mVertexBuffer:Ljava/nio/FloatBuffer;

    move v0, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 104
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 107
    :cond_27
    const-string v0, "tile vertex"

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->checkGLError(Ljava/lang/String;)V

    .line 109
    if-lez p4, :cond_40

    .line 110
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 111
    const/16 v0, 0xde1

    invoke-static {v0, p4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 112
    invoke-static {p5, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 113
    const/4 v0, 0x1

    invoke-static {p6, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 116
    :cond_40
    const-string v0, "tile texture"

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->checkGLError(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTexCoordBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 119
    if-ltz p3, :cond_57

    .line 120
    const/4 v1, 0x2

    iget-object v5, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTexCoordBuffer:Ljava/nio/FloatBuffer;

    move v0, p3

    move v4, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 122
    invoke-static {p3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 124
    :cond_57
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicesBuffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0, v3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 125
    const/4 v0, 0x4

    iget v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicCount:I

    const/16 v2, 0x1403

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mIndicesBuffer:Ljava/nio/ShortBuffer;

    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 127
    const-string v0, "tile draw"

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->checkGLError(Ljava/lang/String;)V

    goto :goto_9
.end method

.method public fillVertext([Lcom/lge/gallery/vr/viewer/data/Point;)V
    .registers 8
    .param p1, "vertics"    # [Lcom/lge/gallery/vr/viewer/data/Point;

    .prologue
    .line 132
    iget v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mNumberOfVertex:I

    mul-int/lit8 v3, v3, 0x3

    mul-int/lit8 v3, v3, 0x4

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v3

    iput-object v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 133
    const/4 v3, 0x0

    iput v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCurrentVertexOffset:I

    .line 134
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1c
    array-length v3, p1

    if-ge v0, v3, :cond_3f

    .line 135
    aget-object v1, p1, v0

    .line 136
    .local v1, "point":Lcom/lge/gallery/vr/viewer/data/Point;
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mVertexBuffer:Ljava/nio/FloatBuffer;

    iget v4, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCurrentVertexOffset:I

    invoke-virtual {v1, v3, v4}, Lcom/lge/gallery/vr/viewer/data/Point;->fill(Ljava/nio/FloatBuffer;I)V

    .line 137
    iget v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCurrentVertexOffset:I

    add-int/lit8 v3, v3, 0x3

    iput v3, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCurrentVertexOffset:I

    .line 138
    new-instance v2, Lcom/lge/gallery/vr/viewer/geometry/Vertex;

    iget v3, v1, Lcom/lge/gallery/vr/viewer/data/Point;->x:F

    iget v4, v1, Lcom/lge/gallery/vr/viewer/data/Point;->y:F

    iget v5, v1, Lcom/lge/gallery/vr/viewer/data/Point;->z:F

    invoke-direct {v2, v3, v4, v5}, Lcom/lge/gallery/vr/viewer/geometry/Vertex;-><init>(FFF)V

    .line 139
    .local v2, "vertex":Lcom/lge/gallery/vr/viewer/geometry/Vertex;
    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->normalize()F

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 141
    .end local v1    # "point":Lcom/lge/gallery/vr/viewer/data/Point;
    .end local v2    # "vertex":Lcom/lge/gallery/vr/viewer/geometry/Vertex;
    :cond_3f
    return-void
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 177
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 178
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->unload()V

    .line 179
    return-void
.end method

.method public getTextureId()I
    .registers 3

    .prologue
    .line 166
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0
.end method

.method public isLoaded(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)Z
    .registers 5
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    const/4 v1, 0x0

    .line 170
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 171
    .local v0, "canvasRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;>;"
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    aget v2, v2, v1

    if-lez v2, :cond_12

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_12

    const/4 v1, 0x1

    :cond_12
    return v1
.end method

.method public setAssociatedCanvas(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V
    .registers 3
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    .line 88
    if-nez p1, :cond_6

    const/4 v0, 0x0

    :goto_3
    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 91
    return-void

    .line 88
    :cond_6
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    goto :goto_3
.end method

.method public setTile(Lcom/lge/gallery/vr/viewer/data/Tile;)V
    .registers 2
    .param p1, "tile"    # Lcom/lge/gallery/vr/viewer/data/Tile;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

    .line 145
    return-void
.end method

.method public unload()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 159
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    aget v0, v0, v2

    if-lez v0, :cond_11

    .line 160
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 161
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    aput v2, v0, v2

    .line 163
    :cond_11
    return-void
.end method

.method public upload(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)I
    .registers 6
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    const/4 v3, 0x0

    .line 148
    invoke-virtual {p0, p1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->isLoaded(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)Z

    move-result v0

    if-nez v0, :cond_4a

    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

    if-eqz v0, :cond_4a

    .line 149
    invoke-virtual {p0, p1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->setAssociatedCanvas(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V

    .line 150
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/data/Tile;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->createTexture(Landroid/graphics/Bitmap;)I

    move-result v1

    aput v1, v0, v3

    .line 152
    const-string v0, "TiledTexture"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mPosition:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] is loaded."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :cond_4a
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->mTextureIds:[I

    aget v0, v0, v3

    return v0
.end method
