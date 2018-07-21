.class public abstract Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;
.super Ljava/lang/Object;
.source "AbstractWallpaperCover.java"

# interfaces
.implements Lcom/lge/gallery/vr/wallpaper/WallpaperCover;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCachedIcon:Landroid/graphics/drawable/Drawable;

.field protected mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-class v0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mContext:Landroid/content/Context;

    .line 31
    return-void
.end method

.method private decodeInternal(I)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "maxSize"    # I

    .prologue
    .line 51
    const/4 v2, 0x0

    .line 52
    .local v2, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 54
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_2
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->openInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 55
    invoke-static {v2, p1}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->createDecodingOptions(Ljava/io/InputStream;I)Landroid/graphics/BitmapFactory$Options;

    move-result-object v3

    .line 56
    .local v3, "options":Landroid/graphics/BitmapFactory$Options;
    invoke-static {v2}, Lcom/lge/gallery/vr/wallpaper/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 57
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->openInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 58
    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1a
    .catchall {:try_start_2 .. :try_end_15} :catchall_26

    move-result-object v0

    .line 62
    invoke-static {v2}, Lcom/lge/gallery/vr/wallpaper/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 64
    .end local v3    # "options":Landroid/graphics/BitmapFactory$Options;
    :goto_19
    return-object v0

    .line 59
    :catch_1a
    move-exception v1

    .line 60
    .local v1, "e":Ljava/io/IOException;
    :try_start_1b
    sget-object v4, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->TAG:Ljava/lang/String;

    const-string v5, "Failed to create icon."

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_26

    .line 62
    invoke-static {v2}, Lcom/lge/gallery/vr/wallpaper/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_19

    .end local v1    # "e":Ljava/io/IOException;
    :catchall_26
    move-exception v4

    invoke-static {v2}, Lcom/lge/gallery/vr/wallpaper/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v4
.end method


# virtual methods
.method public getPreviewBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    const/16 v1, 0x800

    .line 47
    invoke-direct {p0, v1}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->decodeInternal(I)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->getScaledBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getThumbnailIcon()Landroid/graphics/drawable/Drawable;
    .registers 4

    .prologue
    .line 35
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mCachedIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_7

    .line 36
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mCachedIcon:Landroid/graphics/drawable/Drawable;

    .line 42
    :goto_6
    return-object v1

    .line 38
    :cond_7
    const/16 v1, 0x1f4

    invoke-direct {p0, v1}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->decodeInternal(I)Landroid/graphics/Bitmap;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/lge/gallery/vr/wallpaper/Utils;->cropCenter(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 39
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_21

    .line 40
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mCachedIcon:Landroid/graphics/drawable/Drawable;

    .line 42
    :cond_21
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;->mCachedIcon:Landroid/graphics/drawable/Drawable;

    goto :goto_6
.end method

.method public isObservable()Z
    .registers 2

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract openInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
