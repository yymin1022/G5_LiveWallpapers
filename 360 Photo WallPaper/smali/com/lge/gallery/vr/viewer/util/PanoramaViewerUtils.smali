.class public Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;
.super Ljava/lang/Object;
.source "PanoramaViewerUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-class v0, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeSampleSize(II)I
    .registers 7
    .param p0, "size"    # I
    .param p1, "maxSize"    # I

    .prologue
    .line 52
    if-gtz p1, :cond_4

    .line 53
    const/4 v1, 0x1

    .line 62
    :goto_3
    return v1

    .line 55
    :cond_4
    const/4 v1, 0x1

    .line 56
    .local v1, "sampleSize":I
    div-int/lit8 v0, p0, 0x2

    .line 57
    .local v0, "halfSize":I
    :goto_7
    if-le v0, p1, :cond_e

    .line 58
    div-int/lit8 v0, v0, 0x2

    .line 59
    mul-int/lit8 v1, v1, 0x2

    goto :goto_7

    .line 61
    :cond_e
    sget-object v2, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Compute sample size : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method

.method public static createDecodingOptions(Ljava/io/InputStream;I)Landroid/graphics/BitmapFactory$Options;
    .registers 6
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "maxSize"    # I

    .prologue
    const/4 v3, 0x1

    .line 37
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 38
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 39
    if-lez p1, :cond_1e

    .line 40
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 41
    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 42
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1, p1}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->computeSampleSize(II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 45
    :cond_1e
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 46
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inPreferQualityOverSpeed:Z

    .line 47
    sget-object v1, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    return-object v0
.end method

.method public static final createDecodingOptions(Ljava/lang/String;I)Landroid/graphics/BitmapFactory$Options;
    .registers 6
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "maxSize"    # I

    .prologue
    const/4 v3, 0x1

    .line 22
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 23
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 24
    if-lez p1, :cond_1d

    .line 25
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 26
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 27
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1, p1}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->computeSampleSize(II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 30
    :cond_1d
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 31
    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inPreferQualityOverSpeed:Z

    .line 32
    sget-object v1, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    return-object v0
.end method

.method public static getScaledBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "maxSize"    # I

    .prologue
    .line 66
    if-nez p0, :cond_4

    .line 67
    const/4 v4, 0x0

    .line 80
    :goto_3
    return-object v4

    .line 69
    :cond_4
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 70
    .local v3, "w":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 71
    .local v0, "h":I
    const/4 v2, 0x0

    .line 72
    .local v2, "targetWidth":I
    const/4 v1, 0x0

    .line 73
    .local v1, "targetHeight":I
    if-le v3, v0, :cond_1d

    .line 74
    move v2, p1

    .line 75
    int-to-float v4, p1

    int-to-float v5, v0

    mul-float/2addr v4, v5

    int-to-float v5, v3

    div-float/2addr v4, v5

    float-to-int v1, v4

    .line 80
    :goto_17
    const/4 v4, 0x1

    invoke-static {p0, v2, v1, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_3

    .line 77
    :cond_1d
    int-to-float v4, p1

    int-to-float v5, v3

    mul-float/2addr v4, v5

    int-to-float v5, v0

    div-float/2addr v4, v5

    float-to-int v2, v4

    .line 78
    move v1, p1

    goto :goto_17
.end method
