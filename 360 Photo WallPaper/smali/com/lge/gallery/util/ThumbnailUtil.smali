.class public Lcom/lge/gallery/util/ThumbnailUtil;
.super Ljava/lang/Object;
.source "ThumbnailUtil.java"


# static fields
.field private static final HD_PIXELS:I = 0x780

.field private static final INVALID_SIZE:I = 0x0

.field private static final MAX_SCREENNAIL_SIZE:I = 0x500

.field private static final MIN_SCREENNAIL_SIZE:I = 0x320

.field public static final TILE_BORDER:I = 0x1

.field public static final TILE_SIZE_LARGE:I = 0x1fe

.field public static final TILE_SIZE_SMALL:I = 0xfe

.field private static sLargeScreenNailSize:I

.field private static sTileSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput v0, Lcom/lge/gallery/util/ThumbnailUtil;->sLargeScreenNailSize:I

    .line 24
    const/16 v0, 0x1fe

    sput v0, Lcom/lge/gallery/util/ThumbnailUtil;->sTileSize:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLargeScreenNailSize()I
    .registers 1

    .prologue
    .line 38
    sget v0, Lcom/lge/gallery/util/ThumbnailUtil;->sLargeScreenNailSize:I

    return v0
.end method

.method public static getTileBorder()I
    .registers 1

    .prologue
    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method public static final getTileSize()I
    .registers 1

    .prologue
    .line 42
    sget v0, Lcom/lge/gallery/util/ThumbnailUtil;->sTileSize:I

    return v0
.end method

.method public static initialize(Landroid/util/DisplayMetrics;)V
    .registers 5
    .param p0, "metrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 27
    if-nez p0, :cond_3

    .line 35
    :goto_2
    return-void

    .line 30
    :cond_3
    iget v2, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 31
    .local v1, "maxScreenSize":I
    const/16 v2, 0x500

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 32
    .local v0, "largeScreennailSize":I
    const/16 v2, 0x320

    if-le v0, v2, :cond_20

    .end local v0    # "largeScreennailSize":I
    :goto_15
    sput v0, Lcom/lge/gallery/util/ThumbnailUtil;->sLargeScreenNailSize:I

    .line 34
    const/16 v2, 0x780

    if-lt v1, v2, :cond_22

    const/16 v2, 0x1fe

    :goto_1d
    sput v2, Lcom/lge/gallery/util/ThumbnailUtil;->sTileSize:I

    goto :goto_2

    .line 32
    .restart local v0    # "largeScreennailSize":I
    :cond_20
    const/4 v0, 0x0

    goto :goto_15

    .line 34
    .end local v0    # "largeScreennailSize":I
    :cond_22
    const/16 v2, 0xfe

    goto :goto_1d
.end method
