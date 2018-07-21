.class Lcom/lge/gallery/util/ThreadPool$JobContextStub;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$JobContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/util/ThreadPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JobContextStub"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/util/ThreadPool$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$1;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/lge/gallery/util/ThreadPool$JobContextStub;-><init>()V

    return-void
.end method


# virtual methods
.method public isCancelled()Z
    .registers 2

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/lge/gallery/util/ThreadPool$CancelListener;

    .prologue
    .line 67
    return-void
.end method

.method public setMode(I)Z
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 71
    const/4 v0, 0x1

    return v0
.end method
