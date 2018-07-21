.class public Lcom/lge/gallery/data/local/LocalSource;
.super Lcom/lge/gallery/data/core/AbstractSortedMediaSource;
.source "LocalSource.java"


# static fields
.field public static final KEY_BUCKET_ID:Ljava/lang/String; = "bucketId"

.field private static final LOCAL_ALL_ALBUM:I = 0x7

.field private static final LOCAL_ALL_ALBUMSET:I = 0x6

.field private static final LOCAL_IMAGE_ALBUM:I = 0x2

.field private static final LOCAL_IMAGE_ALBUMSET:I = 0x0

.field private static final LOCAL_IMAGE_ITEM:I = 0x4

.field private static final LOCAL_VIDEO_ALBUM:I = 0x3

.field private static final LOCAL_VIDEO_ALBUMSET:I = 0x1

.field private static final LOCAL_VIDEO_ITEM:I = 0x5

.field private static final MEDIA_TYPE_IMAGE:I = 0x1

.field private static final MEDIA_TYPE_VIDEO:I = 0x4

.field private static final NO_MATCH:I = -0x1

.field private static final TAG:Ljava/lang/String; = "LocalSource"


# instance fields
.field private mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field private mClient:Landroid/content/ContentProviderClient;

.field private final mCurrentSourceType:I

.field private mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

.field private final mPathAllAlbum:Lcom/lge/gallery/data/core/Path;

.field private final mPathImageAlbum:Lcom/lge/gallery/data/core/Path;

.field private final mPathImageItem:Lcom/lge/gallery/data/core/Path;

.field private final mPathVideoAlbum:Lcom/lge/gallery/data/core/Path;

.field private final mPathVideoItem:Lcom/lge/gallery/data/core/Path;

.field private final mPrefix:Ljava/lang/String;

