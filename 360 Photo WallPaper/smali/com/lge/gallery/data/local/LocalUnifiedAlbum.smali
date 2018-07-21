.class public Lcom/lge/gallery/data/local/LocalUnifiedAlbum;
.super Lcom/lge/gallery/data/local/LocalMergeAlbum;
.source "LocalUnifiedAlbum.java"

# interfaces
.implements Lcom/lge/gallery/data/core/ContentListener;


# static fields
.field private static final BASE_URI:Landroid/net/Uri;

.field private static final COUNT_PROJECTION:[Ljava/lang/String;

.field private static final DEBUG:Z = false

.field private static final IMG_ORDER_ASC_BY_TTIME:Ljava/lang/String; = "datetaken ASC, _id ASC"

.field private static final IMG_ORDER_DESC_BY_TTIME:Ljava/lang/String; = "datetaken DESC, _id DESC"

.field private static final MAX_CACHE_SIZE:I = 0x90

.field private static final TAG:Ljava/lang/String; = "LocalUnifiedAlbum"

.field private static final USE_CACHED_ITEMS:Z = true

.field private static final WHERE:Ljava/lang/String;

.field private static final WHERE_FOR_HINT_ASC:Ljava/lang/String;

.field private static final WHERE_FOR_HINT_DESC:Ljava/lang/String;


# instance fields
.field private mCacheRef:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCacheStartPosition:I

.field private mCachedCount:I

.field private mImageMediaSet:Lcom/lge/gallery/data/core/MediaSet;

.field private final mUseCahceMode:Z

.field private mVideoMediaSet:Lcom/lge/gallery/data/core/MediaSet;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(media_type = ? OR media_type = ? ) AND bucket_id = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_LOCK_FIELD_EXIST:Z

    if-eqz v0, :cond_b6

    const-string v0, " AND is_lock = 0"

    :goto_11
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v0, :cond_ba

    const-string v0, ") GROUP BY bucket_id, (burst_id"

    :goto_1b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE:Ljava/lang/String;

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v0, :cond_be

    const-string v0, "burst_id IS NOT (SELECT burst_id FROM IMAGES WHERE _id = ?) AND "

    :goto_30
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "datetaken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " < ? OR ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "datetaken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " < ?)) AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE_FOR_HINT_ASC:Ljava/lang/String;

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v0, :cond_c2

    const-string v0, "burst_id IS NOT (SELECT burst_id FROM IMAGES WHERE _id = ?) AND "

    :goto_6f
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "datetaken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " > ? OR ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "datetaken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " > ?)) AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE_FOR_HINT_DESC:Ljava/lang/String;

    .line 58
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->BASE_URI:Landroid/net/Uri;

    .line 59
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "count(*)"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->COUNT_PROJECTION:[Ljava/lang/String;

    return-void

    .line 43
    :cond_b6
    const-string v0, ""

    goto/16 :goto_11

    :cond_ba
    const-string v0, ""

    goto/16 :goto_1b

    .line 48
    :cond_be
    const-string v0, "?"

    goto/16 :goto_30

    .line 53
    :cond_c2
    const-string v0, "?"

    goto :goto_6f
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;)V
    .registers 16
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
    .line 73
    .local p4, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/lge/gallery/data/local/LocalMergeAlbum;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;Z)V

    .line 75
    const/4 v8, 0x0

    .line 76
    .local v8, "useCache":Z
    if-eqz p5, :cond_33

    array-length v0, p5

    const/4 v1, 0x2

    if-ne v0, v1, :cond_33

    .line 77
    const/4 v0, 0x0

    aget-object v0, p5, v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_36

    const/4 v0, 0x1

    aget-object v0, p5, v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_36

    .line 79
    const/4 v0, 0x0

    aget-object v0, p5, v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mImageMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 80
    const/4 v0, 0x1

    aget-object v0, p5, v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mVideoMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 81
    const/4 v8, 0x1

    .line 89
    :cond_33
    :goto_33
    iput-boolean v8, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mUseCahceMode:Z

    .line 90
    return-void

    .line 82
    :cond_36
    const/4 v0, 0x1

    aget-object v0, p5, v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_33

    const/4 v0, 0x0

    aget-object v0, p5, v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_33

    .line 84
    const/4 v0, 0x1

    aget-object v0, p5, v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mImageMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 85
    const/4 v0, 0x0

    aget-object v0, p5, v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mVideoMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 86
    const/4 v8, 0x1

    goto :goto_33
