.class public abstract Lcom/lge/gallery/data/cache/AbstractImageCacheService;
.super Ljava/lang/Object;
.source "AbstractImageCacheService.java"

# interfaces
.implements Lcom/lge/gallery/data/cache/ImageCacheCoreService;


# static fields
.field public static final EXTRA_KEY_KAR:Ljava/lang/String; = "kar"

.field private static final TAG:Ljava/lang/String; = "AbstractImageCacheService"


# instance fields
.field private mCache:Lcom/lge/gallery/common/BlobCache;

.field private mCacheBuffer:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

.field private mCacheFileName:Ljava/lang/String;

.field private mCacheMaxBytes:I

.field private mCacheMaxEntries:I

.field private mCacheVersion:I

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;III)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "maxEnties"    # I
    .param p4, "maxBytes"    # I
    .param p5, "version"    # I

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {}, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->getInstance()Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheBuffer:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mContext:Landroid/content/Context;

    .line 41
    iput-object p2, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheFileName:Ljava/lang/String;

    .line 42
    iput p3, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheMaxEntries:I

    .line 43
    iput p4, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheMaxBytes:I

    .line 44
    iput p5, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheVersion:I

    .line 45
    return-void
.end method

.method private declared-synchronized getCache()Lcom/lge/gallery/common/BlobCache;
    .registers 6

    .prologue
    .line 48
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCache:Lcom/lge/gallery/common/BlobCache;

    if-nez v0, :cond_15

    .line 49
    iget-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheFileName:Ljava/lang/String;

    iget v2, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheMaxEntries:I

    iget v3, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheMaxBytes:I

    iget v4, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheVersion:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/lge/gallery/util/CacheManager;->getCache(Landroid/content/Context;Ljava/lang/String;III)Lcom/lge/gallery/common/BlobCache;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCache:Lcom/lge/gallery/common/BlobCache;

    .line 52
    :cond_15
    iget-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCache:Lcom/lge/gallery/common/BlobCache;
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_19

    monitor-exit p0

    return-object v0

    .line 48
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getImageDataCached([BZ)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 14
    .param p1, "key"    # [B
    .param p2, "useThumbnailPool"    # Z

    .prologue
    const/4 v7, 0x0

    .line 82
    invoke-direct {p0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getCache()Lcom/lge/gallery/common/BlobCache;

    move-result-object v0

    .line 83
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    if-eqz v0, :cond_9

    if-nez p1, :cond_12

    .line 84
    :cond_9
    const-string v8, "AbstractImageCacheService"

    const-string v9, "Don\'t use cache data in getImageData()."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v7

    .line 119
    :cond_11
    :goto_11
    return-object v5

    .line 87
    :cond_12
    if-eqz p2, :cond_21

    iget-object v8, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheBuffer:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    invoke-virtual {v8}, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->getThumbnailPool()Lcom/lge/gallery/data/cache/ImageDataPool;

    move-result-object v1

    .line 89
    .local v1, "dataPool":Lcom/lge/gallery/data/cache/ImageDataPool;
    :goto_1a
    if-nez v1, :cond_28

    .line 90
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataNotCached([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v5

    goto :goto_11

    .line 87
    .end local v1    # "dataPool":Lcom/lge/gallery/data/cache/ImageDataPool;
    :cond_21
    iget-object v8, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheBuffer:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    invoke-virtual {v8}, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->getScreennailPool()Lcom/lge/gallery/data/cache/ImageDataPool;

    move-result-object v1

    goto :goto_1a

    .line 92
    .restart local v1    # "dataPool":Lcom/lge/gallery/data/cache/ImageDataPool;
    :cond_28
    invoke-virtual {v1}, Lcom/lge/gallery/data/cache/ImageDataPool;->get()Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v5

    .line 93
    .local v5, "imageData":Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->crc64Long([B)J

    move-result-wide v2

    .line 94
    .local v2, "cacheKey":J
    new-instance v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;

    invoke-direct {v6}, Lcom/lge/gallery/common/BlobCache$LookupRequest;-><init>()V

    .line 95
    .local v6, "request":Lcom/lge/gallery/common/BlobCache$LookupRequest;
    iput-wide v2, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    .line 96
    iget-object v8, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    iput-object v8, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    .line 98
    :try_start_3b
    monitor-enter v0
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_3c} :catch_82

    .line 99
    :try_start_3c
    invoke-virtual {v0, v6}, Lcom/lge/gallery/common/BlobCache;->lookup(Lcom/lge/gallery/common/BlobCache$LookupRequest;)Z

    move-result v8

    if-nez v8, :cond_48

    .line 100
    invoke-virtual {v1, v5}, Lcom/lge/gallery/data/cache/ImageDataPool;->recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V

    .line 101
    monitor-exit v0

    move-object v5, v7

    goto :goto_11

    .line 103
    :cond_48
    monitor-exit v0
    :try_end_49
    .catchall {:try_start_3c .. :try_end_49} :catchall_8f

    .line 104
    :try_start_49
    iget-object v8, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    invoke-static {p1, v8}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->isSameKey([B[B)Z

    move-result v8

    if-eqz v8, :cond_8a

    .line 105
    array-length v8, p1

    iput v8, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    .line 106
    iget v8, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->length:I

    iget v9, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    sub-int/2addr v8, v9

    iput v8, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    .line 107
    iget-object v8, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    array-length v8, v8

    iget-object v9, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    array-length v9, v9

    if-ge v8, v9, :cond_11

    .line 108
    iget-object v8, v6, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    iput-object v8, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    .line 109
    const-string v8, "AbstractImageCacheService"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[Buffer exceeded] new buffer is allocated = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v5, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_81} :catch_82

    goto :goto_11

    .line 114
    :catch_82
    move-exception v4

    .line 116
    .local v4, "ex":Ljava/io/IOException;
    const-string v8, "AbstractImageCacheService"

    const-string v9, "Something\'s wrong with getting cache."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .end local v4    # "ex":Ljava/io/IOException;
    :cond_8a
    invoke-virtual {v1, v5}, Lcom/lge/gallery/data/cache/ImageDataPool;->recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V

    move-object v5, v7

    .line 119
    goto :goto_11

    .line 103
    :catchall_8f
    move-exception v8

    :try_start_90
    monitor-exit v0
    :try_end_91
    .catchall {:try_start_90 .. :try_end_91} :catchall_8f

    :try_start_91
    throw v8
    :try_end_92
    .catch Ljava/io/IOException; {:try_start_91 .. :try_end_92} :catch_82
.end method

.method private getImageDataNotCached([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 11
    .param p1, "key"    # [B

    .prologue
    const/4 v6, 0x0

    .line 123
    invoke-direct {p0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getCache()Lcom/lge/gallery/common/BlobCache;

    move-result-object v0

    .line 124
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    if-eqz v0, :cond_9

    if-nez p1, :cond_11

    .line 125
    :cond_9
    const-string v7, "AbstractImageCacheService"

    const-string v8, "Don\'t use cache data in getImageData()."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_10
    :goto_10
    return-object v6

    .line 128
    :cond_11
    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->crc64Long([B)J

    move-result-wide v2

    .line 130
    .local v2, "cacheKey":J
    const/4 v5, 0x0

    .line 131
    .local v5, "value":[B
    :try_start_16
    monitor-enter v0
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_17} :catch_31

    .line 132
    :try_start_17
    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/common/BlobCache;->lookup(J)[B

    move-result-object v5

    .line 133
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_17 .. :try_end_1c} :catchall_2e

    .line 134
    if-eqz v5, :cond_10

    .line 137
    :try_start_1e
    invoke-static {p1, v5}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->isSameKey([B[B)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 138
    array-length v4, p1

    .line 139
    .local v4, "offset":I
    new-instance v7, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    array-length v8, v5

    sub-int/2addr v8, v4

    invoke-direct {v7, v5, v4, v8}, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;-><init>([BII)V
    :try_end_2c
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_2c} :catch_31

    move-object v6, v7

    goto :goto_10

    .line 133
    .end local v4    # "offset":I
    :catchall_2e
    move-exception v7

    :try_start_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2e

    :try_start_30
    throw v7
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_31} :catch_31

    .line 141
    :catch_31
    move-exception v1

    .line 143
    .local v1, "ex":Ljava/io/IOException;
    const-string v7, "AbstractImageCacheService"

    const-string v8, "Something\'s wrong with getting cache."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10
.end method

.method private static isSameKey([B[B)Z
    .registers 7
    .param p0, "key"    # [B
    .param p1, "buffer"    # [B

    .prologue
    const/4 v2, 0x0

    .line 149
    array-length v1, p0

    .line 150
    .local v1, "n":I
    array-length v3, p1

    if-ge v3, v1, :cond_6

    .line 158
    :cond_5
    :goto_5
    return v2

    .line 153
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_12

    .line 154
    aget-byte v3, p0, v0

    aget-byte v4, p1, v0

    if-ne v3, v4, :cond_5

    .line 153
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 158
    :cond_12
    const/4 v2, 0x1

    goto :goto_5
.end method


# virtual methods
.method public clearCache()V
    .registers 3

    .prologue
    .line 188
    iget-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheFileName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/lge/gallery/util/CacheManager;->removeCache(Landroid/content/Context;Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "kind"    # I
    .param p4, "size"    # I

    .prologue
    .line 65
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImageData([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 3
    .param p1, "key"    # [B

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataUsingThumbnailPool([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public getImageDataUsingScreennailPool([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 3
    .param p1, "key"    # [B

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataCached([BZ)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public getImageDataUsingThumbnailPool([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 3
    .param p1, "key"    # [B

    .prologue
    .line 74
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataCached([BZ)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public putImageData([B[B)V
    .registers 10
    .param p1, "key"    # [B
    .param p2, "value"    # [B

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getCache()Lcom/lge/gallery/common/BlobCache;

    move-result-object v1

    .line 168
    .local v1, "cache":Lcom/lge/gallery/common/BlobCache;
    if-eqz v1, :cond_8

    if-nez p1, :cond_10

    .line 169
    :cond_8
    const-string v5, "AbstractImageCacheService"

    const-string v6, "Don\'t use cache data in putImageData()."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :goto_f
    return-void

    .line 172
    :cond_10
    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->crc64Long([B)J

    move-result-wide v2

    .line 173
    .local v2, "cacheKey":J
    array-length v5, p1

    array-length v6, p2

    add-int/2addr v5, v6

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 174
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 175
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 176
    monitor-enter v1

    .line 178
    :try_start_22
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v1, v2, v3, v5}, Lcom/lge/gallery/common/BlobCache;->insert(J[B)V
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_29} :catch_2e
    .catchall {:try_start_22 .. :try_end_29} :catchall_2b

    .line 183
    :goto_29
    :try_start_29
    monitor-exit v1

    goto :goto_f

    :catchall_2b
    move-exception v5

    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_29 .. :try_end_2d} :catchall_2b

    throw v5

    .line 179
    :catch_2e
    move-exception v4

    .line 181
    .local v4, "ex":Ljava/io/IOException;
    :try_start_2f
    const-string v5, "AbstractImageCacheService"

    const-string v6, "Failed to insert cache data."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_36
    .catchall {:try_start_2f .. :try_end_36} :catchall_2b

    goto :goto_29
.end method

.method public recycleImageData(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V
    .registers 3
    .param p1, "data"    # Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->mCacheBuffer:Lcom/lge/gallery/data/cache/ImageCacheBufferManager;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/data/cache/ImageCacheBufferManager;->recycle(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V

    .line 193
    return-void
.end method

.method public setCacheStateChangedListener(Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getCache()Lcom/lge/gallery/common/BlobCache;

    move-result-object v0

    .line 57
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    if-nez v0, :cond_7

    .line 61
    :goto_6
    return-void

    .line 60
    :cond_7
    invoke-virtual {v0, p1}, Lcom/lge/gallery/common/BlobCache;->setStateChangedListener(Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;)V

    goto :goto_6
.end method

.method public storeCachedBitmap(Landroid/graphics/Bitmap;Lcom/lge/gallery/data/core/Path;I)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I

    .prologue
    .line 163
    return-void
.end method
