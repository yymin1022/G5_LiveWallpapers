.class Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;
.super Ljava/lang/Object;
.source "VrImage.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/data/VrImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TileProviderLoader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/ThreadPool$Job",
        "<",
        "Lcom/lge/gallery/vr/viewer/data/TileProvider;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/viewer/data/VrImage;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/vr/viewer/data/VrImage;)V
    .registers 2

    .prologue
    .line 37
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;->this$0:Lcom/lge/gallery/vr/viewer/data/VrImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/viewer/data/VrImage;Lcom/lge/gallery/vr/viewer/data/VrImage$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/vr/viewer/data/VrImage;
    .param p2, "x1"    # Lcom/lge/gallery/vr/viewer/data/VrImage$1;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;-><init>(Lcom/lge/gallery/vr/viewer/data/VrImage;)V

    return-void
.end method


# virtual methods
.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/vr/viewer/data/TileProvider;
    .registers 5
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 40
    const-string v0, "VrImage"

    const-string v1, "generating TileProvider"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;->this$0:Lcom/lge/gallery/vr/viewer/data/VrImage;

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/data/VrImage;->access$000(Lcom/lge/gallery/vr/viewer/data/VrImage;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 42
    new-instance v1, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;

    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;->this$0:Lcom/lge/gallery/vr/viewer/data/VrImage;

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/data/VrImage;->access$000(Lcom/lge/gallery/vr/viewer/data/VrImage;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaItem;->requestLargeImage()Lcom/lge/gallery/util/ThreadPool$Job;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/lge/gallery/util/ThreadPool$Job;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    invoke-direct {v1, v0}, Lcom/lge/gallery/vr/viewer/data/RegionalTileProvider;-><init>(Lcom/lge/gallery/decoder/GalleryRegionDecoder;)V

    move-object v0, v1

    .line 45
    :goto_2d
    return-object v0

    .line 44
    :cond_2e
    const-string v0, "VrImage"

    const-string v1, "BitmapTileProvider used."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    new-instance v1, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;

    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;->this$0:Lcom/lge/gallery/vr/viewer/data/VrImage;

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/data/VrImage;->access$000(Lcom/lge/gallery/vr/viewer/data/VrImage;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/lge/gallery/data/core/MediaItem;->requestImage(I)Lcom/lge/gallery/util/ThreadPool$Job;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/lge/gallery/util/ThreadPool$Job;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-direct {v1, v0}, Lcom/lge/gallery/vr/viewer/data/BitmapTileProvider;-><init>(Landroid/graphics/Bitmap;)V

    move-object v0, v1

    goto :goto_2d
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/vr/viewer/data/TileProvider;

    move-result-object v0

    return-object v0
.end method
