.class public interface abstract Lcom/lge/gallery/decoder/GalleryRegionDecoder;
.super Ljava/lang/Object;
.source "GalleryRegionDecoder.java"


# static fields
.field public static final INVALID_LENGTH:I


# virtual methods
.method public abstract decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
.end method

.method public abstract getHeight()I
.end method

.method public abstract getWidth()I
.end method

.method public abstract inBitmapSupported()Z
.end method

.method public abstract isRecycled()Z
.end method

.method public abstract recycle()V
.end method
