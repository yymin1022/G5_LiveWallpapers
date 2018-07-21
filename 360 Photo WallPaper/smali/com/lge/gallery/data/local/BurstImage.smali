.class public Lcom/lge/gallery/data/local/BurstImage;
.super Lcom/lge/gallery/data/local/LocalImage;
.source "BurstImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/BurstImage$ChangeNotifierForItem;
    }
.end annotation


# static fields
.field private static final BURST_COUNT_PROJECTION:[Ljava/lang/String;

.field static final BURST_PROJECTION:[Ljava/lang/String;

.field private static final BURST_SHOT:Ljava/lang/String; = "Burst"

.field private static final TAG:Ljava/lang/String; = "BurstImage"

.field private static final WHERE_CLAUSE:Ljava/lang/String; = "bucket_id= ? AND burst_id = ?"


# instance fields
.field protected mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field private mBurstCount:I

.field private final mBurstId:Ljava/lang/String;

.field private mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

.field private final mParentPath:Lcom/lge/gallery/data/core/Path;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 37
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "count(burst_id)"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/data/local/BurstImage;->BURST_COUNT_PROJECTION:[Ljava/lang/String;

    .line 47
    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    sput-object v0, Lcom/lge/gallery/data/local/BurstImage;->BURST_PROJECTION:[Ljava/lang/String;

    .line 49
    sget-object v0, Lcom/lge/gallery/data/local/BurstImage;->BURST_PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x13

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;I)V
    .registers 9
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p5, "burstId"    # Ljava/lang/String;
    .param p6, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p4, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lge/gallery/data/local/LocalImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 62
    iput-object p2, p0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 63
    iput-object p5, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    .line 64
    iput p6, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    .line 65
    iget-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mPath:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/Path;->getParent()Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mParentPath:Lcom/lge/gallery/data/core/Path;

    .line 66
    new-instance v0, Lcom/lge/gallery/data/local/BurstImage$ChangeNotifierForItem;

    iget-object v1, p0, Lcom/lge/gallery/data/local/BurstImage;->mBaseUri:Landroid/net/Uri;

    invoke-direct {v0, v1, p2}, Lcom/lge/gallery/data/local/BurstImage$ChangeNotifierForItem;-><init>(Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

    .line 67
    return-void
.end method

.method private static createBurstImage(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;IZ)Lcom/lge/gallery/data/local/LocalMediaItem;
    .registers 14
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p4, "id"    # Ljava/lang/String;
    .param p5, "count"    # I
    .param p6, "isUnit"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "IZ)",
            "Lcom/lge/gallery/data/local/LocalMediaItem;"
        }
    .end annotation

    .prologue
    .line 176
    .local p3, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-eqz p6, :cond_d

    .line 177
    new-instance v0, Lcom/lge/gallery/data/local/BurstUnitImage;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/local/BurstUnitImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 179
    :goto_c
    return-object v0

    :cond_d
    new-instance v0, Lcom/lge/gallery/data/local/BurstImage;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/lge/gallery/data/local/BurstImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;I)V

    goto :goto_c
.end method

.method private getSubCount()I
    .registers 11

    .prologue
    const/4 v8, 0x0

    .line 78
    const/4 v6, 0x0

    .line 80
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    iget-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/data/local/BurstImage;->mBaseUri:Landroid/net/Uri;

    sget-object v2, Lcom/lge/gallery/data/local/BurstImage;->BURST_COUNT_PROJECTION:[Ljava/lang/String;

    const-string v3, "bucket_id= ? AND burst_id = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v9, p0, Lcom/lge/gallery/data/local/BurstImage;->bucketId:I

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v5

    const/4 v5, 0x1

    iget-object v9, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    aput-object v9, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 85
    if-nez v6, :cond_34

    .line 86
    const-string v0, "BurstImage"

    const-string v1, "query fail"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2d} :catch_4c
    .catchall {:try_start_2 .. :try_end_2d} :catchall_5a

    .line 95
    if-eqz v6, :cond_32

    .line 96
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_32
    move v0, v8

    .line 99
    :cond_33
    :goto_33
    return v0

    .line 89
    :cond_34
    :try_start_34
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_45

    .line 90
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_3e} :catch_4c
    .catchall {:try_start_34 .. :try_end_3e} :catchall_5a

    move-result v0

    .line 95
    if-eqz v6, :cond_33

    .line 96
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_33

    .line 95
    :cond_45
    if-eqz v6, :cond_4a

    .line 96
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4a
    :goto_4a
    move v0, v8

    .line 99
    goto :goto_33

    .line 92
    :catch_4c
    move-exception v7

    .line 93
    .local v7, "e":Ljava/lang/Exception;
    :try_start_4d
    const-string v0, "BurstImage"

    const-string v1, "Exception while getting burst count."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_54
    .catchall {:try_start_4d .. :try_end_54} :catchall_5a

    .line 95
    if-eqz v6, :cond_4a

    .line 96
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_4a

    .line 95
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_5a
    move-exception v0

    if-eqz v6, :cond_60

    .line 96
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_60
    throw v0
.end method

.method static loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;I)Lcom/lge/gallery/data/core/MediaItem;
    .registers 15
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p3, "dataManager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p4, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p5, "id"    # Ljava/lang/String;
    .param p6, "count"    # I
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
            "Ljava/lang/String;",
            "I)",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 141
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-static/range {v0 .. v7}, Lcom/lge/gallery/data/local/BurstImage;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;IZ)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method static loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;IZ)Lcom/lge/gallery/data/core/MediaItem;
    .registers 19
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p3, "dataManager"    # Lcom/lge/gallery/data/core/DataManager;
    .param p4, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p5, "id"    # Ljava/lang/String;
    .param p6, "count"    # I
    .param p7, "isUnit"    # Z
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
            "Ljava/lang/String;",
            "IZ)",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation

    .prologue
    .line 147
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_4

    .line 148
    const/4 v9, 0x0

    .line 170
    :goto_3
    return-object v9

    .line 150
    :cond_4
    const/4 v9, 0x0

    .line 151
    .local v9, "item":Lcom/lge/gallery/data/local/LocalMediaItem;
    const-class v10, Lcom/lge/gallery/data/core/Path;

    monitor-enter v10

    .line 152
    :try_start_8
    invoke-virtual {p3, p0}, Lcom/lge/gallery/data/core/DataManager;->peekMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/lge/gallery/data/local/LocalMediaItem;

    move-object v9, v0

    .line 153
    if-nez v9, :cond_25

    move-object v1, p0

    move-object v2, p4

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    .line 154
    invoke-static/range {v1 .. v7}, Lcom/lge/gallery/data/local/BurstImage;->createBurstImage(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;IZ)Lcom/lge/gallery/data/local/LocalMediaItem;

    move-result-object v9

    .line 169
    :cond_20
    :goto_20
    monitor-exit v10

    goto :goto_3

    :catchall_22
    move-exception v1

    monitor-exit v10
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_22

    throw v1

    .line 156
    :cond_25
    :try_start_25
    instance-of v8, v9, Lcom/lge/gallery/data/local/BurstImage;

    .line 157
    .local v8, "isBurstImage":Z
    if-nez v8, :cond_40

    const/4 v1, 0x1

    move/from16 v0, p6

    if-le v0, v1, :cond_40

    .line 160
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->forceRemoveObject()V

    move-object v1, p0

    move-object v2, p4

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    .line 161
    invoke-static/range {v1 .. v7}, Lcom/lge/gallery/data/local/BurstImage;->createBurstImage(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;IZ)Lcom/lge/gallery/data/local/LocalMediaItem;

    move-result-object v9

    goto :goto_20

    .line 163
    :cond_40
    invoke-virtual {v9, p1, p2}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 164
    if-eqz v8, :cond_20

    .line 165
    move-object v0, v9

    check-cast v0, Lcom/lge/gallery/data/local/BurstImage;

    move-object v1, v0

    move/from16 v0, p6

    invoke-virtual {v1, v0}, Lcom/lge/gallery/data/local/BurstImage;->setBurstCount(I)V
    :try_end_4e
    .catchall {:try_start_25 .. :try_end_4e} :catchall_22

    goto :goto_20
