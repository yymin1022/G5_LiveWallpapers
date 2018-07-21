.class public Lcom/lge/gallery/data/util/BitmapPoolSelector;
.super Ljava/lang/Object;
.source "BitmapPoolSelector.java"


# static fields
.field private static final POOL_STUB:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

.field private static final SCREENNAIL_BYTE_COUNT:I

.field private static final TAG:Ljava/lang/String; = "BitmapPoolSelector"

.field private static final THUMB_BYTE_COUNT:I

.field private static final USE_BITMAP_POOL:Z = true

.field private static final sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

.field private static final sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/16 v4, 0x280

    const/16 v3, 0xc8

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-direct {v0, v2, v2, v1, v2}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;-><init>(IILandroid/graphics/Bitmap$Config;I)V

    sput-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->POOL_STUB:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 26
    new-instance v0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x40

    invoke-direct {v0, v3, v3, v1, v2}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;-><init>(IILandroid/graphics/Bitmap$Config;I)V

    sput-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 33
    new-instance v0, Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x3

    invoke-direct {v0, v4, v4, v1, v2}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;-><init>(IILandroid/graphics/Bitmap$Config;I)V

    sput-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 39
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->getAllocatedByteCount()I

    move-result v0

    sput v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->THUMB_BYTE_COUNT:I

    .line 40
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->getAllocatedByteCount()I

    move-result v0

    sput v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->SCREENNAIL_BYTE_COUNT:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->clear()V

    .line 80
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v0}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->clear()V

    .line 81
    return-void
.end method

.method public static getBitmapPool(I)Lcom/lge/gallery/data/util/ByteCountBitmapPool;
    .registers 2
    .param p0, "size"    # I

    .prologue
    .line 46
    const/4 v0, 0x0

    .line 47
    .local v0, "pool":Lcom/lge/gallery/data/util/ByteCountBitmapPool;
    sparse-switch p0, :sswitch_data_e

    .line 55
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->POOL_STUB:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 58
    :goto_6
    return-object v0

    .line 49
    :sswitch_7
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 50
    goto :goto_6

    .line 52
    :sswitch_a
    sget-object v0, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    .line 53
    goto :goto_6

    .line 47
    nop

    :sswitch_data_e
    .sparse-switch
        0xc8 -> :sswitch_7
        0x280 -> :sswitch_a
    .end sparse-switch
.end method

.method public static getBitmapPoolByByteCount(I)Lcom/lge/gallery/data/util/ByteCountBitmapPool;
    .registers 3
    .param p0, "byteCount"    # I

    .prologue
    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, "targetSize":I
    sget v1, Lcom/lge/gallery/data/util/BitmapPoolSelector;->THUMB_BYTE_COUNT:I

    if-ne v1, p0, :cond_c

    .line 64
    const/16 v0, 0xc8

    .line 68
    :cond_7
    :goto_7
    invoke-static {v0}, Lcom/lge/gallery/data/util/BitmapPoolSelector;->getBitmapPool(I)Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    move-result-object v1

    return-object v1

    .line 65
    :cond_c
    sget v1, Lcom/lge/gallery/data/util/BitmapPoolSelector;->SCREENNAIL_BYTE_COUNT:I

    if-ne v1, p0, :cond_7

    .line 66
    const/16 v0, 0x280

    goto :goto_7
.end method

.method public static printStatus()V
    .registers 2

    .prologue
    .line 84
    const-string v0, "BitmapPoolSelector"

    sget-object v1, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sThumbnailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v1}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    const-string v0, "BitmapPoolSelector"

    sget-object v1, Lcom/lge/gallery/data/util/BitmapPoolSelector;->sScreennailBitmapPool:Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    invoke-virtual {v1}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-void
.end method

.method public static recycle(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 72
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 76
    :cond_8
    :goto_8
    return-void

    .line 75
    :cond_9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v0

    invoke-static {v0}, Lcom/lge/gallery/data/util/BitmapPoolSelector;->getBitmapPoolByByteCount(I)Lcom/lge/gallery/data/util/ByteCountBitmapPool;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lge/gallery/data/util/ByteCountBitmapPool;->put(Landroid/graphics/Bitmap;)V

    goto :goto_8
.end method
