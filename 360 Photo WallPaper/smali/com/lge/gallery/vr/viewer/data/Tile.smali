.class public Lcom/lge/gallery/vr/viewer/data/Tile;
.super Ljava/lang/Object;
.source "Tile.java"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mHeight:I

.field private mHorizontalOffset:I

.field private mLevel:I

.field private mVerticalOffset:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIIII)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "level"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mBitmap:Landroid/graphics/Bitmap;

    .line 24
    iput p2, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mHorizontalOffset:I

    .line 25
    iput p3, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mVerticalOffset:I

    .line 26
    iput p4, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mWidth:I

    .line 27
    iput p5, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mHeight:I

    .line 28
    iput p6, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mLevel:I

    .line 29
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mHeight:I

    return v0
.end method

.method public getHorizontalOffset()I
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mHorizontalOffset:I

    return v0
.end method

.method public getLevel()I
    .registers 2

    .prologue
    .line 52
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mLevel:I

    return v0
.end method

.method public getVerticalOffset()I
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mVerticalOffset:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 44
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Tile;->mWidth:I

    return v0
.end method
