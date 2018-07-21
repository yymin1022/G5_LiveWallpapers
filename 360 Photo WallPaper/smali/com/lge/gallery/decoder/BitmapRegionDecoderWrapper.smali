.class public Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;
.super Ljava/lang/Object;
.source "BitmapRegionDecoderWrapper.java"

# interfaces
.implements Lcom/lge/gallery/decoder/GalleryRegionDecoder;


# static fields
.field private static final TAG:Ljava/lang/String; = "BitmapRegionDecoderWrapper"


# instance fields
.field private isRecycled:Z

.field private mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;


# direct methods
.method public constructor <init>(Ljava/io/FileDescriptor;Z)V
    .registers 4
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    .line 62
    invoke-static {p1, p2}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/FileDescriptor;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->initDecoder(Landroid/graphics/BitmapRegionDecoder;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    .line 58
    invoke-static {p1, p2}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->initDecoder(Landroid/graphics/BitmapRegionDecoder;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "pathName"    # Ljava/lang/String;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    .line 54
    invoke-static {p1, p2}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->initDecoder(Landroid/graphics/BitmapRegionDecoder;)V

    .line 55
    return-void
.end method

.method public constructor <init>([BIIZ)V
    .registers 6
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    .line 67
    invoke-static {p1, p2, p3, p4}, Landroid/graphics/BitmapRegionDecoder;->newInstance([BIIZ)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->initDecoder(Landroid/graphics/BitmapRegionDecoder;)V

    .line 68
    return-void
.end method

.method private initDecoder(Landroid/graphics/BitmapRegionDecoder;)V
    .registers 4
    .param p1, "decoder"    # Landroid/graphics/BitmapRegionDecoder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    if-nez p1, :cond_11

    .line 72
    const-string v0, "BitmapRegionDecoderWrapper"

    const-string v1, "fail to create instance : decoder is null"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    new-instance v0, Ljava/io/IOException;

    const-string v1, "decoder is null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_11
    iput-object p1, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 76
    return-void
.end method


# virtual methods
.method public decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_b

    .line 97
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 100
    :goto_a
    return-object v0

    .line 99
    :cond_b
    const-string v0, "BitmapRegionDecoderWrapper"

    const-string v1, "decode Region retuns null because of null instance."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_b

    .line 81
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v0

    .line 83
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_b

    .line 89
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v0

    .line 91
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public inBitmapSupported()Z
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x1

    return v0
.end method

.method public isRecycled()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    return v0
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_c

    .line 111
    iget-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    .line 112
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->mRegionDecoder:Landroid/graphics/BitmapRegionDecoder;

    .line 114
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;->isRecycled:Z

    .line 115
    return-void
.end method
