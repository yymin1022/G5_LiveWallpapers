.class public Lcom/lge/gallery/data/local/LocalAlbumSet;
.super Lcom/lge/gallery/data/core/MediaSet;
.source "LocalAlbumSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    }
.end annotation


# static fields
.field private static final ARGS:[Ljava/lang/String;

.field private static final BUCKET_GROUP_BY:Ljava/lang/String; = "(media_type=? OR media_type=?)) GROUP BY 1,(2"

.field private static final BUCKET_ORDER_BY:Ljava/lang/String;

.field private static final BURST_COUNT_PROJECTION:Ljava/lang/String; = "count(DISTINCT burst_id)"

.field private static final COUNT_PROJECTION:Ljava/lang/String;

.field private static final EXTERNAL_MEDIA:Ljava/lang/String; = "external"

.field private static final INDEX_BUCKET_ID:I = 0x0

.field private static final INDEX_BUCKET_NAME:I = 0x2

.field private static final INDEX_DATA:I = 0x3

.field private static final INDEX_ITEM_COUNT:I = 0x4

.field private static final INDEX_MEDIA_TYPE:I = 0x1

.field private static final INVALID_COUNT:I = -0x1

.field private static final ITEM_COUNT_PROJECTION:Ljava/lang/String; = "count(*)"

.field public static final PATH_ALL:Lcom/lge/gallery/data/core/Path;

.field public static final PATH_IMAGE:Lcom/lge/gallery/data/core/Path;

.field public static final PATH_VIDEO:Lcom/lge/gallery/data/core/Path;

.field private static final TAG:Ljava/lang/String; = "LocalAlbumSet"

.field private static final mBaseUri:Landroid/net/Uri;


# instance fields
.field private final PROJECTION_BUCKET:[Ljava/lang/String;

.field private mAlbums:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSet;",
            ">;"
        }
    .end annotation
.end field

.field private final mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field private final mCurrentSourceType:I

.field private mGroupBy:Ljava/lang/String;

.field private mIsFirst:Z

.field private final mName:Ljava/lang/String;

.field private final mNotifierBase:Lcom/lge/gallery/data/core/ChangeNotifier;

.field private final mNotifierImage:Lcom/lge/gallery/data/core/ChangeNotifier;

.field private final mNotifierVideo:Lcom/lge/gallery/data/core/ChangeNotifier;

.field private final mPath:Lcom/lge/gallery/data/core/Path;

.field private final mType:I

.field private final mWatchUriImage:Landroid/net/Uri;

.field private final mWatchUriVideo:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    .line 49
    const-string v0, "/local/all"

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PATH_ALL:Lcom/lge/gallery/data/core/Path;

    .line 50
    const-string v0, "/local/image"

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PATH_IMAGE:Lcom/lge/gallery/data/core/Path;

    .line 51
    const-string v0, "/local/video"

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PATH_VIDEO:Lcom/lge/gallery/data/core/Path;

    .line 67
    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-eqz v0, :cond_56

    const-string v0, "count(DISTINCT burst_id)"

    :goto_1f
    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->COUNT_PROJECTION:Ljava/lang/String;

    .line 70
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mBaseUri:Landroid/net/Uri;

    .line 109
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->ARGS:[Ljava/lang/String;

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bucket_display_name"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->getAlbumOrderString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->BUCKET_ORDER_BY:Ljava/lang/String;

    return-void

    .line 67
    :cond_56
    const-string v0, "count(*)"

    goto :goto_1f
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    const/4 v3, 0x1

    .line 128
    invoke-static {}, Lcom/lge/gallery/data/local/LocalAlbumSet;->nextVersionNumber()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/gallery/data/core/MediaSet;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 90
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "bucket_id"

    aput-object v2, v0, v1

    const-string v1, "media_type"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "bucket_display_name"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "_data"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/lge/gallery/data/local/LocalAlbumSet;->COUNT_PROJECTION:Ljava/lang/String;

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PROJECTION_BUCKET:[Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mAlbums:Ljava/util/ArrayList;

    .line 129
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mPath:Lcom/lge/gallery/data/core/Path;

    .line 130
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 131
    iput-boolean v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mIsFirst:Z

    .line 132
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->getLocalSourceTypeFromPrefix(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mCurrentSourceType:I

    .line 133
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mWatchUriImage:Landroid/net/Uri;

    .line 134
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mWatchUriVideo:Landroid/net/Uri;

    .line 135
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_LOCK_FIELD_EXIST:Z

    if-eqz v0, :cond_8e

    const-string v0, "is_lock = 0 AND"

    :goto_4a
    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mGroupBy:Ljava/lang/String;

    .line 136
    invoke-static {p1}, Lcom/lge/gallery/data/local/LocalAlbumSet;->getTypeFromPath(Lcom/lge/gallery/data/core/Path;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mType:I

    .line 137
    new-instance v0, Lcom/lge/gallery/data/core/ChangeNotifier;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mWatchUriImage:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, p2}, Lcom/lge/gallery/data/core/ChangeNotifier;-><init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierImage:Lcom/lge/gallery/data/core/ChangeNotifier;

    .line 138
    new-instance v0, Lcom/lge/gallery/data/core/ChangeNotifier;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mWatchUriVideo:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, p2}, Lcom/lge/gallery/data/core/ChangeNotifier;-><init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierVideo:Lcom/lge/gallery/data/core/ChangeNotifier;

    .line 139
    new-instance v0, Lcom/lge/gallery/data/core/ChangeNotifier;

    sget-object v1, Lcom/lge/gallery/data/local/LocalAlbumSet;->mBaseUri:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, p2}, Lcom/lge/gallery/data/core/ChangeNotifier;-><init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierBase:Lcom/lge/gallery/data/core/ChangeNotifier;

    .line 140
    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/lge/gallery/common/R$string;->set_label_local_albums:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mName:Ljava/lang/String;

    .line 142
    new-instance v0, Lcom/lge/gallery/data/local/LocalAlbumSet$1;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/local/LocalAlbumSet$1;-><init>(Lcom/lge/gallery/data/local/LocalAlbumSet;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mSortObserver:Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    .line 152
    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/SortingOrderManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mSortObserver:Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    invoke-virtual {v0, v1}, Lcom/lge/gallery/util/SortingOrderManager;->registerObserver(Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;)V

    .line 153
    return-void

    .line 135
    :cond_8e
    const-string v0, ""

    goto :goto_4a
.end method

.method static synthetic access$000(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/data/local/LocalAlbumSet;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierImage:Lcom/lge/gallery/data/core/ChangeNotifier;

    return-object v0
.end method

.method static synthetic access$100(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/data/local/LocalAlbumSet;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierVideo:Lcom/lge/gallery/data/core/ChangeNotifier;

    return-object v0
.end method

.method static synthetic access$200(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/data/local/LocalAlbumSet;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierBase:Lcom/lge/gallery/data/core/ChangeNotifier;

    return-object v0
.end method

.method private addBucketEntry(Ljava/util/ArrayList;Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;)V
    .registers 5
    .param p2, "newEntry"    # Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;",
            ">;",
            "Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;",
            ")V"
        }
    .end annotation

    .prologue
    .line 235
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;>;"
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 236
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    .line 237
    .local v0, "oldEntry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    invoke-virtual {v0, p2}, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->addItemCount(Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;)V

    .line 241
    .end local v0    # "oldEntry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    :goto_13
    return-void

    .line 239
    :cond_14
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13
.end method

.method private static findBucket([Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;I)I
    .registers 5
    .param p0, "entries"    # [Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    .param p1, "bucketId"    # I

    .prologue
    .line 244
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p0

    .local v1, "n":I
    :goto_2
    if-ge v0, v1, :cond_e

    .line 245
    aget-object v2, p0, v0

    iget v2, v2, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    if-ne v2, p1, :cond_b

    .line 249
    .end local v0    # "i":I
    :goto_a
    return v0

    .line 244
    .restart local v0    # "i":I
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 249
    :cond_e
    const/4 v0, -0x1

    goto :goto_a
.end method

.method private getDataPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "dataPath"    # Ljava/lang/String;

    .prologue
    .line 188
    if-nez p1, :cond_c

    .line 189
    const-string v1, "LocalAlbumSet"

    const-string v2, "fail to get data from media DB : _data is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    :goto_9
    const-string v1, ""

    :goto_b
    return-object v1

    .line 191
    :cond_c
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 192
    .local v0, "idx":I
    if-ltz v0, :cond_1a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v0, v1, :cond_33

    .line 193
    :cond_1a
    const-string v1, "LocalAlbumSet"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fail to get data from media DB : _data is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 195
    :cond_33
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method private getLocalAlbum(Lcom/lge/gallery/data/core/DataManager;ILcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;II)Lcom/lge/gallery/data/core/MediaSet;
    .registers 25
    .param p1, "manager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p2, "type"    # I
    .param p3, "parent"    # Lcom/lge/gallery/data/core/Path;
    .param p4, "id"    # I
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "directory"    # Ljava/lang/String;
    .param p7, "imageCount"    # I
    .param p8, "videoCount"    # I

    .prologue
    .line 308
    invoke-virtual/range {p3 .. p4}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v2

    .line 309
    .local v2, "path":Lcom/lge/gallery/data/core/Path;
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/lge/gallery/data/core/DataManager;->peekMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v14

    .line 310
    .local v14, "object":Lcom/lge/gallery/data/core/MediaObject;
    if-eqz v14, :cond_10

    .line 311
    check-cast v14, Lcom/lge/gallery/data/core/MediaSet;

    .end local v14    # "object":Lcom/lge/gallery/data/core/MediaObject;
    move-object v1, v14

    .line 328
    :goto_f
    return-object v1

    .line 313
    .restart local v14    # "object":Lcom/lge/gallery/data/core/MediaObject;
    :cond_10
    packed-switch p2, :pswitch_data_d2

    .line 333
    :pswitch_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 315
    :pswitch_1d
    new-instance v1, Lcom/lge/gallery/data/local/LocalAlbum;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v5, 0x1

    move/from16 v4, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcom/lge/gallery/data/local/LocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V

    goto :goto_f

    .line 318
    :pswitch_30
    new-instance v1, Lcom/lge/gallery/data/local/LocalAlbum;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v5, 0x0

    move/from16 v4, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    invoke-direct/range {v1 .. v8}, Lcom/lge/gallery/data/local/LocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V

    goto :goto_f

    .line 321
    :pswitch_43
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/DateTakenComparator;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/core/DateTakenComparator;

    move-result-object v12

    .line 322
    .local v12, "comp":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v5, 0x2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/image"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v6

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v3 .. v11}, Lcom/lge/gallery/data/local/LocalAlbumSet;->getLocalAlbum(Lcom/lge/gallery/data/core/DataManager;ILcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;II)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v13

    .line 325
    .local v13, "imageSet":Lcom/lge/gallery/data/core/MediaSet;
    const/4 v5, 0x4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "/video"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v6

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    invoke-direct/range {v3 .. v11}, Lcom/lge/gallery/data/local/LocalAlbumSet;->getLocalAlbum(Lcom/lge/gallery/data/core/DataManager;ILcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;II)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v15

    .line 328
    .local v15, "videoSet":Lcom/lge/gallery/data/core/MediaSet;
    new-instance v3, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v1, 0x2

    new-array v8, v1, [Lcom/lge/gallery/data/core/MediaSet;

    const/4 v1, 0x0

    aput-object v13, v8, v1

    const/4 v1, 0x1

    aput-object v15, v8, v1

    move/from16 v5, p4

    move-object v6, v2

    move-object v7, v12

    move-object/from16 v9, p6

    invoke-direct/range {v3 .. v9}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;)V

    move-object v1, v3

    goto/16 :goto_f

    .line 313
    :pswitch_data_d2
    .packed-switch 0x2
        :pswitch_1d
        :pswitch_13
        :pswitch_30
        :pswitch_13
        :pswitch_43
    .end packed-switch
.end method

.method private static getTypeFromPath(Lcom/lge/gallery/data/core/Path;)I
    .registers 6
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    const/4 v1, 0x2

    const/4 v4, 0x1

    .line 156
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->split()[Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "name":[Ljava/lang/String;
    array-length v2, v0

    if-ge v2, v1, :cond_13

    .line 158
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 160
    :cond_13
    const-string v2, "all"

    aget-object v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 161
    const/4 v1, 0x6

    .line 167
    :cond_1e
    :goto_1e
    return v1

    .line 163
    :cond_1f
    const-string v2, "image"

    aget-object v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1e

    .line 166
    const-string v1, "video"

    aget-object v2, v0, v4

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 167
    const/4 v1, 0x4

    goto :goto_1e

    .line 169
    :cond_35
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private loadBucketEntries(Landroid/database/Cursor;)[Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    .registers 15
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 202
    if-nez p1, :cond_7

    .line 203
    new-array v1, v11, [Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    .line 231
    :goto_6
    return-object v1

    .line 205
    :cond_7
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .local v6, "buffer":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;>;"
    const/4 v10, 0x0

    .line 207
    .local v10, "typeBits":I
    iget v1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mType:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_15

    .line 208
    or-int/lit8 v10, v10, 0x2

    .line 210
    :cond_15
    iget v1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mType:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_1d

    .line 211
    or-int/lit8 v10, v10, 0x8

    .line 214
    :cond_1d
    :goto_1d
    :try_start_1d
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 215
    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 216
    .local v9, "mediaType":I
    shl-int v1, v12, v9

    and-int/2addr v1, v10

    if-eqz v1, :cond_1d

    .line 217
    const/4 v1, 0x4

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 218
    .local v8, "itemCount":I
    if-ne v9, v12, :cond_5c

    move v7, v12

    .line 219
    .local v7, "isImage":Z
    :goto_35
    if-eqz v7, :cond_5e

    move v4, v8

    .line 220
    .local v4, "imageCount":I
    :goto_38
    if-eqz v7, :cond_60

    move v5, v11

    .line 221
    .local v5, "videoCount":I
    :goto_3b
    new-instance v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/lge/gallery/data/local/LocalAlbumSet;->getDataPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;-><init>(ILjava/lang/String;Ljava/lang/String;II)V

    .line 225
    .local v0, "entry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    invoke-direct {p0, v6, v0}, Lcom/lge/gallery/data/local/LocalAlbumSet;->addBucketEntry(Ljava/util/ArrayList;Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;)V
    :try_end_56
    .catchall {:try_start_1d .. :try_end_56} :catchall_57

    goto :goto_1d

    .line 229
    .end local v0    # "entry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    .end local v4    # "imageCount":I
    .end local v5    # "videoCount":I
    .end local v7    # "isImage":Z
    .end local v8    # "itemCount":I
    .end local v9    # "mediaType":I
    :catchall_57
    move-exception v1

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v1

    .restart local v8    # "itemCount":I
    .restart local v9    # "mediaType":I
    :cond_5c
    move v7, v11

    .line 218
    goto :goto_35

    .restart local v7    # "isImage":Z
    :cond_5e
    move v4, v11

    .line 219
    goto :goto_38

    .restart local v4    # "imageCount":I
    :cond_60
    move v5, v8

    .line 220
    goto :goto_3b

    .line 229
    .end local v4    # "imageCount":I
    .end local v7    # "isImage":Z
    .end local v8    # "itemCount":I
    .end local v9    # "mediaType":I
    :cond_62
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 231
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    goto :goto_6
.end method


# virtual methods
.method fakeChange()V
    .registers 2

    .prologue
    .line 351
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierImage:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 352
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierVideo:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 353
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierBase:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 354
    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 408
    iget v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mCurrentSourceType:I

    return v0
.end method

.method public getSubMediaSet(I)Lcom/lge/gallery/data/core/MediaSet;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 174
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mAlbums:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSet;

    return-object v0
.end method

.method public getSubMediaSetCount()I
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mAlbums:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected loadSubMediaSets()Ljava/util/ArrayList;
    .registers 31
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
    .line 255
    sget-object v4, Lcom/lge/gallery/data/local/LocalAlbumSet;->mBaseUri:Landroid/net/Uri;

    .line 256
    .local v4, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 257
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mIsFirst:Z

    if-nez v3, :cond_17

    .line 258
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PROJECTION_BUCKET:[Ljava/lang/String;

    const/4 v5, 0x4

    const/4 v7, -0x1

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v5

    .line 260
    :cond_17
    const/16 v17, 0x0

    .line 262
    .local v17, "cursor":Landroid/database/Cursor;
    :try_start_19
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->PROJECTION_BUCKET:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mGroupBy:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "(media_type=? OR media_type=?)) GROUP BY 1,(2"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/lge/gallery/data/local/LocalAlbumSet;->ARGS:[Ljava/lang/String;

    sget-object v8, Lcom/lge/gallery/data/local/LocalAlbumSet;->BUCKET_ORDER_BY:Ljava/lang/String;

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_43} :catch_64

    move-result-object v17

    .line 268
    if-nez v17, :cond_6e

    .line 269
    const-string v3, "LocalAlbumSet"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot open local database: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 301
    :cond_63
    :goto_63
    return-object v14

    .line 264
    :catch_64
    move-exception v18

    .line 265
    .local v18, "e":Ljava/lang/Exception;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Exception;->printStackTrace()V

    .line 266
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    goto :goto_63

    .line 272
    .end local v18    # "e":Ljava/lang/Exception;
    :cond_6e
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/local/LocalAlbumSet;->loadBucketEntries(Landroid/database/Cursor;)[Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;

    move-result-object v19

    .line 273
    .local v19, "entries":[Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    const/16 v28, 0x0

    .line 274
    .local v28, "offset":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/lge/gallery/data/local/MediaSetUtils;->getFrontBucketId(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v16

    .line 275
    .local v16, "cameraIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/16 v24, -0x1

    .line 276
    .local v24, "index":I
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v22

    .local v22, "i$":Ljava/util/Iterator;
    :cond_8a
    :goto_8a
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b5

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v23

    .line 277
    .local v23, "id":I
    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-static {v0, v1}, Lcom/lge/gallery/data/local/LocalAlbumSet;->findBucket([Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;I)I

    move-result v24

    .line 278
    const/4 v3, -0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_8a

    .line 279
    add-int/lit8 v29, v28, 0x1

    .end local v28    # "offset":I
    .local v29, "offset":I
    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/data/local/MediaSetUtils;->circularShiftRight([Ljava/lang/Object;II)V

    move/from16 v28, v29

    .end local v29    # "offset":I
    .restart local v28    # "offset":I
    goto :goto_8a

    .line 282
    .end local v23    # "id":I
    :cond_b5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    const/4 v5, 0x0

    invoke-static {v3, v5}, Lcom/lge/gallery/data/local/MediaSetUtils;->getDownloadBucketId(Landroid/content/Context;Z)I

    move-result v3

    move-object/from16 v0, v19

    invoke-static {v0, v3}, Lcom/lge/gallery/data/local/LocalAlbumSet;->findBucket([Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;I)I

    move-result v24

    .line 283
    const/4 v3, -0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_da

    .line 284
    add-int/lit8 v29, v28, 0x1

    .end local v28    # "offset":I
    .restart local v29    # "offset":I
    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/data/local/MediaSetUtils;->circularShiftRight([Ljava/lang/Object;II)V

    move/from16 v28, v29

    .line 286
    .end local v29    # "offset":I
    .restart local v28    # "offset":I
    :cond_da
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcom/lge/gallery/data/local/MediaSetUtils;->getDownloadBucketId(Landroid/content/Context;Z)I

    move-result v3

    move-object/from16 v0, v19

    invoke-static {v0, v3}, Lcom/lge/gallery/data/local/LocalAlbumSet;->findBucket([Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;I)I

    move-result v24

    .line 287
    const/4 v3, -0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_ff

    .line 288
    add-int/lit8 v29, v28, 0x1

    .end local v28    # "offset":I
    .restart local v29    # "offset":I
    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/data/local/MediaSetUtils;->circularShiftRight([Ljava/lang/Object;II)V

    move/from16 v28, v29

    .line 291
    .end local v29    # "offset":I
    .restart local v28    # "offset":I
    :cond_ff
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .local v14, "albums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSet;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v6

    .line 293
    .local v6, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    move-object/from16 v15, v19

    .local v15, "arr$":[Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    array-length v0, v15

    move/from16 v25, v0

    .local v25, "len$":I
    const/16 v22, 0x0

    .local v22, "i$":I
    :goto_113
    move/from16 v0, v22

    move/from16 v1, v25

    if-ge v0, v1, :cond_145

    aget-object v20, v15, v22

    .line 294
    .local v20, "entry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    move-object/from16 v0, p0

    iget v7, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mType:I

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mPath:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v0, v20

    iget v9, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketId:I

    move-object/from16 v0, v20

    iget-object v10, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketName:Ljava/lang/String;

    move-object/from16 v0, v20

    iget-object v11, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->bucketDirectory:Ljava/lang/String;

    move-object/from16 v0, v20

    iget v12, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->imageCount:I

    move-object/from16 v0, v20

    iget v13, v0, Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;->videoCount:I

    move-object/from16 v5, p0

    invoke-direct/range {v5 .. v13}, Lcom/lge/gallery/data/local/LocalAlbumSet;->getLocalAlbum(Lcom/lge/gallery/data/core/DataManager;ILcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;II)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v26

    .line 296
    .local v26, "mediaset":Lcom/lge/gallery/data/core/MediaSet;
    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    add-int/lit8 v22, v22, 0x1

    goto :goto_113

    .line 298
    .end local v20    # "entry":Lcom/lge/gallery/data/local/LocalAlbumSet$BucketEntry;
    .end local v26    # "mediaset":Lcom/lge/gallery/data/core/MediaSet;
    :cond_145
    const/16 v21, 0x0

    .local v21, "i":I
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v27

    .local v27, "n":I
    :goto_14b
    move/from16 v0, v21

    move/from16 v1, v27

    if-ge v0, v1, :cond_63

    .line 299
    move/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaSet;->reload()J

    .line 298
    add-int/lit8 v21, v21, 0x1

    goto :goto_14b
.end method

.method public reload()J
    .registers 7

    .prologue
    .line 338
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierImage:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/ChangeNotifier;->isDirty()Z

    move-result v1

    .line 339
    .local v1, "isImageDirty":Z
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierVideo:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/ChangeNotifier;->isDirty()Z

    move-result v2

    .line 340
    .local v2, "isVideoDirty":Z
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mNotifierBase:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/ChangeNotifier;->isDirty()Z

    move-result v0

    .line 341
    .local v0, "isBaseDirty":Z
    if-nez v1, :cond_18

    if-nez v2, :cond_18

    if-eqz v0, :cond_27

    .line 342
    :cond_18
    invoke-static {}, Lcom/lge/gallery/data/local/LocalAlbumSet;->nextVersionNumber()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mDataVersion:J

    .line 343
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalAlbumSet;->loadSubMediaSets()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mAlbums:Ljava/util/ArrayList;

    .line 344
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mIsFirst:Z

    .line 346
    :cond_27
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalAlbumSet;->mDataVersion:J

    return-wide v4
.end method
