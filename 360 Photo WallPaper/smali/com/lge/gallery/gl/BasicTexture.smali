.class public abstract Lcom/lge/gallery/gl/BasicTexture;
.super Ljava/lang/Object;
.source "BasicTexture.java"

# interfaces
.implements Lcom/lge/gallery/gl/Texture;


# static fields
.field protected static final STATE_ERROR:I = -0x1

.field protected static final STATE_LOADED:I = 0x1

.field protected static final STATE_UNLOADED:I = 0x0

.field protected static final UNSPECIFIED:I = -0x1

.field private static sAllTextures:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/lge/gallery/gl/BasicTexture;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static sInFinalizer:Ljava/lang/ThreadLocal;


# instance fields
.field protected mCanvasRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lge/gallery/gl/GLCanvas;",
            ">;"
        }
    .end annotation
.end field

.field private mHasBorder:Z

.field protected mHeight:I

.field protected mId:I

.field protected mState:I

.field private mTextureHeight:I

.field private mTextureWidth:I

.field protected mWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/lge/gallery/gl/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    .line 48
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/lge/gallery/gl/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    return-void
.end method

.method protected constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/lge/gallery/gl/BasicTexture;-><init>(Lcom/lge/gallery/gl/GLCanvas;II)V

    .line 61
    return-void
.end method

.method protected constructor <init>(Lcom/lge/gallery/gl/GLCanvas;II)V
    .registers 7
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "id"    # I
    .param p3, "state"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mWidth:I

    .line 39
    iput v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mHeight:I

    .line 46
    iput-object v1, p0, Lcom/lge/gallery/gl/BasicTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 51
    invoke-virtual {p0, p1}, Lcom/lge/gallery/gl/BasicTexture;->setAssociatedCanvas(Lcom/lge/gallery/gl/GLCanvas;)V

    .line 52
    iput p2, p0, Lcom/lge/gallery/gl/BasicTexture;->mId:I

    .line 53
    iput p3, p0, Lcom/lge/gallery/gl/BasicTexture;->mState:I

    .line 54
    sget-object v1, Lcom/lge/gallery/gl/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter v1

    .line 55
    :try_start_15
    sget-object v0, Lcom/lge/gallery/gl/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    monitor-exit v1

    .line 57
    return-void

    .line 56
    :catchall_1d
    move-exception v0

    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_15 .. :try_end_1f} :catchall_1d

    throw v0
.end method

