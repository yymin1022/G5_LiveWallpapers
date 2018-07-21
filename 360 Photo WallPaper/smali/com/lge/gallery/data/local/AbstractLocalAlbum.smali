.class public abstract Lcom/lge/gallery/data/local/AbstractLocalAlbum;
.super Lcom/lge/gallery/data/core/MediaSet;
.source "AbstractLocalAlbum.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
    }
.end annotation


# static fields
.field private static final BURST_COUNT_PROJECTION:[Ljava/lang/String;

.field private static final COUNT_PROJECTION:[Ljava/lang/String;

.field protected static final DNG_FORMAT:Ljava/lang/String; = ".dng"

.field protected static final EMPTY_ALBUM_NAME:Ljava/lang/String; = ""

.field private static final GROUP_BY_BURST_BUCKET_ID:Ljava/lang/String; = ") GROUP BY bucket_id, (burst_id"

.field private static final IMG_ORDER_ASC_BY_TTIME:Ljava/lang/String; = "datetaken ASC, _id ASC"

.field private static final IMG_ORDER_DESC_BY_TTIME:Ljava/lang/String; = "datetaken DESC, _id DESC"

.field public static final INVALID_COUNT:I = -0x1

.field protected static final OPERATORE_AND:Ljava/lang/String; = " AND "

.field private static final SIZE_PROJECTION:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "AbstractLocalAlbum"


# instance fields
.field protected mAlbumName:Ljava/lang/String;

.field protected final mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field private mCachedCount:I

.field private mCoverItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field protected mDirectory:Ljava/lang/String;

.field protected mIsAlbumNameUpdated:Z

.field protected mIsBurstShotEnabled:Z

.field private mIsFirst:Z

.field protected final mIsImage:Z

.field private final mItemPath:Lcom/lge/gallery/data/core/Path;

.field private mManager:Lcom/lge/gallery/util/SortingOrderManager;

.field protected final mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

.field private final mProjection:[Ljava/lang/String;

.field protected final mResolver:Landroid/content/ContentResolver;

.field private mUseCachedCover:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "count(*)"

    aput-object v1, v0, v2

    sput-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->COUNT_PROJECTION:[Ljava/lang/String;

    .line 47
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "count(DISTINCT burst_id)"

    aput-object v1, v0, v2

    sput-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->BURST_COUNT_PROJECTION:[Ljava/lang/String;

    .line 49
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "SUM(_size)"

    aput-object v1, v0, v2

    sput-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->SIZE_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/lang/String;Ljava/lang/String;I)V
    .registers 15
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "isImage"    # Z
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "directory"    # Ljava/lang/String;
    .param p6, "count"    # I

    .prologue
    .line 83
    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/lang/String;Ljava/lang/String;IZ)V

    .line 84
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/lang/String;Ljava/lang/String;IZ)V
    .registers 11
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "isImage"    # Z
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "directory"    # Ljava/lang/String;
    .param p6, "count"    # I
    .param p7, "useBurstshotGrouping"    # Z

    .prologue
    const/4 v2, 0x1

    .line 88
    invoke-static {}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->nextVersionNumber()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/gallery/data/core/MediaSet;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    .line 68
    iput-boolean v2, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsFirst:Z

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    .line 89
    iput-object p2, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 90
    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    .line 91
    iput-object p4, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mAlbumName:Ljava/lang/String;

    .line 92
    iput-object p5, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDirectory:Ljava/lang/String;

    .line 93
    iput p6, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    .line 94
    const-string v0, ""

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    .line 95
    iput-boolean v2, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsAlbumNameUpdated:Z

    .line 97
    :cond_2c
    iput-boolean p3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    .line 98
    if-eqz p7, :cond_6c

    if-eqz p3, :cond_6c

    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    :goto_34
    iput-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    .line 101
    if-eqz p3, :cond_6e

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    :goto_3a
    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    .line 102
    invoke-virtual {p0, p3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getProjection(Z)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mProjection:[Ljava/lang/String;

    .line 103
    invoke-virtual {p0, p3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getItemPath(Z)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mItemPath:Lcom/lge/gallery/data/core/Path;

    .line 104
    new-instance v0, Lcom/lge/gallery/data/core/ChangeNotifier;

    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, p2}, Lcom/lge/gallery/data/core/ChangeNotifier;-><init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

    .line 105
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/SortingOrderManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mManager:Lcom/lge/gallery/util/SortingOrderManager;

    .line 106
    new-instance v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum$1;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum$1;-><init>(Lcom/lge/gallery/data/local/AbstractLocalAlbum;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mSortObserver:Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    .line 112
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mManager:Lcom/lge/gallery/util/SortingOrderManager;

    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mSortObserver:Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    invoke-virtual {v0, v1}, Lcom/lge/gallery/util/SortingOrderManager;->registerObserver(Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;)V

    .line 113
    return-void

    .line 98
    :cond_6c
    const/4 v0, 0x0

    goto :goto_34

    .line 101
    :cond_6e
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_3a
.end method

.method private static getBurstIdMap(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/util/HashMap;
    .registers 14
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 536
    const/4 v6, 0x0

    .line 537
    .local v6, "burstCursor":Landroid/database/Cursor;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 539
    .local v7, "burstIdhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;Ljava/lang/Integer;>;"
    const/4 v0, 0x3

    :try_start_8
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "bucket_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "burst_id"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "count(burst_id)"

    aput-object v1, v2, v0

    const-string v3, "1) GROUP BY bucket_id, (burst_id"

    const/4 v4, 0x0

    const-string v5, "_id ASC"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 545
    if-nez v6, :cond_44

    .line 546
    const-string v0, "AbstractLocalAlbum"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "query fail"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3e} :catch_68
    .catchall {:try_start_8 .. :try_end_3e} :catchall_91

    .line 562
    if-eqz v6, :cond_43

    .line 563
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 566
    :cond_43
    :goto_43
    return-object v7

    .line 550
    :cond_44
    :goto_44
    :try_start_44
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_8b

    .line 551
    const/4 v0, 0x2

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 552
    .local v8, "count":I
    if-le v8, v11, :cond_44

    .line 553
    new-instance v10, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;

    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v10, v0, v1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;-><init>(ILjava/lang/String;)V

    .line 555
    .local v10, "entry":Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v7, v10, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_67} :catch_68
    .catchall {:try_start_44 .. :try_end_67} :catchall_91

    goto :goto_44

    .line 558
    .end local v8    # "count":I
    .end local v10    # "entry":Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
    :catch_68
    move-exception v9

    .line 559
    .local v9, "e":Ljava/lang/Exception;
    :try_start_69
    const-string v0, "AbstractLocalAlbum"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Database query failed for any exception."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_85
    .catchall {:try_start_69 .. :try_end_85} :catchall_91

    .line 562
    if-eqz v6, :cond_43

    .line 563
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_43

    .line 562
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_8b
    if-eqz v6, :cond_43

    .line 563
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_43

    .line 562
    :catchall_91
    move-exception v0

    if-eqz v6, :cond_97

    .line 563
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_97
    throw v0
.end method

.method private getBurstMediaItem(Landroid/database/Cursor;)Lcom/lge/gallery/data/core/MediaItem;
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 280
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mItemPath:Lcom/lge/gallery/data/core/Path;

    invoke-static {v0, p1, v1, v2, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstMediaItem(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;ILcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method static getBurstMediaItem(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;ILcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaItem;
    .registers 18
    .param p0, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p3, "burstCounter"    # I
    .param p4, "prefix"    # Lcom/lge/gallery/data/core/Path;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;I",
            "Lcom/lge/gallery/data/core/Path;",
            ")",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 216
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    sget-boolean v3, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-nez v3, :cond_6

    .line 217
    const/4 v11, 0x0

    .line 249
    :cond_5
    :goto_5
    return-object v11

    .line 219
    :cond_6
    const-string v6, ""

    .line 220
    .local v6, "burstId":Ljava/lang/String;
    const/4 v2, 0x0

    .line 221
    .local v2, "myCursor":Landroid/database/Cursor;
    if-nez p2, :cond_5b

    sget-object v12, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 224
    .local v12, "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_d
    const/4 v3, 0x1

    move/from16 v0, p3

    if-gt v0, v3, :cond_5d

    :try_start_12
    const-string v3, "count(burst_id)"

    invoke-virtual {v12, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 227
    .local v7, "counter":I
    :goto_22
    const/4 v3, 0x1

    if-le v7, v3, :cond_60

    const/4 v10, 0x1

    .line 228
    .local v10, "isBurstImage":Z
    :goto_26
    if-eqz v10, :cond_7d

    .line 229
    const-string v3, "burst_id"

    invoke-virtual {v12, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 230
    invoke-interface {p0}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "bucket_id"

    invoke-virtual {v12, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v4, v5, v3, v6}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->queryBurstCover(Landroid/content/ContentResolver;Landroid/net/Uri;ILjava/lang/String;)Landroid/database/Cursor;
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_51} :catch_84
    .catchall {:try_start_12 .. :try_end_51} :catchall_92

    move-result-object v2

    .line 233
    if-nez v2, :cond_62

    .line 234
    const/4 v11, 0x0

    .line 245
    if-eqz v2, :cond_5

    .line 246
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_5

    .end local v7    # "counter":I
    .end local v10    # "isBurstImage":Z
    .end local v12    # "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_5b
    move-object v12, p2

    .line 221
    goto :goto_d

    .restart local v12    # "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_5d
    move/from16 v7, p3

    .line 224
    goto :goto_22

    .line 227
    .restart local v7    # "counter":I
    :cond_60
    const/4 v10, 0x0

    goto :goto_26

    .line 236
    .restart local v10    # "isBurstImage":Z
    :cond_62
    const/4 v3, 0x0

    :try_start_63
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 237
    .local v9, "id":I
    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    .line 238
    .local v1, "childPath":Lcom/lge/gallery/data/core/Path;
    const/4 v3, 0x0

    invoke-interface {p0}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v4

    move-object v5, p0

    invoke-static/range {v1 .. v7}, Lcom/lge/gallery/data/local/BurstImage;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;I)Lcom/lge/gallery/data/core/MediaItem;
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_76} :catch_84
    .catchall {:try_start_63 .. :try_end_76} :catchall_92

    move-result-object v11

    .line 245
    .local v11, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v2, :cond_5

    .line 246
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_5

    .line 245
    .end local v1    # "childPath":Lcom/lge/gallery/data/core/Path;
    .end local v9    # "id":I
    .end local v11    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_7d
    if-eqz v2, :cond_82

    .line 246
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 249
    .end local v7    # "counter":I
    .end local v10    # "isBurstImage":Z
    :cond_82
    :goto_82
    const/4 v11, 0x0

    goto :goto_5

    .line 242
    :catch_84
    move-exception v8

    .line 243
    .local v8, "e":Ljava/lang/Exception;
    :try_start_85
    const-string v3, "AbstractLocalAlbum"

    const-string v4, "Failed to get burst image."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8c
    .catchall {:try_start_85 .. :try_end_8c} :catchall_92

    .line 245
    if-eqz v2, :cond_82

    .line 246
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_82

    .line 245
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_92
    move-exception v3

    if-eqz v2, :cond_98

    .line 246
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_98
    throw v3
.end method

.method private getCountProjection()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 622
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    if-eqz v0, :cond_7

    sget-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->BURST_COUNT_PROJECTION:[Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->COUNT_PROJECTION:[Ljava/lang/String;

    goto :goto_6
.end method

.method public static getMediaItemById(ZLjava/lang/String;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;
    .registers 37
    .param p0, "isBurstUnit"    # Z
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "isImage"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)[",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 405
    .local p4, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v11

    new-array v0, v11, [Lcom/lge/gallery/data/core/MediaItem;

    move-object/from16 v29, v0

    .line 406
    .local v29, "result":[Lcom/lge/gallery/data/core/MediaItem;
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_f

    .line 513
    :goto_e
    return-object v29

    .line 409
    :cond_f
    const/4 v11, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v20

    .line 410
    .local v20, "idLow":I
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v19

    .line 417
    .local v19, "idHigh":I
    if-eqz p3, :cond_8d

    .line 418
    sget-object v3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 419
    .local v3, "baseUri":Landroid/net/Uri;
    sget-object v4, Lcom/lge/gallery/data/local/BurstImage;->BURST_PROJECTION:[Ljava/lang/String;

    .line 420
    .local v4, "projection":[Ljava/lang/String;
    sget-object v9, Lcom/lge/gallery/data/local/BurstImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 421
    .local v9, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-eqz p0, :cond_88

    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/data/local/MediaSetUtils;->getBurstUnitItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v24

    .line 431
    .local v24, "itemPath":Lcom/lge/gallery/data/core/Path;
    :goto_3c
    invoke-interface/range {p2 .. p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 432
    .local v2, "resolver":Landroid/content/ContentResolver;
    invoke-interface/range {p2 .. p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v10

    .line 433
    .local v10, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    const-string v5, "_id BETWEEN ? AND ?"

    .line 434
    .local v5, "where":Ljava/lang/String;
    const/4 v11, 0x2

    new-array v6, v11, [Ljava/lang/String;

    const/4 v11, 0x0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v6, v11

    const/4 v11, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v6, v11

    .line 435
    .local v6, "whereArgs":[Ljava/lang/String;
    if-eqz p3, :cond_af

    .line 436
    new-instance v30, Ljava/lang/StringBuilder;

    const-string v11, "_id IN("

    move-object/from16 v0, v30

    invoke-direct {v0, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 437
    .local v30, "sb":Ljava/lang/StringBuilder;
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_a3

    .line 438
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_6a
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v11

    move/from16 v0, v17

    if-ge v0, v11, :cond_98

    .line 439
    move-object/from16 v0, p4

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    add-int/lit8 v17, v17, 0x1

    goto :goto_6a

    .line 421
    .end local v2    # "resolver":Landroid/content/ContentResolver;
    .end local v5    # "where":Ljava/lang/String;
    .end local v6    # "whereArgs":[Ljava/lang/String;
    .end local v10    # "dataManager":Lcom/lge/gallery/data/core/DataManager;
    .end local v17    # "i":I
    .end local v24    # "itemPath":Lcom/lge/gallery/data/core/Path;
    .end local v30    # "sb":Ljava/lang/StringBuilder;
    :cond_88
    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/data/local/MediaSetUtils;->getImageItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v24

    goto :goto_3c

    .line 425
    .end local v3    # "baseUri":Landroid/net/Uri;
    .end local v4    # "projection":[Ljava/lang/String;
    .end local v9    # "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_8d
    sget-object v3, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 426
    .restart local v3    # "baseUri":Landroid/net/Uri;
    sget-object v4, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    .line 427
    .restart local v4    # "projection":[Ljava/lang/String;
    sget-object v9, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 428
    .restart local v9    # "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/data/local/MediaSetUtils;->getVideoItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v24

    .restart local v24    # "itemPath":Lcom/lge/gallery/data/core/Path;
    goto :goto_3c

    .line 441
    .restart local v2    # "resolver":Landroid/content/ContentResolver;
    .restart local v5    # "where":Ljava/lang/String;
    .restart local v6    # "whereArgs":[Ljava/lang/String;
    .restart local v10    # "dataManager":Lcom/lge/gallery/data/core/DataManager;
    .restart local v17    # "i":I
    .restart local v30    # "sb":Ljava/lang/StringBuilder;
    :cond_98
    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x2

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 443
    .end local v17    # "i":I
    :cond_a3
    const-string v11, ")"

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 445
    const/4 v6, 0x0

    .line 448
    .end local v30    # "sb":Ljava/lang/StringBuilder;
    :cond_af
    sget-boolean v11, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v11, :cond_e2

    if-eqz p3, :cond_e2

    invoke-static {v2, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstIdMap(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/util/HashMap;

    move-result-object v14

    .line 452
    .local v14, "burstIdhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;Ljava/lang/Integer;>;"
    :goto_b9
    invoke-virtual {v14}, Ljava/util/HashMap;->size()I

    move-result v28

    .line 453
    .local v28, "numOfBurstShot":I
    const/4 v8, 0x0

    .line 455
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_be
    const-string v7, "_id ASC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_be .. :try_end_c3} :catch_e8

    move-result-object v8

    .line 463
    if-nez v8, :cond_f5

    .line 464
    const-string v11, "AbstractLocalAlbum"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "query fail"

    move-object/from16 v0, v31

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 448
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v14    # "burstIdhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;Ljava/lang/Integer;>;"
    .end local v28    # "numOfBurstShot":I
    :cond_e2
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    goto :goto_b9

    .line 458
    .restart local v8    # "cursor":Landroid/database/Cursor;
    .restart local v14    # "burstIdhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;Ljava/lang/Integer;>;"
    .restart local v28    # "numOfBurstShot":I
    :catch_e8
    move-exception v16

    .line 459
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    .line 460
    const-string v11, "AbstractLocalAlbum"

    const-string v12, "Database query failed for any exception."

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_e

    .line 468
    .end local v16    # "e":Ljava/lang/Exception;
    :cond_f5
    :try_start_f5
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v26

    .line 469
    .local v26, "n":I
    const/16 v17, 0x0

    .line 470
    .restart local v17    # "i":I
    if-lez v28, :cond_15f

    if-eqz p3, :cond_15f

    const/16 v27, 0x1

    .line 471
    .local v27, "needToCheckBurstShot":Z
    :goto_101
    if-eqz v27, :cond_162

    const-string v11, "bucket_id"

    invoke-virtual {v9, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v21

    .line 473
    .local v21, "indexBucketId":I
    :goto_10f
    if-eqz v27, :cond_165

    const-string v11, "burst_id"

    invoke-virtual {v9, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v22

    .line 476
    .local v22, "indexBurstId":I
    :cond_11d
    :goto_11d
    move/from16 v0, v17

    move/from16 v1, v26

    if-ge v0, v1, :cond_1b4

    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11

    if-eqz v11, :cond_1b4

    .line 477
    const/4 v11, 0x0

    invoke-interface {v8, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 480
    .local v18, "id":I
    move-object/from16 v0, p4

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    move/from16 v0, v18

    if-gt v11, v0, :cond_11d

    .line 484
    :cond_140
    move-object/from16 v0, p4

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I
    :try_end_14d
    .catchall {:try_start_f5 .. :try_end_14d} :catchall_1b9

    move-result v11

    move/from16 v0, v18

    if-ge v11, v0, :cond_168

    .line 485
    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    move/from16 v1, v26

    if-lt v0, v1, :cond_140

    .line 513
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto/16 :goto_e

    .line 470
    .end local v18    # "id":I
    .end local v21    # "indexBucketId":I
    .end local v22    # "indexBurstId":I
    .end local v27    # "needToCheckBurstShot":Z
    :cond_15f
    const/16 v27, 0x0

    goto :goto_101

    .line 471
    .restart local v27    # "needToCheckBurstShot":Z
    :cond_162
    const/16 v21, 0x0

    goto :goto_10f

    .line 473
    .restart local v21    # "indexBucketId":I
    :cond_165
    const/16 v22, 0x0

    goto :goto_11d

    .line 489
    .restart local v18    # "id":I
    .restart local v22    # "indexBurstId":I
    :cond_168
    if-lez v28, :cond_19e

    if-eqz p3, :cond_19e

    .line 490
    :try_start_16c
    new-instance v25, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;

    move/from16 v0, v21

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    move/from16 v0, v22

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, v25

    invoke-direct {v0, v11, v12}, Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;-><init>(ILjava/lang/String;)V

    .line 493
    .local v25, "key":Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    .line 494
    .local v13, "burstCounter":Ljava/lang/Integer;
    if-eqz v13, :cond_19e

    .line 495
    add-int/lit8 v28, v28, -0x1

    .line 496
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v11

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-static {v0, v8, v9, v11, v1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstMediaItem(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;ILcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v15

    .line 498
    .local v15, "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v15, :cond_19e

    .line 499
    aput-object v15, v29, v17

    .line 500
    add-int/lit8 v17, v17, 0x1

    .line 501
    goto :goto_11d

    .line 505
    .end local v13    # "burstCounter":Ljava/lang/Integer;
    .end local v15    # "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    .end local v25    # "key":Lcom/lge/gallery/data/local/AbstractLocalAlbum$BucketBurstEntry;
    :cond_19e
    move-object/from16 v0, v24

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v7

    .local v7, "childPath":Lcom/lge/gallery/data/core/Path;
    move-object/from16 v11, p2

    move/from16 v12, p3

    .line 506
    invoke-static/range {v7 .. v12}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v23

    .line 508
    .local v23, "item":Lcom/lge/gallery/data/core/MediaItem;
    aput-object v23, v29, v17
    :try_end_1b0
    .catchall {:try_start_16c .. :try_end_1b0} :catchall_1b9

    .line 509
    add-int/lit8 v17, v17, 0x1

    .line 510
    goto/16 :goto_11d

    .line 513
    .end local v7    # "childPath":Lcom/lge/gallery/data/core/Path;
    .end local v18    # "id":I
    .end local v23    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_1b4
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto/16 :goto_e

    .end local v17    # "i":I
    .end local v21    # "indexBucketId":I
    .end local v22    # "indexBurstId":I
    .end local v26    # "n":I
    .end local v27    # "needToCheckBurstShot":Z
    :catchall_1b9
    move-exception v11

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v11
.end method

.method private final getWhereFilterHiddenFilesOut()Ljava/lang/String;
    .registers 5

    .prologue
    .line 135
    iget-boolean v2, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-virtual {p0, v2}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereStatement(Z)Ljava/lang/String;

    move-result-object v1

    .line 136
    .local v1, "whereClause":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->isHiddenAlbumFilteredOut()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 137
    invoke-static {}, Lcom/lge/gallery/util/AllFolderManager;->getAllfolderQueryString()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "filterString":Ljava/lang/String;
    if-eqz v0, :cond_15

    .line 139
    if-nez v1, :cond_16

    move-object v1, v0

    .line 143
    .end local v0    # "filterString":Ljava/lang/String;
    :cond_15
    :goto_15
    return-object v1

    .line 139
    .restart local v0    # "filterString":Ljava/lang/String;
    :cond_16
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " AND "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_15
.end method

.method public static loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;
    .registers 11
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "dataManager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p3, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p4, "isImage"    # Z

    .prologue
    .line 369
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method static loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;
    .registers 11
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p3, "dataManager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p4, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p5, "isImage"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/lge/gallery/data/core/DataManager;",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Z)",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 375
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_4

    .line 376
    const/4 v1, 0x0

    .line 396
    :goto_3
    return-object v1

    .line 378
    :cond_4
    const/4 v1, 0x0

    .line 379
    .local v1, "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    const-class v4, Lcom/lge/gallery/data/core/Path;

    monitor-enter v4

    .line 380
    :try_start_8
    invoke-virtual {p3, p0}, Lcom/lge/gallery/data/core/DataManager;->peekMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/lge/gallery/data/local/LocalMediaItem;

    move-object v1, v0

    .line 381
    if-nez v1, :cond_26

    .line 382
    if-eqz p5, :cond_1f

    .line 383
    new-instance v2, Lcom/lge/gallery/data/local/LocalImage;

    invoke-direct {v2, p0, p4, p1, p2}, Lcom/lge/gallery/data/local/LocalImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V

    .end local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .local v2, "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    move-object v1, v2

    .line 395
    .end local v2    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .restart local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    :goto_1a
    monitor-exit v4

    goto :goto_3

    :catchall_1c
    move-exception v3

    monitor-exit v4
    :try_end_1e
    .catchall {:try_start_8 .. :try_end_1e} :catchall_1c

    throw v3

    .line 385
    :cond_1f
    :try_start_1f
    new-instance v2, Lcom/lge/gallery/data/local/LocalVideo;

    invoke-direct {v2, p0, p4, p1, p2}, Lcom/lge/gallery/data/local/LocalVideo;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V

    .end local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .restart local v2    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    move-object v1, v2

    .end local v2    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .restart local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    goto :goto_1a

    .line 387
    :cond_26
    instance-of v3, v1, Lcom/lge/gallery/data/local/BurstImage;

    if-eqz v3, :cond_34

    .line 390
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->forceRemoveObject()V

    .line 391
    new-instance v2, Lcom/lge/gallery/data/local/LocalImage;

    invoke-direct {v2, p0, p4, p1, p2}, Lcom/lge/gallery/data/local/LocalImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V

    .end local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .restart local v2    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    move-object v1, v2

    .end local v2    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    .restart local v1    # "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    goto :goto_1a

    .line 393
    :cond_34
    invoke-virtual {v1, p1, p2}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V
    :try_end_37
    .catchall {:try_start_1f .. :try_end_37} :catchall_1c

    goto :goto_1a
.end method

.method private static queryBurstCover(Landroid/content/ContentResolver;Landroid/net/Uri;ILjava/lang/String;)Landroid/database/Cursor;
    .registers 12
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "baseUri"    # Landroid/net/Uri;
    .param p2, "bucket_id"    # I
    .param p3, "burstId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 254
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "limit"

    const-string v5, "1"

    invoke-virtual {v0, v2, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 256
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 257
    const/4 v6, 0x0

    .line 259
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_15
    const-string v3, "bucket_id = ? AND burst_id =?"

    .line 260
    .local v3, "whereClause":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v0

    const/4 v0, 0x1

    aput-object p3, v4, v0

    .line 261
    .local v4, "whereArgs":[Ljava/lang/String;
    sget-object v2, Lcom/lge/gallery/data/local/BurstImage;->BURST_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "replace(title, \'"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, "_Burst\', 0)*1 ASC"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 267
    if-nez v6, :cond_48

    move-object v6, v7

    .line 276
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_47
    :goto_47
    return-object v6

    .line 270
    .restart local v6    # "cursor":Landroid/database/Cursor;
    :cond_48
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_47

    .line 271
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_51
    .catchall {:try_start_15 .. :try_end_51} :catchall_53

    move-object v6, v7

    .line 272
    goto :goto_47

    .line 274
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v4    # "whereArgs":[Ljava/lang/String;
    :catchall_53
    move-exception v0

    throw v0
.end method

.method private queryItemCount()I
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 595
    const/4 v7, 0x0

    .line 596
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 598
    .local v6, "count":I
    :try_start_3
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereFilterHiddenFilesOut()Ljava/lang/String;

    move-result-object v3

    .line 599
    .local v3, "whereClause":Ljava/lang/String;
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereArgurments(Z)[Ljava/lang/String;

    move-result-object v4

    .line 600
    .local v4, "whereArgs":[Ljava/lang/String;
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getCountProjection()[Ljava/lang/String;

    move-result-object v2

    .line 601
    .local v2, "proj":[Ljava/lang/String;
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 603
    if-nez v7, :cond_2a

    .line 604
    const-string v0, "AbstractLocalAlbum"

    const-string v1, "query fail"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_23} :catch_3c
    .catchall {:try_start_3 .. :try_end_23} :catchall_47

    .line 614
    if-eqz v7, :cond_28

    .line 615
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_28
    move v0, v9

    .line 618
    .end local v2    # "proj":[Ljava/lang/String;
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v4    # "whereArgs":[Ljava/lang/String;
    :goto_29
    return v0

    .line 607
    .restart local v2    # "proj":[Ljava/lang/String;
    .restart local v3    # "whereClause":Ljava/lang/String;
    .restart local v4    # "whereArgs":[Ljava/lang/String;
    :cond_2a
    :try_start_2a
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 608
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_34} :catch_3c
    .catchall {:try_start_2a .. :try_end_34} :catchall_47

    move-result v6

    .line 614
    :cond_35
    if-eqz v7, :cond_3a

    .line 615
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3a
    move v0, v6

    .line 618
    goto :goto_29

    .line 610
    .end local v2    # "proj":[Ljava/lang/String;
    .end local v3    # "whereClause":Ljava/lang/String;
    .end local v4    # "whereArgs":[Ljava/lang/String;
    :catch_3c
    move-exception v8

    .line 611
    .local v8, "e":Ljava/lang/Exception;
    :try_start_3d
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_47

    .line 614
    if-eqz v7, :cond_45

    .line 615
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_45
    move v0, v9

    goto :goto_29

    .line 614
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_47
    move-exception v0

    if-eqz v7, :cond_4d

    .line 615
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_4d
    throw v0
.end method

.method private reloadCoverItems(I)V
    .registers 19
    .param p1, "size"    # I

    .prologue
    .line 298
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    if-nez v1, :cond_8

    if-gtz p1, :cond_1b

    .line 299
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getMediaItemCount()I

    move-result v15

    .line 300
    .local v15, "subMediaItemSize":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 301
    .local v8, "cachedMediaItemSize":I
    move/from16 v0, p1

    if-le v0, v8, :cond_1a

    if-ne v15, v8, :cond_1b

    .line 355
    .end local v8    # "cachedMediaItemSize":I
    .end local v15    # "subMediaItemSize":I
    :cond_1a
    :goto_1a
    return-void

    .line 306
    :cond_1b
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v11

    .line 307
    .local v11, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "limit"

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v1, v3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 309
    .local v2, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 311
    const/4 v6, 0x0

    .line 315
    .local v6, "order":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getOrderBy()Ljava/lang/String;

    move-result-object v6

    .line 318
    invoke-virtual/range {p0 .. p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereWithGrouping()Ljava/lang/String;

    move-result-object v4

    .line 319
    .local v4, "whereClause":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereArgurments(Z)[Ljava/lang/String;

    move-result-object v5

    .line 320
    .local v5, "whereArgs":[Ljava/lang/String;
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 321
    .local v14, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v10, 0x0

    .line 323
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_57
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mProjection:[Ljava/lang/String;

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_62
    .catchall {:try_start_57 .. :try_end_62} :catchall_83

    move-result-object v10

    .line 328
    if-nez v10, :cond_6b

    .line 346
    if-eqz v10, :cond_1a

    .line 347
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_1a

    .line 331
    :cond_6b
    :goto_6b
    :try_start_6b
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_a7

    .line 332
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    if-eqz v1, :cond_8a

    .line 333
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstMediaItem(Landroid/database/Cursor;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v7

    .line 334
    .local v7, "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v7, :cond_8a

    .line 335
    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_82
    .catchall {:try_start_6b .. :try_end_82} :catchall_83

    goto :goto_6b

    .line 346
    .end local v7    # "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    :catchall_83
    move-exception v1

    if-eqz v10, :cond_89

    .line 347
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_89
    throw v1

    .line 339
    :cond_8a
    const/4 v1, 0x0

    :try_start_8b
    invoke-interface {v10, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 340
    .local v12, "id":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mItemPath:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v1, v12}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v9

    .line 341
    .local v9, "childPath":Lcom/lge/gallery/data/core/Path;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-static {v9, v10, v11, v1, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v13

    .line 343
    .local v13, "item":Lcom/lge/gallery/data/core/MediaItem;
    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a6
    .catchall {:try_start_8b .. :try_end_a6} :catchall_83

    goto :goto_6b

    .line 346
    .end local v9    # "childPath":Lcom/lge/gallery/data/core/Path;
    .end local v12    # "id":I
    .end local v13    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_a7
    if-eqz v10, :cond_ac

    .line 347
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 350
    :cond_ac
    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    .line 351
    invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 352
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    .line 354
    :cond_bb
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    goto/16 :goto_1a
.end method

.method private updateDirectory()Ljava/lang/String;
    .registers 8

    .prologue
    .line 743
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getCoverItem()Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v2

    .line 744
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    instance-of v4, v2, Lcom/lge/gallery/data/local/LocalMediaItem;

    if-eqz v4, :cond_46

    move-object v3, v2

    .line 745
    check-cast v3, Lcom/lge/gallery/data/local/LocalMediaItem;

    .line 746
    .local v3, "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    invoke-virtual {v3}, Lcom/lge/gallery/data/local/LocalMediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 747
    .local v0, "file":Ljava/lang/String;
    if-nez v0, :cond_2e

    .line 748
    const-string v4, "AbstractLocalAlbum"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fail to get directory : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 749
    const-string v4, ""

    .line 756
    .end local v0    # "file":Ljava/lang/String;
    .end local v3    # "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    :goto_2d
    return-object v4

    .line 751
    .restart local v0    # "file":Ljava/lang/String;
    .restart local v3    # "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    :cond_2e
    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 752
    .local v1, "index":I
    if-ltz v1, :cond_46

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v4, v5, :cond_46

    .line 753
    const/4 v4, 0x0

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_2d

    .line 756
    .end local v0    # "file":Ljava/lang/String;
    .end local v1    # "index":I
    .end local v3    # "lItem":Lcom/lge/gallery/data/local/LocalMediaItem;
    :cond_46
    const-string v4, ""

    goto :goto_2d
.end method


# virtual methods
.method public clearCoverItem()V
    .registers 2

    .prologue
    .line 284
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    .line 285
    return-void
.end method

.method public delete()V
    .registers 6

    .prologue
    .line 687
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 689
    iget-boolean v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-virtual {p0, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereStatement(Z)Ljava/lang/String;

    move-result-object v2

    .line 690
    .local v2, "whereClause":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getDeleteOptionString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 691
    iget-boolean v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-virtual {p0, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereArgurments(Z)[Ljava/lang/String;

    move-result-object v1

    .line 694
    .local v1, "whereArgs":[Ljava/lang/String;
    :try_start_24
    iget-object v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    iget-object v4, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v3, v4, v2, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_2b} :catch_2c

    .line 703
    return-void

    .line 695
    :catch_2c
    move-exception v0

    .line 696
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "AbstractLocalAlbum"

    const-string v4, "Delete error in localAlbum"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    iget-object v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 698
    new-instance v3, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v4, ""

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 700
    :cond_48
    new-instance v3, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v4, ""

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getCoverItem()Lcom/lge/gallery/data/core/MediaItem;
    .registers 4

    .prologue
    .line 359
    iget-boolean v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_15

    iget v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_15

    .line 361
    :cond_11
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->reloadCoverItems(I)V

    .line 363
    :cond_15
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    .line 364
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1f

    const/4 v1, 0x0

    :goto_1e
    return-object v1

    :cond_1f
    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    goto :goto_1e
.end method

.method public final getCoverItems(I)Ljava/util/ArrayList;
    .registers 4
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
    .line 288
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    iget v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    .line 291
    :cond_11
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    .line 294
    :goto_13
    return-object v0

    .line 293
    :cond_14
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->reloadCoverItems(I)V

    .line 294
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    goto :goto_13
.end method

.method protected getDeleteOptionString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 706
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_LOCK_FIELD_EXIST:Z

    if-eqz v0, :cond_7

    .line 707
    const-string v0, " AND is_lock = 0"

    .line 709
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ""

    goto :goto_6
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 5

    .prologue
    .line 761
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaSet;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v0

    .line 762
    .local v0, "details":Lcom/lge/gallery/data/core/MediaDetails;
    iget-object v2, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBucketId:I

    invoke-static {v2, v3}, Lcom/lge/gallery/data/local/MediaSetUtils;->getCameraAlbumName(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    .line 764
    .local v1, "title":Ljava/lang/String;
    const/4 v2, 0x1

    if-eqz v1, :cond_17

    .end local v1    # "title":Ljava/lang/String;
    :goto_13
    invoke-virtual {v0, v2, v1}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 765
    return-object v0

    .line 764
    .restart local v1    # "title":Ljava/lang/String;
    :cond_17
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_13
.end method

.method public getDirectory()Ljava/lang/String;
    .registers 2

    .prologue
    .line 736
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDirectory:Ljava/lang/String;

    if-nez v0, :cond_a

    .line 737
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->updateDirectory()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDirectory:Ljava/lang/String;

    .line 739
    :cond_a
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDirectory:Ljava/lang/String;

    return-object v0
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
    .line 714
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaSet;->getEntryFilePaths()Ljava/util/ArrayList;

    .line 715
    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getMediaItemCount()I

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v4

    .line 716
    .local v4, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 718
    .local v0, "filePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_15
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaItem;

    .line 719
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v2, :cond_15

    .line 722
    invoke-virtual {v2}, Lcom/lge/gallery/data/core/MediaItem;->getEntryFilePaths()Ljava/util/ArrayList;

    move-result-object v3

    .line 723
    .local v3, "itemFilePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v3, :cond_15

    .line 724
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_15

    .line 727
    .end local v2    # "item":Lcom/lge/gallery/data/core/MediaItem;
    .end local v3    # "itemFilePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2d
    return-object v0
.end method

.method protected getItemPath(Z)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p1, "isImage"    # Z

    .prologue
    .line 120
    if-eqz p1, :cond_5

    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lcom/lge/gallery/data/local/LocalVideo;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    goto :goto_4
.end method

.method public getMediaItem(II)Ljava/util/ArrayList;
    .registers 20
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
    .line 170
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 171
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v10

    .line 172
    .local v10, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "limit"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ","

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v3, v15}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 174
    .local v2, "uri":Landroid/net/Uri;
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .local v14, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v9, 0x0

    .line 176
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getOrderBy()Ljava/lang/String;

    move-result-object v6

    .line 177
    .local v6, "order":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereWithGrouping()Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "whereClause":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereArgurments(Z)[Ljava/lang/String;

    move-result-object v5

    .line 180
    .local v5, "whereArgs":[Ljava/lang/String;
    :try_start_50
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mProjection:[Ljava/lang/String;

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_5b} :catch_77

    move-result-object v9

    .line 189
    if-nez v9, :cond_83

    .line 190
    const-string v1, "AbstractLocalAlbum"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "query fail: "

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    :goto_76
    return-object v14

    .line 184
    :catch_77
    move-exception v11

    .line 185
    .local v11, "e":Ljava/lang/Exception;
    const-string v1, "AbstractLocalAlbum"

    const-string v3, "Database query failed for any exception."

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_76

    .line 194
    .end local v11    # "e":Ljava/lang/Exception;
    :cond_83
    :goto_83
    :try_start_83
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_bd

    .line 195
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    if-eqz v1, :cond_a0

    .line 196
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getBurstMediaItem(Landroid/database/Cursor;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v7

    .line 197
    .local v7, "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v7, :cond_a0

    .line 198
    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_9a
    .catchall {:try_start_83 .. :try_end_9a} :catchall_9b

    goto :goto_83

    .line 209
    .end local v7    # "burstItem":Lcom/lge/gallery/data/core/MediaItem;
    :catchall_9b
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1

    .line 202
    :cond_a0
    const/4 v1, 0x0

    :try_start_a1
    invoke-interface {v9, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 203
    .local v12, "id":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mItemPath:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v1, v12}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v8

    .line 204
    .local v8, "childPath":Lcom/lge/gallery/data/core/Path;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-static {v8, v9, v10, v1, v3}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Z)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v13

    .line 206
    .local v13, "item":Lcom/lge/gallery/data/core/MediaItem;
    invoke-virtual {v14, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_bc
    .catchall {:try_start_a1 .. :try_end_bc} :catchall_9b

    goto :goto_83

    .line 209
    .end local v8    # "childPath":Lcom/lge/gallery/data/core/Path;
    .end local v12    # "id":I
    .end local v13    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_bd
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_76
.end method

.method public getMediaItemCount()I
    .registers 3

    .prologue
    .line 579
    iget v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_f

    .line 580
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->queryItemCountIfBurstshotEnabled()I

    move-result v0

    :goto_d
    iput v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    .line 583
    :cond_f
    iget v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    return v0

    .line 580
    :cond_12
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->queryItemCountDefault()I

    move-result v0

    goto :goto_d
.end method

.method public getMediaItemSize()J
    .registers 13

    .prologue
    const-wide/16 v10, 0x0

    .line 628
    const-wide/16 v8, 0x0

    .line 629
    .local v8, "mSize":J
    const/4 v6, 0x0

    .line 631
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_5
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mBaseUri:Landroid/net/Uri;

    sget-object v2, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->SIZE_PROJECTION:[Ljava/lang/String;

    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereFilterHiddenFilesOut()Ljava/lang/String;

    move-result-object v3

    iget-boolean v4, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsImage:Z

    invoke-virtual {p0, v4}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereArgurments(Z)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 635
    if-nez v6, :cond_2a

    .line 636
    const-string v0, "AbstractLocalAlbum"

    const-string v1, "query fail"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_23} :catch_3d
    .catchall {:try_start_5 .. :try_end_23} :catchall_48

    .line 647
    if-eqz v6, :cond_28

    .line 648
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_28
    move-wide v0, v10

    .line 651
    :goto_29
    return-wide v0

    .line 640
    :cond_2a
    :try_start_2a
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 641
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_35} :catch_3d
    .catchall {:try_start_2a .. :try_end_35} :catchall_48

    move-result-wide v8

    .line 647
    if-eqz v6, :cond_3b

    .line 648
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3b
    move-wide v0, v8

    .line 651
    goto :goto_29

    .line 643
    :catch_3d
    move-exception v7

    .line 644
    .local v7, "e":Ljava/lang/Exception;
    :try_start_3e
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_41
    .catchall {:try_start_3e .. :try_end_41} :catchall_48

    .line 647
    if-eqz v6, :cond_46

    .line 648
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_46
    move-wide v0, v10

    goto :goto_29

    .line 647
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_48
    move-exception v0

    if-eqz v6, :cond_4e

    .line 648
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4e
    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 656
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mAlbumName:Ljava/lang/String;

    return-object v0
.end method

.method protected getOrderBy()Ljava/lang/String;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mManager:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-virtual {v0}, Lcom/lge/gallery/util/SortingOrderManager;->getSortingOrder()I

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "datetaken ASC, _id ASC"

    :goto_a
    return-object v0

    :cond_b
    const-string v0, "datetaken DESC, _id DESC"

    goto :goto_a
.end method

.method protected getProjection(Z)[Ljava/lang/String;
    .registers 3
    .param p1, "isImage"    # Z

    .prologue
    .line 116
    if-eqz p1, :cond_5

    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    goto :goto_4
.end method

.method protected getProjectionForBurstCount()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 574
    sget-object v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->BURST_COUNT_PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 770
    const/4 v0, 0x0

    return v0
.end method

.method public getSupportedOperations()I
    .registers 2

    .prologue
    .line 681
    const/16 v0, 0x405

    .line 682
    .local v0, "operation":I
    return v0
.end method

.method protected abstract getWhereArgurments(Z)[Ljava/lang/String;
.end method

.method protected getWhereForCount()Ljava/lang/String;
    .registers 2

    .prologue
    .line 570
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereFilterHiddenFilesOut()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getWhereStatement(Z)Ljava/lang/String;
.end method

.method protected final getWhereWithGrouping()Ljava/lang/String;
    .registers 4

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->getWhereFilterHiddenFilesOut()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "whereClause":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsBurstShotEnabled:Z

    if-eqz v1, :cond_c

    .line 127
    if-nez v0, :cond_d

    const-string v0, "1 ) GROUP BY bucket_id, (burst_id"

    .line 130
    :cond_c
    :goto_c
    return-object v0

    .line 127
    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") GROUP BY bucket_id, (burst_id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method public hasCachedCover()Z
    .registers 2

    .prologue
    .line 165
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    return v0
.end method

.method protected abstract isHiddenAlbumFilteredOut()Z
.end method

.method public isLeafAlbum()Z
    .registers 2

    .prologue
    .line 732
    const/4 v0, 0x1

    return v0
.end method

.method protected queryItemCountDefault()I
    .registers 2

    .prologue
    .line 591
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->queryItemCount()I

    move-result v0

    return v0
.end method

.method protected queryItemCountIfBurstshotEnabled()I
    .registers 2

    .prologue
    .line 587
    invoke-direct {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->queryItemCount()I

    move-result v0

    return v0
.end method

.method public reload()J
    .registers 3

    .prologue
    .line 661
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->isDirty()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 662
    invoke-static {}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->nextVersionNumber()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDataVersion:J

    .line 663
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsFirst:Z

    if-nez v0, :cond_22

    .line 664
    iget-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsAlbumNameUpdated:Z

    if-nez v0, :cond_1c

    .line 665
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->updateAlbumName()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsAlbumNameUpdated:Z

    .line 667
    :cond_1c
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCachedCount:I

    .line 668
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->clearCoverItem()V

    .line 671
    :cond_22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mIsFirst:Z

    .line 672
    iget-wide v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mDataVersion:J

    return-wide v0
.end method

.method public setCoverItem(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 3
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 159
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mCoverItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mUseCachedCover:Z

    .line 161
    return-void
.end method

.method protected updateAlbumName()Z
    .registers 2

    .prologue
    .line 676
    const/4 v0, 0x1

    return v0
.end method
