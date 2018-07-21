.class public Lcom/lge/gallery/data/util/DecodeUtils;
.super Ljava/lang/Object;
.source "DecodeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;
    }
.end annotation


# static fields
.field public static final CENTER_ROI_POSITION:I = 0x32

.field private static final TAG:Ljava/lang/String; = "DecodeService"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static decode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 59
    if-nez p2, :cond_7

    .line 60
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    .end local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 62
    .restart local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 63
    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 84
    if-nez p4, :cond_7

    .line 85
    new-instance p4, Landroid/graphics/BitmapFactory$Options;

    .end local p4    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 87
    .restart local p4    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p4}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 88
    invoke-static {p1, p2, p3, p4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 5
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 79
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static decodeBounds(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)V
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 69
    if-nez p2, :cond_3

    .line 76
    :goto_2
    return-void

    .line 72
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 73
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 74
    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    goto :goto_2
.end method

.method public static decodeBounds(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)V
    .registers 6
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 94
    if-nez p4, :cond_3

    .line 101
    :goto_2
    return-void

    .line 97
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 98
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p4}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 99
    invoke-static {p1, p2, p3, p4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    goto :goto_2
.end method

.method public static decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "pathName"    # Ljava/lang/String;
    .param p1, "opts"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 226
    :try_start_0
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 230
    :goto_4
    return-object v1

    .line 227
    :catch_5
    move-exception v0

    .line 228
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    const-string v1, "DecodeService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fail to decode image : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 7
    .param p0, "fd"    # Ljava/io/FileDescriptor;
    .param p1, "outPadding"    # Landroid/graphics/Rect;
    .param p2, "opts"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 217
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_3
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 221
    :goto_4
    return-object v1

    .line 218
    :catch_5
    move-exception v0

    .line 219
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    const-string v1, "DecodeService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fail to decode image : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static decodeThumbnailFromExif(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 431
    invoke-static {p0}, Lcom/lge/gallery/data/util/DecodeUtils;->getExifThumbnailData(Ljava/lang/String;)[B

    move-result-object v2

    .line 432
    .local v2, "thumbData":[B
    if-nez v2, :cond_8

    .line 441
    :goto_7
    return-object v3

    .line 435
    :cond_8
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 436
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v4, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 438
    const/4 v4, 0x0

    :try_start_12
    array-length v5, v2

    invoke-static {v2, v4, v5, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_16} :catch_18

    move-result-object v3

    goto :goto_7

    .line 439
    :catch_18
    move-exception v1

    .line 440
    .local v1, "t":Ljava/lang/Throwable;
    const-string v4, "DecodeService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to get thumbnail from exif data:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7
.end method

.method public static ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 247
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    if-eqz v1, :cond_a

    :cond_8
    move-object v0, p0

    .line 252
    :goto_9
    return-object v0

    .line 250
    :cond_a
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 251
    .local v0, "newBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_9
.end method

.method public static getExifDataBitmap(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 446
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 449
    :cond_5
    :goto_5
    return-object v0

    :cond_6
    const-string v1, "image/jpeg"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {p0}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeThumbnailFromExif(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_5
.end method

.method public static getExifThumbnailData(Ljava/lang/String;)[B
    .registers 8
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    .line 414
    if-nez p0, :cond_4

    .line 415
    const/4 v3, 0x0

    .line 427
    :goto_3
    return-object v3

    .line 417
    :cond_4
    const/4 v1, 0x0

    .line 418
    .local v1, "exif":Landroid/media/ExifInterface;
    const/4 v3, 0x0

    .line 420
    .local v3, "thumbData":[B
    :try_start_6
    new-instance v2, Landroid/media/ExifInterface;

    invoke-direct {v2, p0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_13

    .line 421
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .local v2, "exif":Landroid/media/ExifInterface;
    if-eqz v2, :cond_11

    .line 422
    :try_start_d
    invoke-virtual {v2}, Landroid/media/ExifInterface;->getThumbnail()[B
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_2d

    move-result-object v3

    :cond_11
    move-object v1, v2

    .line 426
    .end local v2    # "exif":Landroid/media/ExifInterface;
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    goto :goto_3

    .line 424
    :catch_13
    move-exception v0

    .line 425
    .local v0, "e":Ljava/io/IOException;
    :goto_14
    const-string v4, "DecodeService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to get exif thumbnail data:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 424
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "exif":Landroid/media/ExifInterface;
    .restart local v2    # "exif":Landroid/media/ExifInterface;
    :catch_2d
    move-exception v0

    move-object v1, v2

    .end local v2    # "exif":Landroid/media/ExifInterface;
    .restart local v1    # "exif":Landroid/media/ExifInterface;
    goto :goto_14
.end method

.method public static recycleSilently(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 235
    if-eqz p0, :cond_5

    .line 236
    :try_start_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_5} :catch_6

    .line 241
    :cond_5
    :goto_5
    return-void

    .line 238
    :catch_6
    move-exception v0

    .line 239
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "DecodeService"

    const-string v2, "fail to recycle bitmap"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method public static requestCenterCroppedDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "maxSize"    # I

    .prologue
    const/16 v4, 0x32

    .line 354
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, v4

    invoke-static/range {v0 .. v5}, Lcom/lge/gallery/data/util/DecodeUtils;->requestSpecificCroppedDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Landroid/net/Uri;Landroid/content/ContentResolver;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 5
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "resolver"    # Landroid/content/ContentResolver;
    .param p3, "shareable"    # Z

    .prologue
    .line 334
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Landroid/net/Uri;Landroid/content/ContentResolver;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Landroid/net/Uri;Landroid/content/ContentResolver;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 9
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "resolver"    # Landroid/content/ContentResolver;
    .param p3, "shareable"    # Z
    .param p4, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 339
    const/4 v0, 0x0

    .line 341
    .local v0, "pfd":Landroid/os/ParcelFileDescriptor;
    :try_start_1
    const-string v2, "r"

    invoke-virtual {p2, p1, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 342
    invoke-static {p4}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v2, v3, p3}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->newInstance(Ljava/io/FileDescriptor;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_12} :catch_17
    .catchall {:try_start_1 .. :try_end_12} :catchall_22

    move-result-object v2

    .line 348
    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    :goto_16
    return-object v2

    .line 344
    :catch_17
    move-exception v1

    .line 345
    .local v1, "t":Ljava/lang/Throwable;
    :try_start_18
    const-string v2, "DecodeService"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1d
    .catchall {:try_start_18 .. :try_end_1d} :catchall_22

    .line 346
    const/4 v2, 0x0

    .line 348
    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_16

    .end local v1    # "t":Ljava/lang/Throwable;
    :catchall_22
    move-exception v2

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v2
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "shareable"    # Z

    .prologue
    .line 299
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 11
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "shareable"    # Z
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 304
    :try_start_1
    invoke-static {p3}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->newInstance(Ljava/io/FileDescriptor;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_31

    move-result-object v3

    .line 311
    :goto_9
    return-object v3

    .line 305
    :catch_a
    move-exception v0

    .line 306
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2c

    const-string v1, "unknown"

    .line 307
    .local v1, "message":Ljava/lang/String;
    :goto_13
    const-string v4, "DecodeService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to create BitmapRegionDecoder : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 306
    .end local v1    # "message":Ljava/lang/String;
    :cond_2c
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 309
    .end local v0    # "e":Ljava/io/IOException;
    :catch_31
    move-exception v2

    .line 310
    .local v2, "t":Ljava/lang/Throwable;
    const-string v4, "DecodeService"

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/InputStream;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "shareable"    # Z

    .prologue
    .line 317
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/InputStream;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/InputStream;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 8
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "shareable"    # Z
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 322
    :try_start_0
    invoke-static {p3}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->newInstance(Ljava/io/InputStream;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 327
    :goto_8
    return-object v1

    .line 323
    :catch_9
    move-exception v0

    .line 326
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "DecodeService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestCreateBitmapRegionDecoder: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "shareable"    # Z

    .prologue
    .line 280
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 11
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "shareable"    # Z
    .param p3, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 286
    :try_start_1
    invoke-static {p3}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    move-result-object v4

    invoke-virtual {v4, p1, p2, p3}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->newInstance(Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_31

    move-result-object v3

    .line 293
    :goto_9
    return-object v3

    .line 287
    :catch_a
    move-exception v0

    .line 288
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2c

    const-string v1, "unknown"

    .line 289
    .local v1, "message":Ljava/lang/String;
    :goto_13
    const-string v4, "DecodeService"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to create BitmapRegionDecoder : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 288
    .end local v1    # "message":Ljava/lang/String;
    :cond_2c
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 291
    .end local v0    # "e":Ljava/io/IOException;
    :catch_31
    move-exception v2

    .line 292
    .local v2, "t":Ljava/lang/Throwable;
    const-string v4, "DecodeService"

    invoke-static {v4, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIIZ)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 11
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "shareable"    # Z

    .prologue
    .line 257
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIIZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public static requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIIZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 12
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "shareable"    # Z
    .param p5, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 263
    if-ltz p2, :cond_9

    if-lez p3, :cond_9

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_2e

    .line 264
    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "offset = %s, length = %s, bytes = %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    array-length v5, p1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 270
    :cond_2e
    :try_start_2e
    invoke-static {p5}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->newInstance([BIIZ)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_35} :catch_37

    move-result-object v1

    .line 274
    :goto_36
    return-object v1

    .line 272
    :catch_37
    move-exception v0

    .line 273
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "DecodeService"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 274
    const/4 v1, 0x0

    goto :goto_36
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 114
    if-nez p2, :cond_7

    .line 115
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    .end local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 117
    .restart local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 118
    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;ILandroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "targetSize"    # I
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 154
    if-nez p2, :cond_9

    .line 155
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    .end local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 157
    .restart local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_9
    new-instance v2, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v2, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v2}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 159
    iput-boolean v4, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 160
    invoke-static {p1, v1, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 161
    invoke-interface {p0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 173
    :goto_1c
    return-object v1

    .line 165
    :cond_1d
    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v3, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v2, v3, p3}, Lcom/lge/gallery/common/BitmapUtils;->computeSampleSizeLarger(III)I

    move-result v2

    iput v2, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 167
    const/4 v2, 0x0

    iput-boolean v2, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 169
    invoke-static {p1, v1, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 172
    .local v0, "result":Landroid/graphics/Bitmap;
    invoke-static {v0, p3, v4}, Lcom/lge/gallery/common/BitmapUtils;->resizeDownIfTooBig(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 173
    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_1c
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 5
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .param p2, "paddings"    # Landroid/graphics/Rect;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 207
    if-nez p3, :cond_7

    .line 208
    new-instance p3, Landroid/graphics/BitmapFactory$Options;

    .end local p3    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 210
    .restart local p3    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p3}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 211
    invoke-static {p1, p2, p3}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 105
    if-nez p2, :cond_7

    .line 106
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    .end local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 108
    .restart local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 109
    invoke-static {p1, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;
    .registers 14
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "targetSize"    # I

    .prologue
    const/4 v9, 0x0

    .line 139
    const/4 v7, 0x0

    .line 141
    .local v7, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_19
    .catchall {:try_start_2 .. :try_end_7} :catchall_24

    .line 142
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .local v8, "fis":Ljava/io/FileInputStream;
    :try_start_7
    invoke-virtual {v8}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    .line 143
    .local v1, "fd":Ljava/io/FileDescriptor;
    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;ILandroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_13} :catch_2c
    .catchall {:try_start_7 .. :try_end_13} :catchall_29

    move-result-object v0

    .line 148
    invoke-static {v8}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    move-object v7, v8

    .end local v1    # "fd":Ljava/io/FileDescriptor;
    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    :goto_18
    return-object v0

    .line 144
    :catch_19
    move-exception v6

    .line 145
    .local v6, "ex":Ljava/lang/Exception;
    :goto_1a
    :try_start_1a
    const-string v0, "DecodeService"

    invoke-static {v0, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_24

    .line 148
    invoke-static {v7}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    move-object v0, v9

    goto :goto_18

    .end local v6    # "ex":Ljava/lang/Exception;
    :catchall_24
    move-exception v0

    :goto_25
    invoke-static {v7}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catchall_29
    move-exception v0

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_25

    .line 144
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catch_2c
    move-exception v6

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto :goto_1a
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 6
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 129
    if-nez p4, :cond_7

    .line 130
    new-instance p4, Landroid/graphics/BitmapFactory$Options;

    .end local p4    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 132
    .restart local p4    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_7
    new-instance v0, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v0, p4}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 133
    invoke-static {p1, p2, p3, p4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 5
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "bytes"    # [B
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 124
    const/4 v0, 0x0

    array-length v1, p1

    invoke-static {p0, p1, v0, v1, p2}, Lcom/lge/gallery/data/util/DecodeUtils;->requestDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static requestDecodeIfBigEnough(Lcom/lge/gallery/util/ThreadPool$JobContext;[BLandroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;
    .registers 7
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "data"    # [B
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "targetSize"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 185
    if-nez p2, :cond_9

    .line 186
    new-instance p2, Landroid/graphics/BitmapFactory$Options;

    .end local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 188
    .restart local p2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_9
    new-instance v1, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;

    invoke-direct {v1, p2}, Lcom/lge/gallery/data/util/DecodeUtils$DecodeCanceller;-><init>(Landroid/graphics/BitmapFactory$Options;)V

    invoke-interface {p0, v1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 190
    const/4 v1, 0x1

    iput-boolean v1, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 191
    array-length v1, p1

    invoke-static {p1, v2, v1, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 192
    invoke-interface {p0}, Lcom/lge/gallery/util/ThreadPool$JobContext;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 201
    :cond_1e
    :goto_1e
    return-object v0

    .line 195
    :cond_1f
    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lt v1, p3, :cond_1e

    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v1, p3, :cond_1e

    .line 198
    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v0, v1, p3}, Lcom/lge/gallery/common/BitmapUtils;->computeSampleSizeLarger(III)I

    move-result v0

    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 200
    iput-boolean v2, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 201
    array-length v0, p1

    invoke-static {p1, v2, v0, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/DecodeUtils;->ensureGLCompatibleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1e
.end method

.method public static requestSpecificCroppedDecode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;Ljava/lang/String;III)Landroid/graphics/Bitmap;
    .registers 23
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "maxSize"    # I
    .param p4, "roix"    # I
    .param p5, "roiy"    # I

    .prologue
    .line 360
    if-eqz p0, :cond_c

    if-eqz p1, :cond_c

    if-lez p3, :cond_c

    invoke-static/range {p2 .. p2}, Lcom/lge/gallery/common/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_e

    .line 365
    :cond_c
    const/4 v3, 0x0

    .line 410
    :cond_d
    :goto_d
    return-object v3

    .line 367
    :cond_e
    const/4 v6, 0x0

    .line 368
    .local v6, "decoder":Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    const/4 v3, 0x0

    .line 370
    .local v3, "b":Landroid/graphics/Bitmap;
    const/4 v13, 0x0

    :try_start_11
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v0, v1, v13, v2}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1a} :catch_49
    .catchall {:try_start_11 .. :try_end_1a} :catchall_b3

    move-result-object v6

    .line 372
    if-nez v6, :cond_29

    .line 406
    if-eqz v6, :cond_d

    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->isRecycled()Z

    move-result v13

    if-nez v13, :cond_d

    .line 407
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->recycle()V

    goto :goto_d

    .line 375
    :cond_29
    :try_start_29
    new-instance v10, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v10}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 376
    .local v10, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->getWidth()I

    move-result v12

    .line 377
    .local v12, "w":I
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->getHeight()I

    move-result v8

    .line 378
    .local v8, "h":I
    if-le v12, v8, :cond_59

    move v9, v8

    .line 379
    .local v9, "min":I
    :goto_39
    const/4 v13, 0x1

    iput v13, v10, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 380
    :goto_3c
    move/from16 v0, p3

    if-le v9, v0, :cond_5b

    .line 381
    div-int/lit8 v9, v9, 0x2

    .line 382
    iget v13, v10, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v13, v13, 0x2

    iput v13, v10, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_48} :catch_49
    .catchall {:try_start_29 .. :try_end_48} :catchall_b3

    goto :goto_3c

    .line 403
    .end local v8    # "h":I
    .end local v9    # "min":I
    .end local v10    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v12    # "w":I
    :catch_49
    move-exception v7

    .line 404
    .local v7, "e":Ljava/lang/Exception;
    :try_start_4a
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4d
    .catchall {:try_start_4a .. :try_end_4d} :catchall_b3

    .line 406
    if-eqz v6, :cond_d

    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->isRecycled()Z

    move-result v13

    if-nez v13, :cond_d

    .line 407
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->recycle()V

    goto :goto_d

    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v8    # "h":I
    .restart local v10    # "options":Landroid/graphics/BitmapFactory$Options;
    .restart local v12    # "w":I
    :cond_59
    move v9, v12

    .line 378
    goto :goto_39

    .line 384
    .restart local v9    # "min":I
    :cond_5b
    const/4 v11, 0x0

    .line 385
    .local v11, "rect":Landroid/graphics/Rect;
    if-le v12, v8, :cond_90

    .line 386
    mul-int v13, v12, p4

    :try_start_60
    div-int/lit8 v4, v13, 0x64

    .line 387
    .local v4, "centerX":I
    div-int/lit8 v13, v8, 0x2

    div-int/lit8 v14, v8, 0x2

    sub-int v14, v12, v14

    invoke-static {v4, v13, v14}, Lcom/lge/gallery/common/Utils;->clamp(III)I

    move-result v4

    .line 388
    new-instance v11, Landroid/graphics/Rect;

    .end local v11    # "rect":Landroid/graphics/Rect;
    div-int/lit8 v13, v8, 0x2

    sub-int v13, v4, v13

    const/4 v14, 0x0

    div-int/lit8 v15, v8, 0x2

    add-int/2addr v15, v4

    add-int/lit8 v15, v15, -0x1

    add-int/lit8 v16, v8, -0x1

    move/from16 v0, v16

    invoke-direct {v11, v13, v14, v15, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 402
    .end local v4    # "centerX":I
    .restart local v11    # "rect":Landroid/graphics/Rect;
    :goto_7f
    invoke-interface {v6, v11, v10}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_82} :catch_49
    .catchall {:try_start_60 .. :try_end_82} :catchall_b3

    move-result-object v3

    .line 406
    if-eqz v6, :cond_d

    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->isRecycled()Z

    move-result v13

    if-nez v13, :cond_d

    .line 407
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->recycle()V

    goto/16 :goto_d

    .line 394
    :cond_90
    mul-int v13, v8, p5

    :try_start_92
    div-int/lit8 v5, v13, 0x64

    .line 395
    .local v5, "centerY":I
    div-int/lit8 v13, v12, 0x2

    div-int/lit8 v14, v12, 0x2

    sub-int v14, v8, v14

    invoke-static {v5, v13, v14}, Lcom/lge/gallery/common/Utils;->clamp(III)I

    move-result v5

    .line 396
    new-instance v11, Landroid/graphics/Rect;

    .end local v11    # "rect":Landroid/graphics/Rect;
    const/4 v13, 0x0

    div-int/lit8 v14, v12, 0x2

    sub-int v14, v5, v14

    add-int/lit8 v15, v12, -0x1

    div-int/lit8 v16, v12, 0x2

    add-int v16, v16, v5

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    invoke-direct {v11, v13, v14, v15, v0}, Landroid/graphics/Rect;-><init>(IIII)V
    :try_end_b2
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_b2} :catch_49
    .catchall {:try_start_92 .. :try_end_b2} :catchall_b3

    .restart local v11    # "rect":Landroid/graphics/Rect;
    goto :goto_7f

    .line 406
    .end local v5    # "centerY":I
    .end local v8    # "h":I
    .end local v9    # "min":I
    .end local v10    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v11    # "rect":Landroid/graphics/Rect;
    .end local v12    # "w":I
    :catchall_b3
    move-exception v13

    if-eqz v6, :cond_bf

    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->isRecycled()Z

    move-result v14

    if-nez v14, :cond_bf

    .line 407
    invoke-interface {v6}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->recycle()V

    :cond_bf
    throw v13
.end method