.method private freeResource()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 188
    iget-object v1, p0, Lcom/lge/gallery/gl/BasicTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 189
    .local v1, "canvasRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/lge/gallery/gl/GLCanvas;>;"
    if-nez v1, :cond_18

    move-object v0, v3

    .line 190
    .local v0, "canvas":Lcom/lge/gallery/gl/GLCanvas;
    :goto_6
    if-eqz v0, :cond_11

    invoke-virtual {p0, v0}, Lcom/lge/gallery/gl/BasicTexture;->isLoaded(Lcom/lge/gallery/gl/GLCanvas;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 191
    invoke-interface {v0, p0}, Lcom/lge/gallery/gl/GLCanvas;->unloadTexture(Lcom/lge/gallery/gl/BasicTexture;)Z

    .line 193
    :cond_11
    const/4 v2, 0x0

    iput v2, p0, Lcom/lge/gallery/gl/BasicTexture;->mState:I

    .line 194
    invoke-virtual {p0, v3}, Lcom/lge/gallery/gl/BasicTexture;->setAssociatedCanvas(Lcom/lge/gallery/gl/GLCanvas;)V

    .line 195
    return-void

    .line 189
    .end local v0    # "canvas":Lcom/lge/gallery/gl/GLCanvas;
    :cond_18
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/gl/GLCanvas;

    move-object v0, v2

    goto :goto_6
.end method

.method public static inFinalizer()Z
    .registers 1

    .prologue
    .line 209
    sget-object v0, Lcom/lge/gallery/gl/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static yieldAllTextures()V
    .registers 4

    .prologue
    .line 213
    sget-object v3, Lcom/lge/gallery/gl/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    monitor-enter v3

    .line 214
    :try_start_3
    sget-object v2, Lcom/lge/gallery/gl/BasicTexture;->sAllTextures:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/gl/BasicTexture;

    .line 215
    .local v1, "t":Lcom/lge/gallery/gl/BasicTexture;
    invoke-virtual {v1}, Lcom/lge/gallery/gl/BasicTexture;->yield()V

    goto :goto_d

    .line 217
    .end local v1    # "t":Lcom/lge/gallery/gl/BasicTexture;
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v2

    :cond_20
    :try_start_20
    monitor-exit v3
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1d

    .line 218
    return-void
.end method


# virtual methods
.method public draw(Lcom/lge/gallery/gl/GLCanvas;II)V
    .registers 10
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/lge/gallery/gl/BasicTexture;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/lge/gallery/gl/BasicTexture;->getHeight()I

    move-result v5

    move-object v0, p1

    move-object v1, p0

    move v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lcom/lge/gallery/gl/GLCanvas;->drawTexture(Lcom/lge/gallery/gl/BasicTexture;IIII)V

    .line 123
    return-void
.end method

.method public draw(Lcom/lge/gallery/gl/GLCanvas;IIII)V
    .registers 12
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 126
    move-object v0, p1

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/lge/gallery/gl/GLCanvas;->drawTexture(Lcom/lge/gallery/gl/BasicTexture;IIII)V

    .line 127
    return-void
.end method

.method public draw(Lcom/lge/gallery/gl/GLCanvas;IIIIF)V
    .registers 14
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "alpha"    # F

    .prologue
    .line 130
    move-object v0, p1

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/lge/gallery/gl/GLCanvas;->drawTexture(Lcom/lge/gallery/gl/BasicTexture;IIIIF)V

    .line 131
    return-void
.end method

.method public drawCropped(Lcom/lge/gallery/gl/GLCanvas;IIIIFFF)V
    .registers 9
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "croppedRatioX"    # F
    .param p7, "croppedRatioY"    # F
    .param p8, "scaleUpRatio"    # F

    .prologue
    .line 136
    return-void
.end method

.method public drawToSquare(Lcom/lge/gallery/gl/GLCanvas;IIIIF)V
    .registers 7
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "progress"    # F

    .prologue
    .line 152
    return-void
.end method

.method public drawToSquare(Lcom/lge/gallery/gl/GLCanvas;IIIIFF)V
    .registers 8
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "progress"    # F
    .param p7, "alpha"    # F

    .prologue
    .line 156
    return-void
.end method

.method protected finalize()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 199
    sget-object v0, Lcom/lge/gallery/gl/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    const-class v1, Lcom/lge/gallery/gl/BasicTexture;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 200
    invoke-virtual {p0}, Lcom/lge/gallery/gl/BasicTexture;->recycle()V

    .line 201
    sget-object v0, Lcom/lge/gallery/gl/BasicTexture;->sInFinalizer:Ljava/lang/ThreadLocal;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 202
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 203
    return-void
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mHeight:I

    return v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mId:I

    return v0
.end method

.method public getTextureHeight()I
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mTextureHeight:I

    return v0
.end method

.method public getTextureWidth()I
    .registers 2

    .prologue
    .line 94
    iget v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mTextureWidth:I

    return v0
.end method

.method public getUvBuffer()[I
    .registers 2

    .prologue
    .line 148
    const/4 v0, 0x0

    return-object v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mWidth:I

    return v0
.end method

.method public getXyBuffer()[I
    .registers 2

    .prologue
    .line 144
    const/4 v0, 0x0

    return-object v0
.end method

.method public hasBorder()Z
    .registers 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mHasBorder:Z

    return v0
.end method

.method public isLoaded()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 169
    iget v1, p0, Lcom/lge/gallery/gl/BasicTexture;->mState:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isLoaded(Lcom/lge/gallery/gl/GLCanvas;)Z
    .registers 5
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;

    .prologue
    const/4 v1, 0x1

    .line 163
    iget-object v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 164
    .local v0, "canvasRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/lge/gallery/gl/GLCanvas;>;"
    iget v2, p0, Lcom/lge/gallery/gl/BasicTexture;->mState:I

    if-ne v2, v1, :cond_10

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_10

    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public abstract onBind(Lcom/lge/gallery/gl/GLCanvas;)Z
.end method

.method public prepareCroppedBuffers(Lcom/lge/gallery/gl/GLCanvas;IIIIFFF)Z
    .registers 10
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "croppedRatioX"    # F
    .param p7, "croppedRatioY"    # F
    .param p8, "scaleUpRatio"    # F

    .prologue
    .line 140
    const/4 v0, 0x0

    return v0
.end method

.method public recycle()V
    .registers 1

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/lge/gallery/gl/BasicTexture;->freeResource()V

    .line 176
    return-void
.end method

.method protected setAssociatedCanvas(Lcom/lge/gallery/gl/GLCanvas;)V
    .registers 3
    .param p1, "canvas"    # Lcom/lge/gallery/gl/GLCanvas;

    .prologue
    .line 64
    if-nez p1, :cond_6

    const/4 v0, 0x0

    :goto_3
    iput-object v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mCanvasRef:Ljava/lang/ref/WeakReference;

    .line 67
    return-void

    .line 64
    :cond_6
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    goto :goto_3
.end method

.method protected setBorder(Z)V
    .registers 2
    .param p1, "hasBorder"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/lge/gallery/gl/BasicTexture;->mHasBorder:Z

    .line 119
    return-void
.end method

.method public setSize(II)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v1, 0x0

    .line 74
    iput p1, p0, Lcom/lge/gallery/gl/BasicTexture;->mWidth:I

    .line 75
    iput p2, p0, Lcom/lge/gallery/gl/BasicTexture;->mHeight:I

    .line 76
    if-lez p1, :cond_16

    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->nextPowerOf2(I)I

    move-result v0

    :goto_b
    iput v0, p0, Lcom/lge/gallery/gl/BasicTexture;->mTextureWidth:I

    .line 77
    if-lez p2, :cond_13

    invoke-static {p2}, Lcom/lge/gallery/common/Utils;->nextPowerOf2(I)I

    move-result v1

    :cond_13
    iput v1, p0, Lcom/lge/gallery/gl/BasicTexture;->mTextureHeight:I

    .line 78
    return-void

    :cond_16
    move v0, v1

    .line 76
    goto :goto_b
.end method

.method public yield()V
    .registers 1

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/lge/gallery/gl/BasicTexture;->freeResource()V

    .line 185
    return-void
.end method
