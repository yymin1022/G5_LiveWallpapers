.class public Lcom/lge/gallery/util/ThreadPool;
.super Ljava/lang/Object;
.source "ThreadPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/util/ThreadPool$1;,
        Lcom/lge/gallery/util/ThreadPool$Worker;,
        Lcom/lge/gallery/util/ThreadPool$ResourceCounter;,
        Lcom/lge/gallery/util/ThreadPool$CancelListener;,
        Lcom/lge/gallery/util/ThreadPool$JobContextStub;,
        Lcom/lge/gallery/util/ThreadPool$JobContext;,
        Lcom/lge/gallery/util/ThreadPool$Job;
    }
.end annotation


# static fields
.field private static final CORE_POOL_SIZE:I = 0x4

.field public static final JOB_CONTEXT_STUB:Lcom/lge/gallery/util/ThreadPool$JobContext;

.field private static final KEEP_ALIVE_TIME:I = 0xa

.field private static final MAX_POOL_SIZE:I = 0x6

.field private static final MIN_SIZE_FOR_PERFORMANCE:I = 0x200

.field public static final MODE_CPU:I = 0x1

.field public static final MODE_NETWORK:I = 0x2

.field public static final MODE_NONE:I = 0x0

.field private static final RES_LARGE:I = 0x4

.field private static final RES_SMALL:I = 0x2

.field public static final USE_PERFORMANCE_MODE:Z


# instance fields
.field final mCpuCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field mNetworkCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 36
    new-instance v0, Lcom/lge/gallery/util/ThreadPool$JobContextStub;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lge/gallery/util/ThreadPool$JobContextStub;-><init>(Lcom/lge/gallery/util/ThreadPool$1;)V

    sput-object v0, Lcom/lge/gallery/util/ThreadPool;->JOB_CONTEXT_STUB:Lcom/lge/gallery/util/ThreadPool$JobContext;

    .line 41
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->getApplicationHeapSizeInMbytes()J

    move-result-wide v0

    const-wide/16 v2, 0x200

    cmp-long v0, v0, v2

    if-ltz v0, :cond_16

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lcom/lge/gallery/util/ThreadPool;->USE_PERFORMANCE_MODE:Z

    return-void

    :cond_16
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public constructor <init>()V
    .registers 12

    .prologue
    const/4 v2, 0x4

    const/4 v10, 0x2

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    invoke-direct {v0, v10}, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;-><init>(I)V

    iput-object v0, p0, Lcom/lge/gallery/util/ThreadPool;->mNetworkCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 89
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v3, 0x6

    const-wide/16 v4, 0xa

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v8, Lcom/lge/gallery/util/PriorityThreadFactory;

    const-string v0, "thread-pool"

    const/16 v9, 0xa

    invoke-direct {v8, v0, v9}, Lcom/lge/gallery/util/PriorityThreadFactory;-><init>(Ljava/lang/String;I)V

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v1, p0, Lcom/lge/gallery/util/ThreadPool;->mExecutor:Ljava/util/concurrent/Executor;

    .line 94
    sget-boolean v0, Lcom/lge/gallery/util/ThreadPool;->USE_PERFORMANCE_MODE:Z

    if-eqz v0, :cond_32

    new-instance v0, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    invoke-direct {v0, v2}, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;-><init>(I)V

    :goto_2f
    iput-object v0, p0, Lcom/lge/gallery/util/ThreadPool;->mCpuCounter:Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    .line 96
    return-void

    .line 94
    :cond_32
    new-instance v0, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;

    invoke-direct {v0, v10}, Lcom/lge/gallery/util/ThreadPool$ResourceCounter;-><init>(I)V

    goto :goto_2f
.end method


# virtual methods
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
    .line 107
    .local p1, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/util/ThreadPool;->submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;

    move-result-object v0

    return-object v0
.end method

.method public submit(Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)Lcom/lge/gallery/util/Future;
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
    .line 101
    .local p1, "job":Lcom/lge/gallery/util/ThreadPool$Job;, "Lcom/lge/gallery/util/ThreadPool$Job<TT;>;"
    .local p2, "listener":Lcom/lge/gallery/util/FutureListener;, "Lcom/lge/gallery/util/FutureListener<TT;>;"
    new-instance v0, Lcom/lge/gallery/util/ThreadPool$Worker;

    invoke-direct {v0, p0, p1, p2}, Lcom/lge/gallery/util/ThreadPool$Worker;-><init>(Lcom/lge/gallery/util/ThreadPool;Lcom/lge/gallery/util/ThreadPool$Job;Lcom/lge/gallery/util/FutureListener;)V

    .line 102
    .local v0, "w":Lcom/lge/gallery/util/ThreadPool$Worker;, "Lcom/lge/gallery/util/ThreadPool$Worker<TT;>;"
    iget-object v1, p0, Lcom/lge/gallery/util/ThreadPool;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 103
    return-object v0
.end method
