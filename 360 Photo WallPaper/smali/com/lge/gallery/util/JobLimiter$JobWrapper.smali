.class Lcom/lge/gallery/util/JobLimiter$JobWrapper;
.super Ljava/lang/Object;
.source "JobLimiter.java"

# interfaces
.implements Lcom/lge/gallery/util/Future;
.implements Lcom/lge/gallery/util/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/util/JobLimiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JobWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/Future",
        "<TT;>;",
        "Lcom/lge/gallery/util/ThreadPool$Job",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mDelegate:Lcom/lge/gallery/util/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/Future",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mJob:Lcom/lge/gallery/util/ThreadPool$Job;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mListener:Lcom/lge/gallery/util/FutureListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/FutureListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mState:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<TT;>;",
            "Lcom/lge/gallery/util/FutureListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    .local p1, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    .local p2, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    .line 50
    iput-object p1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    .line 51
    iput-object p2, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 52
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 4

    .prologue
    .line 63
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    const/4 v0, 0x0

    .line 64
    .local v0, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    monitor-enter p0

    .line 65
    :try_start_2
    iget v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1b

    .line 66
    iget-object v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 67
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    .line 68
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 69
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mDelegate:Lcom/lge/gallery/util/Future;

    if-eqz v1, :cond_1b

    .line 70
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mDelegate:Lcom/lge/gallery/util/Future;

    invoke-interface {v1}, Lcom/lge/gallery/util/Future;->cancel()V

    .line 71
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mDelegate:Lcom/lge/gallery/util/Future;

    .line 74
    :cond_1b
    const/4 v1, 0x2

    iput v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    .line 75
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mResult:Ljava/lang/Object;

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 77
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_2 .. :try_end_25} :catchall_2b

    .line 78
    if-eqz v0, :cond_2a

    .line 79
    invoke-interface {v0, p0}, Lcom/lge/gallery/util/FutureListener;->onFutureDone(Lcom/lge/gallery/util/Future;)V

    .line 81
    :cond_2a
    return-void

    .line 77
    :catchall_2b
    move-exception v1

    :try_start_2c
    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    monitor-enter p0

    :goto_1
    :try_start_1
    iget v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    if-nez v0, :cond_c

    .line 98
    invoke-static {p0}, Lcom/lge/gallery/common/Utils;->waitWithoutInterrupt(Ljava/lang/Object;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_9

    goto :goto_1

    .line 96
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0

    .line 100
    :cond_c
    :try_start_c
    iget-object v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mResult:Ljava/lang/Object;
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_9

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized isCancelled()Z
    .registers 3

    .prologue
    .line 85
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    const/4 v1, 0x2

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

.method public isDone()Z
    .registers 2

    .prologue
    .line 91
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    iget v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 11
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/ThreadPool$JobContext;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    const/4 v8, 0x2

    const/4 v4, 0x0

    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    monitor-enter p0

    .line 112
    :try_start_4
    iget v5, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    if-ne v5, v8, :cond_b

    .line 113
    monitor-exit p0

    move-object v2, v4

    .line 138
    :cond_a
    :goto_a
    return-object v2

    .line 115
    :cond_b
    iget-object v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    .line 116
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_1c

    .line 117
    const/4 v2, 0x0

    .line 119
    .local v2, "result":Ljava/lang/Object;, "TT;"
    :try_start_f
    invoke-interface {v0, p1}, Lcom/lge/gallery/util/ThreadPool$Job;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_12} :catch_1f

    move-result-object v2

    .line 123
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    :goto_13
    const/4 v1, 0x0

    .line 124
    .local v1, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    monitor-enter p0

    .line 125
    :try_start_15
    iget v5, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    if-ne v5, v8, :cond_39

    .line 126
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_15 .. :try_end_1a} :catchall_50

    move-object v2, v4

    goto :goto_a

    .line 116
    .end local v1    # "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    :catchall_1c
    move-exception v4

    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1c

    throw v4

    .line 120
    .restart local v2    # "result":Ljava/lang/Object;, "TT;"
    :catch_1f
    move-exception v3

    .line 121
    .local v3, "t":Ljava/lang/Throwable;
    const-string v5, "JobLimiter"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "error executing job: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_13

    .line 128
    .end local v2    # "result":Ljava/lang/Object;, "TT;"
    .end local v3    # "t":Ljava/lang/Throwable;
    .restart local v1    # "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    :cond_39
    const/4 v4, 0x1

    :try_start_3a
    iput v4, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I

    .line 129
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 130
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 131
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    .line 132
    iput-object v2, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mResult:Ljava/lang/Object;

    .line 133
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 134
    monitor-exit p0
    :try_end_4a
    .catchall {:try_start_3a .. :try_end_4a} :catchall_50

    .line 135
    if-eqz v1, :cond_a

    .line 136
    invoke-interface {v1, p0}, Lcom/lge/gallery/util/FutureListener;->onFutureDone(Lcom/lge/gallery/util/Future;)V

    goto :goto_a

    .line 134
    :catchall_50
    move-exception v4

    :try_start_51
    monitor-exit p0
    :try_end_52
    .catchall {:try_start_51 .. :try_end_52} :catchall_50

    throw v4
.end method

.method public declared-synchronized setFuture(Lcom/lge/gallery/util/Future;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/util/Future",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    .local p1, "future":Lcom/lge/gallery/util/Future;, "Lcom/lge/gallery/util/Future<TT;>;"
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_a

    if-eqz v0, :cond_7

    .line 59
    :goto_5
    monitor-exit p0

    return-void

    .line 58
    :cond_7
    :try_start_7
    iput-object p1, p0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->mDelegate:Lcom/lge/gallery/util/Future;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_a

    goto :goto_5

    .line 55
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public waitDone()V
    .registers 1

    .prologue
    .line 105
    .local p0, "this":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    invoke-virtual {p0}, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->get()Ljava/lang/Object;

    .line 106
    return-void
.end method
