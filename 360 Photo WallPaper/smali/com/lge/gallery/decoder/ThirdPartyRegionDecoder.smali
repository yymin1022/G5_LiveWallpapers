.class public Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;
.super Ljava/lang/Object;
.source "ThirdPartyRegionDecoder.java"

# interfaces
.implements Lcom/lge/gallery/decoder/GalleryRegionDecoder;


# static fields
.field private static final TAG:Ljava/lang/String; = "ThirdPartyRegionDecoder"


# instance fields
.field private isRecycled:Z


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

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    .line 62
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
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

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    .line 58
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "pathName"    # Ljava/lang/String;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    .line 53
    const-string v0, "ThirdPartyRegionDecoder"

    const-string v1, "use thirdparty region decoder."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
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

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    .line 67
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
.end method


# virtual methods
.method public decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x0

    return v0
.end method

.method public inBitmapSupported()Z
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method public isRecycled()Z
    .registers 2

    .prologue
    .line 87
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    return v0
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/ThirdPartyRegionDecoder;->isRecycled:Z

    .line 93
    return-void
.end method
