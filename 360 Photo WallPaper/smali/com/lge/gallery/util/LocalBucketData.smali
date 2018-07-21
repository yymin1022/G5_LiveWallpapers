.class public Lcom/lge/gallery/util/LocalBucketData;
.super Ljava/lang/Object;
.source "LocalBucketData.java"


# static fields
.field private static sInstance:Lcom/lge/gallery/util/LocalBucketData;


# instance fields
.field private mCameraBucketId:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mFrontBucketIdForInternal:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mFrontBucketIdForSdcard:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalizedBucketMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mCameraBucketId:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForInternal:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForSdcard:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mLocalizedBucketMap:Ljava/util/HashMap;

    .line 38
    invoke-virtual {p0, p1}, Lcom/lge/gallery/util/LocalBucketData;->updateBucketIds(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method public static getCameraAlbumName(Landroid/content/Context;Z)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "oldVersion"    # Z

    .prologue
    .line 116
    if-eqz p1, :cond_5

    .line 117
    const-string v0, "100LGDSC"

    .line 119
    :goto_4
    return-object v0

    :cond_5
    const-string v0, "Camera"

    goto :goto_4
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/LocalBucketData;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const-class v1, Lcom/lge/gallery/util/LocalBucketData;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/lge/gallery/util/LocalBucketData;->sInstance:Lcom/lge/gallery/util/LocalBucketData;

    if-nez v0, :cond_e

    .line 32
    new-instance v0, Lcom/lge/gallery/util/LocalBucketData;

    invoke-direct {v0, p0}, Lcom/lge/gallery/util/LocalBucketData;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lge/gallery/util/LocalBucketData;->sInstance:Lcom/lge/gallery/util/LocalBucketData;

    .line 34
    :cond_e
    sget-object v0, Lcom/lge/gallery/util/LocalBucketData;->sInstance:Lcom/lge/gallery/util/LocalBucketData;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-object v0

    .line 31
    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public getFrontBucketId(Z)Ljava/util/ArrayList;
    .registers 3
    .param p1, "isSaveCameraInSdcard"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    if-eqz p1, :cond_5

    iget-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForSdcard:Ljava/util/ArrayList;

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForInternal:Ljava/util/ArrayList;

    goto :goto_4
.end method

.method public getLocalizedBucketName(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bucketId"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v2, p0, Lcom/lge/gallery/util/LocalBucketData;->mLocalizedBucketMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 101
    .local v1, "resId":Ljava/lang/Integer;
    if-eqz v1, :cond_1d

    .line 102
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "localized":Ljava/lang/String;
    if-eqz v0, :cond_1d

    .line 104
    move-object p3, v0

    .line 107
    .end local v0    # "localized":Ljava/lang/String;
    :cond_1d
    return-object p3
.end method

.method public isCameraAlbum(I)Z
    .registers 4
    .param p1, "bucketId"    # I

    .prologue
    .line 111
    iget-object v0, p0, Lcom/lge/gallery/util/LocalBucketData;->mCameraBucketId:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public updateBucketIds(Landroid/content/Context;)V
    .registers 21
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .local v4, "buckets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .local v6, "cameraBucketId":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v8, "frontBucketIdForInternal":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 47
    .local v12, "localized":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v10

    .line 48
    .local v10, "internal":Ljava/lang/String;
    const/16 v17, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v7

    .line 49
    .local v7, "external":Ljava/lang/String;
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v15, v0, [Ljava/lang/String;

    const/16 v17, 0x0

    aput-object v10, v15, v17

    const/16 v17, 0x1

    aput-object v7, v15, v17

    .line 53
    .local v15, "paths":[Ljava/lang/String;
    const/16 v17, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/lge/gallery/util/LocalBucketData;->getCameraAlbumName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v5

    .line 55
    .local v5, "camera":Ljava/lang/String;
    const/4 v3, 0x0

    .line 56
    .local v3, "bucketId":I
    move-object v2, v15

    .local v2, "arr$":[Ljava/lang/String;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_44
    if-ge v9, v11, :cond_87

    aget-object v14, v2, v9

    .line 57
    .local v14, "path":Ljava/lang/String;
    if-nez v14, :cond_4d

    .line 56
    :goto_4a
    add-int/lit8 v9, v9, 0x1

    goto :goto_44

    .line 60
    :cond_4d
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "DCIM/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/lge/gallery/util/GalleryUtils;->getBucketId(Ljava/lang/String;)I

    move-result v3

    .line 61
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    sget v18, Lcom/lge/gallery/common/R$string;->sp_camera_NORMAL:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4a

    .line 65
    .end local v14    # "path":Ljava/lang/String;
    :cond_87
    const/16 v17, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1}, Lcom/lge/gallery/util/LocalBucketData;->getCameraAlbumName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v13

    .line 66
    .local v13, "oldCamera":Ljava/lang/String;
    if-eqz v13, :cond_d9

    .line 67
    move-object v2, v15

    array-length v11, v2

    const/4 v9, 0x0

    :goto_96
    if-ge v9, v11, :cond_d9

    aget-object v14, v2, v9

    .line 68
    .restart local v14    # "path":Ljava/lang/String;
    if-nez v14, :cond_9f

    .line 67
    :goto_9c
    add-int/lit8 v9, v9, 0x1

    goto :goto_96

    .line 71
    :cond_9f
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "DCIM/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/lge/gallery/util/GalleryUtils;->getBucketId(Ljava/lang/String;)I

    move-result v3

    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    sget v18, Lcom/lge/gallery/common/R$string;->sp_camera_old_NORMAL:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9c

    .line 77
    .end local v14    # "path":Ljava/lang/String;
    :cond_d9
    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 78
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 81
    if-eqz v7, :cond_116

    .line 82
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "DCIM/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/lge/gallery/util/GalleryUtils;->getBucketId(Ljava/lang/String;)I

    move-result v16

    .line 83
    .local v16, "sdcardBucketId":I
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 84
    const/16 v17, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v4, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 86
    .end local v16    # "sdcardBucketId":I
    :cond_116
    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/lge/gallery/util/LocalBucketData;->mCameraBucketId:Ljava/util/ArrayList;

    .line 87
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForInternal:Ljava/util/ArrayList;

    .line 88
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/lge/gallery/util/LocalBucketData;->mFrontBucketIdForSdcard:Ljava/util/ArrayList;

    .line 89
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/lge/gallery/util/LocalBucketData;->mLocalizedBucketMap:Ljava/util/HashMap;

    .line 90
    return-void
.end method
