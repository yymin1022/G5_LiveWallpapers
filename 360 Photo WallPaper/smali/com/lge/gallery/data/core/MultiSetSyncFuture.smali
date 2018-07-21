.class Lcom/lge/gallery/data/core/MultiSetSyncFuture;
.super Ljava/lang/Object;
.source "MultiSetSyncFuture.java"

# interfaces
.implements Lcom/lge/gallery/util/Future;
.implements Lcom/lge/gallery/data/core/SyncListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/Future",
        "<",
        "Ljava/lang/Integer;",
        ">;",
        "Lcom/lge/gallery/data/core/SyncListener;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Gallery.MultiSetSync"


# instance fields
.field private final mFutures:[Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mIsCancelled:Z

.field private final mListener:Lcom/lge/gallery/data/core/SyncListener;

.field private final mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

.field private mPendingCount:I

.field private mResult:I


# direct methods
.method constructor <init>(Lcom/lge/gallery/data/core/MediaSet;[Lcom/lge/gallery/data/core/MediaSet;Lcom/lge/gallery/data/core/SyncListener;)V
    .registers 9
    .param p1, "callerSet"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "sets"    # [Lcom/lge/gallery/data/core/MediaSet;
    .param p3, "listener"    # Lcom/lge/gallery/data/core/SyncListener;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mIsCancelled:Z

    .line 23
    const/4 v2, -0x1

    iput v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I

    .line 27
    iput-object p1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 28
    iput-object p3, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mListener:Lcom/lge/gallery/data/core/SyncListener;

    .line 29
    array-length v2, p2

    iput v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I

    .line 30
    array-length v2, p2

    new-array v2, v2, [Lcom/lge/gallery/util/Future;

    iput-object v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mFutures:[Lcom/lge/gallery/util/Future;

    .line 32
    monitor-enter p0

    .line 33
    const/4 v0, 0x0

    .local v0, "i":I
    :try_start_17
    array-length v1, p2

    .local v1, "n":I
    :goto_18
    if-ge v0, v1, :cond_49

    .line 34
    iget-object v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mFutures:[Lcom/lge/gallery/util/Future;

    aget-object v3, p2, v0

    invoke-virtual {v3, p0}, Lcom/lge/gallery/data/core/MediaSet;->requestSync(Lcom/lge/gallery/data/core/SyncListener;)Lcom/lge/gallery/util/Future;

    move-result-object v3

    aput-object v3, v2, v0

    .line 35
    const-string v2, "Gallery.MultiSetSync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  request sync: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, p2, v0

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/lge/gallery/common/Utils;->maskDebugInfo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 37
    :cond_49
    monitor-exit p0

    .line 38
    return-void

    .line 37
    .end local v1    # "n":I
    :catchall_4b
    move-exception v2

    monitor-exit p0
    :try_end_4d
    .catchall {:try_start_17 .. :try_end_4d} :catchall_4b

    throw v2
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .registers 6

    .prologue
    .line 42
    monitor-enter p0

    :try_start_1
    iget-boolean v4, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mIsCancelled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_20

    if-eqz v4, :cond_7

    .line 52
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 45
    :cond_7
    const/4 v4, 0x1

    :try_start_8
    iput-boolean v4, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mIsCancelled:Z

    .line 46
    iget-object v0, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mFutures:[Lcom/lge/gallery/util/Future;

    .local v0, "arr$":[Lcom/lge/gallery/util/Future;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_18

    aget-object v1, v0, v2

    .line 47
    .local v1, "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Ljava/lang/Integer;>;"
    invoke-interface {v1}, Lcom/lge/gallery/util/Future;->cancel()V

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 49
    .end local v1    # "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Ljava/lang/Integer;>;"
    :cond_18
    iget v4, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I

    if-gez v4, :cond_5

    .line 50
    const/4 v4, 0x1

    iput v4, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I
    :try_end_1f
    .catchall {:try_start_8 .. :try_end_1f} :catchall_20

    goto :goto_5

    .line 42
    .end local v0    # "arr$":[Lcom/lge/gallery/util/Future;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_20
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized get()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 66
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->waitDone()V

    .line 67
    iget v0, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_c

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 66
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 16
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->get()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized isCancelled()Z
    .registers 2

    .prologue
    .line 56
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mIsCancelled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isDone()Z
    .registers 2

    .prologue
    .line 61
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_6

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onSyncDone(Lcom/lge/gallery/data/core/MediaSet;I)V
    .registers 7
    .param p1, "mediaSet"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "resultCode"    # I

    .prologue
    const/4 v1, 0x2

    .line 84
    const/4 v0, 0x0

    .line 85
    .local v0, "listener":Lcom/lge/gallery/data/core/SyncListener;
    monitor-enter p0

    .line 86
    if-ne p2, v1, :cond_8

    .line 87
    const/4 v1, 0x2

    :try_start_6
    iput v1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I

    .line 89
    :cond_8
    iget v1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I

    .line 90
    iget v1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I

    if-nez v1, :cond_17

    .line 91
    iget-object v0, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mListener:Lcom/lge/gallery/data/core/SyncListener;

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 94
    :cond_17
    const-string v1, "Gallery.MultiSetSync"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSyncDone: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lge/gallery/common/Utils;->maskDebugInfo(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " #pending="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mPendingCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_6 .. :try_end_44} :catchall_4e

    .line 97
    if-eqz v0, :cond_4d

    .line 98
    iget-object v1, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    iget v2, p0, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->mResult:I

    invoke-interface {v0, v1, v2}, Lcom/lge/gallery/data/core/SyncListener;->onSyncDone(Lcom/lge/gallery/data/core/MediaSet;I)V

    .line 100
    :cond_4d
    return-void

    .line 96
    :catchall_4e
    move-exception v1

    :try_start_4f
    monitor-exit p0
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_4e

    throw v1
.end method

.method public declared-synchronized waitDone()V
    .registers 4

    .prologue
    .line 73
    monitor-enter p0

    :goto_1
    :try_start_1
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MultiSetSyncFuture;->isDone()Z

    move-result v1

    if-nez v1, :cond_13

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_a} :catch_b
    .catchall {:try_start_1 .. :try_end_a} :catchall_15

    goto :goto_1

    .line 76
    :catch_b
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_c
    const-string v1, "Gallery.MultiSetSync"

    const-string v2, "waitDone() interrupted"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catchall {:try_start_c .. :try_end_13} :catchall_15

    .line 79
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_13
    monitor-exit p0

    return-void

    .line 73
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method
