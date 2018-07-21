.class public interface abstract Lcom/lge/gallery/appinterface/GalleryApp;
.super Ljava/lang/Object;
.source "GalleryApp.java"


# virtual methods
.method public abstract getAndroidContext()Landroid/content/Context;
.end method

.method public abstract getContentResolver()Landroid/content/ContentResolver;
.end method

.method public abstract getDataManager()Lcom/lge/gallery/data/core/DataManager;
.end method

.method public abstract getImageCacheService()Lcom/lge/gallery/data/cache/ImageCacheService;
.end method

.method public abstract getMainLooper()Landroid/os/Looper;
.end method

.method public abstract getResources()Landroid/content/res/Resources;
.end method

.method public abstract getThreadPool()Lcom/lge/gallery/util/ThreadPool;
.end method
