.class public Lcom/lge/gallery/data/local/LocalMergeAlbum;
.super Lcom/lge/gallery/data/core/MergeAlbum;
.source "LocalMergeAlbum.java"

# interfaces
.implements Lcom/lge/gallery/data/core/ContentListener;


# static fields
.field private static final PAGE_SIZE:I = 0x40

.field private static final TAG:Ljava/lang/String; = "LocalMergeAlbum"


# instance fields
.field protected mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field protected mBucketId:I

.field private mDirectory:Ljava/lang/String;

.field protected mResolver:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;)V
    .registers 15
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "bucketId"    # I
    .param p3, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p5, "sources"    # [Lcom/lge/gallery/data/core/MediaSet;
    .param p6, "directory"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "I",
            "Lcom/lge/gallery/data/core/Path;",
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;[",
            "Lcom/lge/gallery/data/core/MediaSet;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 48
    .local p4, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/lge/gallery/data/local/LocalMergeAlbum;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;Z)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;Z)V
    .registers 9
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "bucketId"    # I
    .param p3, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p5, "sources"    # [Lcom/lge/gallery/data/core/MediaSet;
    .param p6, "directory"    # Ljava/lang/String;
    .param p7, "useCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "I",
            "Lcom/lge/gallery/data/core/Path;",
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;[",
            "Lcom/lge/gallery/data/core/MediaSet;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p4, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-direct {p0, p3, p4, p5, p7}, Lcom/lge/gallery/data/core/MergeAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Z)V

    .line 55
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 56
    invoke-interface {p1}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mResolver:Landroid/content/ContentResolver;

    .line 57
    iput p2, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mBucketId:I

    .line 58
    if-nez p6, :cond_11

    const-string p6, ""

    .end local p6    # "directory":Ljava/lang/String;
    :cond_11
    iput-object p6, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    .line 59
    return-void
.end method


# virtual methods
.method protected checkAlbumSanity(Lcom/lge/gallery/data/local/LocalMergeAlbum;)Z
    .registers 5
    .param p1, "album"    # Lcom/lge/gallery/data/local/LocalMergeAlbum;

    .prologue
    .line 102
    iget-object v0, p1, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v0, v0

    if-eqz v0, :cond_d

    iget-object v0, p1, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mIndex:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    if-nez v0, :cond_2b

    .line 103
    :cond_d
    const-string v0, "LocalMergeAlbum"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mSources or mIndex has wrong size : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const/4 v0, 0x0

    .line 106
    :goto_2a
    return v0

    :cond_2b
    const/4 v0, 0x1

    goto :goto_2a
.end method

.method public getBucketId()I
    .registers 3

    .prologue
    .line 63
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getBucketId()I

    move-result v0

    return v0
.end method

.method protected getCachePageSize()I
    .registers 2

    .prologue
    .line 75
    const/16 v0, 0x40

    return v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 11

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 132
    invoke-super {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v1

    .line 133
    .local v1, "details":Lcom/lge/gallery/data/core/MediaDetails;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    .line 134
    .local v0, "cover":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v0, :cond_23

    .line 135
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "filepath":Ljava/lang/String;
    if-eqz v2, :cond_23

    .line 137
    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 138
    .local v3, "folderPath":Ljava/lang/String;
    const/16 v4, 0x10

    invoke-virtual {v1, v4, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 141
    .end local v2    # "filepath":Ljava/lang/String;
    .end local v3    # "folderPath":Ljava/lang/String;
    :cond_23
    const/16 v4, 0xf

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getTotalMediaItemSize()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 142
    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    aget-object v4, v4, v8

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v4

    invoke-virtual {v4, v9}, Lcom/lge/gallery/data/core/MediaDetails;->getDetail(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v9, v4}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 143
    return-object v1
.end method

.method public getDirectory()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_12

    .line 80
    :cond_c
    invoke-virtual {p0, p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getDirectory(Lcom/lge/gallery/data/local/LocalMergeAlbum;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    .line 82
    :cond_12
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    return-object v0
.end method

.method protected getDirectory(Lcom/lge/gallery/data/local/LocalMergeAlbum;)Ljava/lang/String;
    .registers 9
    .param p1, "album"    # Lcom/lge/gallery/data/local/LocalMergeAlbum;

    .prologue
    .line 110
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->checkAlbumSanity(Lcom/lge/gallery/data/local/LocalMergeAlbum;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 111
    const-string v4, ""

    .line 127
    :goto_8
    return-object v4

    .line 113
    :cond_9
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v2

    .line 114
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    instance-of v4, v2, Lcom/lge/gallery/data/local/LocalMediaItem;

    if-eqz v4, :cond_51

    move-object v3, v2

    .line 115
    check-cast v3, Lcom/lge/gallery/data/local/LocalMediaItem;

    .line 116
    .local v3, "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    invoke-virtual {v3}, Lcom/lge/gallery/data/local/LocalMediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "file":Ljava/lang/String;
    if-nez v0, :cond_39

    .line 118
    const-string v4, "LocalMergeAlbum"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to get directory : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    const-string v4, ""

    goto :goto_8

    .line 121
    :cond_39
    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 122
    .local v1, "index":I
    if-ltz v1, :cond_51

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v4, v5, :cond_51

    .line 123
    const/4 v4, 0x0

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_8

    .line 126
    .end local v0    # "file":Ljava/lang/String;
    .end local v1    # "index":I
    .end local v3    # "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    :cond_51
    const-string v4, "LocalMergeAlbum"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "MediaItem is not LocalMediaItem or null : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    const-string v4, ""

    goto :goto_8
.end method

.method public getEntryFilePaths()Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    invoke-super {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getEntryFilePaths()Ljava/util/ArrayList;

    .line 88
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v1, "filePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_c
    if-ge v2, v3, :cond_21

    aget-object v4, v0, v2

    .line 90
    .local v4, "set":Lcom/lge/gallery/data/core/MediaSet;
    instance-of v6, v4, Lcom/lge/gallery/data/local/LocalAlbum;

    if-nez v6, :cond_17

    .line 89
    :cond_14
    :goto_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 93
    :cond_17
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getEntryFilePaths()Ljava/util/ArrayList;

    move-result-object v5

    .line 94
    .local v5, "setsPaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v5, :cond_14

    .line 95
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_14

    .line 98
    .end local v4    # "set":Lcom/lge/gallery/data/core/MediaSet;
    .end local v5    # "setsPaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_21
    return-object v1
.end method

.method protected updateFurtherData()V
    .registers 2

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mIsFirst:Z

    if-nez v0, :cond_8

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalMergeAlbum;->mDirectory:Ljava/lang/String;

    .line 71
    :cond_8
    return-void
.end method
