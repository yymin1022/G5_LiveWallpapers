.class public Lcom/lge/gallery/vr/wallpaper/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Utils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 23
    if-nez p0, :cond_3

    .line 31
    :goto_2
    return-void

    .line 27
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 28
    :catch_7
    move-exception v0

    .line 29
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "Utils"

    const-string v2, "close fail"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static cropCenter(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .registers 11
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "recycle"    # Z

    .prologue
    const/4 v8, 0x0

    .line 35
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 53
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_9
    :goto_9
    return-object p0

    .line 38
    .restart local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_a
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 39
    .local v5, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 40
    .local v1, "height":I
    if-eq v5, v1, :cond_9

    .line 43
    invoke-static {v5, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 45
    .local v3, "size":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    invoke-static {v3, v3, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 46
    .local v4, "target":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 47
    .local v0, "canvas":Landroid/graphics/Canvas;
    sub-int v6, v3, v5

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    sub-int v7, v3, v1

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v0, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 48
    new-instance v2, Landroid/graphics/Paint;

    const/4 v6, 0x2

    invoke-direct {v2, v6}, Landroid/graphics/Paint;-><init>(I)V

    .line 49
    .local v2, "paint":Landroid/graphics/Paint;
    invoke-virtual {v0, p0, v8, v8, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 50
    if-eqz p1, :cond_40

    .line 51
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_40
    move-object p0, v4

    .line 53
    goto :goto_9
.end method
