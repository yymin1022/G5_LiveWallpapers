.class public Lcom/lge/gallery/data/local/LocalVrMetadataLoader;
.super Lcom/lge/gallery/data/core/VRMetadataLoader;
.source "LocalVrMetadataLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 2
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/core/VRMetadataLoader;-><init>(Lcom/lge/gallery/data/core/MediaItem;)V

    .line 26
    return-void
.end method


# virtual methods
.method protected createMetadatLoader(Landroid/content/Context;)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    new-instance v0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaItem;->getContentUri()Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    return-object v0
.end method