.field private final mUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 6
    .param p1, "context"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 68
    const-string v0, "local"

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/data/local/LocalSource;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/images/media/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 71
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/video/media/#"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 73
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/images/media"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 75
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "media"

    const-string v2, "external/video/media"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;)V
    .registers 6
    .param p1, "context"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p2}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;-><init>(Ljava/lang/String;)V

    .line 47
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    .line 81
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 82
    new-instance v0, Lcom/lge/gallery/data/core/PathMatcher;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/PathMatcher;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    .line 83
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/image"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 84
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/video"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 85
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/all"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 87
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/image/*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 88
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/video/*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 89
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/all/*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 90
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/image/item/*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 91
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/video/item/*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/all"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathAllAlbum:Lcom/lge/gallery/data/core/Path;

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/image"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathImageAlbum:Lcom/lge/gallery/data/core/Path;

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/video"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathVideoAlbum:Lcom/lge/gallery/data/core/Path;

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/image/item"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathImageItem:Lcom/lge/gallery/data/core/Path;

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/video/item"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathVideoItem:Lcom/lge/gallery/data/core/Path;

    .line 99
    invoke-static {p2}, Lcom/lge/gallery/util/GalleryUtils;->getLocalSourceTypeFromPrefix(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mCurrentSourceType:I

    .line 100
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalSource;->mPrefix:Ljava/lang/String;

    .line 101
    return-void
.end method

.method private createLocalMergeAlbum(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/Path;I)Lcom/lge/gallery/data/core/MediaSet;
    .registers 16
    .param p1, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "parentParent"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "subImagePath"    # Lcom/lge/gallery/data/core/Path;
    .param p4, "subVideoPath"    # Lcom/lge/gallery/data/core/Path;
    .param p5, "type"    # I

    .prologue
    const/4 v2, 0x0

    .line 152
    invoke-interface {p1}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v7

    .line 153
    .local v7, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    invoke-virtual {v7, p3}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v8

    check-cast v8, Lcom/lge/gallery/data/core/MediaSet;

    .line 154
    .local v8, "imageSet":Lcom/lge/gallery/data/core/MediaSet;
    invoke-virtual {v7, p4}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v9

    check-cast v9, Lcom/lge/gallery/data/core/MediaSet;

    .line 155
    .local v9, "videoSet":Lcom/lge/gallery/data/core/MediaSet;
    invoke-interface {p1}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/DateTakenComparator;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/core/DateTakenComparator;

    move-result-object v4

    .line 158
    .local v4, "comp":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v0, Lcom/lge/gallery/data/local/LocalMergeAlbum;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v3, 0x2

    new-array v5, v3, [Lcom/lge/gallery/data/core/MediaSet;

    aput-object v8, v5, v2

    const/4 v3, 0x1

    aput-object v9, v5, v3

    const/4 v6, 0x0

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/lge/gallery/data/local/LocalMergeAlbum;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;)V

    return-object v0
.end method

.method private getAlbumPath(Landroid/net/Uri;I)Lcom/lge/gallery/data/core/Path;
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "defaultType"    # I

    .prologue
    .line 184
    const-string v4, "mediaTypes"

    invoke-virtual {p1, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2}, Lcom/lge/gallery/data/local/LocalSource;->getMediaType(Ljava/lang/String;I)I

    move-result v3

    .line 186
    .local v3, "mediaType":I
    const-string v4, "bucketId"

    invoke-virtual {p1, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 188
    .local v0, "bucketId":Ljava/lang/String;
    :try_start_10
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 189
    .local v2, "id":I
    packed-switch v3, :pswitch_data_48

    .line 195
    :pswitch_17
    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathAllAlbum:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4, v2}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v4

    .line 199
    .end local v2    # "id":I
    :goto_1d
    return-object v4

    .line 191
    .restart local v2    # "id":I
    :pswitch_1e
    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathImageAlbum:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4, v2}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v4

    goto :goto_1d

    .line 193
    :pswitch_25
    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathVideoAlbum:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4, v2}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_2a} :catch_2c

    move-result-object v4

    goto :goto_1d

    .line 197
    .end local v2    # "id":I
    :catch_2c
    move-exception v1

    .line 198
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v4, "LocalSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "invalid bucket id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 199
    const/4 v4, 0x0

    goto :goto_1d

    .line 189
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_17
        :pswitch_17
        :pswitch_25
    .end packed-switch
.end method

.method private getMediaItemsById(ZZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;
    .registers 6
    .param p1, "isImage"    # Z
    .param p2, "isBurstUnit"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)[",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 257
    .local p3, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPrefix:Ljava/lang/String;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-static {p2, v0, v1, p1, p3}, Lcom/lge/gallery/data/local/LocalAlbum;->getMediaItemById(ZLjava/lang/String;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method private static getMediaType(Ljava/lang/String;I)I
    .registers 7
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "defaultType"    # I

    .prologue
    .line 164
    if-nez p0, :cond_3

    .line 175
    .end local p1    # "defaultType":I
    :cond_2
    :goto_2
    return p1

    .line 168
    .restart local p1    # "defaultType":I
    :cond_3
    :try_start_3
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_6} :catch_d

    move-result v1

    .line 169
    .local v1, "value":I
    and-int/lit8 v2, v1, 0x5

    if-eqz v2, :cond_2

    move p1, v1

    .line 170
    goto :goto_2

    .line 172
    .end local v1    # "value":I
    :catch_d
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v2, "LocalSource"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method


# virtual methods
.method public createMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 20
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 105
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 106
    .local v3, "app":Lcom/lge/gallery/appinterface/GalleryApp;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/lge/gallery/data/core/PathMatcher;->match(Lcom/lge/gallery/data/core/Path;)I

    move-result v16

    .line 107
    .local v16, "type":I
    packed-switch v16, :pswitch_data_152

    .line 146
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bad path: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 111
    :pswitch_2c
    new-instance v1, Lcom/lge/gallery/data/local/LocalAlbumSet;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object/from16 v0, p1

    invoke-direct {v1, v0, v2}, Lcom/lge/gallery/data/local/LocalAlbumSet;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;)V

    .line 144
    :goto_37
    return-object v1

    .line 113
    :pswitch_38
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->getIntVar(I)I

    move-result v4

    .line 114
    .local v4, "bucketId":I
    new-instance v1, Lcom/lge/gallery/data/local/LocalAlbum;

    const/4 v5, 0x1

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v2, v4, v0}, Lcom/lge/gallery/data/local/LocalAlbumUtils;->getBucketName(Landroid/content/ContentResolver;ILcom/lge/gallery/data/core/Path;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, -0x1

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v8}, Lcom/lge/gallery/data/local/LocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V

    goto :goto_37

    .line 119
    .end local v4    # "bucketId":I
    :pswitch_56
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->getIntVar(I)I

    move-result v4

    .line 120
    .restart local v4    # "bucketId":I
    new-instance v1, Lcom/lge/gallery/data/local/LocalAlbum;

    const/4 v5, 0x0

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v2, v4, v0}, Lcom/lge/gallery/data/local/LocalAlbumUtils;->getBucketName(Landroid/content/ContentResolver;ILcom/lge/gallery/data/core/Path;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, -0x1

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v8}, Lcom/lge/gallery/data/local/LocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;IZLjava/lang/String;Ljava/lang/String;I)V

    goto :goto_37

    .line 125
    .end local v4    # "bucketId":I
    :pswitch_74
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->getIntVar(I)I

    move-result v4

    .line 126
    .restart local v4    # "bucketId":I
    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v12

    .line 127
    .local v12, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lge/gallery/data/local/LocalSource;->mPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/image"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v14

    check-cast v14, Lcom/lge/gallery/data/core/MediaSet;

    .line 129
    .local v14, "imageSet":Lcom/lge/gallery/data/core/MediaSet;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lge/gallery/data/local/LocalSource;->mPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/video"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v12, v1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v17

    check-cast v17, Lcom/lge/gallery/data/core/MediaSet;

    .line 131
    .local v17, "videoSet":Lcom/lge/gallery/data/core/MediaSet;
    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/DateTakenComparator;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/core/DateTakenComparator;

    move-result-object v9

    .line 132
    .local v9, "comp":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v5, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    const/4 v1, 0x2

    new-array v10, v1, [Lcom/lge/gallery/data/core/MediaSet;

    const/4 v1, 0x0

    aput-object v14, v10, v1

    const/4 v1, 0x1

    aput-object v17, v10, v1

    const/4 v11, 0x0

    move v7, v4

    move-object/from16 v8, p1

    invoke-direct/range {v5 .. v11}, Lcom/lge/gallery/data/local/LocalUnifiedAlbum;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;ILcom/lge/gallery/data/core/Path;Ljava/util/Comparator;[Lcom/lge/gallery/data/core/MediaSet;Ljava/lang/String;)V

    move-object v1, v5

    goto/16 :goto_37

    .line 136
    .end local v4    # "bucketId":I
    .end local v9    # "comp":Ljava/util/Comparator;, "Ljava/util/Comparator<Lcom/lge/gallery/data/core/MediaItem;>;"
    .end local v12    # "dataManager":Lcom/lge/gallery/data/core/DataManager;
    .end local v14    # "imageSet":Lcom/lge/gallery/data/core/MediaSet;
    .end local v17    # "videoSet":Lcom/lge/gallery/data/core/MediaSet;
    :pswitch_f8
    new-instance v13, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v13, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 137
    .local v13, "id":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->getIntVar(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    const/4 v1, 0x1

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v2, v13}, Lcom/lge/gallery/data/local/LocalSource;->getMediaItemsById(ZZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v15

    .line 139
    .local v15, "items":[Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v15, :cond_11b

    array-length v1, v15

    if-nez v1, :cond_136

    .line 140
    :cond_11b
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bad path for local image : "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 142
    :cond_136
    const/4 v1, 0x0

    aget-object v1, v15, v1

    goto/16 :goto_37

    .line 144
    .end local v13    # "id":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v15    # "items":[Lcom/lge/gallery/data/core/MediaItem;
    :pswitch_13b
    new-instance v1, Lcom/lge/gallery/data/local/LocalVideo;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lge/gallery/data/local/LocalSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/lge/gallery/data/core/PathMatcher;->getIntVar(I)I

    move-result v5

    move-object/from16 v0, p1

    invoke-direct {v1, v0, v2, v5}, Lcom/lge/gallery/data/local/LocalVideo;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;I)V

    goto/16 :goto_37

    .line 107
    nop

    :pswitch_data_152
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_2c
        :pswitch_38
        :pswitch_56
        :pswitch_f8
        :pswitch_13b
        :pswitch_2c
        :pswitch_74
    .end packed-switch
.end method

.method public findPathByUri(Landroid/net/Uri;)Lcom/lge/gallery/data/core/Path;
    .registers 10
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    .line 206
    :try_start_3
    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    packed-switch v4, :pswitch_data_56

    .line 227
    :cond_c
    :goto_c
    return-object v1

    .line 208
    :pswitch_d
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 209
    .local v2, "id":J
    cmp-long v4, v2, v6

    if-ltz v4, :cond_c

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathImageItem:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4, v2, v3}, Lcom/lge/gallery/data/core/Path;->getChild(J)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    goto :goto_c

    .line 212
    .end local v2    # "id":J
    :pswitch_1c
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 213
    .restart local v2    # "id":J
    cmp-long v4, v2, v6

    if-ltz v4, :cond_c

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathVideoItem:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4, v2, v3}, Lcom/lge/gallery/data/core/Path;->getChild(J)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    goto :goto_c

    .line 216
    .end local v2    # "id":J
    :pswitch_2b
    const/4 v4, 0x1

    invoke-direct {p0, p1, v4}, Lcom/lge/gallery/data/local/LocalSource;->getAlbumPath(Landroid/net/Uri;I)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    goto :goto_c

    .line 219
    :pswitch_31
    const/4 v4, 0x4

    invoke-direct {p0, p1, v4}, Lcom/lge/gallery/data/local/LocalSource;->getAlbumPath(Landroid/net/Uri;I)Lcom/lge/gallery/data/core/Path;
    :try_end_35
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_35} :catch_37

    move-result-object v1

    goto :goto_c

    .line 224
    :catch_37
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v4, "LocalSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uri: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c

    .line 206
    nop

    :pswitch_data_56
    .packed-switch 0x2
        :pswitch_2b
        :pswitch_31
        :pswitch_d
        :pswitch_1c
    .end packed-switch
.end method

.method public getDefaultSetOf(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/Path;
    .registers 5
    .param p1, "item"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 232
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 233
    .local v0, "object":Lcom/lge/gallery/data/core/MediaObject;
    instance-of v1, v0, Lcom/lge/gallery/data/local/LocalMediaItem;

    if-eqz v1, :cond_1f

    .line 234
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathAllAlbum:Lcom/lge/gallery/data/core/Path;

    check-cast v0, Lcom/lge/gallery/data/local/LocalMediaItem;

    .end local v0    # "object":Lcom/lge/gallery/data/core/MediaObject;
    invoke-virtual {v0}, Lcom/lge/gallery/data/local/LocalMediaItem;->getBucketId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/lge/gallery/data/core/Path;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    .line 237
    :goto_1e
    return-object v1

    .restart local v0    # "object":Lcom/lge/gallery/data/core/MediaObject;
    :cond_1f
    const/4 v1, 0x0

    goto :goto_1e
.end method

.method protected getImageItemPath()Lcom/lge/gallery/data/core/Path;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathImageItem:Lcom/lge/gallery/data/core/Path;

    return-object v0
.end method

.method protected getMediaItemsById(ZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;
    .registers 4
    .param p1, "isImage"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)[",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 252
    .local p2, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/lge/gallery/data/local/LocalSource;->getMediaItemsById(ZZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 280
    iget v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mCurrentSourceType:I

    return v0
.end method

.method protected getVideoItemPath()Lcom/lge/gallery/data/core/Path;
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mPathVideoItem:Lcom/lge/gallery/data/core/Path;

    return-object v0
.end method

.method public pause()V
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mClient:Landroid/content/ContentProviderClient;

    if-nez v0, :cond_5

    .line 276
    :goto_4
    return-void

    .line 274
    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mClient:Landroid/content/ContentProviderClient;

    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->release()Z

    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mClient:Landroid/content/ContentProviderClient;

    goto :goto_4
.end method

.method public resume()V
    .registers 3

    .prologue
    .line 265
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "media"

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->acquireContentProviderClient(Ljava/lang/String;)Landroid/content/ContentProviderClient;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalSource;->mClient:Landroid/content/ContentProviderClient;

    .line 267
    return-void
.end method
