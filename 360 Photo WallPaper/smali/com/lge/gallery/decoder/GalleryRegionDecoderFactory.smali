.class public Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;
.super Ljava/lang/Object;
.source "GalleryRegionDecoderFactory.java"


# static fields
.field private static final BMP:Ljava/lang/String; = "bmp"

.field private static final SUPPORT:Z = true

.field private static final TAG:Ljava/lang/String; = "MyRegionDecoderFactory"

.field public static final USE_THIRD_PARTY_DECODER:Z

.field private static sBitmapInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

.field private static sInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;


# instance fields
.field private mIsForBitmap:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 49
    sput-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sBitmapInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    .line 50
    sput-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    .line 55
    return-void
.end method

.method private constructor <init>(Z)V
    .registers 3
    .param p1, "isForBMP"    # Z

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    .line 58
    iput-boolean p1, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    .line 59
    return-void
.end method

.method public static getFactory(Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;
    .registers 3
    .param p0, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 62
    if-eqz p0, :cond_19

    const-string v0, "bmp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 63
    sget-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sBitmapInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    if-nez v0, :cond_16

    .line 64
    new-instance v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;-><init>(Z)V

    sput-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sBitmapInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    .line 66
    :cond_16
    sget-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sBitmapInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    .line 71
    :goto_18
    return-object v0

    .line 68
    :cond_19
    sget-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    if-nez v0, :cond_24

    .line 69
    new-instance v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    invoke-direct {v0}, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;-><init>()V

    sput-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    .line 71
    :cond_24
    sget-object v0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->sInstance:Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;

    goto :goto_18
.end method


# virtual methods
.method public newInstance(Ljava/io/FileDescriptor;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 4
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    if-eqz v0, :cond_a

    .line 104
    new-instance v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;-><init>(Ljava/io/FileDescriptor;Z)V

    .line 106
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;-><init>(Ljava/io/FileDescriptor;Z)V

    goto :goto_9
.end method

.method public newInstance(Ljava/io/InputStream;Z)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 4
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    if-eqz v0, :cond_a

    .line 94
    new-instance v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;-><init>(Ljava/io/InputStream;Z)V

    .line 96
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;-><init>(Ljava/io/InputStream;Z)V

    goto :goto_9
.end method

.method public newInstance(Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 5
    .param p1, "pathName"    # Ljava/lang/String;
    .param p2, "isShareable"    # Z
    .param p3, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    if-eqz v0, :cond_a

    .line 80
    new-instance v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;-><init>(Ljava/lang/String;Z)V

    .line 86
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;

    invoke-direct {v0, p1, p2}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;-><init>(Ljava/lang/String;Z)V

    goto :goto_9
.end method

.method public newInstance([BIIZ)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
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
    .line 113
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/GalleryRegionDecoderFactory;->mIsForBitmap:Z

    if-eqz v0, :cond_a

    .line 114
    new-instance v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/lge/gallery/decoder/BmpRegionDecoder;-><init>([BIIZ)V

    .line 116
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/lge/gallery/decoder/BitmapRegionDecoderWrapper;-><init>([BIIZ)V

    goto :goto_9
.end method
