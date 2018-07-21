.class public Lcom/lge/gallery/data/cache/ImageCacheBufferManager;
.super Ljava/lang/Object;
.source "ImageCacheBufferManager.java"


# static fields
.field private static final LARGE_DATA_SIZE:I = 0x96000

.field private static final LARGE_POOL_SIZE:I = 0x2

.field private static final SMALL_DATA_SIZE:I = 0x19000

.field private static final SMALL_POOL_SIZE:I = 0x8

.field private static final USE_DATA_POOL:Z = true

.field private static sInstance:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;


# instance fields
.field private final screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

.field private final thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;


# direct methods
.method private constructor <init>()V
    .registers 4

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/lge/gallery/data/cache/ImageDataPool;

    const/16 v1, 0x8

    const v2, 0x19000

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/data/cache/ImageDataPool;-><init>(II)V

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    .line 30
    new-instance v0, Lcom/lge/gallery/data/cache/ImageDataPool;

    const/4 v1, 0x2

    const v2, 0x96000

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/data/cache/ImageDataPool;-><init>(II)V

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    .line 35
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/lge/gallery/data/cache/ImageCacheBufferManager;
    .registers 2

    .prologue
    .line 38
    const-class v1, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->sInstance:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    if-nez v0, :cond_e

    .line 39
    new-instance v0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    invoke-direct {v0}, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;-><init>()V

    sput-object v0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->sInstance:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    .line 41
    :cond_e
    sget-object v0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->sInstance:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 38
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 59
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    if-eqz v0, :cond_a

    .line 60
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/cache/ImageDataPool;->clear()V

    .line 62
    :cond_a
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    if-eqz v0, :cond_13

    .line 63
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/cache/ImageDataPool;->clear()V
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_15

    .line 65
    :cond_13
    monitor-exit p0

    return-void

    .line 59
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getScreennailPool()Lcom/lge/gallery/data/cache/ImageDataPool;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    return-object v0
.end method

.method public getThumbnailPool()Lcom/lge/gallery/data/cache/ImageDataPool;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    return-object v0
.end method

.method public declared-synchronized recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V
    .registers 4
    .param p1, "data"    # Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    .prologue
    .line 45
    monitor-enter p0

    if-eqz p1, :cond_7

    :try_start_3
    iget-object v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_17

    if-nez v0, :cond_9

    .line 53
    :cond_7
    :goto_7
    monitor-exit p0

    return-void

    .line 48
    :cond_9
    :try_start_9
    iget-object v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    array-length v0, v0

    const v1, 0x19000

    if-ne v0, v1, :cond_1a

    .line 49
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->thumbnailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/data/cache/ImageDataPool;->recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_17

    goto :goto_7

    .line 45
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0

    .line 50
    :cond_1a
    :try_start_1a
    iget-object v0, p1, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    array-length v0, v0

    const v1, 0x96000

    if-ne v0, v1, :cond_7

    .line 51
    iget-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->screennailImageDataPool:Lcom/lge/gallery/data/cache/ImageDataPool;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/data/cache/ImageDataPool;->recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V
    :try_end_27
    .catchall {:try_start_1a .. :try_end_27} :catchall_17

    goto :goto_7
.end method
