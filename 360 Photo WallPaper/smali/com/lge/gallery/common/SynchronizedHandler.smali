.class public Lcom/lge/gallery/common/SynchronizedHandler;
.super Landroid/os/Handler;
.source "SynchronizedHandler.java"


# instance fields
.field private final mLock:Lcom/lge/gallery/app/Lockable;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/app/Lockable;)V
    .registers 2
    .param p1, "root"    # Lcom/lge/gallery/app/Lockable;

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/lge/gallery/common/SynchronizedHandler;->mLock:Lcom/lge/gallery/app/Lockable;

    .line 22
    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/lge/gallery/common/SynchronizedHandler;->mLock:Lcom/lge/gallery/app/Lockable;

    invoke-interface {v0}, Lcom/lge/gallery/app/Lockable;->lockResources()V

    .line 28
    :try_start_5
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_e

    .line 30
    iget-object v0, p0, Lcom/lge/gallery/common/SynchronizedHandler;->mLock:Lcom/lge/gallery/app/Lockable;

    invoke-interface {v0}, Lcom/lge/gallery/app/Lockable;->unlockResources()V

    .line 32
    return-void

    .line 30
    :catchall_e
    move-exception v0

    iget-object v1, p0, Lcom/lge/gallery/common/SynchronizedHandler;->mLock:Lcom/lge/gallery/app/Lockable;

    invoke-interface {v1}, Lcom/lge/gallery/app/Lockable;->unlockResources()V

    throw v0
.end method
