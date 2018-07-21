.class public Lcom/lge/gallery/app/AlbumDataAdapter;
.super Ljava/lang/Object;
.source "AlbumDataAdapter.java"

# interfaces
.implements Lcom/lge/gallery/common/DataModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;,
        Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;,
        Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;,
        Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;,
        Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;
    }
.end annotation


# static fields
.field private static final DATA_CACHE_SIZE:I = 0x3e8

.field private static final MAX_LOAD_COUNT:I = 0x40

.field private static final MIN_LOAD_COUNT:I = 0x20

.field private static final MSG_LOAD_FINISH:I = 0x2

.field private static final MSG_LOAD_INITIAL:I = 0x4

.field private static final MSG_LOAD_START:I = 0x1

.field private static final MSG_RUN_OBJECT:I = 0x3

.field private static final TAG:Ljava/lang/String; = "AlbumDataAdapter"


# instance fields
.field private mActiveEnd:I

.field private mActiveStart:I

.field private mContentEnd:I

.field private mContentStart:I

.field private final mData:[Lcom/lge/gallery/data/core/MediaItem;

.field private mIsActive:Z

.field private final mIsSyncModeSupported:Z

.field private final mItemVersion:[J

.field private mLoadingListener:Lcom/lge/gallery/common/LoadingListener;

.field private final mMainHandler:Landroid/os/Handler;

.field private mModelListener:Lcom/lge/gallery/common/ModelListener;

.field private mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

.field private final mSetVersion:[J

.field private mSize:I

.field protected final mSource:Lcom/lge/gallery/data/core/MediaSet;

.field private mSourceListener:Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;

.field private mSourceVersion:J

.field private mVersion:J


# direct methods
.method public constructor <init>(Lcom/lge/gallery/app/Lockable;Lcom/lge/gallery/data/core/MediaSet;Z)V
    .registers 10
    .param p1, "context"    # Lcom/lge/gallery/app/Lockable;
    .param p2, "mediaSet"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p3, "supportSyncMode"    # Z

    .prologue
    const-wide/16 v4, -0x1

    const/16 v2, 0x3e8

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    .line 53
    iput v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    .line 54
    iput v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    .line 55
    iput v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    .line 58
    iput-wide v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceVersion:J

    .line 61
    iput v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    .line 64
    new-instance v0, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$1;)V

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceListener:Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;

    .line 414
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mVersion:J

    .line 71
    iput-object p2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    .line 73
    new-array v0, v2, [Lcom/lge/gallery/data/core/MediaItem;

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    .line 74
    new-array v0, v2, [J

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mItemVersion:[J

    .line 75
    new-array v0, v2, [J

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSetVersion:[J

    .line 76
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mItemVersion:[J

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->fill([JJ)V

    .line 77
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSetVersion:[J

    invoke-static {v0, v4, v5}, Ljava/util/Arrays;->fill([JJ)V

    .line 79
    new-instance v0, Lcom/lge/gallery/app/AlbumDataAdapter$1;

    invoke-direct {v0, p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter$1;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/Lockable;)V

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mMainHandler:Landroid/os/Handler;

    .line 106
    iput-boolean p3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsSyncModeSupported:Z

    .line 107
    return-void
.end method

.method static synthetic access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mLoadingListener:Lcom/lge/gallery/common/LoadingListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/lge/gallery/app/AlbumDataAdapter;)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;

    .prologue
    .line 39
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    return v0
.end method

.method static synthetic access$1100(Lcom/lge/gallery/app/AlbumDataAdapter;I)V
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->setSize(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/lge/gallery/app/AlbumDataAdapter;J)Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .registers 4
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # J

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/app/AlbumDataAdapter;->getSyncUpdateInfo(J)Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;)Ljava/util/ArrayList;
    .registers 3
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->syncUpdateContent(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lcom/lge/gallery/app/AlbumDataAdapter;Ljava/lang/Runnable;)V
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->executeFirst(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$300(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    return-object v0
.end method

.method static synthetic access$500(Lcom/lge/gallery/app/AlbumDataAdapter;I)V
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->notifySizedChanged(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/lge/gallery/app/AlbumDataAdapter;I)V
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->notifyOnWindowContentChanged(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/lge/gallery/app/AlbumDataAdapter;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$802(Lcom/lge/gallery/app/AlbumDataAdapter;J)J
    .registers 4
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p1, "x1"    # J

    .prologue
    .line 39
    iput-wide p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mVersion:J

    return-wide p1
.end method

.method static synthetic access$900(Lcom/lge/gallery/app/AlbumDataAdapter;)J
    .registers 3
    .param p0, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceVersion:J

    return-wide v0
.end method

.method private clearSlot(I)V
    .registers 6
    .param p1, "slotIndex"    # I

    .prologue
    const-wide/16 v2, -0x1

    .line 192
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    const/4 v1, 0x0

    aput-object v1, v0, p1

    .line 193
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mItemVersion:[J

    aput-wide v2, v0, p1

    .line 194
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSetVersion:[J

    aput-wide v2, v0, p1

    .line 195
    return-void
.end method

.method private executeAndWait(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 281
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    new-instance v1, Ljava/util/concurrent/FutureTask;

    invoke-direct {v1, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 282
    .local v1, "task":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<TT;>;"
    iget-object v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mMainHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mMainHandler:Landroid/os/Handler;

    const/4 v4, 0x3

    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 285
    :try_start_11
    invoke-virtual {v1}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_14} :catch_16
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_11 .. :try_end_14} :catch_19

    move-result-object v2

    .line 287
    :goto_15
    return-object v2

    .line 286
    :catch_16
    move-exception v0

    .line 287
    .local v0, "e":Ljava/lang/InterruptedException;
    const/4 v2, 0x0

    goto :goto_15

    .line 288
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_19
    move-exception v0

    .line 289
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private executeFirst(Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 277
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 278
    return-void
.end method

.method private findDirty(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;JII)Z
    .registers 16
    .param p1, "info"    # Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .param p2, "currentVersion"    # J
    .param p4, "start"    # I
    .param p5, "end"    # I

    .prologue
    const/4 v6, 0x0

    .line 323
    if-gez p4, :cond_4

    .line 336
    :cond_3
    :goto_3
    return v6

    .line 326
    :cond_4
    move-wide v4, p2

    .line 327
    .local v4, "version":J
    iget-object v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSetVersion:[J

    .line 328
    .local v3, "setVersion":[J
    move v0, p4

    .local v0, "i":I
    move v2, p5

    .local v2, "n":I
    :goto_9
    if-ge v0, v2, :cond_3

    .line 329
    rem-int/lit16 v1, v0, 0x3e8

    .line 330
    .local v1, "index":I
    aget-wide v8, v3, v1

    cmp-long v7, v8, v4

    if-eqz v7, :cond_21

    .line 331
    iput v0, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadStart:I

    .line 332
    const/16 v6, 0x40

    sub-int v7, v2, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    iput v6, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadCount:I

    .line 333
    const/4 v6, 0x1

    goto :goto_3

    .line 328
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method private getSyncUpdateInfo(J)Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .registers 10
    .param p1, "version"    # J

    .prologue
    const/4 v6, 0x0

    .line 304
    new-instance v1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;

    invoke-direct {v1, v6}, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter$1;)V

    .line 305
    .local v1, "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    iput-wide p1, v1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->version:J

    .line 306
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    iput v0, v1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->size:I

    .line 307
    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    iget v5, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/app/AlbumDataAdapter;->findDirty(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;JII)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 316
    .end local v1    # "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    :cond_18
    :goto_18
    return-object v1

    .line 310
    .restart local v1    # "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    :cond_19
    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    iget v5, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/app/AlbumDataAdapter;->findDirty(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;JII)Z

    move-result v0

    if-nez v0, :cond_18

    .line 313
    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    iget v5, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/app/AlbumDataAdapter;->findDirty(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;JII)Z

    move-result v0

    if-nez v0, :cond_18

    .line 316
    iget-wide v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceVersion:J

    cmp-long v0, v2, p1

    if-nez v0, :cond_18

    move-object v1, v6

    goto :goto_18
.end method

.method private notifyOnWindowContentChanged(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 117
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mModelListener:Lcom/lge/gallery/common/ModelListener;

    .line 118
    .local v0, "modellistener":Lcom/lge/gallery/common/ModelListener;
    if-eqz v0, :cond_7

    .line 119
    invoke-interface {v0, p1}, Lcom/lge/gallery/common/ModelListener;->onWindowContentChanged(I)V

    .line 121
    :cond_7
    return-void
.end method

.method private notifySizedChanged(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 110
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mModelListener:Lcom/lge/gallery/common/ModelListener;

    .line 111
    .local v0, "modellistener":Lcom/lge/gallery/common/ModelListener;
    if-eqz v0, :cond_7

    .line 112
    invoke-interface {v0, p1}, Lcom/lge/gallery/common/ModelListener;->onSizeChanged(I)V

    .line 114
    :cond_7
    return-void
.end method

.method private notifySizedChangedEvent(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 407
    iget-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsSyncModeSupported:Z

    if-eqz v0, :cond_8

    .line 408
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->notifySizedChanged(I)V

    .line 412
    :goto_7
    return-void

    .line 410
    :cond_8
    new-instance v0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;

    invoke-direct {v0, p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;I)V

    invoke-direct {p0, v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->executeFirst(Ljava/lang/Runnable;)V

    goto :goto_7
.end method

.method private setActiveWindowInternal(II)V
    .registers 13
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 227
    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    .line 228
    .local v3, "size":I
    if-gt p1, p2, :cond_3b

    sub-int v4, p2, p1

    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    array-length v7, v7

    if-gt v4, v7, :cond_3b

    if-gt p2, v3, :cond_3b

    move v4, v5

    :goto_10
    const-string v7, "start = %s, end = %s, length = %s, size = %s"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const/4 v5, 0x2

    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    array-length v9, v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const/4 v5, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    invoke-static {v4, v7, v8}, Lcom/lge/gallery/common/Utils;->assertTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 234
    iget-object v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    array-length v2, v4

    .line 237
    .local v2, "length":I
    if-ne p1, p2, :cond_3d

    .line 248
    :cond_3a
    :goto_3a
    return-void

    .end local v2    # "length":I
    :cond_3b
    move v4, v6

    .line 228
    goto :goto_10

    .line 241
    .restart local v2    # "length":I
    :cond_3d
    add-int v4, p1, p2

    div-int/lit8 v4, v4, 0x2

    div-int/lit8 v5, v2, 0x2

    sub-int/2addr v4, v5

    sub-int v5, v3, v2

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {v4, v6, v5}, Lcom/lge/gallery/common/Utils;->clamp(III)I

    move-result v1

    .line 243
    .local v1, "contentStart":I
    add-int v4, v1, v2

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 244
    .local v0, "contentEnd":I
    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    if-gt v4, p1, :cond_68

    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    if-lt v4, p2, :cond_68

    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    sub-int v4, v1, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    const/16 v5, 0x20

    if-le v4, v5, :cond_3a

    .line 246
    :cond_68
    invoke-direct {p0, v1, v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->setContentWindow(II)V

    goto :goto_3a
.end method

.method private setContentWindow(II)V
    .registers 8
    .param p1, "contentStart"    # I
    .param p2, "contentEnd"    # I

    .prologue
    .line 198
    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    if-ne p1, v4, :cond_9

    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    if-ne p2, v4, :cond_9

    .line 224
    :cond_8
    :goto_8
    return-void

    .line 201
    :cond_9
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    .line 202
    .local v0, "end":I
    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    .line 205
    .local v3, "start":I
    monitor-enter p0

    .line 206
    :try_start_e
    iput p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    .line 207
    iput p2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    .line 208
    monitor-exit p0
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_23

    .line 209
    if-ge p1, v0, :cond_17

    if-lt v3, p2, :cond_26

    .line 210
    :cond_17
    move v1, v3

    .local v1, "i":I
    move v2, v0

    .local v2, "n":I
    :goto_19
    if-ge v1, v2, :cond_3d

    .line 211
    rem-int/lit16 v4, v1, 0x3e8

    invoke-direct {p0, v4}, Lcom/lge/gallery/app/AlbumDataAdapter;->clearSlot(I)V

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 208
    .end local v1    # "i":I
    .end local v2    # "n":I
    :catchall_23
    move-exception v4

    :try_start_24
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw v4

    .line 214
    :cond_26
    move v1, v3

    .restart local v1    # "i":I
    :goto_27
    if-ge v1, p1, :cond_31

    .line 215
    rem-int/lit16 v4, v1, 0x3e8

    invoke-direct {p0, v4}, Lcom/lge/gallery/app/AlbumDataAdapter;->clearSlot(I)V

    .line 214
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 217
    :cond_31
    move v1, p2

    move v2, v0

    .restart local v2    # "n":I
    :goto_33
    if-ge v1, v2, :cond_3d

    .line 218
    rem-int/lit16 v4, v1, 0x3e8

    invoke-direct {p0, v4}, Lcom/lge/gallery/app/AlbumDataAdapter;->clearSlot(I)V

    .line 217
    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    .line 221
    :cond_3d
    iget-object v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    if-eqz v4, :cond_8

    .line 222
    iget-object v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    invoke-virtual {v4}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->notifyDirty()V

    goto :goto_8
.end method

.method private setSize(I)V
    .registers 6
    .param p1, "size"    # I

    .prologue
    .line 177
    iput p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    .line 178
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->notifySizedChangedEvent(I)V

    .line 179
    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 180
    .local v0, "end":I
    iget v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    .local v1, "i":I
    :goto_f
    if-ge v1, v0, :cond_19

    .line 181
    rem-int/lit16 v2, v1, 0x3e8

    invoke-direct {p0, v2}, Lcom/lge/gallery/app/AlbumDataAdapter;->clearSlot(I)V

    .line 180
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 183
    :cond_19
    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    if-le v2, v3, :cond_23

    .line 184
    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    iput v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    .line 186
    :cond_23
    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    if-le v2, v3, :cond_2d

    .line 187
    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    iput v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    .line 189
    :cond_2d
    return-void
.end method

.method private syncUpdateContent(Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;)Ljava/util/ArrayList;
    .registers 14
    .param p1, "info"    # Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 370
    iget-wide v10, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->version:J

    iput-wide v10, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceVersion:J

    .line 371
    iget v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    iget v10, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->size:I

    if-eq v9, v10, :cond_f

    .line 372
    iget v9, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->size:I

    invoke-direct {p0, v9}, Lcom/lge/gallery/app/AlbumDataAdapter;->setSize(I)V

    .line 375
    :cond_f
    iget-object v6, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->items:Ljava/util/ArrayList;

    .line 376
    .local v6, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 378
    .local v0, "dirtyItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-nez v6, :cond_20

    .line 379
    const-string v9, "AlbumDataAdapter"

    const-string v10, "syncUpdateContent. info.items is null. it may not have been loaded yet."

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    :cond_1f
    return-object v0

    .line 383
    :cond_20
    iget v9, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadStart:I

    iget v10, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentStart:I

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 384
    .local v7, "start":I
    iget v9, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadStart:I

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v9, v10

    iget v10, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mContentEnd:I

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 386
    .local v1, "end":I
    move v2, v7

    .local v2, "i":I
    :goto_36
    if-ge v2, v1, :cond_1f

    .line 387
    rem-int/lit16 v3, v2, 0x3e8

    .line 388
    .local v3, "index":I
    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSetVersion:[J

    iget-wide v10, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->version:J

    aput-wide v10, v9, v3

    .line 389
    iget v9, p1, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadStart:I

    sub-int v9, v2, v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/lge/gallery/data/core/MediaItem;

    .line 390
    .local v8, "updateItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz v8, :cond_1f

    .line 393
    invoke-virtual {v8}, Lcom/lge/gallery/data/core/MediaItem;->getDataVersion()J

    move-result-wide v4

    .line 394
    .local v4, "itemVersion":J
    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mItemVersion:[J

    aget-wide v10, v9, v3

    cmp-long v9, v10, v4

    if-eqz v9, :cond_6f

    .line 395
    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mItemVersion:[J

    aput-wide v4, v9, v3

    .line 396
    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    aput-object v8, v9, v3

    .line 397
    iget v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    if-lt v2, v9, :cond_6f

    iget v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    if-ge v2, v9, :cond_6f

    .line 398
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_36
.end method


# virtual methods
.method public get(I)Lcom/lge/gallery/data/core/MediaItem;
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 148
    invoke-virtual {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->isActive(I)Z

    move-result v0

    if-nez v0, :cond_2e

    .line 149
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "%s not in (%s, %s)"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_2e
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    iget-object v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mData:[Lcom/lge/gallery/data/core/MediaItem;

    array-length v1, v1

    rem-int v1, p1, v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getActiveEnd()I
    .registers 2

    .prologue
    .line 161
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    return v0
.end method

.method public getActiveStart()I
    .registers 2

    .prologue
    .line 157
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    return v0
.end method

.method public getDataVersion()J
    .registers 3

    .prologue
    .line 418
    iget-wide v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mVersion:J

    return-wide v0
.end method

.method public getMediaObject(I)Lcom/lge/gallery/data/core/MediaObject;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 518
    invoke-virtual {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter;->get(I)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method public isActive(I)Z
    .registers 9
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 165
    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    if-lt p1, v3, :cond_33

    iget v3, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    if-ge p1, v3, :cond_33

    move v0, v1

    .line 166
    .local v0, "isActive":Z
    :goto_b
    if-nez v0, :cond_32

    .line 167
    const-string v3, "AlbumDataAdapter"

    const-string v4, "%s not in (%s, %s)"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    const/4 v1, 0x2

    iget v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_32
    return v0

    .end local v0    # "isActive":Z
    :cond_33
    move v0, v2

    .line 165
    goto :goto_b
.end method

.method public pause()V
    .registers 3

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsActive:Z

    if-nez v0, :cond_5

    .line 145
    :goto_4
    return-void

    .line 139
    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    if-eqz v0, :cond_11

    .line 140
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    invoke-virtual {v0}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->terminate()V

    .line 141
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    .line 143
    :cond_11
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    iget-object v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceListener:Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/core/MediaSet;->removeContentListener(Lcom/lge/gallery/data/core/ContentListener;)V

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsActive:Z

    goto :goto_4
.end method

.method public resume()V
    .registers 3

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsActive:Z

    if-eqz v0, :cond_5

    .line 132
    :goto_4
    return-void

    .line 128
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mIsActive:Z

    .line 129
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    iget-object v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSourceListener:Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;

    invoke-virtual {v0, v1}, Lcom/lge/gallery/data/core/MediaSet;->addContentListener(Lcom/lge/gallery/data/core/ContentListener;)V

    .line 130
    new-instance v0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$1;)V

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    .line 131
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mReloadTask:Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    invoke-virtual {v0}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->start()V

    goto :goto_4
.end method

.method public declared-synchronized setActiveWindow(II)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 251
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    if-ne p1, v0, :cond_b

    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_13

    if-ne p2, v0, :cond_b

    .line 257
    :goto_9
    monitor-exit p0

    return-void

    .line 254
    :cond_b
    :try_start_b
    iput p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveStart:I

    .line 255
    iput p2, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mActiveEnd:I

    .line 256
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/app/AlbumDataAdapter;->setActiveWindowInternal(II)V
    :try_end_12
    .catchall {:try_start_b .. :try_end_12} :catchall_13

    goto :goto_9

    .line 251
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setLoadingListener(Lcom/lge/gallery/common/LoadingListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/lge/gallery/common/LoadingListener;

    .prologue
    .line 273
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mLoadingListener:Lcom/lge/gallery/common/LoadingListener;

    .line 274
    return-void
.end method

.method public setModelListener(Lcom/lge/gallery/common/ModelListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/lge/gallery/common/ModelListener;

    .prologue
    .line 268
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mModelListener:Lcom/lge/gallery/common/ModelListener;

    .line 269
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 173
    iget v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter;->mSize:I

    return v0
.end method
