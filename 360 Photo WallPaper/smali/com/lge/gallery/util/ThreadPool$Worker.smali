.class Lcom/lge/gallery/util/ThreadPool$Worker;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/lge/gallery/util/Future;
.implements Lcom/lge/gallery/util/ThreadPool$JobContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/util/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Worker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Lcom/lge/gallery/util/Future",
        "<TT;>;",
        "Lcom/lge/gallery/util/ThreadPool$JobContext;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Worker"


# instance fields
.field private mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

.field private volatile mIsCancelled:Z

.field private mIsDone:Z

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

.field private mMode:I

.field private mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

.field final synthetic this$0:Lcom/lge/gallery/util/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/util/ThreadPool;Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)V
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
    .line 121
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    .local p2, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    .local p3, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    iput-object p1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->this$0:Lcom/lge/gallery/util/ThreadPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput-object p2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    .line 123
    iput-object p3, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mListener:Lcom/lge/gallery/util/FutureListener;

    .line 124
    return-void
.end method

.method private acquireResource(Lcom/lge/gallery/util/ThreadPool$ResourceCounter;)Z
    .registers 5
    .param p1, "counter"    # Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .prologue
    .line 233
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    :goto_0
    monitor-enter p0

    .line 234
    :try_start_1
    iget-boolean v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z

    if-eqz v1, :cond_b

    .line 235
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 236
    const/4 v1, 0x0

    monitor-exit p0

    .line 259
    :goto_a
    return v1

    .line 238
    :cond_b
    iput-object p1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 239
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_21

    .line 241
    monitor-enter p1

    .line 242
    :try_start_f
    iget v1, p1, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;->value:I

    if-lez v1, :cond_24

    .line 243
    iget v1, p1, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;->value:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p1, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;->value:I

    .line 244
    monitor-exit p1
    :try_end_1a
    .catchall {:try_start_f .. :try_end_1a} :catchall_29

    .line 255
    monitor-enter p0

    .line 256
    const/4 v1, 0x0

    :try_start_1c
    iput-object v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 257
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1c .. :try_end_1f} :catchall_35

    .line 259
    const/4 v1, 0x1

    goto :goto_a

    .line 239
    :catchall_21
    move-exception v1

    :try_start_22
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v1

    .line 247
    :cond_24
    :try_start_24
    invoke-virtual {p1}, Ljava/lang/Object;->wait()V
    :try_end_27
    .catch Ljava/lang/InterruptedException; {:try_start_24 .. :try_end_27} :catch_2c
    .catchall {:try_start_24 .. :try_end_27} :catchall_29

    .line 252
    :goto_27
    :try_start_27
    monitor-exit p1

    goto :goto_0

    :catchall_29
    move-exception v1

    monitor-exit p1
    :try_end_2b
    .catchall {:try_start_27 .. :try_end_2b} :catchall_29

    throw v1

    .line 248
    :catch_2c
    move-exception v0

    .line 249
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2d
    const-string v1, "Worker"

    const-string v2, "ingore exception"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_34
    .catchall {:try_start_2d .. :try_end_34} :catchall_29

    goto :goto_27

    .line 257
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_35
    move-exception v1

    :try_start_36
    monitor-exit p0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw v1
.end method

.method private modeToCounter(I)Lcom/lge/gallery/util/ThreadPool$ResourceCounter;
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 222
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    const/4 v0, 0x1

    if-ne p1, v0, :cond_8

    .line 223
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->this$0:Lcom/lge/gallery/util/ThreadPool;

    iget-object v0, v0, Lcom/lge/gallery/util/ThreadPool;->mCpuCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 227
    :goto_7
    return-object v0

    .line 224
    :cond_8
    const/4 v0, 0x2

    if-ne p1, v0, :cond_10

    .line 225
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->this$0:Lcom/lge/gallery/util/ThreadPool;

    iget-object v0, v0, Lcom/lge/gallery/util/ThreadPool;->mNetworkCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    goto :goto_7

    .line 227
    :cond_10
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private releaseResource(Lcom/lge/gallery/util/ThreadPool$ResourceCounter;)V
    .registers 3
    .param p1, "counter"    # Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .prologue
    .line 263
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    monitor-enter p1

    .line 264
    :try_start_1
    iget v0, p1, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;->value:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;->value:I

    .line 265
    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 266
    monitor-exit p1

    .line 267
    return-void

    .line 266
    :catchall_c
    move-exception v0

    monitor-exit p1
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .prologue
    .line 153
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    monitor-enter p0

    .line 154
    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z

    if-eqz v0, :cond_7

    .line 155
    monitor-exit p0

    .line 167
    :cond_6
    :goto_6
    return-void

    .line 157
    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z

    .line 158
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

    if-eqz v0, :cond_13

    .line 159
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

    invoke-interface {v0}, Lcom/lge/gallery/util/ThreadPool$CancelListener;->onCancel()V

    .line 161
    :cond_13
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_25

    .line 162
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    if-eqz v0, :cond_6

    .line 163
    iget-object v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    monitor-enter v1

    .line 164
    :try_start_1b
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mWaitOnResource:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 165
    monitor-exit v1

    goto :goto_6

    :catchall_22
    move-exception v0

    monitor-exit v1
    :try_end_24
    .catchall {:try_start_1b .. :try_end_24} :catchall_22

    throw v0

    .line 161
    :catchall_25
    move-exception v0

    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v0
.end method

