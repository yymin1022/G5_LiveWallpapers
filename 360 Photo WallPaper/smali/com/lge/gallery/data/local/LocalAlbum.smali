.class public Lcom/lge/gallery/data/local/LocalAlbum;
.super Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;
.source "LocalAlbum.java"


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "bucketId"    # I
    .param p4, "isImage"    # Z
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "directory"    # Ljava/lang/String;
    .param p7, "count"    # I

    .prologue
    .line 27
    invoke-direct/range {p0 .. p7}, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V

    .line 28
    return-void
.end method