.end method

.method private debugPrint(Ljava/util/ArrayList;I)V
    .registers 10
    .param p2, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 170
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .local v0, "builder":Ljava/lang/StringBuilder;
    move v1, p2

    .line 172
    .local v1, "count":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/MediaItem;

    .line 173
    .local v4, "item":Lcom/lge/gallery/data/core/MediaItem;
    const-string v5, "["

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "count":I
    .local v2, "count":I
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    .line 174
    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_a

    .line 175
    .end local v4    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_37
    const-string v5, "LocalUnifiedAlbum"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    return-void
.end method

.method private generateMediaItem(Lcom/lge/gallery/data/core/DataManager;Landroid/database/Cursor;)Lcom/lge/gallery/data/core/MediaItem;
    .registers 14
    .param p1, "dataManager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v5, 0x1

    const/4 v1, 0x0

    .line 290
    const/16 v2, 0xd

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 291
    .local v9, "mediaType":I
    if-ne v9, v5, :cond_23

    .line 292
    .local v5, "isImage":Z
    :goto_a
    if-eqz v5, :cond_25

    sget-object v10, Lcom/lge/gallery/data/local/LocalImage;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    .line 293
    .local v10, "parentItemPath":Lcom/lge/gallery/data/core/Path;
    :goto_e
    sget-boolean v2, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v2, :cond_28

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->showBurstImageAsSingleImage()Z

    move-result v2

    if-nez v2, :cond_28

    .line 294
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->PROJECTION_INDEX_MAP:Ljava/util/HashMap;

    invoke-static {v2, p2, v3, v1, v10}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstMediaItem(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;ILcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v6

    .line 296
    .local v6, "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v6, :cond_28

    .line 305
    .end local v6    # "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    :goto_22
    return-object v6

    .end local v5    # "isImage":Z
    .end local v10    # "parentItemPath":Lcom/lge/gallery/data/core/Path;
    :cond_23
    move v5, v1

    .line 291
    goto :goto_a

    .line 292
    .restart local v5    # "isImage":Z
    :cond_25
    sget-object v10, Lcom/lge/gallery/data/local/LocalVideo;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    goto :goto_e

    .line 300
    .restart local v10    # "parentItemPath":Lcom/lge/gallery/data/core/Path;
    :cond_28
    invoke-interface {p2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 301
    .local v7, "id":I
    invoke-virtual {v10, v7}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    .line 302
    .local v0, "childPath":Lcom/lge/gallery/data/core/Path;
    sget-object v2, Lcom/lge/gallery/data/local/LocalMediaProjection;->PROJECTION_INDEX_MAP:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object v1, p2

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v8

    .local v8, "item":Lcom/lge/gallery/data/core/MediaItem;
    move-object v6, v8

    .line 305
    goto :goto_22
.end method

.method private getCachedItems(II)Ljava/util/ArrayList;
    .registers 9
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
    const/4 v3, 0x0

    .line 179
    const/4 v0, 0x0

    .line 180
    .local v0, "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheRef:Ljava/lang/ref/SoftReference;

    .line 181
    .local v1, "cacheRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;>;"
    if-eqz v1, :cond_11

    iget v4, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    if-lt p1, v4, :cond_11

    iget v4, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    iget v5, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCachedCount:I

    add-int/2addr v4, v5

    if-lt p1, v4, :cond_12

    .line 196
    :cond_11
    :goto_11
    return-object v3

    .line 185
    :cond_12
    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    check-cast v0, Ljava/util/ArrayList;

    .line 186
    .restart local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    if-eqz v0, :cond_11

    .line 189
    iget v4, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    iget v5, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCachedCount:I

    add-int v2, v4, v5

    .line 190
    .local v2, "lastCachedIndex":I
    add-int v4, p1, p2

    if-le v4, v2, :cond_2a

    .line 192
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemCount()I

    move-result v4

    if-ne v2, v4, :cond_11

    :cond_2a
    move-object v3, v0

    .line 196
    goto :goto_11
.end method

.method private getMediaItemFromCache(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;
    .registers 14
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;
    .param p4, "focusToLast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/lge/gallery/data/core/MediaSet$Options;",
            "Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    if-eqz p4, :cond_7

    .line 131
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemInternal(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;

    move-result-object v4

    .line 166
    :cond_6
    :goto_6
    return-object v4

    .line 133
    :cond_7
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getCachedItems(II)Ljava/util/ArrayList;

    move-result-object v0

    .line 134
    .local v0, "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v4, 0x0

    .line 135
    .local v4, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_46

    .line 136
    :cond_14
    new-instance v7, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v7}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    const/4 v8, 0x0

    invoke-direct {p0, p1, p2, v7, v8}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemInternal(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;

    move-result-object v4

    .line 137
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 138
    .local v5, "retSize":I
    const/16 v7, 0x90

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 139
    .local v3, "max":I
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 140
    .restart local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2e
    if-ge v2, v3, :cond_3a

    .line 141
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 143
    :cond_3a
    iput v3, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCachedCount:I

    .line 144
    iput p1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    .line 149
    new-instance v7, Ljava/lang/ref/SoftReference;

    invoke-direct {v7, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v7, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheRef:Ljava/lang/ref/SoftReference;

    goto :goto_6

    .line 152
    .end local v2    # "i":I
    .end local v3    # "max":I
    .end local v5    # "retSize":I
    :cond_46
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-direct {v4, p2}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    .restart local v4    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    iget v7, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    sub-int v6, p1, v7

    .line 154
    .local v6, "startPos":I
    add-int v7, v6, p2

    iget v8, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCachedCount:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 159
    .local v1, "endPos":I
    move v2, v6

    .restart local v2    # "i":I
    :goto_58
    if-ge v2, v1, :cond_6

    .line 160
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    add-int/lit8 v2, v2, 0x1

    goto :goto_58
.end method

.method private getMediaItemInternal(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;
    .registers 17
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;
    .param p4, "focusToLast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/lge/gallery/data/core/MediaSet$Options;",
            "Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 242
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 243
    sget-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->BASE_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "limit"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ","

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v2, v10}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 245
    .local v1, "uri":Landroid/net/Uri;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .local v9, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v5, 0x0

    .line 247
    .local v5, "order":Ljava/lang/String;
    if-eqz p4, :cond_60

    .line 248
    const-string v5, "datetaken DESC, _id DESC"

    .line 252
    :goto_34
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getWhere()Ljava/lang/String;

    move-result-object v3

    .line 253
    .local v3, "whrere":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getWhereArgs()[Ljava/lang/String;

    move-result-object v4

    .line 254
    .local v4, "whereArgs":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 256
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_3d
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_44} :catch_65

    move-result-object v6

    .line 262
    if-nez v6, :cond_6e

    .line 263
    const-string v0, "LocalUnifiedAlbum"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "query fail: "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    :goto_5f
    return-object v9

    .line 250
    .end local v3    # "whrere":Ljava/lang/String;
    .end local v4    # "whereArgs":[Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_60
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getOrder()Ljava/lang/String;

    move-result-object v5

    goto :goto_34

    .line 258
    .restart local v3    # "whrere":Ljava/lang/String;
    .restart local v4    # "whereArgs":[Ljava/lang/String;
    .restart local v6    # "cursor":Landroid/database/Cursor;
    :catch_65
    move-exception v8

    .line 259
    .local v8, "e":Ljava/lang/Exception;
    const-string v0, "LocalUnifiedAlbum"

    const-string v2, "Database query failed for any exception."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5f

    .line 267
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_6e
    :try_start_6e
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v7

    .line 268
    .local v7, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    :goto_74
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_94

    .line 269
    invoke-virtual {p3}, Lcom/lge/gallery/data/core/MediaSet$Options;->isCancelRequested()Z

    move-result v0

    if-eqz v0, :cond_87

    .line 270
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V
    :try_end_83
    .catchall {:try_start_6e .. :try_end_83} :catchall_8f

    .line 276
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_5f

    .line 273
    :cond_87
    :try_start_87
    invoke-direct {p0, v7, v6}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->generateMediaItem(Lcom/lge/gallery/data/core/DataManager;Landroid/database/Cursor;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_8e
    .catchall {:try_start_87 .. :try_end_8e} :catchall_8f

    goto :goto_74

    .line 276
    .end local v7    # "dataManager":Lcom/lge/gallery/data/core/DataManager;
    :catchall_8f
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0

    .restart local v7    # "dataManager":Lcom/lge/gallery/data/core/DataManager;
    :cond_94
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_5f
.end method

.method private pickFirstMediaItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 328
    const/4 v1, 0x1

    new-instance v2, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v2}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    invoke-direct {p0, v3, v1, v2, v3}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemInternal(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 330
    .local v0, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_13

    const/4 v1, 0x0

    :goto_12
    return-object v1

    :cond_13
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    goto :goto_12
.end method

.method private setChildCacheCover(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 4
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 334
    if-eqz p1, :cond_e

    iget-boolean v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mUseCahceMode:Z

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mImageMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mVideoMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    if-nez v1, :cond_f

    .line 343
    :cond_e
    :goto_e
    return-void

    .line 337
    :cond_f
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaItem;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    .line 338
    .local v0, "uri":Landroid/net/Uri;
    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_1d

    .line 339
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mImageMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v1, p1}, Lcom/lge/gallery/data/core/MediaSet;->setCoverItem(Lcom/lge/gallery/data/core/MediaItem;)V

    goto :goto_e

    .line 340
    :cond_1d
    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    if-ne v0, v1, :cond_e

    .line 341
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mVideoMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v1, p1}, Lcom/lge/gallery/data/core/MediaSet;->setCoverItem(Lcom/lge/gallery/data/core/MediaItem;)V

    goto :goto_e
.end method


# virtual methods
.method protected checkAlbumSanity(Lcom/lge/gallery/data/local/LocalMergeAlbum;)Z
    .registers 3
    .param p1, "album"    # Lcom/lge/gallery/data/local/LocalMergeAlbum;

    .prologue
    .line 310
    const/4 v0, 0x1

    return v0
.end method

.method public getBaseUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 93
    sget-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->BASE_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 3

    .prologue
    .line 315
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    if-eqz v1, :cond_7

    .line 316
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 324
    :cond_6
    :goto_6
    return-object v0

    .line 318
    :cond_7
    iget-boolean v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mUseCahceMode:Z

    if-eqz v1, :cond_16

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->hasCachedCover()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 319
    invoke-super {p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    goto :goto_6

    .line 321
    :cond_16
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->pickFirstMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    .line 322
    .local v0, "item":Lcom/lge/gallery/data/core/MediaItem;
    invoke-direct {p0, v0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->setChildCacheCover(Lcom/lge/gallery/data/core/MediaItem;)V

    .line 323
    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCoverItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 324
    if-nez v0, :cond_6

    invoke-super {p0}, Lcom/lge/gallery/data/local/LocalMergeAlbum;->getCoverMediaItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    goto :goto_6
.end method

.method public getHintIndex(IJ)I
    .registers 16
    .param p1, "id"    # I
    .param p2, "dateTaken"    # J

    .prologue
    .line 215
    const/4 v7, -0x1

    .line 217
    .local v7, "index":I
    sget-object v1, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->BASE_URI:Landroid/net/Uri;

    .line 218
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getOrder()Ljava/lang/String;

    move-result-object v5

    .line 219
    .local v5, "order":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getWhereForHint()Ljava/lang/String;

    move-result-object v3

    .line 220
    .local v3, "where":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, p3}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getWhereForHintArgs(IJ)[Ljava/lang/String;

    move-result-object v4

    .line 221
    .local v4, "whereArgs":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 223
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_10
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->COUNT_PROJECTION:[Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 225
    if-eqz v6, :cond_20

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_1d} :catch_32
    .catchall {:try_start_10 .. :try_end_1d} :catchall_6d

    move-result v0

    if-nez v0, :cond_27

    .line 233
    :cond_20
    if-eqz v6, :cond_25

    .line 234
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_25
    move v8, v7

    .line 237
    .end local v7    # "index":I
    .local v8, "index":I
    :goto_26
    return v8

    .line 228
    .end local v8    # "index":I
    .restart local v7    # "index":I
    :cond_27
    :try_start_27
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_2a} :catch_32
    .catchall {:try_start_27 .. :try_end_2a} :catchall_6d

    move-result v7

    .line 233
    if-eqz v6, :cond_30

    .line 234
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_30
    :goto_30
    move v8, v7

    .line 237
    .end local v7    # "index":I
    .restart local v8    # "index":I
    goto :goto_26

    .line 229
    .end local v8    # "index":I
    .restart local v7    # "index":I
    :catch_32
    move-exception v9

    .line 230
    .local v9, "t":Ljava/lang/Throwable;
    :try_start_33
    const-string v0, "LocalUnifiedAlbum"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getHintIndex got an exception : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "\n"

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, "projection : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v10, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->COUNT_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v10, ", where : "

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_67
    .catchall {:try_start_33 .. :try_end_67} :catchall_6d

    .line 233
    if-eqz v6, :cond_30

    .line 234
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_30

    .line 233
    .end local v9    # "t":Ljava/lang/Throwable;
    :catchall_6d
    move-exception v0

    if-eqz v6, :cond_73

    .line 234
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_73
    throw v0
.end method

.method public getMediaItem(II)Ljava/util/ArrayList;
    .registers 5
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
    .line 98
    new-instance v0, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemFromCache(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;

    move-result-object v0

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
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->getMediaItemFromCache(IILcom/lge/gallery/data/core/MediaSet$Options;Z)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected getOrder()Ljava/lang/String;
    .registers 3

    .prologue
    .line 207
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/SortingOrderManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/util/SortingOrderManager;->getSortingOrder()I

    move-result v1

    if-nez v1, :cond_13

    const-string v0, "datetaken ASC, _id ASC"

    .line 210
    .local v0, "order":Ljava/lang/String;
    :goto_12
    return-object v0

    .line 207
    .end local v0    # "order":Ljava/lang/String;
    :cond_13
    const-string v0, "datetaken DESC, _id DESC"

    goto :goto_12
.end method

.method protected getWhere()Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    sget-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE:Ljava/lang/String;

    return-object v0
.end method

.method protected getWhereArgs()[Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 118
    new-array v0, v4, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    iget v2, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mBucketId:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected getWhereForHint()Ljava/lang/String;
    .registers 4

    .prologue
    .line 111
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/SortingOrderManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/util/SortingOrderManager;->getSortingOrder()I

    move-result v1

    if-nez v1, :cond_26

    sget-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE_FOR_HINT_ASC:Ljava/lang/String;

    .line 114
    .local v0, "hint":Ljava/lang/String;
    :goto_12
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 111
    .end local v0    # "hint":Ljava/lang/String;
    :cond_26
    sget-object v0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->WHERE_FOR_HINT_DESC:Ljava/lang/String;

    goto :goto_12
.end method

.method protected getWhereForHintArgs(IJ)[Ljava/lang/String;
    .registers 10
    .param p1, "id"    # I
    .param p2, "dateTaken"    # J

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    .line 123
    const/4 v0, 0x7

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v0, :cond_3b

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_e
    aput-object v0, v1, v2

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v3

    const/4 v0, 0x2

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v4

    const/4 v0, 0x4

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    const/4 v0, 0x5

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    const/4 v0, 0x6

    iget v2, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mBucketId:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    return-object v1

    :cond_3b
    const-string v0, ""

    goto :goto_e
.end method

.method protected invalidateCache()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheRef:Ljava/lang/ref/SoftReference;

    .line 202
    iput v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCacheStartPosition:I

    .line 203
    iput v1, p0, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;->mCachedCount:I

    .line 204
    return-void
.end method

.method protected showBurstImageAsSingleImage()Z
    .registers 2

    .prologue
    .line 286
    const/4 v0, 0x0

    return v0
.end method
