.class public Lcom/lge/gallery/data/cache/FacadeImageCacheService;
.super Ljava/lang/Object;
.source "FacadeImageCacheService.java"

# interfaces
.implements Lcom/lge/gallery/data/cache/ImageCacheService;


# instance fields
.field private mLocalScreennailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

.field private mLocalThumbnailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

.field private mOscImageCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->getLocalCacheService(Landroid/content/Context;I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mLocalThumbnailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    .line 34
    const/4 v0, 0x3

    invoke-static {p1, v0}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->getLocalCacheService(Landroid/content/Context;I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mLocalScreennailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    .line 36
    invoke-static {p1}, Lcom/lge/gallery/data/cache/OscImageCacheService;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/OscImageCacheService;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mOscImageCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    .line 37
    return-void
.end method

.method private chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 75
    packed-switch p1, :pswitch_data_a

    .line 81
    iget-object v0, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mLocalScreennailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    :goto_5
    return-object v0

    .line 77
    :pswitch_6
    iget-object v0, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mLocalThumbnailCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    goto :goto_5

    .line 75
    nop

    :pswitch_data_a
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method private decodeUsingPool(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "kind"    # I
    .param p4, "targetSize"    # I
    .param p5, "cachekey"    # [B

    .prologue
    .line 52
    if-eqz p5, :cond_5

    array-length v4, p5

    if-nez v4, :cond_9

    .line 53
    :cond_5
    invoke-static {p2, p3}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;I)[B

    move-result-object p5

    .line 55
    :cond_9
    invoke-direct {p0, p2, p3, p5}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->getImageDataInternal(Lcom/lge/gallery/data/core/Path;I[B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v2

    .line 56
    .local v2, "data":Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    const/4 v0, 0x0

    .line 57
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v2, :cond_3d

    .line 58
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 59
    .local v3, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 60
    invoke-static {p4}, Lcom/lge/gallery/data/util/BitmapPoolSelector;->getBitmapPool(I)Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    move-result-object v1

    .line 61
    .local v1, "bitmapPool":Lcom/lge/gallery/data/util/ByteCountBitmapPool;
    invoke-virtual {v1}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->get()Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 62
    iget-object v4, v2, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    iget v5, v2, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    iget v6, v2, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    invoke-static {p1, v4, v5, v6, v3}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 64
    iget-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_3d

    iget-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eq v4, v0, :cond_3d

    .line 65
    iget-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v4}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->put(Landroid/graphics/Bitmap;)V

    .line 66
    const/4 v4, 0x0

    iput-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 69
    .end local v1    # "bitmapPool":Lcom/lge/gallery/data/util/ByteCountBitmapPool;
    .end local v3    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_3d
    invoke-direct {p0, p3}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->recycleImageData(Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;)V

    .line 70
    return-object v0
.end method

.method private getImageDataInternal(Lcom/lge/gallery/data/core/Path;I[B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "kind"    # I
    .param p3, "cachekey"    # [B

    .prologue
    .line 86
    const/4 v1, 0x0

    .line 87
    .local v1, "useThumbnailBufferPool":Z
    move v0, p2

    .line 88
    .local v0, "imageType":I
    packed-switch v0, :pswitch_data_1c

    .line 95
    const/4 v1, 0x0

    .line 98
    :goto_6
    if-eqz v1, :cond_13

    invoke-direct {p0, p2}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataUsingThumbnailPool([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v2

    :goto_10
    return-object v2

    .line 91
    :pswitch_11
    const/4 v1, 0x1

    .line 92
    goto :goto_6

    .line 98
    :cond_13
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageDataUsingScreennailPool([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v2

    goto :goto_10

    .line 88
    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_11
        :pswitch_11
    .end packed-switch
.end method


# virtual methods
.method public getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "kind"    # I
    .param p4, "size"    # I

    .prologue
    .line 42
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->decodeUsingPool(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "kind"    # I
    .param p4, "size"    # I
    .param p5, "cachekey"    # [B

    .prologue
    .line 47
    invoke-direct/range {p0 .. p5}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->decodeUsingPool(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCloudImageData(Lcom/lge/gallery/data/core/Path;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I

    .prologue
    .line 143
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->getCloudImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public getCloudImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "exKey"    # Ljava/lang/String;

    .prologue
    .line 148
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImageData(Lcom/lge/gallery/data/core/Path;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->getImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public getImageData(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaItemInfo;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "mediaItemInfo"    # Lcom/lge/gallery/data/core/MediaItemInfo;
    .param p3, "type"    # I

    .prologue
    .line 118
    invoke-direct {p0, p3}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v0

    invoke-static {p1, p2, p3}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKeyByMediaInfo(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaItemInfo;I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageData([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v0

    return-object v0
.end method

.method public getImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "exKey"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {p1, p2}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;I)[B

    move-result-object v0

    .line 111
    .local v0, "key":[B
    if-eqz p3, :cond_a

    .line 112
    invoke-static {v0, p3}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->appendExtraKey([BLjava/lang/String;)[B

    move-result-object v0

    .line 114
    :cond_a
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageData([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v1

    return-object v1
.end method

.method public getOscImageData(Ljava/lang/String;Ljava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p1, p2}, Lcom/lge/gallery/data/cache/OscImageCacheService;->makeKey(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 164
    .local v0, "key":[B
    iget-object v1, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mOscImageCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    invoke-virtual {v1, v0}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->getImageData([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v1

    return-object v1
.end method

.method public getSmallThumbImageData(Ljava/lang/String;J)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "timestamp"    # J

    .prologue
    .line 176
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTimestampImageData(Lcom/lge/gallery/data/core/Path;IIJ)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "col"    # I
    .param p3, "total"    # I
    .param p4, "version"    # J

    .prologue
    .line 185
    const/4 v0, 0x0

    return-object v0
.end method

.method public putCloudImageData(Lcom/lge/gallery/data/core/Path;I[B)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "value"    # [B

    .prologue
    .line 153
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->putCloudImageDataEx(Lcom/lge/gallery/data/core/Path;I[BLjava/lang/String;)V

    .line 154
    return-void
.end method

.method public putCloudImageDataEx(Lcom/lge/gallery/data/core/Path;I[BLjava/lang/String;)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "value"    # [B
    .param p4, "exKey"    # Ljava/lang/String;

    .prologue
    .line 158
    return-void
.end method

.method public putImageData(Lcom/lge/gallery/data/core/Path;I[B)V
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "value"    # [B

    .prologue
    .line 128
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v0

    invoke-static {p1, p2}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;I)[B

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->putImageData([B[B)V

    .line 129
    return-void
.end method

.method public putImageDataEx(Lcom/lge/gallery/data/core/Path;I[BLjava/lang/String;)V
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "value"    # [B
    .param p4, "exKey"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-static {p1, p2}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;I)[B

    move-result-object v0

    .line 134
    .local v0, "key":[B
    if-eqz p4, :cond_a

    .line 135
    invoke-static {v0, p4}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->appendExtraKey([BLjava/lang/String;)[B

    move-result-object v0

    .line 137
    :cond_a
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->chooseLocalCache(I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    move-result-object v1

    invoke-virtual {v1, v0, p3}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->putImageData([B[B)V

    .line 138
    return-void
.end method

.method public putOscImageData(Ljava/lang/String;Ljava/lang/String;[B)V
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "deviceId"    # Ljava/lang/String;
    .param p3, "value"    # [B

    .prologue
    .line 169
    invoke-static {p1, p2}, Lcom/lge/gallery/data/cache/OscImageCacheService;->makeKey(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 170
    .local v0, "key":[B
    iget-object v1, p0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->mOscImageCache:Lcom/lge/gallery/data/cache/AbstractImageCacheService;

    invoke-virtual {v1, v0, p3}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;->putImageData([B[B)V

    .line 171
    return-void
.end method

.method public putSmallThumbImageData(Ljava/lang/String;J[B)V
    .registers 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "timestamp"    # J
    .param p4, "value"    # [B

    .prologue
    .line 181
    return-void
.end method

.method public putTimestampImageData(Lcom/lge/gallery/data/core/Path;IIJ[B)V
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "col"    # I
    .param p3, "total"    # I
    .param p4, "version"    # J
    .param p6, "value"    # [B

    .prologue
    .line 190
    return-void
.end method

.method public storeCachedBitmap(Landroid/graphics/Bitmap;Lcom/lge/gallery/data/core/Path;I)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I

    .prologue
    .line 123
    invoke-static {p1}, Lcom/lge/gallery/common/BitmapUtils;->compressBitmap(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    invoke-virtual {p0, p2, p3, v0}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;->putImageData(Lcom/lge/gallery/data/core/Path;I[B)V

    .line 124
    return-void
.end method