.method public declared-synchronized get()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    monitor-enter p0

    :goto_1
    :try_start_1
    iget-boolean v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsDone:Z

    if-nez v1, :cond_19

    iget-boolean v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_16

    if-nez v1, :cond_19

    .line 180
    :try_start_9
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_d
    .catchall {:try_start_9 .. :try_end_c} :catchall_16

    goto :goto_1

    .line 181
    :catch_d
    move-exception v0

    .line 182
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_e
    const-string v1, "Worker"

    const-string v2, "ingore exception"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_15
    .catchall {:try_start_e .. :try_end_15} :catchall_16

    goto :goto_1

    .line 178
    .end local v0    # "ex":Ljava/lang/Exception;
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1

    .line 185
    :cond_19
    :try_start_19
    iget-object v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mResult:Ljava/lang/Object;
    :try_end_1b
    .catchall {:try_start_19 .. :try_end_1b} :catchall_16

    monitor-exit p0

    return-object v1
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 170
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    iget-boolean v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z

    return v0
.end method

.method public declared-synchronized isDone()Z
    .registers 2

    .prologue
    .line 174
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsDone:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 5

    .prologue
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    const/4 v2, 0x1

    .line 128
    const/4 v1, 0x0

    .line 132
    .local v1, "result":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v2}, Lcom/lge/gallery/util/ThreadPool$Worker;->setMode(I)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 134
    :try_start_8
    iget-object v2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mJob:Lcom/lge/gallery/util/ThreadPool$Job;

    invoke-interface {v2, p0}, Lcom/lge/gallery/util/ThreadPool$Job;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_d} :catch_26

    move-result-object v1

    .line 140
    .end local v1    # "result":Ljava/lang/Object;, "TT;"
    :cond_e
    :goto_e
    monitor-enter p0

    .line 141
    const/4 v2, 0x0

    :try_start_10
    invoke-virtual {p0, v2}, Lcom/lge/gallery/util/ThreadPool$Worker;->setMode(I)Z

    .line 142
    iput-object v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mResult:Ljava/lang/Object;

    .line 143
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsDone:Z

    .line 144
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 145
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_10 .. :try_end_1c} :catchall_2f

    .line 146
    iget-object v2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mListener:Lcom/lge/gallery/util/FutureListener;

    if-eqz v2, :cond_25

    .line 147
    iget-object v2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mListener:Lcom/lge/gallery/util/FutureListener;

    invoke-interface {v2, p0}, Lcom/lge/gallery/util/FutureListener;->onFutureDone(Lcom/lge/gallery/util/Future;)V

    .line 149
    :cond_25
    return-void

    .line 135
    .restart local v1    # "result":Ljava/lang/Object;, "TT;"
    :catch_26
    move-exception v0

    .line 136
    .local v0, "ex":Ljava/lang/Throwable;
    const-string v2, "Worker"

    const-string v3, "Exception in running a job"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_e

    .line 145
    .end local v0    # "ex":Ljava/lang/Throwable;
    .end local v1    # "result":Ljava/lang/Object;, "TT;"
    :catchall_2f
    move-exception v2

    :try_start_30
    monitor-exit p0
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v2
.end method

.method public declared-synchronized setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/util/ThreadPool$CancelListener;

    .prologue
    .line 195
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

    .line 196
    iget-boolean v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mIsCancelled:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

    if-eqz v0, :cond_10

    .line 197
    iget-object v0, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mCancelListener:Lcom/lge/gallery/util/ThreadPool$CancelListener;

    invoke-interface {v0}, Lcom/lge/gallery/util/ThreadPool$CancelListener;->onCancel()V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 199
    :cond_10
    monitor-exit p0

    return-void

    .line 195
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setMode(I)Z
    .registers 5
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    const/4 v1, 0x0

    .line 203
    iget v2, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mMode:I

    invoke-direct {p0, v2}, Lcom/lge/gallery/util/ThreadPool$Worker;->modeToCounter(I)Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    move-result-object v0

    .line 204
    .local v0, "rc":Lcom/lge/gallery/util/ThreadPool$ResourceCounter;
    if-eqz v0, :cond_c

    .line 205
    invoke-direct {p0, v0}, Lcom/lge/gallery/util/ThreadPool$Worker;->releaseResource(Lcom/lge/gallery/util/ThreadPool$ResourceCounter;)V

    .line 207
    :cond_c
    iput v1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mMode:I

    .line 210
    invoke-direct {p0, p1}, Lcom/lge/gallery/util/ThreadPool$Worker;->modeToCounter(I)Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    move-result-object v0

    .line 211
    if-eqz v0, :cond_1d

    .line 212
    invoke-direct {p0, v0}, Lcom/lge/gallery/util/ThreadPool$Worker;->acquireResource(Lcom/lge/gallery/util/ThreadPool$ResourceCounter;)Z

    move-result v2

    if-nez v2, :cond_1b

    .line 218
    :goto_1a
    return v1

    .line 215
    :cond_1b
    iput p1, p0, Lcom/lge/gallery/util/ThreadPool$Worker;->mMode:I

    .line 218
    :cond_1d
    const/4 v1, 0x1

    goto :goto_1a
.end method

.method public waitDone()V
    .registers 1

    .prologue
    .line 189
    .local p0, "this":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    invoke-virtual {p0}, Lcom/lge/gallery/util/ThreadPool$Worker;->get()Ljava/lang/Object;

    .line 190
    return-void
.end method
