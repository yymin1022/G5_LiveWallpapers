.class public Lcom/lge/gallery/data/local/LocalImage;
.super Lcom/lge/gallery/data/local/LocalMediaItem;
.source "LocalImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;,
        Lcom/lge/gallery/data/local/LocalImage$LocalEmptyRequest;
    }
.end annotation


# static fields
.field public static final CURSOR_INDEX_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field static final ITEM_PATH:Lcom/lge/gallery/data/core/Path;

.field protected static final NOT_INIT:I = -0x1

.field private static final PERF_LOG:Z = false

.field public static final PROJECTION:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "LocalImage"


# instance fields
.field private final S_LOCK:Ljava/lang/Object;

.field public height:I

.field private isBroken:Z

.field protected final mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field protected mCachedOperation:I

.field private mHasDng:Ljava/lang/Boolean;

.field private mLargeScreenNail:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lge/gallery/nail/ScreenNail;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;

.field public rotation:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 70
    const-string v3, "/local/image/item"

    invoke-static {v3}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v3

    sput-object v3, Lcom/lge/gallery/data/local/LocalImage;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    .line 71
    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v3}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    sput-object v3, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    .line 72
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 75
    invoke-static {}, Lcom/lge/gallery/data/local/LocalImage;->updateProjection()V

    .line 76
    const/4 v1, 0x0

    .line 77
    .local v1, "jk":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_3c

    .line 78
    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_39

    .line 79
    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    sget-object v4, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    aget-object v4, v4, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "jk":I
    .local v2, "jk":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v2

    .line 77
    .end local v2    # "jk":I
    .restart local v1    # "jk":I
    :cond_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 82
    :cond_3c
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 140
    invoke-static {}, Lcom/lge/gallery/data/local/LocalImage;->nextVersionNumber()J

    move-result-wide v0

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/LocalImage;->isBroken:Z

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->S_LOCK:Ljava/lang/Object;

    .line 302
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    .line 141
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 142
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;I)V
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "id"    # I

    .prologue
    .line 121
    invoke-static {}, Lcom/lge/gallery/data/local/LocalImage;->nextVersionNumber()J

    move-result-wide v2

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, p1, v2, v3, v1}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 107
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lge/gallery/data/local/LocalImage;->isBroken:Z

    .line 108
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    .line 109
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->S_LOCK:Ljava/lang/Object;

    .line 302
    const/4 v1, -0x1

    iput v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    .line 122
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 123
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    invoke-static {v1, v2, v3, p3}, Lcom/lge/gallery/contentmanager/DBUtil;->getItemCursorById(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    .line 125
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_46

    .line 126
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot get cursor for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 129
    :cond_46
    :try_start_46
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_55

    .line 130
    sget-object v1, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v1}, Lcom/lge/gallery/data/local/LocalImage;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    :try_end_51
    .catchall {:try_start_46 .. :try_end_51} :catchall_6e

    .line 135
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 137
    return-void

    .line 132
    :cond_55
    :try_start_55
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot find data for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_6e
    .catchall {:try_start_55 .. :try_end_6e} :catchall_6e

    .line 135
    :catchall_6e
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "cursor"    # Landroid/database/Cursor;
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p4, "cursorKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/lge/gallery/data/local/LocalImage;->nextVersionNumber()J

    move-result-wide v0

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/LocalImage;->isBroken:Z

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->S_LOCK:Ljava/lang/Object;

    .line 302
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    .line 116
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 117
    if-nez p4, :cond_21

    sget-object p4, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .end local p4    # "cursorKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_21
    invoke-virtual {p0, p3, p4}, Lcom/lge/gallery/data/local/LocalImage;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 118
    return-void
.end method

.method private clearCachedOperation()V
    .registers 2

    .prologue
    .line 304
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    .line 305
    return-void
.end method

.method private deleteDNGFile(Z)Ljava/lang/String;
    .registers 3
    .param p1, "notify"    # Z

    .prologue
    .line 353
    const/4 v0, 0x0

    .line 377
    .local v0, "path":Ljava/lang/String;
    return-object v0
.end method

