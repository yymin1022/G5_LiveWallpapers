.class public Lcom/lge/gallery/common/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;
    }
.end annotation


# static fields
.field private static final COMPRESS_JPEG_QUALITY:I = 0x5a

.field private static final FHD_BIGGER_LENGTH:I = 0x780

.field private static final TAG:Ljava/lang/String; = "BitmapUtils"

.field public static final UNCONSTRAINED:I = -0x1

.field private static final UP_SCALE_LIMITATION:F = 1.5f


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static clearBitmapIfNeeded(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 394
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_b

    .line 395
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 397
    :cond_b
    return-void
.end method

.method public static compressBitmap(Landroid/graphics/Bitmap;)[B
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 364
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 365
    .local v0, "os":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x5a

    invoke-virtual {p0, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 367
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static compressToBytes(Landroid/graphics/Bitmap;I)[B
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "quality"    # I

    .prologue
    .line 388
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/high16 v1, 0x10000

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 389
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v1, p1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 390
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method private static computeInitialSampleSize(IIII)I
    .registers 11
    .param p0, "w"    # I
    .param p1, "h"    # I
    .param p2, "minSideLength"    # I
    .param p3, "maxNumOfPixels"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v6, -0x1

    .line 80
    if-ne p3, v6, :cond_7

    if-ne p2, v6, :cond_7

    .line 92
    :cond_6
    :goto_6
    return v0

    .line 85
    :cond_7
    if-ne p3, v6, :cond_18

    .line 88
    .local v0, "lowerBound":I
    :goto_9
    if-eq p2, v6, :cond_6

    .line 91
    div-int v2, p0, p2

    div-int v3, p1, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 92
    .local v1, "sampleSize":I
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_6

    .line 85
    .end local v0    # "lowerBound":I
    .end local v1    # "sampleSize":I
    :cond_18
    mul-int v2, p0, p1

    int-to-double v2, v2

    int-to-double v4, p3

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    goto :goto_9
.end method

.method public static computeSampleSize(F)I
    .registers 7
    .param p0, "scale"    # F

    .prologue
    const/4 v2, 0x1

    .line 124
    const/4 v1, 0x0

    cmpl-float v1, p0, v1

    if-lez v1, :cond_20

    move v1, v2

    :goto_7
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 125
    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, p0

    float-to-double v4, v1

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v1, v4

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 126
    .local v0, "initialSize":I
    const/16 v1, 0x8

    if-gt v0, v1, :cond_22

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->nextPowerOf2(I)I

    move-result v1

    :goto_1f
    return v1

    .line 124
    .end local v0    # "initialSize":I
    :cond_20
    const/4 v1, 0x0

    goto :goto_7

    .line 126
    .restart local v0    # "initialSize":I
    :cond_22
    add-int/lit8 v1, v0, 0x7

    div-int/lit8 v1, v1, 0x8

    mul-int/lit8 v1, v1, 0x8

    goto :goto_1f
.end method

.method public static computeSampleSize(IIII)I
    .registers 6
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "minSideLength"    # I
    .param p3, "maxNumOfPixels"    # I

    .prologue
    .line 70
    invoke-static {p0, p1, p2, p3}, Lcom/lge/gallery/common/BitmapUtils;->computeInitialSampleSize(IIII)I

    move-result v0

    .line 73
    .local v0, "initialSize":I
    const/16 v1, 0x8

    if-gt v0, v1, :cond_d

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->nextPowerOf2(I)I

    move-result v1

    :goto_c
    return v1

    :cond_d
    add-int/lit8 v1, v0, 0x7

    div-int/lit8 v1, v1, 0x8

    mul-int/lit8 v1, v1, 0x8

    goto :goto_c
.end method

.method public static computeSampleSizeLarger(F)I
    .registers 5
    .param p0, "scale"    # F

    .prologue
    const/4 v1, 0x1

    .line 112
    const/high16 v2, 0x3f800000    # 1.0f

    div-float/2addr v2, p0

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v0, v2

    .line 113
    .local v0, "initialSize":I
    if-gt v0, v1, :cond_d

    .line 117
    :goto_c
    return v1

    :cond_d
    const/16 v1, 0x8

    if-gt v0, v1, :cond_16

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->prevPowerOf2(I)I

    move-result v1

    goto :goto_c

    :cond_16
    div-int/lit8 v1, v0, 0x8

    mul-int/lit8 v1, v1, 0x8

    goto :goto_c
.end method

.method public static computeSampleSizeLarger(III)I
    .registers 7
    .param p0, "w"    # I
    .param p1, "h"    # I
    .param p2, "minSideLength"    # I

    .prologue
    const/4 v1, 0x1

    .line 100
    div-int v2, p0, p2

    div-int v3, p1, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 101
    .local v0, "initialSize":I
    if-gt v0, v1, :cond_c

    .line 105
    :goto_b
    return v1

    :cond_c
    const/16 v1, 0x8

    if-gt v0, v1, :cond_15

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->prevPowerOf2(I)I

    move-result v1

    goto :goto_b

    :cond_15
    div-int/lit8 v1, v0, 0x8

    mul-int/lit8 v1, v1, 0x8

    goto :goto_b
.end method

.method public static createVideoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 15
    .param p0, "filePath"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 279
    if-nez p0, :cond_c

    .line 280
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail null filepath."

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v9, v10

    .line 322
    :cond_b
    :goto_b
    return-object v9

    .line 285
    :cond_c
    const/4 v2, 0x0

    .line 286
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    .line 288
    .local v7, "instance":Ljava/lang/Object;
    :try_start_e
    const-string v9, "android.media.MediaMetadataRetriever"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 289
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    .line 291
    const-string v9, "setDataSource"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 292
    .local v8, "method":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p0, v9, v11

    invoke-virtual {v8, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x9

    if-gt v9, v11, :cond_64

    .line 296
    const-string v9, "captureFrame"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/Bitmap;
    :try_end_47
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e .. :try_end_47} :catch_d4
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_47} :catch_fb
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_47} :catch_120
    .catchall {:try_start_e .. :try_end_47} :catchall_156

    .line 315
    if-eqz v2, :cond_b

    if-eqz v7, :cond_b

    .line 316
    :try_start_4b
    const-string v10, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v10, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_5a} :catch_5b

    goto :goto_b

    .line 318
    :catch_5b
    move-exception v6

    .line 319
    .local v6, "ignored":Ljava/lang/Exception;
    const-string v10, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v10, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b

    .line 298
    .end local v6    # "ignored":Ljava/lang/Exception;
    :cond_64
    :try_start_64
    const-string v9, "getEmbeddedPicture"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    move-object v0, v9

    check-cast v0, [B

    move-object v3, v0

    .line 299
    .local v3, "data":[B
    if-eqz v3, :cond_a3

    .line 300
    const/4 v9, 0x0

    array-length v11, v3

    invoke-static {v3, v9, v11}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;
    :try_end_81
    .catch Ljava/lang/IllegalArgumentException; {:try_start_64 .. :try_end_81} :catch_d4
    .catch Ljava/lang/RuntimeException; {:try_start_64 .. :try_end_81} :catch_fb
    .catch Ljava/lang/Throwable; {:try_start_64 .. :try_end_81} :catch_120
    .catchall {:try_start_64 .. :try_end_81} :catchall_156

    move-result-object v1

    .line 301
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_a3

    .line 315
    if-eqz v2, :cond_97

    if-eqz v7, :cond_97

    .line 316
    :try_start_88
    const-string v9, "release"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_97} :catch_9a

    :cond_97
    :goto_97
    move-object v9, v1

    .line 320
    goto/16 :goto_b

    .line 318
    :catch_9a
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v9, "BitmapUtils"

    const-string v10, "createVideoThumbnail"

    invoke-static {v9, v10, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_97

    .line 305
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v6    # "ignored":Ljava/lang/Exception;
    :cond_a3
    :try_start_a3
    const-string v9, "getFrameAtTime"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/Bitmap;
    :try_end_b5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a3 .. :try_end_b5} :catch_d4
    .catch Ljava/lang/RuntimeException; {:try_start_a3 .. :try_end_b5} :catch_fb
    .catch Ljava/lang/Throwable; {:try_start_a3 .. :try_end_b5} :catch_120
    .catchall {:try_start_a3 .. :try_end_b5} :catchall_156

    .line 315
    if-eqz v2, :cond_b

    if-eqz v7, :cond_b

    .line 316
    :try_start_b9
    const-string v10, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v10, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_b9 .. :try_end_c8} :catch_ca

    goto/16 :goto_b

    .line 318
    :catch_ca
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v10, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v10, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 307
    .end local v3    # "data":[B
    .end local v6    # "ignored":Ljava/lang/Exception;
    .end local v7    # "instance":Ljava/lang/Object;
    .end local v8    # "method":Ljava/lang/reflect/Method;
    :catch_d4
    move-exception v5

    .line 308
    .local v5, "ex":Ljava/lang/IllegalArgumentException;
    :try_start_d5
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v9, v11, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_dc
    .catchall {:try_start_d5 .. :try_end_dc} :catchall_156

    .line 315
    if-eqz v2, :cond_ef

    if-eqz v7, :cond_ef

    .line 316
    :try_start_e0
    const-string v9, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ef
    .catch Ljava/lang/Exception; {:try_start_e0 .. :try_end_ef} :catch_f2

    .end local v5    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_ef
    :goto_ef
    move-object v9, v10

    .line 322
    goto/16 :goto_b

    .line 318
    .restart local v5    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_f2
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v9, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_ef

    .line 309
    .end local v5    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v6    # "ignored":Ljava/lang/Exception;
    :catch_fb
    move-exception v5

    .line 310
    .local v5, "ex":Ljava/lang/RuntimeException;
    :try_start_fc
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v9, v11, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_103
    .catchall {:try_start_fc .. :try_end_103} :catchall_156

    .line 315
    if-eqz v2, :cond_ef

    if-eqz v7, :cond_ef

    .line 316
    :try_start_107
    const-string v9, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_107 .. :try_end_116} :catch_117

    goto :goto_ef

    .line 318
    :catch_117
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v9, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_ef

    .line 311
    .end local v5    # "ex":Ljava/lang/RuntimeException;
    .end local v6    # "ignored":Ljava/lang/Exception;
    :catch_120
    move-exception v4

    .line 312
    .local v4, "e":Ljava/lang/Throwable;
    :try_start_121
    const-string v9, "BitmapUtils"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "fail to create video thumbnail : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_139
    .catchall {:try_start_121 .. :try_end_139} :catchall_156

    .line 315
    if-eqz v2, :cond_ef

    if-eqz v7, :cond_ef

    .line 316
    :try_start_13d
    const-string v9, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v9, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14c
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_14c} :catch_14d

    goto :goto_ef

    .line 318
    :catch_14d
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v9, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v9, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_ef

    .line 314
    .end local v4    # "e":Ljava/lang/Throwable;
    .end local v6    # "ignored":Ljava/lang/Exception;
    :catchall_156
    move-exception v9

    .line 315
    if-eqz v2, :cond_16a

    if-eqz v7, :cond_16a

    .line 316
    :try_start_15b
    const-string v10, "release"

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Class;

    invoke-virtual {v2, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v10, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16a
    .catch Ljava/lang/Exception; {:try_start_15b .. :try_end_16a} :catch_16b

    .line 320
    :cond_16a
    :goto_16a
    throw v9

    .line 318
    :catch_16b
    move-exception v6

    .line 319
    .restart local v6    # "ignored":Ljava/lang/Exception;
    const-string v10, "BitmapUtils"

    const-string v11, "createVideoThumbnail"

    invoke-static {v10, v11, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_16a
.end method

.method private static createVideoThumbnailFromMediaStore(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I

    .prologue
    .line 354
    if-nez p0, :cond_4

    .line 355
    const/4 v1, 0x0

    .line 359
    :goto_3
    return-object v1

    .line 357
    :cond_4
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 358
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 359
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    int-to-long v2, p1

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4, v0}, Landroid/provider/MediaStore$Video$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_3
.end method

.method public static createVideoThumbnailSelective(Landroid/content/Context;ILjava/lang/String;)Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # I
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    .line 327
    new-instance v2, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;

    invoke-direct {v2}, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;-><init>()V

    .line 328
    .local v2, "ret":Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;
    if-nez p2, :cond_f

    .line 329
    const-string v4, "BitmapUtils"

    const-string v5, "createVideoThumbnail null filepath."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    :goto_e
    return-object v2

    .line 332
    :cond_f
    new-instance v3, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v3}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 334
    .local v3, "retriever":Landroid/media/MediaMetadataRetriever;
    :try_start_14
    invoke-virtual {v3, p2}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 335
    const/16 v4, 0x12

    invoke-virtual {v3, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/16 v5, 0x13

    invoke-virtual {v3, v5}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    const/16 v5, 0x780

    if-le v4, v5, :cond_42

    const/4 v1, 0x1

    .line 339
    .local v1, "isBiggerThanFHD":Z
    :goto_34
    iput-boolean v1, v2, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;->isOverFHD:Z

    .line 340
    if-eqz v1, :cond_44

    .line 341
    invoke-static {p0, p1}, Lcom/lge/gallery/common/BitmapUtils;->createVideoThumbnailFromMediaStore(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v2, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;->bitmap:Landroid/graphics/Bitmap;
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_3e} :catch_4b
    .catchall {:try_start_14 .. :try_end_3e} :catchall_68

    .line 348
    :goto_3e
    invoke-virtual {v3}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_e

    .line 335
    .end local v1    # "isBiggerThanFHD":Z
    :cond_42
    const/4 v1, 0x0

    goto :goto_34

    .line 343
    .restart local v1    # "isBiggerThanFHD":Z
    :cond_44
    :try_start_44
    invoke-virtual {v3}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime()Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v2, Lcom/lge/gallery/common/BitmapUtils$VideoThumbnailData;->bitmap:Landroid/graphics/Bitmap;
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_4a} :catch_4b
    .catchall {:try_start_44 .. :try_end_4a} :catchall_68

    goto :goto_3e

    .line 345
    .end local v1    # "isBiggerThanFHD":Z
    :catch_4b
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_4c
    const-string v4, "BitmapUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to create video thumbnail : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_64
    .catchall {:try_start_4c .. :try_end_64} :catchall_68

    .line 348
    invoke-virtual {v3}, Landroid/media/MediaMetadataRetriever;->release()V

    goto :goto_e

    .end local v0    # "e":Ljava/lang/Throwable;
    :catchall_68
    move-exception v4

    invoke-virtual {v3}, Landroid/media/MediaMetadataRetriever;->release()V

    throw v4
.end method

.method public static cropCenter(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "recycle"    # Z

    .prologue
    const/4 v8, 0x0

    .line 207
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 208
    .local v5, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 209
    .local v1, "height":I
    if-ne v5, v1, :cond_c

    .line 222
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_b
    return-object p0

    .line 212
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_c
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 214
    .local v3, "size":I
    invoke-static {p0}, Lcom/lge/gallery/common/BitmapUtils;->getConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;

    move-result-object v6

    invoke-static {v3, v3, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 215
    .local v4, "target":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 216
    .local v0, "canvas":Landroid/graphics/Canvas;
    sub-int v6, v3, v5

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    sub-int v7, v3, v1

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v0, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 217
    new-instance v2, Landroid/graphics/Paint;

    const/4 v6, 0x2

    invoke-direct {v2, v6}, Landroid/graphics/Paint;-><init>(I)V

    .line 218
    .local v2, "paint":Landroid/graphics/Paint;
    invoke-virtual {v0, p0, v8, v8, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 219
    if-eqz p1, :cond_38

    .line 220
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_38
    move-object p0, v4

    .line 222
    goto :goto_b
.end method

.method private static getConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 163
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    .line 164
    .local v0, "config":Landroid/graphics/Bitmap$Config;
    if-nez v0, :cond_8

    .line 165
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 167
    :cond_8
    return-object v0
.end method

.method public static isRotationSupported(Ljava/lang/String;)Z
    .registers 2
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 380
    if-nez p0, :cond_4

    .line 381
    const/4 v0, 0x0

    .line 384
    :goto_3
    return v0

    .line 383
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 384
    const-string v0, "image/jpeg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public static isSupportedByRegionDecoder(Ljava/lang/String;)Z
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 371
    if-nez p0, :cond_4

    .line 375
    :cond_3
    :goto_3
    return v0

    .line 374
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 375
    const-string v1, "image/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "image/gif"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "wbmp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static recycleSilently(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 252
    if-nez p0, :cond_3

    .line 260
    :goto_2
    return-void

    .line 256
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 257
    :catch_7
    move-exception v0

    .line 258
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "BitmapUtils"

    const-string v2, "unable recycle bitmap"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "scale"    # F
    .param p2, "recycle"    # Z

    .prologue
    const/4 v6, 0x0

    .line 145
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 146
    .local v4, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 147
    .local v1, "height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-ne v4, v5, :cond_22

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-ne v1, v5, :cond_22

    .line 159
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_21
    return-object p0

    .line 151
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_22
    invoke-static {p0}, Lcom/lge/gallery/common/BitmapUtils;->getConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;

    move-result-object v5

    invoke-static {v4, v1, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 152
    .local v3, "target":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 153
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v0, p1, p1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 154
    new-instance v2, Landroid/graphics/Paint;

    const/4 v5, 0x6

    invoke-direct {v2, v5}, Landroid/graphics/Paint;-><init>(I)V

    .line 155
    .local v2, "paint":Landroid/graphics/Paint;
    invoke-virtual {v0, p0, v6, v6, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 156
    if-eqz p2, :cond_40

    .line 157
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_40
    move-object p0, v3

    .line 159
    goto :goto_21
.end method

.method public static resizeBySideLength(Landroid/graphics/Bitmap;IZZ)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "maxLength"    # I
    .param p2, "recycle"    # Z
    .param p3, "isSupportUpScale"    # Z

    .prologue
    .line 177
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 178
    .local v2, "srcWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 179
    .local v1, "srcHeight":I
    int-to-float v3, p1

    int-to-float v4, v2

    div-float/2addr v3, v4

    int-to-float v4, p1

    int-to-float v5, v1

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 181
    .local v0, "scale":F
    if-nez p3, :cond_1b

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v3, v0, v3

    if-ltz v3, :cond_1b

    .line 186
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_1a
    return-object p0

    .line 183
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_1b
    const/high16 v3, 0x3fc00000    # 1.5f

    cmpl-float v3, v0, v3

    if-lez v3, :cond_23

    .line 184
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 186
    :cond_23
    invoke-static {p0, v0, p2}, Lcom/lge/gallery/common/BitmapUtils;->resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_1a
.end method

.method public static resizeDownAndCropCenter(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .registers 15
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "size"    # I
    .param p2, "recycle"    # Z

    .prologue
    .line 227
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 228
    .local v7, "w":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 229
    .local v1, "h":I
    invoke-static {v7, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 230
    .local v3, "minSide":I
    if-ne v7, v1, :cond_11

    if-gt v3, p1, :cond_11

    .line 248
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_10
    return-object p0

    .line 233
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_11
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 235
    int-to-float v9, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v9, v10

    int-to-float v10, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 237
    .local v5, "scale":F
    invoke-static {p0}, Lcom/lge/gallery/common/BitmapUtils;->getConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap$Config;

    move-result-object v9

    invoke-static {p1, p1, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 238
    .local v6, "target":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 239
    .local v8, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 240
    .local v2, "height":I
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 241
    .local v0, "canvas":Landroid/graphics/Canvas;
    sub-int v9, p1, v8

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    sub-int v10, p1, v2

    int-to-float v10, v10

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    invoke-virtual {v0, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    .line 242
    invoke-virtual {v0, v5, v5}, Landroid/graphics/Canvas;->scale(FF)V

    .line 243
    new-instance v4, Landroid/graphics/Paint;

    const/4 v9, 0x6

    invoke-direct {v4, v9}, Landroid/graphics/Paint;-><init>(I)V

    .line 244
    .local v4, "paint":Landroid/graphics/Paint;
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v0, p0, v9, v10, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 245
    if-eqz p2, :cond_6a

    .line 246
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_6a
    move-object p0, v6

    .line 248
    goto :goto_10
.end method

.method public static resizeDownBySideLength(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .registers 4
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "maxLength"    # I
    .param p2, "recycle"    # Z

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/lge/gallery/common/BitmapUtils;->resizeBySideLength(Landroid/graphics/Bitmap;IZZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static resizeDownIfTooBig(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "targetSize"    # I
    .param p2, "recycle"    # Z

    .prologue
    .line 192
    if-nez p0, :cond_3

    .line 202
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2
    :goto_2
    return-object p0

    .line 195
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 196
    .local v2, "srcWidth":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 197
    .local v1, "srcHeight":I
    int-to-float v3, p1

    int-to-float v4, v2

    div-float/2addr v3, v4

    int-to-float v4, p1

    int-to-float v5, v1

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 199
    .local v0, "scale":F
    const/high16 v3, 0x3f000000    # 0.5f

    cmpl-float v3, v0, v3

    if-gtz v3, :cond_2

    .line 202
    invoke-static {p0, v0, p2}, Lcom/lge/gallery/common/BitmapUtils;->resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_2
.end method

.method public static resizeDownToPixels(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "targetPixels"    # I
    .param p2, "recycle"    # Z

    .prologue
    .line 133
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 134
    .local v2, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 135
    .local v0, "height":I
    int-to-double v4, p1

    mul-int v3, v2, v0

    int-to-double v6, v3

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v1, v4

    .line 137
    .local v1, "scale":F
    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_19

    .line 140
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_18
    return-object p0

    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_19
    invoke-static {p0, v1, p2}, Lcom/lge/gallery/common/BitmapUtils;->resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_18
.end method

.method public static rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "source"    # Landroid/graphics/Bitmap;
    .param p1, "rotation"    # I
    .param p2, "recycle"    # Z

    .prologue
    const/4 v1, 0x0

    .line 263
    if-nez p1, :cond_4

    .line 274
    .end local p0    # "source":Landroid/graphics/Bitmap;
    :goto_3
    return-object p0

    .line 266
    .restart local p0    # "source":Landroid/graphics/Bitmap;
    :cond_4
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 267
    .local v3, "w":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 268
    .local v4, "h":I
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 269
    .local v5, "m":Landroid/graphics/Matrix;
    int-to-float v0, p1

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 270
    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 271
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    if-eqz p2, :cond_21

    .line 272
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_21
    move-object p0, v7

    .line 274
    goto :goto_3
.end method
