.class public Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;
.super Lcom/lge/gallery/data/local/AbstractLocalAlbum;
.source "BucketIdBasedLocalAlbum.java"


# static fields
.field private static final PERF_LOG:Z = false

.field private static final TAG:Ljava/lang/String; = "BucketIdBasedLocalAlbum"


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V
    .registers 17
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "bucketId"    # I
    .param p4, "isImage"    # Z
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "directory"    # Ljava/lang/String;
    .param p7, "count"    # I

    .prologue
    .line 32
    const/4 v8, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;IZ)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;IZ)V
    .registers 17
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "bucketId"    # I
    .param p4, "isImage"    # Z
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "directory"    # Ljava/lang/String;
    .param p7, "count"    # I
    .param p8, "useBurstGrouping"    # Z

    .prologue
    .line 37
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p7

    move/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/lang/String;Ljava/lang/String;IZ)V

    .line 38
    iput p3, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mBucketId:I

    .line 39
    return-void
.end method

.method private deleteDngFiles()V
    .registers 12

    .prologue
    .line 84
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->getDirectory()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 85
    .local v2, "directory":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_10

    .line 102
    :cond_f
    return-void

    .line 89
    :cond_10
    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 90
    .local v6, "list":[Ljava/lang/String;
    if-eqz v6, :cond_f

    .line 93
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_19
    if-ge v4, v5, :cond_f

    aget-object v1, v0, v4

    .line 94
    .local v1, "child":Ljava/lang/String;
    const-string v7, ".dng"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_41

    .line 95
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 96
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 97
    iget-object v7, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v7}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v7

    new-instance v8, Landroid/content/Intent;

    const-string v9, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v7, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 93
    .end local v3    # "file":Ljava/io/File;
    :cond_41
    add-int/lit8 v4, v4, 0x1

    goto :goto_19
.end method


# virtual methods
.method public delete()V
    .registers 1

    .prologue
    .line 68
    invoke-super {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->delete()V

    .line 81
    return-void
.end method

.method protected getWhereArgurments(Z)[Ljava/lang/String;
    .registers 5
    .param p1, "isImage"    # Z

    .prologue
    .line 54
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget v2, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mBucketId:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected getWhereStatement(Z)Ljava/lang/String;
    .registers 3
    .param p1, "isImage"    # Z

    .prologue
    .line 48
    if-eqz p1, :cond_5

    const-string v0, "bucket_id = ?"

    :goto_4
    return-object v0

    :cond_5
    const-string v0, "bucket_id = ?"

    goto :goto_4
.end method

.method protected isHiddenAlbumFilteredOut()Z
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    return v0
.end method

.method protected updateAlbumName()Z
    .registers 3

    .prologue
    .line 59
    iget-object v0, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    iget v1, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mBucketId:I

    invoke-static {v0, v1}, Lcom/lge/gallery/data/local/LocalAlbumUtils;->getBucketName(Landroid/content/ContentResolver;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mAlbumName:Ljava/lang/String;

    .line 60
    const-string v0, ""

    iget-object v1, p0, Lcom/lge/gallery/data/local/BucketIdBasedLocalAlbum;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 61
    const/4 v0, 0x1

    .line 63
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