.method private static getDmsString(D)Ljava/lang/String;
    .registers 12
    .param p0, "value"    # D

    .prologue
    const-wide/high16 v8, 0x404e000000000000L    # 60.0

    .line 530
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    .line 531
    double-to-int v0, p0

    .line 532
    .local v0, "degrees":I
    int-to-float v3, v0

    float-to-double v6, v3

    sub-double v6, p0, v6

    mul-double p0, v6, v8

    .line 533
    double-to-int v1, p0

    .line 534
    .local v1, "minutes":I
    int-to-double v6, v1

    sub-double v6, p0, v6

    mul-double v4, v6, v8

    .line 535
    .local v4, "seconds":D
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 536
    .local v2, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 537
    const-string v3, "/1,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 538
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 539
    const-string v3, "/1,"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 540
    const-wide v6, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v6, v4

    double-to-int v3, v6

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 541
    const-string v3, "/1000000"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 542
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getExifOrientation(I)Ljava/lang/String;
    .registers 4
    .param p0, "orientation"    # I

    .prologue
    .line 381
    sparse-switch p0, :sswitch_data_36

    .line 391
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 383
    :sswitch_1c
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 389
    :goto_21
    return-object v0

    .line 385
    :sswitch_22
    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_21

    .line 387
    :sswitch_28
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_21

    .line 389
    :sswitch_2e
    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_21

    .line 381
    nop

    :sswitch_data_36
    .sparse-switch
        0x0 -> :sswitch_1c
        0x5a -> :sswitch_22
        0xb4 -> :sswitch_28
        0x10e -> :sswitch_2e
    .end sparse-switch
.end method

