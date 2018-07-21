.class public Lcom/lge/gallery/util/ThreadPriorityManager;
.super Ljava/lang/Object;
.source "ThreadPriorityManager.java"


# static fields
.field private static final ID_NONE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ThreadPriorityManager"

.field private static sCurrentMaxTid:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const/4 v0, 0x0

    sput v0, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized requestMaxPriority()V
    .registers 5

    .prologue
    .line 27
    const-class v3, Lcom/lge/gallery/util/ThreadPriorityManager;

    monitor-enter v3

    :try_start_3
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    .line 28
    .local v1, "tid":I
    sget v2, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    if-nez v2, :cond_13

    .line 29
    sput v1, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    .line 30
    const/4 v2, -0x4

    invoke-static {v1, v2}, Landroid/os/Process;->setThreadPriority(II)V
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_24

    .line 43
    :cond_11
    :goto_11
    monitor-exit v3

    return-void

    .line 32
    :cond_13
    :try_start_13
    sget v2, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I
    :try_end_15
    .catchall {:try_start_13 .. :try_end_15} :catchall_24

    if-eq v2, v1, :cond_11

    .line 36
    :try_start_17
    sget v2, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    const/4 v4, 0x0

    invoke-static {v2, v4}, Landroid/os/Process;->setThreadPriority(II)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1d} :catch_27
    .catchall {:try_start_17 .. :try_end_1d} :catchall_24

    .line 40
    :goto_1d
    :try_start_1d
    sput v1, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    .line 41
    const/4 v2, -0x4

    invoke-static {v1, v2}, Landroid/os/Process;->setThreadPriority(II)V
    :try_end_23
    .catchall {:try_start_1d .. :try_end_23} :catchall_24

    goto :goto_11

    .line 27
    :catchall_24
    move-exception v2

    monitor-exit v3

    throw v2

    .line 37
    :catch_27
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/Exception;
    :try_start_28
    const-string v2, "ThreadPriorityManager"

    const-string v4, "setThreadPriority failed"

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_24

    goto :goto_1d
.end method

.method public static declared-synchronized requestNormalPriority()V
    .registers 3

    .prologue
    .line 46
    const-class v2, Lcom/lge/gallery/util/ThreadPriorityManager;

    monitor-enter v2

    :try_start_3
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v0

    .line 47
    .local v0, "tid":I
    sget v1, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    if-ne v1, v0, :cond_e

    .line 48
    const/4 v1, 0x0

    sput v1, Lcom/lge/gallery/util/ThreadPriorityManager;->sCurrentMaxTid:I

    .line 50
    :cond_e
    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/Process;->setThreadPriority(II)V
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_14

    .line 51
    monitor-exit v2

    return-void

    .line 46
    :catchall_14
    move-exception v1

    monitor-exit v2

    throw v1
.end method
