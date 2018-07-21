.class public Lcom/lge/gallery/vr/viewer/data/VrImage;
.super Ljava/lang/Object;
.source "VrImage.java"

# interfaces
.implements Lcom/lge/gallery/util/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/data/VrImage$1;,
        Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;,
        Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/FutureListener",
        "<",
        "Lcom/lge/gallery/vr/viewer/data/TileProvider;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VrImage"


# instance fields
.field private mHorizontalCircumference:F

.field private mHorizontalStartPos:F

.field private mListenerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLoader:Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/Future",
            "<",
            "Lcom/lge/gallery/vr/viewer/data/TileProvider;",
            ">;"
        }
    .end annotation
.end field

.field private final mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

.field private final mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

.field private final mThreadPool:Lcom/lge/gallery/util/ThreadPool;

.field private final mTileLoaderLock:Ljava/lang/Object;

.field private mTileProvider:Lcom/lge/gallery/vr/viewer/data/TileProvider;

.field private mVerticalCircumference:F

.field private mVerticalStartPos:F


# direct methods
.method public constructor <init>(Lcom/lge/gallery/util/ThreadPool;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;)V
    .registers 12
    .param p1, "pool"    # Lcom/lge/gallery/util/ThreadPool;
    .param p2, "item"    # Lcom/lge/gallery/data/core/MediaItem;
    .param p3, "metadata"    # Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .prologue
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mListenerList:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileLoaderLock:Ljava/lang/Object;

    .line 56
    iput-object p2, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 57
    iput-object p3, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .line 58
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    .line 59
    iget v0, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    int-to-double v0, v0

    iget v2, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    mul-double/2addr v0, v4

    mul-double/2addr v0, v6

    double-to-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mHorizontalCircumference:F

    .line 60
    iget v0, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    int-to-double v0, v0

    iget v2, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    mul-double/2addr v0, v4

    double-to-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mVerticalCircumference:F

    .line 61
    iget v0, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaLeft:I

    int-to-double v0, v0

    iget v2, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    mul-double/2addr v0, v4

    mul-double/2addr v0, v6

    double-to-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mHorizontalStartPos:F

    .line 62
    iget v0, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaTop:I

    int-to-double v0, v0

    iget v2, p3, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    mul-double/2addr v0, v4

    double-to-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mVerticalStartPos:F

    .line 63
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/vr/viewer/data/VrImage;)Lcom/lge/gallery/data/core/MediaItem;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/data/VrImage;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    return-object v0
.end method


# virtual methods
.method public getHorizontalCircumference()F
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mHorizontalCircumference:F

    return v0
.end method

.method public getHorizontalStartPos()F
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mHorizontalStartPos:F

    return v0
.end method

.method public getPhotoSphereMetaData()Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    return-object v0
.end method

.method public getVerticalCircumference()F
    .registers 2

    .prologue
    .line 106
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mVerticalCircumference:F

    return v0
.end method

.method public getVerticalStartPos()F
    .registers 2

    .prologue
    .line 114
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mVerticalStartPos:F

    return v0
.end method

.method public isFull360()Z
    .registers 3

    .prologue
    .line 118
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    iget v0, v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    iget v1, v1, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageWidthPixels:I

    if-ne v0, v1, :cond_16

    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    iget v0, v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoHeightPixels:I

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mMetaData:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    iget v1, v1, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->croppedAreaImageHeightPixels:I

    if-ne v0, v1, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public loadTileProvider(Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;)V
    .registers 6
    .param p1, "listener"    # Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;

    .prologue
    .line 66
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileLoaderLock:Ljava/lang/Object;

    monitor-enter v1

    .line 67
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileProvider:Lcom/lge/gallery/vr/viewer/data/TileProvider;

    if-eqz v0, :cond_10

    .line 68
    if-eqz p1, :cond_e

    .line 69
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileProvider:Lcom/lge/gallery/vr/viewer/data/TileProvider;

    invoke-interface {p1, v0}, Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;->onLoaded(Lcom/lge/gallery/vr/viewer/data/TileProvider;)V

    .line 71
    :cond_e
    monitor-exit v1

    .line 83
    :goto_f
    return-void

    .line 73
    :cond_10
    if-eqz p1, :cond_15

    .line 74
    invoke-interface {p1}, Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;->onStarted()V

    .line 76
    :cond_15
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mLoader:Lcom/lge/gallery/util/Future;

    if-nez v0, :cond_27

    .line 77
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    new-instance v2, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/lge/gallery/vr/viewer/data/VrImage$TileProviderLoader;-><init>(Lcom/lge/gallery/vr/viewer/data/VrImage;Lcom/lge/gallery/vr/viewer/data/VrImage$1;)V

    invoke-virtual {v0, v2, p0}, Lcom/lge/gallery/util/ThreadPool;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mLoader:Lcom/lge/gallery/util/Future;

    .line 79
    :cond_27
    if-eqz p1, :cond_2e

    .line 80
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_2e
    monitor-exit v1

    goto :goto_f

    :catchall_30
    move-exception v0

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_30

    throw v0
.end method

.method public onFutureDone(Lcom/lge/gallery/util/Future;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Lcom/lge/gallery/vr/viewer/data/TileProvider;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Lcom/lge/gallery/vr/viewer/data/TileProvider;>;"
    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileLoaderLock:Ljava/lang/Object;

    monitor-enter v4

    .line 88
    :try_start_3
    invoke-interface {p1}, Lcom/lge/gallery/util/Future;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/vr/viewer/data/TileProvider;

    .line 89
    .local v2, "provider":Lcom/lge/gallery/vr/viewer/data/TileProvider;
    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mTileProvider:Lcom/lge/gallery/vr/viewer/data/TileProvider;

    .line 90
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;

    .line 91
    .local v1, "listener":Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;
    invoke-interface {v1, v2}, Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;->onLoaded(Lcom/lge/gallery/vr/viewer/data/TileProvider;)V

    goto :goto_11

    .line 94
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;
    .end local v2    # "provider":Lcom/lge/gallery/vr/viewer/data/TileProvider;
    :catchall_21
    move-exception v3

    monitor-exit v4
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw v3

    .line 93
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v2    # "provider":Lcom/lge/gallery/vr/viewer/data/TileProvider;
    :cond_24
    :try_start_24
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/data/VrImage;->mListenerList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 94
    monitor-exit v4
    :try_end_2a
    .catchall {:try_start_24 .. :try_end_2a} :catchall_21

    .line 95
    return-void
.end method