.method private declared-synchronized getMetadataLoader()Lcom/lge/gallery/data/core/VRMetadataLoader;
    .registers 2

    .prologue
    .line 181
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLocalMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;

    if-nez v0, :cond_c

    .line 182
    new-instance v0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/local/LocalVrMetadataLoader;-><init>(Lcom/lge/gallery/data/core/MediaItem;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLocalMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;

    .line 184
    :cond_c
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLocalMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 181
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private printFieldInfo(Ljava/lang/String;)V
    .registers 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 505
    return-void
.end method

.method private static printProjection([Ljava/lang/String;)V
    .registers 1
    .param p0, "proj"    # [Ljava/lang/String;

    .prologue
    .line 94
    return-void
.end method

.method private updateCameraMode()V
    .registers 3

    .prologue
    .line 188
    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCameraMode:I

    if-nez v0, :cond_14

    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    iget v1, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    mul-int/lit8 v1, v1, 0x2

    if-ne v0, v1, :cond_14

    .line 190
    const/16 v0, 0x64

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCameraMode:I

    .line 192
    :cond_14
    return-void
.end method

.method private static updateProjection()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 85
    sget-object v1, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xd

    aput-object v3, v1, v2

    .line 86
    const/16 v0, 0x14

    .local v0, "i":I
    :goto_9
    sget-object v1, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 87
    sget-object v1, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    aput-object v3, v1, v0

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 89
    :cond_15
    sget-object v1, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    invoke-static {v1}, Lcom/lge/gallery/data/local/LocalImage;->printProjection([Ljava/lang/String;)V

    .line 90
    return-void
.end method


# virtual methods
.method public bulkDelete(Lcom/lge/gallery/contentmanager/BulkDeleteListener;)V
    .registers 5
    .param p1, "listener"    # Lcom/lge/gallery/contentmanager/BulkDeleteListener;

    .prologue
    .line 323
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 324
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 325
    .local v0, "path":Ljava/lang/String;
    if-eqz p1, :cond_43

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    invoke-static {v1, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/lge/gallery/data/local/LocalImage;->deleteDNGFile(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lcom/lge/gallery/contentmanager/BulkDeleteListener;->onDelete(Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_43

    .line 326
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 327
    new-instance v1, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 329
    :cond_3b
    new-instance v1, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 332
    :cond_43
    return-void
.end method

.method public delete()V
    .registers 8

    .prologue
    .line 336
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 337
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    .line 339
    .local v0, "baseUri":Landroid/net/Uri;
    :try_start_5
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v6, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 341
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/lge/gallery/data/local/LocalImage;->deleteDNGFile(Z)Ljava/lang/String;
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_20} :catch_21

    .line 350
    return-void

    .line 342
    :catch_21
    move-exception v1

    .line 343
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "LocalImage"

    const-string v3, "Delete error in localImage"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 345
    new-instance v2, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 347
    :cond_3d
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getBrokenImage(Landroid/app/Activity;)Landroid/graphics/Bitmap;
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 524
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/local/LocalImage;->isBroken:Z

    .line 525
    invoke-super {p0, p1}, Lcom/lge/gallery/data/local/LocalMediaItem;->getBrokenImage(Landroid/app/Activity;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getContentUri()Landroid/net/Uri;
    .registers 3

    .prologue
    .line 434
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget v1, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected getCursorKeyMap()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 196
    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    return-object v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 6

    .prologue
    .line 444
    invoke-super {p0}, Lcom/lge/gallery/data/local/LocalMediaItem;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v0

    .line 445
    .local v0, "details":Lcom/lge/gallery/data/core/MediaDetails;
    const/16 v2, 0xc

    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    invoke-static {v3}, Lcom/lge/gallery/data/core/MediaDetails;->getOrientation(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 446
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/lge/gallery/data/core/MediaDetails;->extractExifInfo(Lcom/lge/gallery/data/core/MediaDetails;Ljava/lang/String;)V

    .line 447
    iget v2, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    if-nez v2, :cond_2c

    iget v2, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    if-nez v2, :cond_2c

    .line 448
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/lge/gallery/decoder/GalleryDecodeUtils;->getImageBound(Landroid/content/Context;Ljava/lang/String;)Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;

    move-result-object v1

    .line 449
    .local v1, "size":Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    iget v2, v1, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;->width:I

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    .line 450
    iget v2, v1, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;->height:I

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    .line 454
    .end local v1    # "size":Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
    :cond_2c
    const-string v2, "image/jpeg"

    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4b

    .line 455
    iget v2, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    if-lez v2, :cond_4b

    iget v2, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    if-lez v2, :cond_4b

    .line 456
    const/16 v2, 0xb

    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    iget v4, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    invoke-static {v3, v4}, Lcom/lge/gallery/data/core/MediaDetails;->getResolution(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 461
    :cond_4b
    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 476
    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    return v0
.end method

.method public getLargeScreenNail()Lcom/lge/gallery/nail/ScreenNail;
    .registers 3

    .prologue
    .line 241
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->S_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 242
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_11

    .line 243
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/nail/ScreenNail;

    monitor-exit v1

    .line 245
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_10

    .line 246
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public getMediaType()I
    .registers 2

    .prologue
    .line 439
    const/4 v0, 0x2

    return v0
.end method

.method public getRotation()I
    .registers 2

    .prologue
    .line 466
    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    return v0
.end method

.method public getSupportedOperations()I
    .registers 4

    .prologue
    .line 309
    iget v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_8

    .line 310
    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    .line 318
    :goto_7
    return v0

    .line 313
    :cond_8
    const/16 v0, 0x605

    .line 314
    .local v0, "operation":I
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/lge/gallery/common/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 315
    or-int/lit8 v0, v0, 0x40

    .line 317
    :cond_14
    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCachedOperation:I

    goto :goto_7
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 471
    iget v0, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    return v0
.end method

.method public hasDng()Z
    .registers 4

    .prologue
    .line 552
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mHasDng:Ljava/lang/Boolean;

    .line 553
    .local v0, "hasDng":Ljava/lang/Boolean;
    if-nez v0, :cond_20

    .line 554
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalImage;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->getDngPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 555
    .local v1, "rawPath":Ljava/lang/String;
    if-eqz v1, :cond_25

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 556
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 560
    :goto_1e
    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mHasDng:Ljava/lang/Boolean;

    .line 562
    .end local v1    # "rawPath":Ljava/lang/String;
    :cond_20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    return v2

    .line 558
    .restart local v1    # "rawPath":Ljava/lang/String;
    :cond_25
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1e
.end method

.method public is360()Z
    .registers 3

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalImage;->getCameraMode()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    .registers 5
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
    .line 145
    .local p2, "cusorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 168
    :goto_2
    return-void

    .line 148
    :cond_3
    const-string v0, "_id"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    .line 149
    const-string v0, "title"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->caption:Ljava/lang/String;

    .line 150
    const-string v0, "mime_type"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    .line 151
    const-string v0, "latitude"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->latitude:D

    .line 152
    const-string v0, "longitude"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->longitude:D

    .line 153
    const-string v0, "datetaken"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->dateTakenInMs:J

    .line 154
    const-string v0, "date_added"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->dateAddedInSec:J

    .line 155
    const-string v0, "date_modified"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->dateModifiedInSec:J

    .line 156
    const-string v0, "_data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    .line 157
    const-string v0, "orientation"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    .line 158
    const-string v0, "bucket_id"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->bucketId:I

    .line 159
    const-string v0, "_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalImage;->fileSize:J

    .line 160
    const-string v0, "width"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    .line 161
    const-string v0, "height"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    .line 162
    sget-object v0, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mProtectionType:I

    .line 163
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    if-eqz v0, :cond_127

    .line 164
    const-string v0, "camera_mode"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mCameraMode:I

    .line 166
    :cond_127
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalImage;->updateCameraMode()V

    .line 167
    const-string v0, "Local"

    invoke-direct {p0, v0}, Lcom/lge/gallery/data/local/LocalImage;->printFieldInfo(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public loadVRMetadata(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V
    .registers 5
    .param p1, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "listener"    # Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;

    .prologue
    .line 172
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    .line 173
    .local v0, "useDB":Z
    if-eqz v0, :cond_c

    .line 174
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalImage;->getMetadataLoader()Lcom/lge/gallery/data/core/VRMetadataLoader;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/lge/gallery/data/core/VRMetadataLoader;->load(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V

    .line 178
    :goto_b
    return-void

    .line 177
    :cond_c
    invoke-super {p0, p1, p2}, Lcom/lge/gallery/data/local/LocalMediaItem;->loadVRMetadata(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V

    goto :goto_b
.end method

.method public requestImage(I)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 8
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 258
    new-instance v0, Lcom/lge/gallery/data/local/LocalImageRequest;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mPath:Lcom/lge/gallery/data/core/Path;

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    iget-object v5, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/local/LocalImageRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public requestLargeImage()Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Lcom/lge/gallery/decoder/GalleryRegionDecoder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 279
    new-instance v0, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/data/local/LocalImage$LocalLargeImageRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public rotate(I)V
    .registers 12
    .param p1, "degrees"    # I

    .prologue
    .line 397
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 398
    iget-boolean v5, p0, Lcom/lge/gallery/data/local/LocalImage;->isBroken:Z

    if-eqz v5, :cond_8

    .line 430
    :goto_7
    return-void

    .line 401
    :cond_8
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    .line 402
    .local v0, "baseUri":Landroid/net/Uri;
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 403
    .local v4, "values":Landroid/content/ContentValues;
    iget v5, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    add-int/2addr v5, p1

    rem-int/lit16 v3, v5, 0x168

    .line 404
    .local v3, "rotation":I
    if-gez v3, :cond_18

    .line 405
    add-int/lit16 v3, v3, 0x168

    .line 408
    :cond_18
    iget-object v5, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    if-eqz v5, :cond_51

    const-string v5, "image/jpeg"

    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 410
    :try_start_26
    new-instance v2, Landroid/media/ExifInterface;

    iget-object v5, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    invoke-direct {v2, v5}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 411
    .local v2, "exif":Landroid/media/ExifInterface;
    const-string v5, "Orientation"

    invoke-static {v3}, Lcom/lge/gallery/data/local/LocalImage;->getExifOrientation(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    invoke-virtual {v2}, Landroid/media/ExifInterface;->saveAttributes()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_39} :catch_77

    .line 419
    .end local v2    # "exif":Landroid/media/ExifInterface;
    :goto_39
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/lge/gallery/data/local/LocalImage;->fileSize:J

    .line 420
    const-string v5, "_size"

    iget-wide v6, p0, Lcom/lge/gallery/data/local/LocalImage;->fileSize:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 423
    :cond_51
    const-string v5, "orientation"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 425
    :try_start_5a
    iget-object v5, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v5}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "_id=?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    iget v9, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v0, v4, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_71} :catch_72

    goto :goto_7

    .line 427
    :catch_72
    move-exception v1

    .line 428
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7

    .line 414
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_77
    move-exception v1

    .line 415
    .local v1, "e":Ljava/io/IOException;
    const-string v5, "LocalImage"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot set exif data: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_39
.end method

.method public setLargeScreenNail(Lcom/lge/gallery/nail/ScreenNail;)V
    .registers 4
    .param p1, "s"    # Lcom/lge/gallery/nail/ScreenNail;

    .prologue
    .line 251
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalImage;->S_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 252
    :try_start_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalImage;->mLargeScreenNail:Ljava/lang/ref/WeakReference;

    .line 253
    monitor-exit v1

    .line 254
    return-void

    .line 253
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public update()Lcom/lge/gallery/data/core/MediaObject;
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 481
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 482
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 483
    .local v1, "resolver":Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mBaseUri:Landroid/net/Uri;

    .line 484
    .local v2, "uri":Landroid/net/Uri;
    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->PROJECTION:[Ljava/lang/String;

    iget v5, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    invoke-static {v1, v2, v3, v5}, Lcom/lge/gallery/contentmanager/DBUtil;->getItemCursorById(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    .line 485
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_18

    move-object p0, v4

    .line 500
    .end local p0    # "this":Lcom/lge/gallery/data/local/LocalImage;
    :goto_17
    return-object p0

    .line 489
    .restart local p0    # "this":Lcom/lge/gallery/data/local/LocalImage;
    :cond_18
    :try_start_18
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_42

    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    const-string v5, "_id"

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iget v5, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    if-ne v3, v5, :cond_42

    .line 491
    sget-object v3, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v3}, Lcom/lge/gallery/data/local/LocalImage;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    :try_end_39
    .catchall {:try_start_18 .. :try_end_39} :catchall_47

    .line 496
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 498
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalImage;->clearCachedOperation()V

    .line 499
    iput-object v4, p0, Lcom/lge/gallery/data/local/LocalImage;->mHasDng:Ljava/lang/Boolean;

    goto :goto_17

    .line 496
    :cond_42
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move-object p0, v4

    goto :goto_17

    :catchall_47
    move-exception v3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v3
.end method

.method protected updateFromCursor(Landroid/database/Cursor;)Z
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 201
    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/data/local/LocalImage;->updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z

    move-result v0

    return v0
.end method

.method protected updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z
    .registers 9
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 206
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_4

    .line 207
    const/4 v2, 0x0

    .line 236
    :goto_3
    return v2

    .line 209
    :cond_4
    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1ae

    :cond_c
    sget-object v0, Lcom/lge/gallery/data/local/LocalImage;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 211
    .local v0, "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_e
    new-instance v1, Lcom/lge/gallery/util/UpdateHelper;

    invoke-direct {v1}, Lcom/lge/gallery/util/UpdateHelper;-><init>()V

    .line 212
    .local v1, "uh":Lcom/lge/gallery/util/UpdateHelper;
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    const-string v2, "_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->id:I

    .line 213
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->caption:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->caption:Ljava/lang/String;

    .line 214
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    const-string v2, "mime_type"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mimeType:Ljava/lang/String;

    .line 215
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->latitude:D

    const-string v2, "latitude"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->latitude:D

    .line 216
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->longitude:D

    const-string v2, "longitude"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->longitude:D

    .line 217
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->dateTakenInMs:J

    const-string v2, "datetaken"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->dateTakenInMs:J

    .line 219
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->dateAddedInSec:J

    const-string v2, "date_added"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->dateAddedInSec:J

    .line 221
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->dateModifiedInSec:J

    const-string v2, "date_modified"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->dateModifiedInSec:J

    .line 223
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    const-string v2, "_data"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalImage;->filePath:Ljava/lang/String;

    .line 224
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    const-string v2, "orientation"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->rotation:I

    .line 225
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->bucketId:I

    const-string v2, "bucket_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->bucketId:I

    .line 226
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalImage;->fileSize:J

    const-string v2, "_size"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalImage;->fileSize:J

    .line 227
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    const-string v2, "width"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->width:I

    .line 228
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    const-string v2, "height"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->height:I

    .line 229
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->mProtectionType:I

    sget-object v2, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mProtectionType:I

    .line 230
    sget-boolean v2, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    if-eqz v2, :cond_19d

    .line 231
    iget v3, p0, Lcom/lge/gallery/data/local/LocalImage;->mCameraMode:I

    const-string v2, "camera_mode"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalImage;->mCameraMode:I

    .line 233
    :cond_19d
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalImage;->updateCameraMode()V

    .line 234
    const-string v2, "Local - load"

    invoke-direct {p0, v2}, Lcom/lge/gallery/data/local/LocalImage;->printFieldInfo(Ljava/lang/String;)V

    .line 235
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalImage;->clearCachedOperation()V

    .line 236
    invoke-virtual {v1}, Lcom/lge/gallery/util/UpdateHelper;->isUpdated()Z

    move-result v2

    goto/16 :goto_3

    .end local v0    # "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v1    # "uh":Lcom/lge/gallery/util/UpdateHelper;
    :cond_1ae
    move-object v0, p2

    .line 209
    goto/16 :goto_e
.end method
