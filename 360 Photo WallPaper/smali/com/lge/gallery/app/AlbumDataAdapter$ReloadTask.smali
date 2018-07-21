.class Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;
.super Ljava/lang/Thread;
.source "AlbumDataAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/app/AlbumDataAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReloadTask"
.end annotation


# static fields
.field private static final INITIAL_RELOAD_COUNT:I = 0x18


# instance fields
.field private volatile mActive:Z

.field private volatile mDirty:Z

.field private mHasBeenLoaded:Z

.field private mIsLoading:Z

.field private mLoadingOptions:Lcom/lge/gallery/data/core/MediaSet$Options;

.field final synthetic this$0:Lcom/lge/gallery/app/AlbumDataAdapter;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;)V
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 436
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 438
    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mActive:Z

    .line 439
    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mDirty:Z

    .line 440
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mIsLoading:Z

    .line 441
    new-instance v0, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mLoadingOptions:Lcom/lge/gallery/data/core/MediaSet$Options;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p2, "x1"    # Lcom/lge/gallery/app/AlbumDataAdapter$1;

    .prologue
    .line 436
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;)V

    return-void
.end method

.method private initialLoaded()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 507
    iget-boolean v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mHasBeenLoaded:Z

    if-nez v1, :cond_12

    .line 508
    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mHasBeenLoaded:Z

    .line 509
    iget-object v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v1}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$700(Lcom/lge/gallery/app/AlbumDataAdapter;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 512
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private updateLoading(Z)V
    .registers 4
    .param p1, "loading"    # Z

    .prologue
    .line 446
    iget-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mIsLoading:Z

    if-ne v0, p1, :cond_5

    .line 451
    :goto_4
    return-void

    .line 449
    :cond_5
    iput-boolean p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mIsLoading:Z

    .line 450
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$700(Lcom/lge/gallery/app/AlbumDataAdapter;)Landroid/os/Handler;

    move-result-object v1

    if-eqz p1, :cond_14

    const/4 v0, 0x1

    :goto_10
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_4

    :cond_14
    const/4 v0, 0x2

    goto :goto_10
.end method


# virtual methods
.method public declared-synchronized notifyDirty()V
    .registers 2

    .prologue
    .line 496
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mDirty:Z

    .line 497
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_9

    .line 498
    monitor-exit p0

    return-void

    .line 496
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 13

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 455
    const/4 v2, 0x0

    .line 456
    .local v2, "updateComplete":Z
    :cond_3
    :goto_3
    iget-boolean v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mActive:Z

    if-eqz v7, :cond_a4

    .line 457
    monitor-enter p0

    .line 458
    :try_start_8
    iget-boolean v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mActive:Z

    if-eqz v7, :cond_1e

    iget-boolean v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mDirty:Z

    if-nez v7, :cond_1e

    if-eqz v2, :cond_1e

    .line 459
    const/4 v7, 0x0

    invoke-direct {p0, v7}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->updateLoading(Z)V

    .line 460
    invoke-static {p0}, Lcom/lge/gallery/common/Utils;->waitWithoutInterrupt(Ljava/lang/Object;)V

    .line 461
    monitor-exit p0

    goto :goto_3

    .line 463
    :catchall_1b
    move-exception v3

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_8 .. :try_end_1d} :catchall_1b

    throw v3

    :cond_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1b

    .line 464
    iput-boolean v6, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mDirty:Z

    .line 465
    invoke-direct {p0, v3}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->updateLoading(Z)V

    .line 467
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v7, v7, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    monitor-enter v7

    .line 468
    :try_start_29
    iget-object v8, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v8, v8, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v8}, Lcom/lge/gallery/data/core/MediaSet;->reload()J

    move-result-wide v4

    .line 469
    .local v4, "version":J
    monitor-exit v7
    :try_end_32
    .catchall {:try_start_29 .. :try_end_32} :catchall_9c

    .line 470
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v7, v4, v5}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$802(Lcom/lge/gallery/app/AlbumDataAdapter;J)J

    .line 471
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v7}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$900(Lcom/lge/gallery/app/AlbumDataAdapter;)J

    move-result-wide v8

    cmp-long v7, v8, v4

    if-eqz v7, :cond_56

    .line 472
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v7, v7, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v7}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v1

    .line 473
    .local v1, "size":I
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v7}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$1000(Lcom/lge/gallery/app/AlbumDataAdapter;)I

    move-result v7

    if-eq v7, v1, :cond_56

    .line 474
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v7, v1}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$1100(Lcom/lge/gallery/app/AlbumDataAdapter;I)V

    .line 477
    .end local v1    # "size":I
    :cond_56
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v7, v4, v5}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$1200(Lcom/lge/gallery/app/AlbumDataAdapter;J)Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;

    move-result-object v0

    .line 478
    .local v0, "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    if-nez v0, :cond_9f

    move v2, v3

    .line 479
    :goto_5f
    if-nez v2, :cond_3

    .line 482
    iget-boolean v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mHasBeenLoaded:Z

    if-nez v7, :cond_6f

    .line 483
    iget v7, v0, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->size:I

    const/16 v8, 0x18

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    iput v7, v0, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadCount:I

    .line 485
    :cond_6f
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v7, v7, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    monitor-enter v7

    .line 486
    :try_start_74
    iget-object v8, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v8, v8, Lcom/lge/gallery/app/AlbumDataAdapter;->mSource:Lcom/lge/gallery/data/core/MediaSet;

    iget v9, v0, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadStart:I

    iget v10, v0, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->reloadCount:I

    iget-object v11, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mLoadingOptions:Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-virtual {v8, v9, v10, v11}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(IILcom/lge/gallery/data/core/MediaSet$Options;)Ljava/util/ArrayList;

    move-result-object v8

    iput-object v8, v0, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;->items:Ljava/util/ArrayList;

    .line 488
    monitor-exit v7
    :try_end_85
    .catchall {:try_start_74 .. :try_end_85} :catchall_a1

    .line 489
    iget-object v7, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    new-instance v8, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;

    iget-object v9, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget-object v10, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v10, v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$1300(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;Ljava/util/ArrayList;)V

    invoke-static {v7, v8}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$1400(Lcom/lge/gallery/app/AlbumDataAdapter;Ljava/lang/Runnable;)V

    .line 490
    invoke-direct {p0}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->initialLoaded()Z

    goto/16 :goto_3

    .line 469
    .end local v0    # "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .end local v4    # "version":J
    :catchall_9c
    move-exception v3

    :try_start_9d
    monitor-exit v7
    :try_end_9e
    .catchall {:try_start_9d .. :try_end_9e} :catchall_9c

    throw v3

    .restart local v0    # "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .restart local v4    # "version":J
    :cond_9f
    move v2, v6

    .line 478
    goto :goto_5f

    .line 488
    :catchall_a1
    move-exception v3

    :try_start_a2
    monitor-exit v7
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_a1

    throw v3

    .line 492
    .end local v0    # "info":Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
    .end local v4    # "version":J
    :cond_a4
    invoke-direct {p0, v6}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->updateLoading(Z)V

    .line 493
    return-void
.end method

.method public declared-synchronized terminate()V
    .registers 2

    .prologue
    .line 501
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mActive:Z

    .line 502
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->mLoadingOptions:Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet$Options;->requestCancel()V

    .line 503
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_e

    .line 504
    monitor-exit p0

    return-void

    .line 501
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method
