.class public Lcom/lge/gallery/data/DataSourceManager;
.super Ljava/lang/Object;
.source "DataSourceManager.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized initializeDataSource(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/DataManager;Ljava/util/ArrayList;)V
    .registers 9
    .param p0, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p1, "manager"    # Lcom/lge/gallery/data/core/DataManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Lcom/lge/gallery/data/core/DataManager;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSource;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "sourceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource;>;"
    const-class v4, Lcom/lge/gallery/data/DataSourceManager;

    monitor-enter v4

    move-object v1, p1

    .line 28
    .local v1, "m":Lcom/lge/gallery/data/core/DataManager;
    if-eqz v1, :cond_37

    if-eqz p0, :cond_37

    :try_start_8
    invoke-virtual {v1}, Lcom/lge/gallery/data/core/DataManager;->getSourceSize()I

    move-result v3

    if-nez v3, :cond_37

    .line 29
    if-eqz p2, :cond_2e

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2e

    .line 30
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaSource;

    .line 31
    .local v2, "source":Lcom/lge/gallery/data/core/MediaSource;
    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/lge/gallery/data/core/DataManager;->addMediaSource(Lcom/lge/gallery/data/core/MediaSource;Z)V
    :try_end_2a
    .catchall {:try_start_8 .. :try_end_2a} :catchall_2b

    goto :goto_1a

    .line 27
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :catchall_2b
    move-exception v3

    monitor-exit v4

    throw v3

    .line 34
    :cond_2e
    :try_start_2e
    new-instance v3, Lcom/lge/gallery/data/local/LocalSource;

    invoke-direct {v3, p0}, Lcom/lge/gallery/data/local/LocalSource;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;)V

    const/4 v5, 0x1

    invoke-virtual {v1, v3, v5}, Lcom/lge/gallery/data/core/DataManager;->addMediaSource(Lcom/lge/gallery/data/core/MediaSource;Z)V
    :try_end_37
    .catchall {:try_start_2e .. :try_end_37} :catchall_2b

    .line 37
    :cond_37
    monitor-exit v4

    return-void
.end method
