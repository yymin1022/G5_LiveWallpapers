.class public Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;
.super Ljava/lang/Object;
.source "LocalImage.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/LocalImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalLargeImageRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/ThreadPool$Job",
        "<",
        "Lcom/lge/gallery/decoder/GalleryRegionDecoder;",
        ">;"
    }
.end annotation


# instance fields
.field mLocalFilePath:Ljava/lang/String;

.field mMimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "localFilePath"    # Ljava/lang/String;

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 288
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->mLocalFilePath:Ljava/lang/String;

    .line 289
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "localFilePath"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 291
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->mLocalFilePath:Ljava/lang/String;

    .line 292
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->mMimeType:Ljava/lang/String;

    .line 293
    return-void
.end method


# virtual methods
.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;
    .registers 5
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 296
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->mLocalFilePath:Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->mMimeType:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Lcom/lge/gallery/data/util/DecodeUtils;->requestCreateBitmapRegionDecoder(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/lang/String;ZLjava/lang/String;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 282
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/decoder/GalleryRegionDecoder;

    move-result-object v0

    return-object v0
.end method
