.class public final Lcom/lge/gallery/decoder/GalleryDecodeUtils;
.super Ljava/lang/Object;
.source "GalleryDecodeUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GalleryDecodeUtils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static getImageBound(Landroid/content/Context;Ljava/io/FileDescriptor;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .prologue
    const/4 v5, 0x0

    .line 62
    if-eqz p0, :cond_5

    if-nez p1, :cond_b

    .line 63
    :cond_5
    new-instance v3, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v3, v5, v5}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    .line 74
    :goto_a
    return-object v3

    .line 65
    :cond_b
    const/4 v1, 0x0

    .line 67
    .local v1, "is":Ljava/io/InputStream;
    :try_start_c
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_11} :catch_19
    .catchall {:try_start_c .. :try_end_11} :catchall_2a

    .line 68
    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    :try_start_11
    invoke-static {p0, v2}, Lcom/lge/gallery/decoder/GalleryDecodeUtils;->getImageBound(Landroid/content/Context;Ljava/io/InputStream;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_32
    .catchall {:try_start_11 .. :try_end_14} :catchall_2f

    move-result-object v3

    .line 72
    invoke-static {v2}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_a

    .line 69
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    :catch_19
    move-exception v0

    .line 70
    .local v0, "e":Ljava/lang/Exception;
    :goto_1a
    :try_start_1a
    const-string v3, "GalleryDecodeUtils"

    const-string v4, "Cannot create inputstream. "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_2a

    .line 72
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 74
    new-instance v3, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v3, v5, v5}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    goto :goto_a

    .line 72
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2a
    move-exception v3

    :goto_2b
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v3

    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catchall_2f
    move-exception v3

    move-object v1, v2

    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_2b

    .line 69
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_32
    move-exception v0

    move-object v1, v2

    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_1a
.end method

.method public static getImageBound(Landroid/content/Context;Ljava/io/InputStream;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v5, 0x0

    .line 78
    if-eqz p0, :cond_5

    if-nez p1, :cond_b

    .line 79
    :cond_5
    new-instance v2, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v2, v5, v5}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    .line 89
    :goto_a
    return-object v2

    .line 81
    :cond_b
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 82
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 84
    const/4 v2, 0x0

    :try_start_14
    invoke-static {p1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 85
    new-instance v2, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {v2, v3, v4}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_20} :catch_21

    goto :goto_a

    .line 86
    :catch_21
    move-exception v1

    .line 87
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "GalleryDecodeUtils"

    const-string v3, "Unexpected exception during getting image size."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    new-instance v2, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v2, v5, v5}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    goto :goto_a
.end method

.method public static getImageBound(Landroid/content/Context;Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/lge/gallery/decoder/GalleryDecodeUtils;->getImageBound(Landroid/content/Context;Ljava/lang/String;Z)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    move-result-object v0

    return-object v0
.end method

.method public static getImageBound(Landroid/content/Context;Ljava/lang/String;Z)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "isDrm"    # Z

    .prologue
    const/4 v6, 0x0

    .line 42
    if-eqz p0, :cond_5

    if-nez p1, :cond_b

    .line 43
    :cond_5
    new-instance v3, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v3, v6, v6}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    .line 54
    :goto_a
    return-object v3

    .line 45
    :cond_b
    const/4 v1, 0x0

    .line 47
    .local v1, "is":Ljava/io/InputStream;
    :try_start_c
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_11} :catch_23
    .catchall {:try_start_c .. :try_end_11} :catchall_34

    .line 48
    .end local v1    # "is":Ljava/io/InputStream;
    .local v2, "is":Ljava/io/InputStream;
    if-nez v2, :cond_1e

    :try_start_13
    new-instance v3, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1a} :catch_3c
    .catchall {:try_start_13 .. :try_end_1a} :catchall_39

    .line 52
    :goto_1a
    invoke-static {v2}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_a

    .line 48
    :cond_1e
    :try_start_1e
    invoke-static {p0, v2}, Lcom/lge/gallery/decoder/GalleryDecodeUtils;->getImageBound(Landroid/content/Context;Ljava/io/InputStream;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_21} :catch_3c
    .catchall {:try_start_1e .. :try_end_21} :catchall_39

    move-result-object v3

    goto :goto_1a

    .line 49
    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    :catch_23
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    :goto_24
    :try_start_24
    const-string v3, "GalleryDecodeUtils"

    const-string v4, "Cannot create inputstream. "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2b
    .catchall {:try_start_24 .. :try_end_2b} :catchall_34

    .line 52
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 54
    new-instance v3, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    invoke-direct {v3, v6, v6}, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;-><init>(II)V

    goto :goto_a

    .line 52
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_34
    move-exception v3

    :goto_35
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v3

    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catchall_39
    move-exception v3

    move-object v1, v2

    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_35

    .line 49
    .end local v1    # "is":Ljava/io/InputStream;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_3c
    move-exception v0

    move-object v1, v2

    .end local v2    # "is":Ljava/io/InputStream;
    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_24
.end method
