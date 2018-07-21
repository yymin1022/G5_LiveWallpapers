.class public Lcom/lge/gallery/data/local/LocalImageRequest;
.super Lcom/lge/gallery/data/cache/ImageCacheRequest;
.source "LocalImageRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LocalImageRequest"


# instance fields
.field private final mListener:Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;

.field protected mMimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)V
    .registers 11
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "localFilePath"    # Ljava/lang/String;

    .prologue
    .line 37
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/local/LocalImageRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "localFilePath"    # Ljava/lang/String;
    .param p5, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {p3}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v4

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/ImageCacheRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;III)V

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mMimeType:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mLocalImagePath:Ljava/lang/String;

    .line 45
    iput-object p5, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mMimeType:Ljava/lang/String;

    .line 46
    new-instance v0, Lcom/lge/gallery/data/local/LocalImageRequest$1;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/local/LocalImageRequest$1;-><init>(Lcom/lge/gallery/data/local/LocalImageRequest;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mListener:Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;

    .line 52
    return-void
.end method

.method static synthetic access$002(Lcom/lge/gallery/data/local/LocalImageRequest;I)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/data/local/LocalImageRequest;
    .param p1, "x1"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mTargetSize:I

    return p1
.end method

.method public static decodeMicroThumbnail(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p4, "listener"    # Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;

    .prologue
    const/16 v2, 0xc8

    .line 80
    invoke-static {p0, p1, p3}, Lcom/lge/gallery/data/local/LocalImageRequest;->decodeMicroThumbnailFromExif(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 81
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_9

    .line 95
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_8
    return-object v0

    .line 84
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_9
    invoke-static {p1, p3, v2, v2}, Lcom/lge/gallery/data/local/LocalImageRequest;->getAdjustedTargetSize(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;II)I

    move-result v1

    .line 87
    .local v1, "size":I
    if-ne v1, v2, :cond_19

    .line 88
    const/4 v2, 0x2

    invoke-static {v2}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v2

    invoke-static {p0, p1, p3, v2}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_8

    .line 92
    :cond_19
    if-eqz p4, :cond_1e

    .line 93
    invoke-interface {p4, v2, v1}, Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;->onChange(II)V

    .line 95
    :cond_1e
    invoke-static {p0, p1, p2, v1}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCenterCroppedDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_8
.end method

.method private static decodeMicroThumbnailFromExif(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 100
    const/4 v0, 0x0

    .line 101
    .local v0, "exif":Landroid/media/ExifInterface;
    const/4 v3, 0x0

    .line 103
    .local v3, "thumbData":[B
    :try_start_2
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_7} :catch_12

    .line 104
    .end local v0    # "exif":Landroid/media/ExifInterface;
    .local v1, "exif":Landroid/media/ExifInterface;
    if-eqz v1, :cond_d

    .line 105
    :try_start_9
    invoke-virtual {v1}, Landroid/media/ExifInterface;->getThumbnail()[B
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_c} :catch_25

    move-result-object v3

    :cond_d
    move-object v0, v1

    .line 110
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v0    # "exif":Landroid/media/ExifInterface;
    :goto_e
    if-nez v3, :cond_1b

    .line 111
    const/4 v4, 0x0

    .line 113
    :goto_11
    return-object v4

    .line 107
    :catch_12
    move-exception v2

    .line 108
    .local v2, "t":Ljava/lang/Throwable;
    :goto_13
    const-string v4, "LocalImageRequest"

    const-string v5, "fail to get exif thumb"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_e

    .line 113
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_1b
    const/4 v4, 0x2

    invoke-static {v4}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v4

    invoke-static {p0, v3, p2, v4}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecodeIfBigEnough(Lcom/lge/gallery/util/ThreadPool$JobContext;[BLandroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_11

    .line 107
    .end local v0    # "exif":Landroid/media/ExifInterface;
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    :catch_25
    move-exception v2

    move-object v0, v1

    .end local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v0    # "exif":Landroid/media/ExifInterface;
    goto :goto_13
.end method

.method private static getAdjustedTargetSize(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;II)I
    .registers 7
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p2, "origSize"    # I
    .param p3, "maxSize"    # I

    .prologue
    .line 119
    if-eqz p0, :cond_4

    if-nez p1, :cond_5

    .line 130
    .end local p2    # "origSize":I
    :cond_4
    :goto_4
    return p2

    .line 122
    .restart local p2    # "origSize":I
    :cond_5
    const/4 v2, 0x1

    iput-boolean v2, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 123
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 124
    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 125
    .local v1, "width":I
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 126
    .local v0, "height":I
    const/4 v2, 0x0

    iput-boolean v2, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 127
    invoke-static {v1, v0}, Lcom/lge/gallery/util/GalleryUtils;->isOneSideTooLong(II)Z

    move-result v2

    if-eqz v2, :cond_4

    move p2, p3

    .line 128
    goto :goto_4
.end method


# virtual methods
.method public onDecodeOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;I)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "type"    # I

    .prologue
    .line 56
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mLocalImagePath:Ljava/lang/String;

    if-nez v2, :cond_d

    .line 57
    const-string v2, "LocalImageRequest"

    const-string v3, "image path for exifInterface cannot be null"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    const/4 v0, 0x0

    .line 75
    :cond_c
    :goto_c
    return-object v0

    .line 60
    :cond_d
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 61
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    packed-switch p2, :pswitch_data_32

    .line 70
    :goto_1a
    if-nez v0, :cond_c

    .line 73
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mLocalImagePath:Ljava/lang/String;

    invoke-static {p2}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v3

    invoke-static {p1, v2, v1, v3}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 75
    goto :goto_c

    .line 65
    :pswitch_27
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mLocalImagePath:Ljava/lang/String;

    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mMimeType:Ljava/lang/String;

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalImageRequest;->mListener:Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;

    invoke-static {p1, v2, v3, v1, v4}, Lcom/lge/gallery/data/local/LocalImageRequest;->decodeMicroThumbnail(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 66
    goto :goto_1a

    .line 63
    :pswitch_data_32
    .packed-switch 0x2
        :pswitch_27
    .end packed-switch
.end method
