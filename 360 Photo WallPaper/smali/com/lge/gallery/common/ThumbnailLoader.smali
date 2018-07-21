.class public Lcom/lge/gallery/common/ThumbnailLoader;
.super Lcom/lge/gallery/common/BitmapLoader;
.source "ThumbnailLoader.java"


# instance fields
.field private final mLoaderListener:Lcom/lge/gallery/common/BitmapLoaderListener;

.field protected final mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

.field protected final mSlotIndex:I

.field protected final mThreadPool:Lcom/lge/gallery/util/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/util/ThreadPool;ILcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/common/BitmapLoaderListener;)V
    .registers 5
    .param p1, "threadPool"    # Lcom/lge/gallery/util/ThreadPool;
    .param p2, "slotIndex"    # I
    .param p3, "item"    # Lcom/lge/gallery/data/core/MediaItem;
    .param p4, "listener"    # Lcom/lge/gallery/common/BitmapLoaderListener;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/lge/gallery/common/BitmapLoader;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    .line 28
    iput-object p3, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 29
    iput-object p4, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mLoaderListener:Lcom/lge/gallery/common/BitmapLoaderListener;

    .line 30
    iput p2, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mSlotIndex:I

    .line 31
    return-void
.end method


# virtual methods
.method protected onLoadComplete(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mLoaderListener:Lcom/lge/gallery/common/BitmapLoaderListener;

    if-eqz v0, :cond_b

    .line 42
    iget-object v0, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mLoaderListener:Lcom/lge/gallery/common/BitmapLoaderListener;

    iget v1, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mSlotIndex:I

    invoke-interface {v0, v1, p0}, Lcom/lge/gallery/common/BitmapLoaderListener;->onLoadComplete(ILcom/lge/gallery/common/BitmapLoader;)V

    .line 44
    :cond_b
    return-void
.end method

.method protected submitBitmapTask(Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/FutureListener",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "l":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<Landroid/graphics/Bitmap;>;"
    iget-object v0, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    iget-object v1, p0, Lcom/lge/gallery/common/ThumbnailLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/MediaItem;->requestImage(I)Lcom/lge/gallery/util/ThreadPool$Job;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/lge/gallery/util/ThreadPool;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    return-object v0
.end method
