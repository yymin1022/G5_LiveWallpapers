.class public Lcom/lge/gallery/data/cache/ImageDataPool;
.super Ljava/lang/Object;
.source "ImageDataPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/cache/ImageDataPool$1;,
        Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    }
.end annotation


# instance fields
.field private final mBufferSize:I

.field private final mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;",
            ">;"
        }
    .end annotation
.end field

.field private final mPoolSize:I


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "poolSize"    # I
    .param p2, "bufferSize"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    .line 37
    iput p1, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mPoolSize:I

    .line 38
    iput p2, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mBufferSize:I

    .line 39
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 61
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 62
    monitor-exit p0

    return-void

    .line 61
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get()Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 5

    .prologue
    .line 42
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 43
    .local v0, "size":I
    if-lez v0, :cond_15

    .line 44
    iget-object v1, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_1e

    .line 46
    :goto_13
    monitor-exit p0

    return-object v1

    :cond_15
    :try_start_15
    new-instance v1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    iget v2, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mBufferSize:I

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;-><init>(ILcom/lge/gallery/data/cache/ImageDataPool$1;)V
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1e

    goto :goto_13

    .line 42
    .end local v0    # "size":I
    :catchall_1e
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V
    .registers 4
    .param p1, "data"    # Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    .prologue
    .line 50
    monitor-enter p0

    if-eqz p1, :cond_a

    :try_start_3
    iget-object v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    array-length v0, v0

    iget v1, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mBufferSize:I
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_22

    if-eq v0, v1, :cond_c

    .line 58
    :cond_a
    :goto_a
    monitor-exit p0

    return-void

    .line 53
    :cond_c
    :try_start_c
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mPoolSize:I

    if-ge v0, v1, :cond_a

    .line 54
    const/4 v0, 0x0

    iput v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    .line 55
    const/4 v0, 0x0

    iput v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    .line 56
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageDataPool;->mList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_21
    .catchall {:try_start_c .. :try_end_21} :catchall_22

    goto :goto_a

    .line 50
    :catchall_22
    move-exception v0

    monitor-exit p0

    throw v0
.end method
