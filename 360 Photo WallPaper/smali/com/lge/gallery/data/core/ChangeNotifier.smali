.class public Lcom/lge/gallery/data/core/ChangeNotifier;
.super Ljava/lang/Object;
.source "ChangeNotifier.java"

# interfaces
.implements Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;


# instance fields
.field private mContentDirty:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mMediaSet:Lcom/lge/gallery/data/core/MediaSet;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 6
    .param p1, "set"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mContentDirty:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 31
    iput-object p1, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 32
    invoke-interface {p3}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v0

    invoke-virtual {v0, p2, p0}, Lcom/lge/gallery/data/core/DataManager;->registerChangeNotifier(Landroid/net/Uri;Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;)V

    .line 33
    return-void
.end method


# virtual methods
.method public clearDirty()V
    .registers 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mContentDirty:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 46
    return-void
.end method

.method public fakeChange()V
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->onChange(Z)V

    .line 42
    return-void
.end method

.method public isDirty()Z
    .registers 4

    .prologue
    .line 37
    iget-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mContentDirty:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    return v0
.end method

.method public onChange(Z)V
    .registers 5
    .param p1, "selfChange"    # Z

    .prologue
    .line 50
    iget-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mContentDirty:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 51
    iget-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    if-eqz v0, :cond_13

    .line 52
    iget-object v0, p0, Lcom/lge/gallery/data/core/ChangeNotifier;->mMediaSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->notifyContentChanged()V

    .line 55
    :cond_13
    return-void
.end method
