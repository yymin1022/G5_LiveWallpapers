.class public abstract Lcom/lge/gallery/app/GalleryApplication;
.super Landroid/app/Application;
.source "GalleryApplication.java"

# interfaces
.implements Lcom/lge/gallery/appinterface/GalleryApp;


# instance fields
.field private mApplication:Landroid/app/Application;

.field private mDataManager:Lcom/lge/gallery/data/core/DataManager;

.field private mImageCacheService:Lcom/lge/gallery/data/cache/ImageCacheService;

.field private mThreadPool:Lcom/lge/gallery/util/ThreadPool;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 32
    iput-object p0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    return-void
.end method


# virtual methods
.method protected abstract generateSupportedMediaSource()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSource;",
            ">;"
        }
    .end annotation
.end method

.method public getAndroidContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    if-ne v0, p0, :cond_5

    .line 78
    .end local p0    # "this":Lcom/lge/gallery/app/GalleryApplication;
    :goto_4
    return-object p0

    .restart local p0    # "this":Lcom/lge/gallery/app/GalleryApplication;
    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_4
.end method

.method public getContentResolver()Landroid/content/ContentResolver;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    if-ne v0, p0, :cond_9

    .line 85
    invoke-super {p0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 87
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    goto :goto_8
.end method

.method public final declared-synchronized getDataManager()Lcom/lge/gallery/data/core/DataManager;
    .registers 3

    .prologue
    .line 48
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mDataManager:Lcom/lge/gallery/data/core/DataManager;

    if-nez v0, :cond_17

    .line 49
    new-instance v0, Lcom/lge/gallery/data/core/DataManager;

    iget-object v1, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/core/DataManager;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mDataManager:Lcom/lge/gallery/data/core/DataManager;

    .line 50
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mDataManager:Lcom/lge/gallery/data/core/DataManager;

    invoke-virtual {p0}, Lcom/lge/gallery/app/GalleryApplication;->generateSupportedMediaSource()Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/lge/gallery/data/DataSourceManager;->initializeDataSource(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/DataManager;Ljava/util/ArrayList;)V

    .line 52
    :cond_17
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mDataManager:Lcom/lge/gallery/data/core/DataManager;
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    monitor-exit p0

    return-object v0

    .line 48
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getImageCacheService()Lcom/lge/gallery/data/cache/ImageCacheService;
    .registers 3

    .prologue
    .line 67
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mImageCacheService:Lcom/lge/gallery/data/cache/ImageCacheService;

    if-nez v0, :cond_10

    .line 68
    new-instance v0, Lcom/lge/gallery/data/cache/FacadeImageCacheService;

    invoke-virtual {p0}, Lcom/lge/gallery/app/GalleryApplication;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/cache/FacadeImageCacheService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mImageCacheService:Lcom/lge/gallery/data/cache/ImageCacheService;

    .line 70
    :cond_10
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mImageCacheService:Lcom/lge/gallery/data/cache/ImageCacheService;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    monitor-exit p0

    return-object v0

    .line 67
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMainLooper()Landroid/os/Looper;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    if-ne v0, p0, :cond_9

    .line 94
    invoke-super {p0}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    .line 96
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    goto :goto_8
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    if-ne v0, p0, :cond_9

    .line 103
    invoke-super {p0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 105
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_8
.end method

.method public declared-synchronized getThreadPool()Lcom/lge/gallery/util/ThreadPool;
    .registers 2

    .prologue
    .line 59
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    if-nez v0, :cond_c

    .line 60
    new-instance v0, Lcom/lge/gallery/util/ThreadPool;

    invoke-direct {v0}, Lcom/lge/gallery/util/ThreadPool;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;

    .line 62
    :cond_c
    iget-object v0, p0, Lcom/lge/gallery/app/GalleryApplication;->mThreadPool:Lcom/lge/gallery/util/ThreadPool;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 59
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onCreate()V
    .registers 1

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 37
    invoke-static {p0}, Lcom/lge/gallery/util/GalleryUtils;->initialize(Landroid/content/Context;)V

    .line 38
    iput-object p0, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    .line 39
    return-void
.end method

.method public onCreate(Landroid/app/Application;)V
    .registers 2
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 42
    invoke-static {p1}, Lcom/lge/gallery/util/GalleryUtils;->initialize(Landroid/content/Context;)V

    .line 43
    iput-object p1, p0, Lcom/lge/gallery/app/GalleryApplication;->mApplication:Landroid/app/Application;

    .line 44
    return-void
.end method
