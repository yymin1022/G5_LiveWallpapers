.class public Lcom/lge/gallery/data/local/LocalImage$LocalEmptyRequest;
.super Lcom/lge/gallery/data/cache/ImageCacheRequest;
.source "LocalImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/LocalImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalEmptyRequest"
.end annotation


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)V
    .registers 11
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "type"    # I
    .param p4, "localFilePath"    # Ljava/lang/String;

    .prologue
    .line 263
    invoke-static {p3}, Lcom/lge/gallery/data/core/MediaItem;->getTargetSize(I)I

    move-result v4

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/ImageCacheRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;III)V

    .line 264
    return-void
.end method


# virtual methods
.method public onDecodeOriginal(Lcom/lge/gallery/util/ThreadPool$JobContext;I)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "type"    # I

    .prologue
    .line 273
    const/4 v0, 0x0

    return-object v0
.end method

.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Landroid/graphics/Bitmap;
    .registers 3
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 268
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/local/LocalImage$LocalEmptyRequest;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
