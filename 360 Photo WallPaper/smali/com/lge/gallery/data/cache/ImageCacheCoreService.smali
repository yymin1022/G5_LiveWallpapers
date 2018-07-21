.class public interface abstract Lcom/lge/gallery/data/cache/ImageCacheCoreService;
.super Ljava/lang/Object;
.source "ImageCacheCoreService.java"


# virtual methods
.method public abstract clearCache()V
.end method

.method public abstract getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II)Landroid/graphics/Bitmap;
.end method

.method public abstract getImageData([B)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract putImageData([B[B)V
.end method

.method public abstract storeCachedBitmap(Landroid/graphics/Bitmap;Lcom/lge/gallery/data/core/Path;I)V
.end method
