.class public Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;
.super Lcom/lge/gallery/data/cache/ImageCacheRequest;
.source "LocalVideo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/LocalVideo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalVideoRequest"
.end annotation


# static fields
.field private static final LARGE_VIDEO_THUMBNAIL:I = 0x3c0


# instance fields
.field private mId:I

.field private mLocalFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)V
    .registers 11
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "localFilePath"    # Ljava/lang/String;

    .prologue
    .line 219
    invoke-static {p3}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v4

    const/4 v5, 0x4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/ImageCacheRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;III)V

    .line 220
    invoke-direct {p0, p3}, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->adjustTargetSize(I)V

    .line 221
    iput-object p4, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mLocalFilePath:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;I)V
    .registers 12
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "localFilePath"    # Ljava/lang/String;
    .param p5, "id"    # I

    .prologue
    .line 226
    invoke-static {p3}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v4

    const/4 v5, 0x4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/ImageCacheRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;III)V

    .line 227
    invoke-direct {p0, p3}, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->adjustTargetSize(I)V

    .line 228
    iput-object p4, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mLocalFilePath:Ljava/lang/String;

    .line 229
    iput p5, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mId:I

    .line 230
    return-void
.end method

.method private adjustTargetSize(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 253
    const/4 v0, 0x1

    if-ne p1, v0, :cond_7

    .line 254
    const/16 v0, 0x3c0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mTargetSize:I

    .line 256
    :cond_7
    return-void
.end method


# virtual methods
.method public onDecodeOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;I)Landroid/graphics/Bitmap;
    .registers 9
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "type"    # I

    .prologue
    const/4 v5, 0x1

    .line 234
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mId:I

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->mLocalFilePath:Ljava/lang/String;

    invoke-static {v2, v3, v4}, Lcom/lge/gallery/common/BitmapUtils;->createVideoThumbnailSelective(Landroid/content/Context;ILjava/lang/String;)Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;

    move-result-object v1

    .line 236
    .local v1, "data":Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;
    iget-object v0, v1, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;->bitmap:Landroid/graphics/Bitmap;

    .line 237
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_22

    .line 238
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;->adjustTargetSize(I)V

    .line 239
    if-ne p2, v5, :cond_22

    .line 240
    iget-boolean v2, v1, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;->isOverFHD:Z

    if-eqz v2, :cond_22

    .line 241
    const/16 v2, 0x3c0

    invoke-static {v0, v2, v5, v5}, Lcom/lge/gallery/common/BitmapUtils;->resizeBySideLength(Landroid/graphics/Bitmap;IZZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 246
    :cond_22
    if-eqz v0, :cond_2a

    invoke-interface {p1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 247
    :cond_2a
    const/4 v0, 0x0

    .line 249
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2b
    return-object v0
.end method
