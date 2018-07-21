.class public Lcom/lge/gallery/data/util/ByteCountBitmapPool;
.super Ljava/lang/Object;
.source "ByteCountBitmapPool.java"


# static fields
.field private static final DEBUG:Z = true


# instance fields
.field private final mAllocatedByteCount:I

.field private final mConfig:Landroid/graphics/Bitmap$Config;

.field private final mHeight:I

.field private mNotReusedCounter:I

.field private final mPool:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final mPoolLimit:I

.field private mReusedCounter:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(IILandroid/graphics/Bitmap$Config;I)V
    .registers 7
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "config"    # Landroid/graphics/Bitmap$Config;
    .param p4, "poolLimit"    # I

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mReusedCounter:I

    .line 31
    iput v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mNotReusedCounter:I

    .line 34
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p4}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    .line 35
    iput p4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPoolLimit:I

    .line 36
    iput p1, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mWidth:I

    .line 37
    iput p2, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mHeight:I

    .line 38
    iput-object p3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mConfig:Landroid/graphics/Bitmap$Config;

    .line 39
    mul-int v0, p1, p2

    invoke-static {p3}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->getByteCount(Landroid/graphics/Bitmap$Config;)I

    move-result v1

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mAllocatedByteCount:I

    .line 40
    return-void
.end method

.method private static getByteCount(Landroid/graphics/Bitmap$Config;)I
    .registers 5
    .param p0, "config"    # Landroid/graphics/Bitmap$Config;

    .prologue
    const/4 v0, 0x4

    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 86
    if-nez p0, :cond_6

    .line 98
    :cond_5
    :goto_5
    return v0

    .line 89
    :cond_6
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-eq p0, v3, :cond_5

    .line 91
    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-ne p0, v0, :cond_10

    move v0, v1

    .line 92
    goto :goto_5

    .line 93
    :cond_10
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    if-ne p0, v0, :cond_16

    move v0, v1

    .line 94
    goto :goto_5

    .line 95
    :cond_16
    sget-object v0, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne p0, v0, :cond_1c

    move v0, v2

    .line 96
    goto :goto_5

    :cond_1c
    move v0, v2

    .line 98
    goto :goto_5
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 79
    return-void
.end method

.method public get()Landroid/graphics/Bitmap;
    .registers 7

    .prologue
    .line 43
    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPoolLimit:I

    if-nez v3, :cond_6

    .line 44
    const/4 v1, 0x0

    .line 63
    :cond_5
    :goto_5
    return-object v1

    .line 46
    :cond_6
    const/4 v1, 0x0

    .line 47
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    iget-object v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2a

    .line 48
    iget-object v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    monitor-enter v4

    .line 49
    :try_start_12
    iget-object v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 50
    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/graphics/Bitmap;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 51
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Landroid/graphics/Bitmap;

    move-object v1, v0

    .line 52
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 54
    :cond_29
    monitor-exit v4
    :try_end_2a
    .catchall {:try_start_12 .. :try_end_2a} :catchall_3f

    .line 57
    .end local v2    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/graphics/Bitmap;>;"
    :cond_2a
    if-nez v1, :cond_42

    .line 58
    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mNotReusedCounter:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mNotReusedCounter:I

    .line 63
    :goto_32
    if-nez v1, :cond_5

    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mWidth:I

    iget v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mHeight:I

    iget-object v5, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mConfig:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_5

    .line 54
    :catchall_3f
    move-exception v3

    :try_start_40
    monitor-exit v4
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw v3

    .line 60
    :cond_42
    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mReusedCounter:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mReusedCounter:I

    goto :goto_32
.end method

.method public getAllocatedByteCount()I
    .registers 2

    .prologue
    .line 82
    iget v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mAllocatedByteCount:I

    return v0
.end method

.method public put(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 67
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 75
    :cond_8
    :goto_8
    return-void

    .line 70
    :cond_9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mAllocatedByteCount:I

    if-ne v0, v1, :cond_8

    iget-object v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPoolLimit:I

    if-ge v0, v1, :cond_8

    .line 74
    iget-object v0, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mPool:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 106
    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mReusedCounter:I

    iget v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mNotReusedCounter:I

    add-int v2, v3, v4

    .line 107
    .local v2, "total":I
    if-nez v2, :cond_52

    const/4 v1, 0x0

    .line 108
    .local v1, "rate":F
    :goto_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v3, "Width = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mWidth:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Height = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mHeight:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Config = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mConfig:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Reusable rate = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 107
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "rate":F
    :cond_52
    iget v3, p0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->mReusedCounter:I

    int-to-float v3, v3

    int-to-float v4, v2

    div-float v1, v3, v4

    goto :goto_9
.end method
