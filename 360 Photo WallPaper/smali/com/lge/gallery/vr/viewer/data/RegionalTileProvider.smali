.class public Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;
.super Ljava/lang/Object;
.source "RegionalTileProvider.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/data/TileProvider;


# static fields
.field private static final TILE_SIZE:I = 0x400


# instance fields
.field private final mHeightTileCount:I

.field private final mImageHeight:I

.field private final mImageWidth:I

.field private mRegionDecoder:Lcom/lge/gallery/decoder/GalleryRegionDecoder;

.field private final mSampleSize:I

.field private final mWidthTileCount:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/decoder/GalleryRegionDecoder;)V
    .registers 6
    .param p1, "regionDecoder"    # Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    .prologue
    const-wide/high16 v2, 0x4090000000000000L    # 1024.0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mRegionDecoder:Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    .line 29
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mRegionDecoder:Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    invoke-interface {v0}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageWidth:I

    .line 30
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mRegionDecoder:Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    invoke-interface {v0}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageHeight:I

    .line 31
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageWidth:I

    int-to-double v0, v0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mWidthTileCount:I

    .line 32
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageHeight:I

    int-to-double v0, v0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mHeightTileCount:I

    .line 33
    const/4 v0, 0x1

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    .line 34
    return-void
.end method

.method private getTileRect(II)Landroid/graphics/Rect;
    .registers 10
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 65
    iget v5, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    mul-int/lit16 v4, v5, 0x400

    .line 66
    .local v4, "unit":I
    mul-int v1, p1, v4

    .line 67
    .local v1, "l":I
    mul-int v3, p2, v4

    .line 68
    .local v3, "t":I
    iget v5, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mWidthTileCount:I

    add-int/lit8 v5, v5, -0x1

    if-ne p1, v5, :cond_26

    iget v5, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageWidth:I

    iget v6, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    div-int v2, v5, v6

    .line 69
    .local v2, "r":I
    :goto_14
    iget v5, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mHeightTileCount:I

    add-int/lit8 v5, v5, -0x1

    if-ne p2, v5, :cond_29

    iget v5, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mImageHeight:I

    iget v6, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    div-int v0, v5, v6

    .line 70
    .local v0, "b":I
    :goto_20
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v1, v3, v2, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v5

    .line 68
    .end local v0    # "b":I
    .end local v2    # "r":I
    :cond_26
    add-int v2, v1, v4

    goto :goto_14

    .line 69
    .restart local v2    # "r":I
    :cond_29
    add-int v0, v3, v4

    goto :goto_20
.end method


# virtual methods
.method public getCurrentTileLevel()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    return v0
.end method

.method public getHeightTileCount()I
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mHeightTileCount:I

    return v0
.end method

.method public getTile(II)Lcom/lge/gallery/vr/viewer/data/Tile;
    .registers 11
    .param p1, "xOffset"    # I
    .param p2, "yOffset"    # I

    .prologue
    .line 53
    new-instance v7, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v7}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 54
    .local v7, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v0, 0x1

    iput-boolean v0, v7, Landroid/graphics/BitmapFactory$Options;->inPreferQualityOverSpeed:Z

    .line 55
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v0, v7, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 56
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    iput v0, v7, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 57
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mRegionDecoder:Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->getTileRect(II)Landroid/graphics/Rect;

    move-result-object v2

    invoke-interface {v0, v2, v7}, Lcom/lge/gallery/decoder/GalleryRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 58
    .local v1, "b":Landroid/graphics/Bitmap;
    if-nez v1, :cond_1e

    .line 59
    const/4 v0, 0x0

    .line 61
    :goto_1d
    return-object v0

    :cond_1e
    new-instance v0, Lcom/lge/gallery/vr/viewer/data/Tile;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    iget v6, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mSampleSize:I

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/lge/gallery/vr/viewer/data/Tile;-><init>(Landroid/graphics/Bitmap;IIIII)V

    goto :goto_1d
.end method

.method public getTileSize()I
    .registers 2

    .prologue
    .line 38
    const/16 v0, 0x400

    return v0
.end method

.method public getWidthTileCount()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;->mWidthTileCount:I

    return v0
.end method
