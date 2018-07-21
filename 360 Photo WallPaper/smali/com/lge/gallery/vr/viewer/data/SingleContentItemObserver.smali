.class public Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;
.super Landroid/database/ContentObserver;
.source "SingleContentItemObserver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBaseUri:Landroid/net/Uri;

.field private mContext:Landroid/content/Context;

.field private mItemObservers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mMediaItem:Lcom/lge/gallery/data/core/MediaItem;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    const-class v0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mItemObservers:Ljava/util/ArrayList;

    .line 37
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mContext:Landroid/content/Context;

    .line 38
    invoke-virtual {p2}, Lcom/lge/gallery/data/core/MediaItem;->getBaseUri()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mBaseUri:Landroid/net/Uri;

    .line 39
    iput-object p2, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    .line 40
    return-void
.end method


# virtual methods
.method public declared-synchronized onChange(Z)V
    .registers 7
    .param p1, "selfChange"    # Z

    .prologue
    .line 59
    monitor-enter p0

    :try_start_1
    sget-object v3, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->TAG:Ljava/lang/String;

    const-string v4, "Parent Uri got changes."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    invoke-virtual {v3}, Lcom/lge/gallery/data/core/MediaItem;->update()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v1

    .line 61
    .local v1, "object":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v1, :cond_2b

    .line 62
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mItemObservers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;

    .line 63
    .local v2, "observer":Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mMediaItem:Lcom/lge/gallery/data/core/MediaItem;

    invoke-interface {v2, v3}, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;->onRemoved(Lcom/lge/gallery/data/core/MediaItem;)V
    :try_end_27
    .catchall {:try_start_1 .. :try_end_27} :catchall_28

    goto :goto_16

    .line 59
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "object":Lcom/lge/gallery/data/core/MediaObject;
    .end local v2    # "observer":Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;
    :catchall_28
    move-exception v3

    monitor-exit p0

    throw v3

    .line 66
    .restart local v1    # "object":Lcom/lge/gallery/data/core/MediaObject;
    :cond_2b
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized registerObserver(Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;)V
    .registers 3
    .param p1, "observer"    # Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;

    .prologue
    .line 51
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mItemObservers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 52
    monitor-exit p0

    return-void

    .line 51
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public startListening()V
    .registers 4

    .prologue
    .line 43
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mBaseUri:Landroid/net/Uri;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 44
    return-void
.end method

.method public stopListening()V
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 48
    return-void
.end method

.method public declared-synchronized unregisterObserver(Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;)V
    .registers 3
    .param p1, "observer"    # Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;

    .prologue
    .line 55
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->mItemObservers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 56
    monitor-exit p0

    return-void

    .line 55
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
