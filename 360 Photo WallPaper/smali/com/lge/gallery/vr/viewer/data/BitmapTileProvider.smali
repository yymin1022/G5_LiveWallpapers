.class public Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;
.super Ljava/lang/Object;
.source "BitmapTileProvider.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/data/TileProvider;


# instance fields
.field private mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

.field private mTileSize:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Lcom/lge/gallery/vr/viewer/data/Tile;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v6, 0x1

    move-object v1, p1

    move v3, v2

    invoke-direct/range {v0 .. v6}, Lcom/lge/gallery/vr/viewer/data/Tile;-><init>(Landroid/graphics/Bitmap;IIIII)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;->mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

    .line 22
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->nextPowerOf2(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;->mTileSize:I

    .line 23
    return-void
.end method


# virtual methods
.method public getCurrentTileLevel()I
    .registers 2

    .prologue
    .line 47
    const/4 v0, 0x1

    return v0
.end method

.method public getHeightTileCount()I
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public getTile(II)Lcom/lge/gallery/vr/viewer/data/Tile;
    .registers 4
    .param p1, "xOffset"    # I
    .param p2, "yOffset"    # I

    .prologue
    .line 42
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;->mTile:Lcom/lge/gallery/vr/viewer/data/Tile;

    return-object v0
.end method

.method public getTileSize()I
    .registers 2

    .prologue
    .line 27
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;->mTileSize:I

    return v0
.end method

.method public getWidthTileCount()I
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x1

    return v0
.end method
