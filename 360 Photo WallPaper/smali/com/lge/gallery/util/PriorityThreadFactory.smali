.class public Lcom/lge/gallery/util/PriorityThreadFactory;
.super Ljava/lang/Object;
.source "PriorityThreadFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mPriority:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "priority"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    iput-object p1, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mName:Ljava/lang/String;

    .line 35
    iput p2, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mPriority:I

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/util/PriorityThreadFactory;)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/PriorityThreadFactory;

    .prologue
    .line 27
    iget v0, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mPriority:I

    return v0
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 5
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 39
    new-instance v0, Lcom/lge/gallery/util/PriorityThreadFactory$1;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/util/PriorityThreadFactory;->mNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/lge/gallery/util/PriorityThreadFactory$1;-><init>(Lcom/lge/gallery/util/PriorityThreadFactory;Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object v0
.end method
