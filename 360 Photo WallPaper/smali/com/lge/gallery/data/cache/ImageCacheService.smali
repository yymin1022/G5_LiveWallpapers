.class public interface abstract Lcom/lge/gallery/data/cache/ImageCacheService;
.super Ljava/lang/Object;
.source "ImageCacheService.java"


# virtual methods
.method public abstract getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II)Landroid/graphics/Bitmap;
.end method

.method public abstract getCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Lcom/lge/gallery/data/core/Path;II[B)Landroid/graphics/Bitmap;
.end method

.method public abstract getCloudImageData(Lcom/lge/gallery/data/core/Path;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getCloudImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getImageData(Lcom/lge/gallery/data/core/Path;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getImageData(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaItemInfo;I)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getImageDataEx(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getOscImageData(Ljava/lang/String;Ljava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getSmallThumbImageData(Ljava/lang/String;J)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract getTimestampImageData(Lcom/lge/gallery/data/core/Path;IIJ)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.end method

.method public abstract putCloudImageData(Lcom/lge/gallery/data/core/Path;I[B)V
.end method

.method public abstract putCloudImageDataEx(Lcom/lge/gallery/data/core/Path;I[BLjava/lang/String;)V
.end method

.method public abstract putImageData(Lcom/lge/gallery/data/core/Path;I[B)V
.end method

.method public abstract putImageDataEx(Lcom/lge/gallery/data/core/Path;I[BLjava/lang/String;)V
.end method

.method public abstract putOscImageData(Ljava/lang/String;Ljava/lang/String;[B)V
.end method

.method public abstract putSmallThumbImageData(Ljava/lang/String;J[B)V
.end method

.method public abstract putTimestampImageData(Lcom/lge/gallery/data/core/Path;IIJ[B)V
.end method

.method public abstract storeCachedBitmap(Landroid/graphics/Bitmap;Lcom/lge/gallery/data/core/Path;I)V
.end method
