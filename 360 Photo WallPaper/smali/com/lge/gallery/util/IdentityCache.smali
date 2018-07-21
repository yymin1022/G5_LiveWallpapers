.class public Lcom/lge/gallery/util/IdentityCache;
.super Ljava/lang/Object;
.source "IdentityCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/util/IdentityCache$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final mWeakMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TK;",
            "Lcom/lge/gallery/util/IdentityCache$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    .line 29
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/IdentityCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    .line 32
    return-void
.end method

.method private cleanUpWeakMap()V
    .registers 4

    .prologue
    .line 44
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    iget-object v1, p0, Lcom/lge/gallery/util/IdentityCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/IdentityCache$Entry;

    .line 45
    .local v0, "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    :goto_8
    if-eqz v0, :cond_1a

    .line 46
    iget-object v1, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    iget-object v2, v0, Lcom/lge/gallery/util/IdentityCache$Entry;->mKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v1, p0, Lcom/lge/gallery/util/IdentityCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    .end local v0    # "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    check-cast v0, Lcom/lge/gallery/util/IdentityCache$Entry;

    .restart local v0    # "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    goto :goto_8

    .line 49
    :cond_1a
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 65
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 66
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/IdentityCache;->mQueue:Ljava/lang/ref/ReferenceQueue;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 67
    monitor-exit p0

    return-void

    .line 65
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/lge/gallery/util/IdentityCache;->cleanUpWeakMap()V

    .line 60
    iget-object v1, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/IdentityCache$Entry;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_16

    .line 61
    .local v0, "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    if-nez v0, :cond_11

    const/4 v1, 0x0

    :goto_f
    monitor-exit p0

    return-object v1

    :cond_11
    :try_start_11
    invoke-virtual {v0}, Lcom/lge/gallery/util/IdentityCache$Entry;->get()Ljava/lang/Object;
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_16

    move-result-object v1

    goto :goto_f

    .line 59
    .end local v0    # "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized keys()Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 71
    .local v1, "set":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 72
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TK;>;"
    monitor-exit p0

    return-object v0

    .line 70
    .end local v0    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TK;>;"
    .end local v1    # "set":Ljava/util/Set;, "Ljava/util/Set<TK;>;"
    :catchall_e
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/lge/gallery/util/IdentityCache;, "Lcom/lge/gallery/util/IdentityCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/lge/gallery/util/IdentityCache;->cleanUpWeakMap()V

    .line 53
    iget-object v1, p0, Lcom/lge/gallery/util/IdentityCache;->mWeakMap:Ljava/util/HashMap;

    new-instance v2, Lcom/lge/gallery/util/IdentityCache$Entry;

    iget-object v3, p0, Lcom/lge/gallery/util/IdentityCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v2, p1, p2, v3}, Lcom/lge/gallery/util/IdentityCache$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/IdentityCache$Entry;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_1d

    .line 55
    .local v0, "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    if-nez v0, :cond_18

    const/4 v1, 0x0

    :goto_16
    monitor-exit p0

    return-object v1

    :cond_18
    :try_start_18
    invoke-virtual {v0}, Lcom/lge/gallery/util/IdentityCache$Entry;->get()Ljava/lang/Object;
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_1d

    move-result-object v1

    goto :goto_16

    .line 52
    .end local v0    # "entry":Lcom/lge/gallery/util/IdentityCache$Entry;, "Lcom/lge/gallery/util/IdentityCache$Entry<TK;TV;>;"
    :catchall_1d
    move-exception v1

    monitor-exit p0

    throw v1
.end method
