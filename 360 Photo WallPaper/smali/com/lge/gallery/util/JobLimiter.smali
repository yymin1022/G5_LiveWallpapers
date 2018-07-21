.class public Lcom/lge/gallery/util/JobLimiter;
.super Ljava/lang/Object;
.source "JobLimiter.java"

# interfaces
.implements Lcom/lge/gallery/util/FutureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/util/JobLimiter$JobWrapper;
    }
.end annotation


# static fields
.field private static final STATE_CANCELLED:I = 0x2

.field private static final STATE_DONE:I = 0x1

.field private static final STATE_INIT:I = 0x0

.field private static final TAG:Ljava/lang/String; = "JobLimiter"


# instance fields
.field private final mJobs:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/lge/gallery/util/JobLimiter$JobWrapper",
            "<*>;>;"
        }
    .end annotation
.end field

.field private mLimit:I

.field private final mPool:Lcom/lge/gallery/util/ThreadPool;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/util/ThreadPool;I)V
    .registers 4
    .param p1, "pool"    # Lcom/lge/gallery/util/ThreadPool;
    .param p2, "limit"    # I

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/JobLimiter;->mJobs:Ljava/util/LinkedList;

    .line 143
    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/ThreadPool;

    iput-object v0, p0, Lcom/lge/gallery/util/JobLimiter;->mPool:Lcom/lge/gallery/util/ThreadPool;

    .line 144
    iput p2, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    .line 145
    return-void
.end method

.method private submitTasksIfAllowed()V
    .registers 3

    .prologue
    .line 159
    :cond_0
    :goto_0
    iget v1, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    if-lez v1, :cond_2a

    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter;->mJobs:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2a

    .line 160
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter;->mJobs:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;

    .line 161
    .local v0, "wrapper":Lcom/lge/gallery/util/JobLimiter$JobWrapper;
    invoke-virtual {v0}, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 162
    iget v1, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    .line 163
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter;->mPool:Lcom/lge/gallery/util/ThreadPool;

    invoke-virtual {v1, v0, p0}, Lcom/lge/gallery/util/ThreadPool;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/util/JobLimiter$JobWrapper;->setFuture(Lcom/lge/gallery/util/Future;)V

    goto :goto_0

    .line 166
    .end local v0    # "wrapper":Lcom/lge/gallery/util/JobLimiter$JobWrapper;
    :cond_2a
    return-void
.end method


# virtual methods
.method public declared-synchronized onFutureDone(Lcom/lge/gallery/util/Future;)V
    .registers 3
    .param p1, "future"    # Lcom/lge/gallery/util/Future;

    .prologue
    .line 170
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lge/gallery/util/JobLimiter;->mLimit:I

    .line 171
    invoke-direct {p0}, Lcom/lge/gallery/util/JobLimiter;->submitTasksIfAllowed()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 172
    monitor-exit p0

    return-void

    .line 170
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public submit(Lcom/lge/gallery/util/ThreadPool$Job;)Lcom/lge/gallery/util/Future;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<TT;>;)",
            "Lcom/lge/gallery/util/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/util/JobLimiter;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<TT;>;",
            "Lcom/lge/gallery/util/FutureListener",
            "<TT;>;)",
            "Lcom/lge/gallery/util/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 148
    .local p1, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    .local p2, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/lge/gallery/util/JobLimiter$JobWrapper;

    invoke-static {p1}, Lcom/lge/gallery/common/Utils;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/util/ThreadPool$Job;

    invoke-direct {v0, v1, p2}, Lcom/lge/gallery/util/JobLimiter$JobWrapper;-><init>(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)V

    .line 149
    .local v0, "future":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    iget-object v1, p0, Lcom/lge/gallery/util/JobLimiter;->mJobs:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 150
    invoke-direct {p0}, Lcom/lge/gallery/util/JobLimiter;->submitTasksIfAllowed()V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 151
    monitor-exit p0

    return-object v0

    .line 148
    .end local v0    # "future":Lcom/lge/gallery/util/JobLimiter$JobWrapper;, "Lcom/lge/gallery/util/JobLimiter$JobWrapper<TT;>;"
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1
.end method
