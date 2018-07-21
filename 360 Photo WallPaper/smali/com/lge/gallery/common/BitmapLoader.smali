.class public abstract Lcom/lge/gallery/common/BitmapLoader;
.super Ljava/lang/Object;
.source "BitmapLoader.java"

# interfaces
.implements Lcom/lge/gallery/util/FutureListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/FutureListener",
        "<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field private static final STATE_CANCELD:I = 0x5

.field private static final STATE_ERROR:I = 0x3

.field private static final STATE_INIT:I = 0x0

.field private static final STATE_LOADED:I = 0x2

.field private static final STATE_RECYCLED:I = 0x4

.field private static final STATE_REQUESTED:I = 0x1


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mState:I

.field private mTask:Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    return-void
.end method


# virtual methods
.method public declared-synchronized cancelLoad()V
    .registers 3

    .prologue
    .line 80
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    .line 81
    const/4 v0, 0x5

    iput v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    .line 82
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    if-eqz v0, :cond_12

    .line 83
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    invoke-interface {v0}, Lcom/lge/gallery/util/Future;->cancel()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 86
    :cond_12
    monitor-exit p0

    return-void

    .line 80
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 109
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isCanceled()Z
    .registers 3

    .prologue
    .line 113
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    const/4 v1, 0x5

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_7
    monitor-exit p0

    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_7

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isRecycled()Z
    .registers 3

    .prologue
    .line 105
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_7
    monitor-exit p0

    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_7

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isRequestInProgress()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 101
    monitor-enter p0

    :try_start_2
    iget v1, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_a

    if-ne v1, v0, :cond_8

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

.method public onFutureDone(Lcom/lge/gallery/util/Future;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<Landroid/graphics/Bitmap;>;"
    monitor-enter p0

    .line 49
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    .line 50
    invoke-interface {p1}, Lcom/lge/gallery/util/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    .line 51
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1f

    .line 52
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1d

    .line 53
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/lge/gallery/data/util/BitmapPoolSelector;->recycle(Landroid/graphics/Bitmap;)V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    .line 56
    :cond_1d
    monitor-exit p0

    .line 68
    :goto_1e
    return-void

    .line 58
    :cond_1f
    invoke-interface {p1}, Lcom/lge/gallery/util/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_39

    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_39

    .line 59
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_34

    .line 60
    invoke-virtual {p0, p0}, Lcom/lge/gallery/common/BitmapLoader;->submitBitmapTask(Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    .line 62
    :cond_34
    monitor-exit p0

    goto :goto_1e

    .line 66
    :catchall_36
    move-exception v0

    monitor-exit p0
    :try_end_38
    .catchall {:try_start_2 .. :try_end_38} :catchall_36

    throw v0

    .line 64
    :cond_39
    :try_start_39
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_47

    const/4 v0, 0x3

    :goto_3e
    iput v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    .line 66
    monitor-exit p0
    :try_end_41
    .catchall {:try_start_39 .. :try_end_41} :catchall_36

    .line 67
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/lge/gallery/common/BitmapLoader;->onLoadComplete(Landroid/graphics/Bitmap;)V

    goto :goto_1e

    .line 64
    :cond_47
    const/4 v0, 0x2

    goto :goto_3e
.end method

.method protected abstract onLoadComplete(Landroid/graphics/Bitmap;)V
.end method

.method public declared-synchronized recycle()V
    .registers 2

    .prologue
    .line 90
    monitor-enter p0

    const/4 v0, 0x4

    :try_start_2
    iput v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    .line 91
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_10

    .line 92
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/lge/gallery/data/util/BitmapPoolSelector;->recycle(Landroid/graphics/Bitmap;)V

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mBitmap:Landroid/graphics/Bitmap;

    .line 95
    :cond_10
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    if-eqz v0, :cond_19

    .line 96
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    invoke-interface {v0}, Lcom/lge/gallery/util/Future;->cancel()V
    :try_end_19
    .catchall {:try_start_2 .. :try_end_19} :catchall_1b

    .line 98
    :cond_19
    monitor-exit p0

    return-void

    .line 90
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startLoad()V
    .registers 3

    .prologue
    .line 71
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_17

    .line 72
    :cond_a
    const/4 v0, 0x1

    iput v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mState:I

    .line 73
    iget-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;

    if-nez v0, :cond_17

    .line 74
    invoke-virtual {p0, p0}, Lcom/lge/gallery/common/BitmapLoader;->submitBitmapTask(Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/common/BitmapLoader;->mTask:Lcom/lge/gallery/util/Future;
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_19

    .line 77
    :cond_17
    monitor-exit p0

    return-void

    .line 71
    :catchall_19
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract submitBitmapTask(Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/FutureListener",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/lge/gallery/util/Future",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end method
