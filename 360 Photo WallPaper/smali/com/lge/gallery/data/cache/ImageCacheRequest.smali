.class public abstract Lcom/lge/gallery/data/cache/ImageCacheRequest;
.super Ljava/lang/Object;
.source "ImageCacheRequest.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/ThreadPool$Job",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageCacheRequest"

.field private static final USE_LARGE_SCREENNAIL:Z


# instance fields
.field protected mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field protected mCachekey:[B

.field protected mLocalImagePath:Ljava/lang/String;

.field protected mMediaType:I

.field protected mPath:Lcom/lge/gallery/data/core/Path;

.field protected mTargetSize:I

.field protected mType:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 43
    invoke-static {}, Lcom/lge/gallery/util/ThumbnailUtil;->getLargeScreenNailSize()I

    move-result v0

    const/16 v1, 0x280

    if-le v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->USE_LARGE_SCREENNAIL:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;III)V
    .registers 7
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "targetSize"    # I
    .param p5, "mediaType"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mLocalImagePath:Ljava/lang/String;

    .line 48
    iput-object p1, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 49
    iput-object p2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mPath:Lcom/lge/gallery/data/core/Path;

    .line 50
    iput p3, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    .line 51
    iput p4, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mTargetSize:I

    .line 52
    iput p5, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mMediaType:I

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;II)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "type"    # I
    .param p3, "targetSize"    # I

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mLocalImagePath:Ljava/lang/String;

    .line 152
    iput-object p1, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mPath:Lcom/lge/gallery/data/core/Path;

    .line 153
    iput p2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    .line 154
    iput p3, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mTargetSize:I

    .line 155
    return-void
.end method

.method private clearBitmapIfNeeded(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 120
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_b

    .line 121
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 123
    :cond_b
    return-void
.end method

.method private decodeFromOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/cache/ImageCacheService;)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "cacheService"    # Lcom/lge/gallery/data/cache/ImageCacheService;

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 74
    iget v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    invoke-virtual {p0, p1, v2}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->onDecodeOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 75
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_10

    if-nez v0, :cond_3e

    .line 76
    :cond_10
    invoke-direct {p0, v0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->clearBitmapIfNeeded(Landroid/graphics/Bitmap;)V

    .line 77
    const-string v2, "ImageCacheRequest"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decode orig failed [Canceled = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->generateDebugTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :goto_3d
    return-object v1

    .line 82
    :cond_3e
    iget v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_53

    .line 83
    iget v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mTargetSize:I

    invoke-static {v0, v2, v4}, Lcom/lge/gallery/common/BitmapUtils;->resizeDownAndCropCenter(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 89
    :goto_49
    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 90
    invoke-direct {p0, v0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->clearBitmapIfNeeded(Landroid/graphics/Bitmap;)V

    goto :goto_3d

    .line 86
    :cond_53
    iget v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mTargetSize:I

    invoke-static {v0, v2, v4}, Lcom/lge/gallery/common/BitmapUtils;->resizeDownBySideLength(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_49

    .line 93
    :cond_5a
    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->isNeedToCache(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_62

    move-object v1, v0

    .line 94
    goto :goto_3d

    .line 96
    :cond_62
    iget-object v1, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mPath:Lcom/lge/gallery/data/core/Path;

    iget v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    invoke-interface {p2, v0, v1, v2}, Lcom/lge/gallery/data/cache/ImageCacheService;->storeCachedBitmap(Landroid/graphics/Bitmap;Lcom/lge/gallery/data/core/Path;I)V

    move-object v1, v0

    .line 97
    goto :goto_3d
.end method

.method private generateDebugTag()Ljava/lang/String;
    .registers 5

    .prologue
    .line 101
    iget v0, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    .line 102
    .local v0, "imageType":I
    const-string v1, "UNKNOWN"

    .line 103
    .local v1, "typeStr":Ljava/lang/String;
    packed-switch v0, :pswitch_data_2a

    .line 116
    :goto_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mPath:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 105
    :pswitch_21
    const-string v1, "MICROTHUMB"

    .line 106
    goto :goto_7

    .line 108
    :pswitch_24
    const-string v1, "THUMB"

    .line 109
    goto :goto_7

    .line 111
    :pswitch_27
    const-string v1, "LARGETHUMB"

    .line 112
    goto :goto_7

    .line 103
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_24
        :pswitch_21
        :pswitch_27
    .end packed-switch
.end method


# virtual methods
.method protected isNeedToCache(Landroid/graphics/Bitmap;)Z
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 126
    iget v6, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_9

    move v4, v5

    .line 146
    :cond_8
    :goto_8
    return v4

    .line 130
    :cond_9
    const/4 v3, 0x0

    .line 131
    .local v3, "targetSize":I
    iget v6, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    if-ne v6, v5, :cond_3a

    .line 132
    sget-boolean v6, Lcom/lge/gallery/data/cache/ImageCacheRequest;->USE_LARGE_SCREENNAIL:Z

    if-eqz v6, :cond_37

    move v3, v4

    .line 136
    :cond_13
    :goto_13
    if-eqz v3, :cond_35

    iget-object v6, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mLocalImagePath:Ljava/lang/String;

    if-eqz v6, :cond_35

    .line 137
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 138
    .local v2, "option":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v5, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 139
    iget-object v6, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mLocalImagePath:Ljava/lang/String;

    invoke-static {v6, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 140
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 141
    .local v1, "bitmapWidth":I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 142
    .local v0, "bitmapHeight":I
    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-ne v6, v1, :cond_35

    iget v6, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-eq v6, v0, :cond_8

    .end local v0    # "bitmapHeight":I
    .end local v1    # "bitmapWidth":I
    .end local v2    # "option":Landroid/graphics/BitmapFactory$Options;
    :cond_35
    move v4, v5

    .line 146
    goto :goto_8

    .line 132
    :cond_37
    const/16 v3, 0x280

    goto :goto_13

    .line 133
    :cond_3a
    iget v6, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_13

    .line 134
    invoke-static {}, Lcom/lge/gallery/util/ThumbnailUtil;->getLargeScreenNailSize()I

    move-result v3

    goto :goto_13
.end method

.method public abstract onDecodeOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;I)Landroid/graphics/Bitmap;
.end method

.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    const/4 v7, 0x0

    .line 56
    iget-object v1, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getImageCacheService()Lcom/lge/gallery/data/cache/ImageCacheService;

    move-result-object v0

    .line 57
    .local v0, "cacheService":Lcom/lge/gallery/data/cache/ImageCacheService;
    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_f

    move-object v6, v7

    .line 70
    :cond_e
    :goto_e
    return-object v6

    .line 60
    :cond_f
    iget-object v2, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mPath:Lcom/lge/gallery/data/core/Path;

    iget v3, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mType:I

    iget v4, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mTargetSize:I

    iget-object v5, p0, Lcom/lge/gallery/data/cache/ImageCacheRequest;->mCachekey:[B

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/lge/gallery/data/cache/ImageCacheService;->getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 61
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    if-nez v6, :cond_e

    .line 64
    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_53

    .line 65
    invoke-direct {p0, v6}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->clearBitmapIfNeeded(Landroid/graphics/Bitmap;)V

    .line 66
    const-string v1, "ImageCacheRequest"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "decode cached failed [Canceled = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->generateDebugTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v6, v7

    .line 68
    goto :goto_e

    .line 70
    :cond_53
    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->decodeFromOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/cache/ImageCacheService;)Landroid/graphics/Bitmap;

    move-result-object v6

    goto :goto_e
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/cache/ImageCacheRequest;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
