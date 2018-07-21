.class Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
.super Ljava/lang/Object;
.source "LocalAlbumSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/LocalAlbumSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BucketEntry"
.end annotation


# instance fields
.field public bucketDirectory:Ljava/lang/String;

.field public bucketId:I

.field public bucketName:Ljava/lang/String;

.field public imageCount:I

.field public videoCount:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;II)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "directory"    # Ljava/lang/String;
    .param p4, "image"    # I
    .param p5, "video"    # I

    .prologue
    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 364
    if-eqz p2, :cond_b

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2d

    .line 365
    :cond_b
    const-string v0, "LocalAlbumSet"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BucketEntry: invalid bucketName = Id : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " , Name : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    :cond_2d
    iput p1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    .line 369
    invoke-static {p2}, Lcom/lge/gallery/common/Utils;->ensureNotNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketName:Ljava/lang/String;

    .line 370
    iput p4, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    .line 371
    iput p5, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    .line 372
    iput-object p3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketDirectory:Ljava/lang/String;

    .line 373
    return-void
.end method


# virtual methods
.method public addItemCount(Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;)V
    .registers 4
    .param p1, "entry"    # Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    .prologue
    .line 390
    if-nez p1, :cond_3

    .line 403
    :goto_2
    return-void

    .line 393
    :cond_3
    iget v0, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    if-ltz v0, :cond_1a

    .line 394
    iget v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    iget v1, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    .line 398
    :goto_e
    iget v0, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    if-ltz v0, :cond_1f

    .line 399
    iget v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    iget v1, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    goto :goto_2

    .line 396
    :cond_1a
    iget v0, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    goto :goto_e

    .line 401
    :cond_1f
    iget v0, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    goto :goto_2
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 382
    instance-of v2, p1, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    if-nez v2, :cond_6

    .line 386
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 385
    check-cast v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    .line 386
    .local v0, "entry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    iget v2, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    iget v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 377
    iget v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    return v0
.end method
