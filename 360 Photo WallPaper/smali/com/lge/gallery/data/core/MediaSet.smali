.class public abstract Lcom/lge/gallery/data/core/MediaSet;
.super Lcom/lge/gallery/data/core/MediaObject;
.source "MediaSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;,
        Lcom/lge/gallery/data/core/MediaSet$Options;
    }
.end annotation


# static fields
.field private static final FUTURE_STUB:Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/Future",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final INDEX_NOT_FOUND:I = -0x1

.field public static final MEDIAITEM_BATCH_FETCH_COUNT:I = 0x1f4

.field public static final SYNC_RESULT_CANCELLED:I = 0x1

.field public static final SYNC_RESULT_ERROR:I = 0x2

.field public static final SYNC_RESULT_SUCCESS:I


# instance fields
.field protected mBucketId:I

.field private mListeners:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/lge/gallery/data/core/ContentListener;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected mSortObserver:Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

.field protected mStopReload:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 348
    new-instance v0, Lcom/lge/gallery/data/core/MediaSet$1;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaSet$1;-><init>()V

    sput-object v0, Lcom/lge/gallery/data/core/MediaSet;->FUTURE_STUB:Lcom/lge/gallery/util/Future;

    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;J)V
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "version"    # J

    .prologue
    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/data/core/MediaObject;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mBucketId:I

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mStopReload:Z

    .line 248
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    .line 59
    return-void
.end method

.method private getCoverMediaItems(I)Ljava/util/ArrayList;
    .registers 7
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
    .line 104
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v4, 0x0

    invoke-virtual {p0, v4, p1}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v2

    .line 121
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_11

    .line 130
    .end local v2    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    :cond_10
    :goto_10
    return-object v2

    .line 124
    .restart local v2    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    :cond_11
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSetCount()I

    move-result v3

    .local v3, "n":I
    :goto_16
    if-ge v1, v3, :cond_10

    .line 125
    invoke-virtual {p0, v1}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v4

    invoke-direct {v4, p1}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItems(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 126
    .local v0, "covers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    if-eqz v0, :cond_24

    move-object v2, v0

    .line 127
    goto :goto_10

    .line 124
    :cond_24
    add-int/lit8 v1, v1, 0x1

    goto :goto_16
.end method

.method private getIndexOfItemInternal(Lcom/lge/gallery/data/core/Path;ILcom/lge/gallery/data/core/MediaSet$Options;)I
    .registers 11
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "hint"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;

    .prologue
    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 195
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemBatchFetchCount()I

    move-result v2

    .line 198
    .local v2, "mediaItemBatchFetchCount":I
    div-int/lit8 v6, v2, 0x2

    sub-int v6, p2, v6

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 200
    .local v3, "start":I
    invoke-virtual {p0, v3, v2}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v1

    .line 202
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {p0, p1, v1}, Lcom/lge/gallery/data/core/MediaSet;->getIndexOf(Lcom/lge/gallery/data/core/Path;Ljava/util/ArrayList;)I

    move-result v0

    .line 203
    .local v0, "index":I
    if-eq v0, v5, :cond_1b

    .line 204
    add-int v4, v3, v0

    .line 219
    :goto_1a
    return v4

    .line 208
    :cond_1b
    if-nez v3, :cond_2a

    move v3, v2

    .line 209
    :goto_1e
    invoke-virtual {p0, v3, v2}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v1

    .line 211
    :goto_22
    invoke-virtual {p3}, Lcom/lge/gallery/data/core/MediaSet$Options;->isCancelRequested()Z

    move-result v4

    if-eqz v4, :cond_2c

    move v4, v5

    .line 212
    goto :goto_1a

    :cond_2a
    move v3, v4

    .line 208
    goto :goto_1e

    .line 214
    :cond_2c
    invoke-virtual {p0, p1, v1}, Lcom/lge/gallery/data/core/MediaSet;->getIndexOf(Lcom/lge/gallery/data/core/Path;Ljava/util/ArrayList;)I

    move-result v0

    .line 215
    if-eq v0, v5, :cond_35

    .line 216
    add-int v4, v3, v0

    goto :goto_1a

    .line 218
    :cond_35
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v4, v2, :cond_3d

    move v4, v5

    .line 219
    goto :goto_1a

    .line 221
    :cond_3d
    add-int/2addr v3, v2

    .line 222
    invoke-virtual {p0, v3, v2}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_22
.end method


# virtual methods
.method public addContentListener(Lcom/lge/gallery/data/core/ContentListener;)V
    .registers 4
    .param p1, "listener"    # Lcom/lge/gallery/data/core/ContentListener;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 256
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 258
    :cond_e
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    return-void
.end method

.method protected enumerateMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I
    .registers 12
    .param p1, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;
    .param p2, "startIndex"    # I

    .prologue
    .line 305
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v6

    .line 306
    .local v6, "total":I
    const/4 v5, 0x0

    .line 307
    .local v5, "start":I
    :goto_5
    if-ge v5, v6, :cond_2d

    .line 308
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemBatchFetchCount()I

    move-result v7

    sub-int v8, v6, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 309
    .local v0, "count":I
    invoke-virtual {p0, v5, v0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v3

    .line 310
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, "n":I
    :goto_1a
    if-ge v1, v4, :cond_2b

    .line 311
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaItem;

    .line 312
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    add-int v7, p2, v5

    add-int/2addr v7, v1

    invoke-interface {p1, v7, v2}, Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;->consume(ILcom/lge/gallery/data/core/MediaItem;)V

    .line 310
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 314
    .end local v2    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_2b
    add-int/2addr v5, v0

    .line 315
    goto :goto_5

    .line 316
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    .end local v4    # "n":I
    :cond_2d
    return v6
.end method

.method public enumerateMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;)V
    .registers 3
    .param p1, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;

    .prologue
    .line 290
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/data/core/MediaSet;->enumerateMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I

    .line 291
    return-void
.end method

.method protected enumerateTotalMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I
    .registers 8
    .param p1, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;
    .param p2, "startIndex"    # I

    .prologue
    .line 323
    const/4 v2, 0x0

    .line 324
    .local v2, "start":I
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/core/MediaSet;->enumerateMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I

    move-result v3

    add-int/2addr v2, v3

    .line 325
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSetCount()I

    move-result v1

    .line 326
    .local v1, "m":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_1b

    .line 327
    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v3

    add-int v4, p2, v2

    invoke-virtual {v3, p1, v4}, Lcom/lge/gallery/data/core/MediaSet;->enumerateTotalMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I

    move-result v3

    add-int/2addr v2, v3

    .line 326
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 330
    :cond_1b
    return v2
.end method

.method public enumerateTotalMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;)V
    .registers 3
    .param p1, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;

    .prologue
    .line 294
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/data/core/MediaSet;->enumerateTotalMediaItems(Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)I

    .line 295
    return-void
