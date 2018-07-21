.class public Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
.super Ljava/lang/Object;
.source "PhotoSphereMetadata.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final PS_NS:Ljava/lang/String; = "http://ns.google.com/photos/1.0/panorama/"

.field private static final TAG:Ljava/lang/String; = "PhotoSphereMetadata"


# instance fields
.field public croppedAreaImageHeightPixels:I

.field public croppedAreaImageWidthPixels:I

.field public croppedAreaLeft:I

.field public croppedAreaTop:I

.field public fullPanoHeightPixels:I

.field public fullPanoWidthPixels:I

.field public imageHeight:I

.field public imageWidth:I

.field public initialCameraDolly:D

.field public initialHorizontalFOVDegrees:D

.field public initialViewHeadingDegrees:D

.field public initialViewPitchDegrees:D

.field public is360:Z

.field public poseHeadingDegrees:D

.field public posePitchDegrees:D

.field public poseRollDegrees:D

.field public projectionType:Ljava/lang/String;

.field public usePanoramaViewer:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->projectionType:Ljava/lang/String;

    .line 46
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    .line 47
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    .line 48
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    .line 49
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    .line 50
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaLeft:I

    .line 51
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaTop:I

    .line 52
    iput-boolean v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->usePanoramaViewer:Z

    .line 53
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->imageWidth:I

    .line 54
    iput v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->imageHeight:I

    .line 55
    iput-boolean v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    .line 56
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIIIIIIZ)V
    .registers 14
    .param p1, "proj"    # Ljava/lang/String;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "fullWidth"    # I
    .param p5, "fullHeight"    # I
    .param p6, "croppedWidth"    # I
    .param p7, "croppedHeight"    # I
    .param p8, "croppedLeft"    # I
    .param p9, "croppedTop"    # I
    .param p10, "usePanoramaViewer"    # Z

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->projectionType:Ljava/lang/String;

    .line 61
    iput p4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    .line 62
    iput p5, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    .line 63
    iput p6, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    .line 64
    iput p7, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    .line 65
    iput p8, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaLeft:I

    .line 66
    iput p9, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaTop:I

    .line 67
    iput-boolean p10, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->usePanoramaViewer:Z

    .line 68
    iput p2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->imageWidth:I

    .line 69
    iput p3, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->imageHeight:I

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    .line 71
    const-string v0, "PhotoSphereMetadata"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[http://ns.google.com/photos/1.0/panorama/] projection type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->projectionType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", w = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", h = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return-void
.end method

.method public static getMetadata(Landroid/content/Context;Landroid/net/Uri;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 75
    const/4 v12, 0x0

    .line 76
    .local v12, "is":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 77
    .local v2, "width":I
    const/4 v3, 0x0

    .line 79
    .local v3, "height":I
    :try_start_5
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v12

    .line 80
    new-instance v13, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v13}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 81
    .local v13, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v0, 0x1

    iput-boolean v0, v13, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 82
    const/4 v0, 0x0

    invoke-static {v12, v0, v13}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 83
    iget v2, v13, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 84
    iget v3, v13, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1d} :catch_2d
    .catchall {:try_start_5 .. :try_end_1d} :catchall_39

    .line 88
    invoke-static {v12}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 90
    .end local v13    # "options":Landroid/graphics/BitmapFactory$Options;
    :goto_20
    new-instance v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    const-string v1, "equirectangular"

    move v4, v2

    move v5, v3

    move v6, v2

    move v7, v3

    move v9, v8

    invoke-direct/range {v0 .. v10}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;-><init>(Ljava/lang/String;IIIIIIIIZ)V

    return-object v0

    .line 85
    :catch_2d
    move-exception v11

    .line 86
    .local v11, "e":Ljava/lang/Exception;
    :try_start_2e
    const-string v0, "PhotoSphereMetadata"

    const-string v1, "Cannot decode stream."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_35
    .catchall {:try_start_2e .. :try_end_35} :catchall_39

    .line 88
    invoke-static {v12}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_20

    .end local v11    # "e":Ljava/lang/Exception;
    :catchall_39
    move-exception v0

    invoke-static {v12}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method


# virtual methods
.method public dump()V
    .registers 5

    .prologue
    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "projectionType : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->projectionType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "usePanoramaViewer : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->usePanoramaViewer:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fullPanoWidthPixels : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fullPanoHeightPixels : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "croppedAreaImageWidthPixels : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "croppedAreaImageHeightPixels : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "croppedAreaLeft : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaLeft:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "croppedAreaTop : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaTop:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "poseHeadingDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->poseHeadingDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "posePitchDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->posePitchDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "poseRollDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->poseRollDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initialViewHeadingDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialViewHeadingDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initialViewPitchDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialViewPitchDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initialHorizontalFOVDegrees : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialHorizontalFOVDegrees:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "initialCameraDolly : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialCameraDolly:D

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "is360 : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    .local v0, "dump":Ljava/lang/String;
    const-string v1, "PhotoSphereMetadata"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    return-void
.end method

.method public loadFromCursor(Landroid/database/Cursor;)V
    .registers 8
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 94
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-eqz v0, :cond_82

    move v0, v1

    :goto_a
    iput-boolean v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->usePanoramaViewer:Z

    .line 95
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->projectionType:Ljava/lang/String;

    .line 96
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->poseHeadingDegrees:D

    .line 97
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->posePitchDegrees:D

    .line 98
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->poseRollDegrees:D

    .line 99
    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialViewHeadingDegrees:D

    .line 100
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialViewPitchDegrees:D

    .line 101
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialHorizontalFOVDegrees:D

    .line 102
    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    .line 103
    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    .line 104
    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaLeft:I

    .line 105
    const/16 v0, 0xe

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaTop:I

    .line 106
    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    .line 107
    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    .line 108
    const/16 v0, 0x11

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->initialCameraDolly:D

    .line 109
    iget v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    if-lez v0, :cond_84

    iget v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    if-lez v0, :cond_84

    :goto_7f
    iput-boolean v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    .line 113
    return-void

    :cond_82
    move v0, v2

    .line 94
    goto :goto_a

    :cond_84
    move v1, v2

    .line 109
    goto :goto_7f
.end method
