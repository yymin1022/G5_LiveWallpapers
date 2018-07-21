.class public abstract Lcom/lge/gallery/data/core/MergeAlbum;
.super Lcom/lge/gallery/data/core/MediaSet;
.source "MergeAlbum.java"

# interfaces
.implements Lcom/lge/gallery/data/core/ContentListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MergeAlbum"


# instance fields
.field protected final mComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field protected mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

.field private mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

.field protected final mIndex:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field

.field protected mIsFirst:Z

.field protected mName:Ljava/lang/String;

.field protected final mSources:[Lcom/lge/gallery/data/core/MediaSet;

.field protected mSupportedOperation:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "sources"    # [Lcom/lge/gallery/data/core/MediaSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;[",
            "Lcom/lge/gallery/data/core/MediaSet;",
            ")V"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lge/gallery/data/core/MergeAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Z)V

    .line 86
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Z)V
    .registers 16
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "sources"    # [Lcom/lge/gallery/data/core/MediaSet;
    .param p4, "useCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;[",
            "Lcom/lge/gallery/data/core/MediaSet;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    const-wide/16 v8, -0x1

    invoke-direct {p0, p1, v8, v9}, Lcom/lge/gallery/data/core/MediaSet;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 29
    new-instance v7, Ljava/util/TreeMap;

    invoke-direct {v7}, Ljava/util/TreeMap;-><init>()V

    iput-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIndex:Ljava/util/TreeMap;

    .line 90
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIsFirst:Z

    .line 91
    iput-object p3, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .line 92
    iput-object p2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mComparator:Ljava/util/Comparator;

    .line 93
    array-length v7, p3

    if-nez v7, :cond_33

    const-string v7, ""

    :goto_18
    iput-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mName:Ljava/lang/String;

    .line 94
    iget-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v7, v7

    if-nez v7, :cond_3b

    const/4 v6, 0x0

    .line 95
    .local v6, "supported":I
    :goto_20
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_24
    if-ge v2, v3, :cond_3d

    aget-object v5, v0, v2

    .line 96
    .local v5, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v5, p0}, Lcom/lge/gallery/data/core/MediaSet;->addContentListener(Lcom/lge/gallery/data/core/ContentListener;)V

    .line 97
    invoke-virtual {v5}, Lcom/lge/gallery/data/core/MediaSet;->getSupportedOperations()I

    move-result v7

    and-int/2addr v6, v7

    .line 95
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 93
    .end local v0    # "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "set":Lcom/lge/gallery/data/core/MediaSet;
    .end local v6    # "supported":I
    :cond_33
    const/4 v7, 0x0

    aget-object v7, p3, v7

    invoke-virtual {v7}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v7

    goto :goto_18

    .line 94
    :cond_3b
    const/4 v6, -0x1

    goto :goto_20

    .line 99
    .restart local v0    # "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v6    # "supported":I
    :cond_3d
    iput v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSupportedOperation:I

    .line 101
    if-eqz p4, :cond_62

    .line 102
    iget-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v7, v7

    new-array v7, v7, [Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    iput-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    .line 103
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v4, v7

    .local v4, "n":I
    :goto_4c
    if-ge v1, v4, :cond_67

    .line 104
    iget-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    new-instance v8, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    iget-object v9, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    aget-object v9, v9, v1

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getCachePageSize()I

    move-result v10

    invoke-direct {v8, v9, v10}, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;-><init>(Lcom/lge/gallery/data/core/MediaSet;I)V

    aput-object v8, v7, v1

    .line 103
    add-int/lit8 v1, v1, 0x1

    goto :goto_4c

    .line 107
    .end local v1    # "i":I
    .end local v4    # "n":I
    :cond_62
    const/4 v7, 0x0

    new-array v7, v7, [Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    iput-object v7, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    .line 109
    :cond_67
    return-void
.end method

.method private clearCovers()V
    .registers 2

    .prologue
    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 246
    return-void
.end method

.method private updateData()V
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 113
    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v6, v6

    if-nez v6, :cond_17

    move v4, v5

    .line 114
    .local v4, "supported":I
    :goto_7
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_b
    if-ge v1, v2, :cond_19

    aget-object v3, v0, v1

    .line 115
    .local v3, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->getSupportedOperations()I

    move-result v6

    and-int/2addr v4, v6

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 113
    .end local v0    # "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    .end local v4    # "supported":I
    :cond_17
    const/4 v4, -0x1

    goto :goto_7

    .line 117
    .restart local v0    # "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v4    # "supported":I
    :cond_19
    iput v4, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSupportedOperation:I

    .line 118
    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v6, v6

    if-nez v6, :cond_28

    const-string v5, ""

    :goto_22
    iput-object v5, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mName:Ljava/lang/String;

    .line 119
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->updateFurtherData()V

    .line 120
    return-void

    .line 118
    :cond_28
    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    aget-object v5, v6, v5

    invoke-virtual {v5}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v5

    goto :goto_22
.end method


# virtual methods
.method public delete()V
    .registers 5

    .prologue
    .line 328
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_e

    aget-object v3, v0, v1

    .line 329
    .local v3, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->delete()V

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 331
    .end local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_e
    return-void
.end method

.method protected abstract getCachePageSize()I
.end method

.method public getCoverItems(I)Ljava/util/ArrayList;
    .registers 6
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 251
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v2, v2

    if-eqz v2, :cond_f

    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    if-eqz v2, :cond_f

    const/4 v2, 0x1

    if-le p1, v2, :cond_14

    .line 252
    :cond_f
    invoke-super {p0, p1}, Lcom/lge/gallery/data/core/MediaSet;->getCoverItems(I)Ljava/util/ArrayList;

    move-result-object v1

    .line 259
    :cond_13
    :goto_13
    return-object v1

    .line 254
    :cond_14
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .local v1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    .line 256
    .local v0, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v0, :cond_13

    .line 257
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13
.end method

.method public getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 9

    .prologue
    .line 264
    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v6, v6

    if-eqz v6, :cond_c

    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    const/4 v7, 0x0

    aget-object v6, v6, v7

    if-nez v6, :cond_11

    .line 265
    :cond_c
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v2

    .line 295
    :goto_10
    return-object v2

    .line 267
    :cond_11
    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    if-eqz v6, :cond_18

    .line 268
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    goto :goto_10

    .line 270
    :cond_18
    const/4 v2, 0x0

    .line 271
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1d
    if-ge v1, v3, :cond_3a

    aget-object v4, v0, v1

    .line 272
    .local v4, "set":Lcom/lge/gallery/data/core/MediaSet;
    if-nez v2, :cond_2a

    .line 273
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getCoverItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v2

    .line 271
    :cond_27
    :goto_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 275
    :cond_2a
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getCoverItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v5

    .line 283
    .local v5, "temp":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v5, :cond_27

    iget-object v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mComparator:Ljava/util/Comparator;

    invoke-interface {v6, v2, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-lez v6, :cond_27

    .line 286
    move-object v2, v5

    goto :goto_27

    .line 291
    .end local v4    # "set":Lcom/lge/gallery/data/core/MediaSet;
    .end local v5    # "temp":Lcom/lge/gallery/data/core/MediaItem;
    :cond_3a
    if-eqz v2, :cond_3f

    .line 292
    iput-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    goto :goto_10

    .line 295
    :cond_3f
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v2

    goto :goto_10
.end method

.method public getIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 347
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/lge/gallery/data/core/MediaSet;->getIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getImageItemCount(Z)I
    .registers 9
    .param p1, "includeSubset"    # Z

    .prologue
    .line 210
    const/4 v1, 0x0

    .line 211
    .local v1, "count":I
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_5
    if-ge v2, v3, :cond_29

    aget-object v4, v0, v2

    .line 212
    .local v4, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "/image"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1c

    .line 211
    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 215
    :cond_1c
    if-eqz p1, :cond_24

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemCount()I

    move-result v5

    :goto_22
    add-int/2addr v1, v5

    goto :goto_19

    :cond_24
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v5

    goto :goto_22

    .line 218
    .end local v4    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_29
    return v1
.end method

.method public getImageMediaSubset()Ljava/util/ArrayList;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 199
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .local v3, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSet;>;"
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_24

    aget-object v4, v0, v1

    .line 201
    .local v4, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v5

    invoke-virtual {v5}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "/image"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_20

    .line 200
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 204
    :cond_20
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 206
    .end local v4    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_24
    return-object v3
.end method

.method public getMediaItem(II)Ljava/util/ArrayList;
    .registers 16
    .param p1, "start"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .local v6, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIndex:Ljava/util/TreeMap;

    add-int/lit8 v11, p1, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/TreeMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v1

    .line 146
    .local v1, "head":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Integer;[I>;"
    const/4 v5, 0x0

    .line 148
    .local v5, "markPos":I
    :try_start_12
    invoke-interface {v1}, Ljava/util/SortedMap;->lastKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I
    :try_end_1b
    .catch Ljava/util/NoSuchElementException; {:try_start_12 .. :try_end_1b} :catch_29

    move-result v5

    .line 153
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v1, v10}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [I

    .line 154
    .local v9, "subPos":[I
    if-nez v9, :cond_32

    .line 195
    .end local v9    # "subPos":[I
    :cond_28
    :goto_28
    return-object v6

    .line 149
    :catch_29
    move-exception v0

    .line 150
    .local v0, "e":Ljava/util/NoSuchElementException;
    const-string v10, "MergeAlbum"

    const-string v11, "Out of Data elements"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_28

    .line 157
    .end local v0    # "e":Ljava/util/NoSuchElementException;
    .restart local v9    # "subPos":[I
    :cond_32
    invoke-virtual {v9}, [I->clone()Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "subPos":[I
    check-cast v9, [I

    .line 158
    .restart local v9    # "subPos":[I
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v10, v10

    new-array v8, v10, [Lcom/lge/gallery/data/core/MediaItem;

    .line 160
    .local v8, "slot":[Lcom/lge/gallery/data/core/MediaItem;
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v7, v10

    .line 163
    .local v7, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_41
    if-ge v2, v7, :cond_52

    .line 164
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    aget-object v10, v10, v2

    aget v11, v9, v2

    invoke-virtual {v10, v11}, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->getItem(I)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v10

    aput-object v10, v8, v2

    .line 163
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 167
    :cond_52
    move v2, v5

    :goto_53
    add-int v10, p1, p2

    if-ge v2, v10, :cond_28

    .line 168
    const/4 v4, -0x1

    .line 169
    .local v4, "k":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_59
    if-ge v3, v7, :cond_72

    .line 170
    aget-object v10, v8, v3

    if-eqz v10, :cond_6f

    .line 171
    const/4 v10, -0x1

    if-eq v4, v10, :cond_6e

    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mComparator:Ljava/util/Comparator;

    aget-object v11, v8, v3

    aget-object v12, v8, v4

    invoke-interface {v10, v11, v12}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    if-gez v10, :cond_6f

    .line 172
    :cond_6e
    move v4, v3

    .line 169
    :cond_6f
    add-int/lit8 v3, v3, 0x1

    goto :goto_59

    .line 178
    :cond_72
    const/4 v10, -0x1

    if-eq v4, v10, :cond_28

    .line 183
    aget v10, v9, v4

    add-int/lit8 v10, v10, 0x1

    aput v10, v9, v4

    .line 184
    if-lt v2, p1, :cond_82

    .line 185
    aget-object v10, v8, v4

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    :cond_82
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    aget-object v10, v10, v4

    aget v11, v9, v4

    invoke-virtual {v10, v11}, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->getItem(I)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v10

    aput-object v10, v8, v4

    .line 190
    add-int/lit8 v10, v2, 0x1

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getCachePageSize()I

    move-result v11

    rem-int/2addr v10, v11

    if-nez v10, :cond_a6

    .line 191
    iget-object v10, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIndex:Ljava/util/TreeMap;

    add-int/lit8 v11, v2, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9}, [I->clone()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_a6
    add-int/lit8 v2, v2, 0x1

    goto :goto_53
.end method

.method public getMediaItemCount()I
    .registers 2

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getTotalMediaItemCount()I

    move-result v0

    return v0
.end method

.method public getMediaItemSize()J
    .registers 3

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->getTotalMediaItemSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()I
    .registers 3

    .prologue
    .line 352
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getSourceType()I

    move-result v0

    return v0
.end method

.method public getSupportedOperations()I
    .registers 2

    .prologue
    .line 323
    iget v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSupportedOperation:I

    return v0
.end method

.method public getTotalMediaItemCount()I
    .registers 7

    .prologue
    .line 223
    const/4 v1, 0x0

    .line 224
    .local v1, "count":I
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_5
    if-ge v2, v3, :cond_11

    aget-object v4, v0, v2

    .line 225
    .local v4, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemCount()I

    move-result v5

    add-int/2addr v1, v5

    .line 224
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 227
    .end local v4    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_11
    return v1
.end method

.method public getTotalMediaItemSize()J
    .registers 9

    .prologue
    .line 232
    const-wide/16 v2, 0x0

    .line 233
    .local v2, "count":J
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_6
    if-ge v1, v4, :cond_12

    aget-object v5, v0, v1

    .line 234
    .local v5, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v5}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemSize()J

    move-result-wide v6

    add-long/2addr v2, v6

    .line 233
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 236
    .end local v5    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_12
    return-wide v2
.end method

.method public hasCachedCover()Z
    .registers 6

    .prologue
    .line 357
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_13

    aget-object v3, v0, v1

    .line 358
    .local v3, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->hasCachedCover()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 359
    const/4 v4, 0x1

    .line 362
    .end local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :goto_f
    return v4

    .line 357
    .restart local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 362
    .end local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_13
    const/4 v4, 0x0

    goto :goto_f
.end method

.method protected invalidateCache()V
    .registers 6

    .prologue
    .line 123
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    array-length v1, v2

    .local v1, "n":I
    :goto_4
    if-ge v0, v1, :cond_10

    .line 124
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->invalidate()V

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 126
    :cond_10
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIndex:Ljava/util/TreeMap;

    invoke-virtual {v2}, Ljava/util/TreeMap;->clear()V

    .line 127
    iget-object v2, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIndex:Ljava/util/TreeMap;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mFetcher:[Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;

    array-length v4, v4

    new-array v4, v4, [I

    invoke-virtual {v2, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    return-void
.end method

.method public isLeafAlbum()Z
    .registers 2

    .prologue
    .line 342
    const/4 v0, 0x1

    return v0
.end method

.method public onContentDirty()V
    .registers 1

    .prologue
    .line 318
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->notifyContentChanged()V

    .line 319
    return-void
.end method

.method public reload()J
    .registers 9

    .prologue
    .line 300
    const/4 v0, 0x0

    .line 301
    .local v0, "changed":Z
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v3, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    array-length v2, v3

    .local v2, "n":I
    :goto_5
    if-ge v1, v2, :cond_19

    .line 302
    iget-object v3, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->reload()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mDataVersion:J

    cmp-long v3, v4, v6

    if-lez v3, :cond_16

    .line 303
    const/4 v0, 0x1

    .line 301
    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 306
    :cond_19
    if-eqz v0, :cond_2a

    .line 307
    invoke-static {}, Lcom/lge/gallery/data/core/MergeAlbum;->nextVersionNumber()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mDataVersion:J

    .line 308
    invoke-direct {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->clearCovers()V

    .line 309
    invoke-direct {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->updateData()V

    .line 310
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MergeAlbum;->invalidateCache()V

    .line 312
    :cond_2a
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mIsFirst:Z

    .line 313
    iget-wide v4, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mDataVersion:J

    return-wide v4
.end method

.method public rotate(I)V
    .registers 6
    .param p1, "degrees"    # I

    .prologue
    .line 335
    iget-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum;->mSources:[Lcom/lge/gallery/data/core/MediaSet;

    .local v0, "arr$":[Lcom/lge/gallery/data/core/MediaSet;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_e

    aget-object v3, v0, v1

    .line 336
    .local v3, "set":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v3, p1}, Lcom/lge/gallery/data/core/MediaSet;->rotate(I)V

    .line 335
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 338
    .end local v3    # "set":Lcom/lge/gallery/data/core/MediaSet;
    :cond_e
    return-void
.end method

.method protected abstract updateFurtherData()V
.end method