.end method

.method public getBaseSet()Lcom/lge/gallery/data/core/MediaSet;
    .registers 1

    .prologue
    .line 378
    return-object p0
.end method

.method public getBucketId()I
    .registers 2

    .prologue
    .line 62
    iget v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mBucketId:I

    return v0
.end method

.method public getCoverItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 2

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method public getCoverItems(I)Ljava/util/ArrayList;
    .registers 3
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
    .line 89
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItems(I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 3

    .prologue
    .line 134
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/lge/gallery/data/core/MediaSet;->getCoverMediaItems(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 135
    .local v0, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_f

    .line 136
    :cond_d
    const/4 v1, 0x0

    .line 138
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    goto :goto_e
.end method

.method public getDateString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 245
    const-string v0, ""

    return-object v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 4

    .prologue
    .line 281
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaObject;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v0

    .line 282
    .local v0, "details":Lcom/lge/gallery/data/core/MediaDetails;
    const/16 v1, 0xe

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 283
    return-object v0
.end method

.method public getDirectory()Ljava/lang/String;
    .registers 2

    .prologue
    .line 382
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHintIndex(IJ)I
    .registers 5
    .param p1, "id"    # I
    .param p2, "dateTaken"    # J

    .prologue
    .line 178
    const/4 v0, -0x1

    return v0
.end method

.method public getHintIndexOfDateTaken(J)I
    .registers 4
    .param p1, "dateTaken"    # J

    .prologue
    .line 174
    const/4 v0, -0x1

    return v0
.end method

.method protected getIndexOf(Lcom/lge/gallery/data/core/Path;Ljava/util/ArrayList;)I
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v3, -0x1

    .line 227
    if-nez p2, :cond_5

    move v0, v3

    .line 239
    :goto_4
    return v0

    .line 230
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "n":I
    :goto_a
    if-ge v0, v2, :cond_1c

    .line 231
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    .line 232
    .local v1, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-nez v1, :cond_17

    .line 230
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 235
    :cond_17
    iget-object v4, v1, Lcom/lge/gallery/data/core/MediaItem;->mPath:Lcom/lge/gallery/data/core/Path;

    if-ne v4, p1, :cond_14

    goto :goto_4

    .end local v1    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_1c
    move v0, v3

    .line 239
    goto :goto_4
.end method

.method public getIndexOfItem(Lcom/lge/gallery/data/core/Path;I)I
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "hint"    # I

    .prologue
    .line 187
    new-instance v0, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/lge/gallery/data/core/MediaSet;->getIndexOfItemInternal(Lcom/lge/gallery/data/core/Path;ILcom/lge/gallery/data/core/MediaSet$Options;)I

    move-result v0

    return v0
.end method

.method public getIndexOfItem(Lcom/lge/gallery/data/core/Path;ILcom/lge/gallery/data/core/MediaSet$Options;)I
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "hint"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;

    .prologue
    .line 182
    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/data/core/MediaSet;->getIndexOfItemInternal(Lcom/lge/gallery/data/core/Path;ILcom/lge/gallery/data/core/MediaSet$Options;)I

    move-result v0

    return v0
.end method

.method public getMediaItem(II)Ljava/util/ArrayList;
    .registers 4
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
    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getMediaItem(IILcom/lge/gallery/data/core/MediaSet$Options;)Ljava/util/ArrayList;
    .registers 5
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/lge/gallery/data/core/MediaSet$Options;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getMediaItemBatchFetchCount()I
    .registers 2

    .prologue
    .line 191
    const/16 v0, 0x1f4

    return v0
.end method

.method public getMediaItemCount()I
    .registers 2

    .prologue
    .line 66
    const/4 v0, 0x0

    return v0
.end method

.method public getMediaItemSize()J
    .registers 3

    .prologue
    .line 70
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 150
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method public getSubMediaSetCount()I
    .registers 2

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public getSubMediaSetSize()I
    .registers 2

    .prologue
    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public getTotalMediaItemCount()I
    .registers 5

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v2

    .line 159
    .local v2, "total":I
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSetCount()I

    move-result v1

    .local v1, "n":I
    :goto_9
    if-ge v0, v1, :cond_17

    .line 160
    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemCount()I

    move-result v3

    add-int/2addr v2, v3

    .line 159
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 162
    :cond_17
    return v2
.end method

.method public getTotalMediaItemSize()J
    .registers 7

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemSize()J

    move-result-wide v2

    .line 167
    .local v2, "total":J
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSetSize()I

    move-result v1

    .local v1, "n":I
    :goto_9
    if-ge v0, v1, :cond_17

    .line 168
    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/MediaSet;->getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getTotalMediaItemSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 170
    :cond_17
    return-wide v2
.end method

.method public hasCachedCover()Z
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public isLeafAlbum()Z
    .registers 2

    .prologue
    .line 154
    const/4 v0, 0x0

    return v0
.end method

.method public notifyContentChanged()V
    .registers 4

    .prologue
    .line 270
    iget-object v2, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/ContentListener;

    .line 271
    .local v1, "listener":Lcom/lge/gallery/data/core/ContentListener;
    invoke-interface {v1}, Lcom/lge/gallery/data/core/ContentListener;->onContentDirty()V

    goto :goto_a

    .line 273
    .end local v1    # "listener":Lcom/lge/gallery/data/core/ContentListener;
    :cond_1a
    return-void
.end method

.method public abstract reload()J
.end method

.method public removeContentListener(Lcom/lge/gallery/data/core/ContentListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/data/core/ContentListener;

    .prologue
    .line 262
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 263
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 265
    :cond_e
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mListeners:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    return-void
.end method

.method public requestSync(Lcom/lge/gallery/data/core/SyncListener;)Lcom/lge/gallery/util/Future;
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/data/core/SyncListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/SyncListener;",
            ")",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 344
    const/4 v0, 0x0

    invoke-interface {p1, p0, v0}, Lcom/lge/gallery/data/core/SyncListener;->onSyncDone(Lcom/lge/gallery/data/core/MediaSet;I)V

    .line 345
    sget-object v0, Lcom/lge/gallery/data/core/MediaSet;->FUTURE_STUB:Lcom/lge/gallery/util/Future;

    return-object v0
.end method

.method protected requestSyncOnMultipleSets([Lcom/lge/gallery/data/core/MediaSet;Lcom/lge/gallery/data/core/SyncListener;)Lcom/lge/gallery/util/Future;
    .registers 4
    .param p1, "sets"    # [Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "listener"    # Lcom/lge/gallery/data/core/SyncListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/lge/gallery/data/core/MediaSet;",
            "Lcom/lge/gallery/data/core/SyncListener;",
            ")",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 374
    new-instance v0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;

    invoke-direct {v0, p0, p1, p2}, Lcom/lge/gallery/data/core/MultiSetSyncFuture;-><init>(Lcom/lge/gallery/data/core/MediaSet;[Lcom/lge/gallery/data/core/MediaSet;Lcom/lge/gallery/data/core/SyncListener;)V

    return-object v0
.end method

.method public setCoverItem(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 2
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 97
    return-void
.end method

.method public stopReload()V
    .registers 2

    .prologue
    .line 386
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/core/MediaSet;->mStopReload:Z

    .line 387
    return-void
.end method
