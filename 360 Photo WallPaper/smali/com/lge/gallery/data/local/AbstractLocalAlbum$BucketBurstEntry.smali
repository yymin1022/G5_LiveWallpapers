.class Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
.super Ljava/lang/Object;
.source "AbstractLocalAlbum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/AbstractLocalAlbum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BucketBurstEntry"
.end annotation


# instance fields
.field private final mHashCode:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "bucketId"    # I
    .param p2, "burstId"    # Ljava/lang/String;

    .prologue
    .line 519
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 520
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;->mHashCode:I

    .line 521
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 525
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;->hashCode()I

    move-result v1

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 530
    iget v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;->mHashCode:I

    return v0
.end method