.end method


# virtual methods
.method public bulkDelete(Lcom/lge/gallery/contentmanager/BulkDeleteListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/lge/gallery/contentmanager/BulkDeleteListener;

    .prologue
    .line 210
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->delete()V

    .line 211
    return-void
.end method

.method public delete()V
    .registers 8

    .prologue
    .line 193
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 194
    iget-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mBaseUri:Landroid/net/Uri;

    .line 196
    .local v0, "baseUri":Landroid/net/Uri;
    :try_start_5
    iget-object v2, p0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "bucket_id= ? AND burst_id = ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v6, p0, Lcom/lge/gallery/data/local/BurstImage;->bucketId:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_21} :catch_22

    .line 206
    return-void

    .line 198
    :catch_22
    move-exception v1

    .line 199
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "BurstImage"

    const-string v3, "Delete error in BurstImage"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    iget-object v2, p0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 201
    new-instance v2, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 203
    :cond_3e
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 5

    .prologue
    .line 262
    invoke-super {p0}, Lcom/lge/gallery/data/local/LocalImage;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v1

    .line 263
    .local v1, "details":Lcom/lge/gallery/data/core/MediaDetails;
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItemCount()I

    move-result v0

    .line 264
    .local v0, "burstImageCount":I
    const/4 v2, 0x1

    if-le v0, v2, :cond_20

    .line 265
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Burst"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_21

    const/16 v2, 0x9

    :goto_19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 268
    :cond_20
    return-object v1

    .line 265
    :cond_21
    const/16 v2, 0xa

    goto :goto_19
.end method

.method public getEntryFilePaths()Ljava/util/ArrayList;
    .registers 7
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
    .line 215
    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItemCount()I

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItem(II)Ljava/util/ArrayList;

    move-result-object v3

    .line 216
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v0, "filePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaItem;

    .line 219
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v2, :cond_12

    .line 222
    invoke-virtual {v2}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 224
    .end local v2    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_28
    return-object v0
.end method

.method public getSubMediaItem(II)Ljava/util/ArrayList;
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
    .line 104
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 105
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v12

    .line 106
    .local v12, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/BurstImage;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v5, "limit"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, p1

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, p2

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 108
    .local v2, "uri":Landroid/net/Uri;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v16, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    const/4 v11, 0x0

    .line 111
    .local v11, "cursor":Landroid/database/Cursor;
    :try_start_3e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v3, Lcom/lge/gallery/data/local/BurstImage;->BURST_PROJECTION:[Ljava/lang/String;

    const-string v4, "bucket_id= ? AND burst_id = ?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lge/gallery/data/local/BurstImage;->bucketId:I

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    aput-object v7, v5, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "replace(title, \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "_Burst\', 0)*1 ASC"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_7f} :catch_9b

    move-result-object v4

    .line 119
    .end local v11    # "cursor":Landroid/database/Cursor;
    .local v4, "cursor":Landroid/database/Cursor;
    if-nez v4, :cond_9e

    .line 120
    const-string v1, "BurstImage"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "query fail: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :goto_9a
    return-object v16

    .line 116
    .end local v4    # "cursor":Landroid/database/Cursor;
    .restart local v11    # "cursor":Landroid/database/Cursor;
    :catch_9b
    move-exception v13

    .local v13, "e":Ljava/lang/Exception;
    move-object v4, v11

    .line 117
    .end local v11    # "cursor":Landroid/database/Cursor;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    goto :goto_9a

    .line 125
    .end local v13    # "e":Ljava/lang/Exception;
    :cond_9e
    :goto_9e
    :try_start_9e
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_eb

    .line 126
    const/4 v1, 0x0

    invoke-interface {v4, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 128
    .local v14, "id":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lge/gallery/data/local/BurstImage;->mParentPath:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v5}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "/burst"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v1, v14}, Lcom/lge/gallery/data/core/Path;->getChild(I)Lcom/lge/gallery/data/core/Path;

    move-result-object v3

    .line 129
    .local v3, "childPath":Lcom/lge/gallery/data/core/Path;
    sget-object v5, Lcom/lge/gallery/data/local/BurstImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/lge/gallery/data/local/BurstImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/lge/gallery/data/local/BurstImage;->mBurstId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v9, v0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    const/4 v10, 0x1

    move-object v6, v12

    invoke-static/range {v3 .. v10}, Lcom/lge/gallery/data/local/BurstImage;->loadOrUpdateItem(Lcom/lge/gallery/data/core/Path;Landroid/database/Cursor;Ljava/util/HashMap;Lcom/lge/gallery/data/core/DataManager;Lcom/lge/gallery/appinterface/GalleryApp;Ljava/lang/String;IZ)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v15

    .line 131
    .local v15, "item":Lcom/lge/gallery/data/core/MediaItem;
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e5
    .catchall {:try_start_9e .. :try_end_e5} :catchall_e6

    goto :goto_9e

    .line 134
    .end local v3    # "childPath":Lcom/lge/gallery/data/core/Path;
    .end local v14    # "id":I
    .end local v15    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :catchall_e6
    move-exception v1

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v1

    :cond_eb
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_9a
.end method

.method public getSubMediaItemCount()I
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->isDirty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 72
    invoke-direct {p0}, Lcom/lge/gallery/data/local/BurstImage;->getSubCount()I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    .line 74
    :cond_e
    iget v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    return v0
.end method

.method public getSupportedOperations()I
    .registers 4

    .prologue
    .line 246
    iget v1, p0, Lcom/lge/gallery/data/local/BurstImage;->mCachedOperation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_8

    .line 247
    iget v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mCachedOperation:I

    .line 257
    :goto_7
    return v0

    .line 250
    :cond_8
    const/16 v0, 0x405

    .line 253
    .local v0, "operation":I
    iget-object v1, p0, Lcom/lge/gallery/data/local/BurstImage;->mimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/lge/gallery/common/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 254
    or-int/lit8 v0, v0, 0x40

    .line 256
    :cond_14
    iput v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mCachedOperation:I

    goto :goto_7
.end method

.method public rotate(I)V
    .registers 7
    .param p1, "degrees"    # I

    .prologue
    .line 233
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 234
    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItemCount()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItem(II)Ljava/util/ArrayList;

    move-result-object v2

    .line 235
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    .line 236
    .local v1, "item":Lcom/lge/gallery/data/core/MediaItem;
    instance-of v3, v1, Lcom/lge/gallery/data/local/BurstImage;

    if-eqz v3, :cond_26

    .line 237
    check-cast v1, Lcom/lge/gallery/data/local/BurstImage;

    .end local v1    # "item":Lcom/lge/gallery/data/core/MediaItem;
    invoke-virtual {v1, p1}, Lcom/lge/gallery/data/local/BurstImage;->rotateImpl(I)V

    goto :goto_10

    .line 239
    .restart local v1    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_26
    invoke-virtual {v1, p1}, Lcom/lge/gallery/data/core/MediaItem;->rotate(I)V

    goto :goto_10

    .line 242
    .end local v1    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_2a
    return-void
.end method

.method protected rotateImpl(I)V
    .registers 2
    .param p1, "degree"    # I

    .prologue
    .line 228
    invoke-super {p0, p1}, Lcom/lge/gallery/data/local/LocalImage;->rotate(I)V

    .line 229
    return-void
.end method

.method setBurstCount(I)V
    .registers 4
    .param p1, "count"    # I

    .prologue
    .line 185
    iget v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    if-eq p1, v0, :cond_a

    .line 186
    invoke-static {}, Lcom/lge/gallery/data/local/BurstImage;->nextVersionNumber()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mDataVersion:J

    .line 188
    :cond_a
    iput p1, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    .line 189
    return-void
.end method

.method public updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V
    .registers 7
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 273
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 281
    :cond_2
    :goto_2
    return-void

    .line 276
    :cond_3
    iget v0, p0, Lcom/lge/gallery/data/local/BurstImage;->mBurstCount:I

    .line 277
    .local v0, "burstCount":I
    invoke-super {p0, p1, p2}, Lcom/lge/gallery/data/local/LocalImage;->updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 278
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstImage;->getSubMediaItemCount()I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 279
    invoke-static {}, Lcom/lge/gallery/data/local/BurstImage;->nextVersionNumber()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/BurstImage;->mDataVersion:J

    goto :goto_2
.end method
