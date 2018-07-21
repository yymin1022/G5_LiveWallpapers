.class public Lcom/lge/gallery/data/core/VRMetadataLoader;
.super Ljava/lang/Object;
.source "VRMetadataLoader.java"

# interfaces
.implements Lcom/lge/gallery/util/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/FutureListener",
        "<",
        "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
        ">;"
    }
.end annotation


# instance fields
.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadingTask:Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/Future",
            "<",
            "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field protected final mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

.field private mMetadata:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 3
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mLock:Ljava/lang/Object;

    .line 34
    iput-object p1, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 35
    return-void
.end method


# virtual methods
.method protected createMetadatLoader(Landroid/content/Context;)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;

    iget-object v1, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaItem;->getContentUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    return-object v0
.end method

.method public load(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V
    .registers 8
    .param p1, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "listener"    # Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;

    .prologue
    .line 38
    iget-object v3, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 39
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMetadata:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .line 40
    .local v0, "metadata":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    if-eqz v0, :cond_10

    .line 41
    iget-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    iget-boolean v4, v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    invoke-interface {p2, v2, v4, v0}, Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;->onMetadataLoaded(Lcom/lge/gallery/data/core/MediaItem;ZLcom/lge/gallery/data/core/vr/PhotoSphereMetadata;)V

    .line 42
    monitor-exit v3

    .line 54
    :goto_f
    return-void

    .line 44
    :cond_10
    iget-object v1, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mLoadingTask:Lcom/lge/gallery/util/Future;

    .line 45
    .local v1, "task":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;>;"
    if-nez v1, :cond_26

    .line 46
    invoke-interface {p1}, Lcom/lge/gallery/appinterface/GalleryApp;->getThreadPool()Lcom/lge/gallery/util/ThreadPool;

    move-result-object v2

    invoke-interface {p1}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/lge/gallery/data/core/VRMetadataLoader;->createMetadatLoader(Landroid/content/Context;)Lcom/lge/gallery/util/ThreadPool$Job;

    move-result-object v4

    invoke-virtual {v2, v4, p0}, Lcom/lge/gallery/util/ThreadPool;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v2

    iput-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mLoadingTask:Lcom/lge/gallery/util/Future;

    .line 49
    :cond_26
    iget-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mListeners:Ljava/util/ArrayList;

    if-nez v2, :cond_31

    .line 50
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mListeners:Ljava/util/ArrayList;

    .line 52
    :cond_31
    iget-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    monitor-exit v3

    goto :goto_f

    .end local v0    # "metadata":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    .end local v1    # "task":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;>;"
    :catchall_38
    move-exception v2

    monitor-exit v3
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_38

    throw v2
.end method

.method public onFutureDone(Lcom/lge/gallery/util/Future;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;>;"
    iget-object v4, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 63
    :try_start_3
    invoke-interface {p1}, Lcom/lge/gallery/util/Future;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .line 64
    .local v2, "metadata":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    if-nez v2, :cond_d

    sget-object v2, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->DEFAULT_METADATA:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .end local v2    # "metadata":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    :cond_d
    iput-object v2, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMetadata:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .line 65
    iget-object v3, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;

    .line 66
    .local v1, "listener":Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;
    iget-object v3, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    iget-object v5, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMetadata:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    iget-boolean v5, v5, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->is360:Z

    iget-object v6, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mMetadata:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    invoke-interface {v1, v3, v5, v6}, Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;->onMetadataLoaded(Lcom/lge/gallery/data/core/MediaItem;ZLcom/lge/gallery/data/core/vr/PhotoSphereMetadata;)V

    goto :goto_15

    .line 69
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;
    :catchall_2d
    move-exception v3

    monitor-exit v4
    :try_end_2f
    .catchall {:try_start_3 .. :try_end_2f} :catchall_2d

    throw v3

    .line 68
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_30
    :try_start_30
    iget-object v3, p0, Lcom/lge/gallery/data/core/VRMetadataLoader;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 69
    monitor-exit v4
    :try_end_36
    .catchall {:try_start_30 .. :try_end_36} :catchall_2d

    .line 70
    return-void
.end method
