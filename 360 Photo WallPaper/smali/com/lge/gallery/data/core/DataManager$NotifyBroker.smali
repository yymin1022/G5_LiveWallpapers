.class Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
.super Landroid/database/ContentObserver;
.source "DataManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/DataManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NotifyBroker"
.end annotation


# instance fields
.field private mNotifiers:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .registers 3
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 371
    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 367
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;->mNotifiers:Ljava/util/WeakHashMap;

    .line 372
    return-void
.end method


# virtual methods
.method public declared-synchronized onChange(Z)V
    .registers 5
    .param p1, "selfChange"    # Z

    .prologue
    .line 380
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;->mNotifiers:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;

    .line 381
    .local v1, "notifier":Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;
    invoke-interface {v1, p1}, Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;->onChange(Z)V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1b

    goto :goto_b

    .line 380
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "notifier":Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;
    :catchall_1b
    move-exception v2

    monitor-exit p0

    throw v2

    .line 383
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1e
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized registerNotifier(Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;)V
    .registers 4
    .param p1, "notifier"    # Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;

    .prologue
    .line 375
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;->mNotifiers:Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 376
    monitor-exit p0

    return-void

    .line 375
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
