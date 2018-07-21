.class public Lcom/lge/gallery/common/LruCache;
.super Ljava/lang/Object;
.source "LruCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/common/LruCache$Entry;
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
.field private final mLruMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TK;TV;>;"
        }
    .end annotation
.end field

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
            "Lcom/lge/gallery/common/LruCache$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 8
    .param p1, "capacity"    # I

    .prologue
    .line 36
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    .line 34
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/common/LruCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    .line 37
    new-instance v0, Lcom/lge/gallery/common/LruCache$1;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    move-object v1, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/common/LruCache$1;-><init>(Lcom/lge/gallery/common/LruCache;IFZI)V

    iput-object v0, p0, Lcom/lge/gallery/common/LruCache;->mLruMap:Ljava/util/HashMap;

    .line 43
    return-void
.end method

.method private cleanUpWeakMap()V
    .registers 4

    .prologue
    .line 55
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    iget-object v1, p0, Lcom/lge/gallery/common/LruCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/common/LruCache$Entry;

    .line 56
    .local v0, "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    :goto_8
    if-eqz v0, :cond_1a

    .line 57
    iget-object v1, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    iget-object v2, v0, Lcom/lge/gallery/common/LruCache$Entry;->mKey:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    iget-object v1, p0, Lcom/lge/gallery/common/LruCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    .end local v0    # "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    check-cast v0, Lcom/lge/gallery/common/LruCache$Entry;

    .restart local v0    # "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    goto :goto_8

    .line 60
    :cond_1a
    return-void
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 86
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/common/LruCache;->mLruMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 87
    iget-object v0, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 88
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/common/LruCache;->mQueue:Ljava/lang/ref/ReferenceQueue;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 89
    monitor-exit p0

    return-void

    .line 86
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized containsKey(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/lge/gallery/common/LruCache;->cleanUpWeakMap()V

    .line 64
    iget-object v0, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_c

    move-result v0

    monitor-exit p0

    return v0

    .line 63
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/lge/gallery/common/LruCache;->cleanUpWeakMap()V

    .line 77
    iget-object v2, p0, Lcom/lge/gallery/common/LruCache;->mLruMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_20

    move-result-object v1

    .line 78
    .local v1, "value":Ljava/lang/Object;, "TV;"
    if-eqz v1, :cond_e

    .line 82
    .end local v1    # "value":Ljava/lang/Object;, "TV;"
    :goto_c
    monitor-exit p0

    return-object v1

    .line 81
    .restart local v1    # "value":Ljava/lang/Object;, "TV;"
    :cond_e
    :try_start_e
    iget-object v2, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/common/LruCache$Entry;

    .line 82
    .local v0, "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    if-nez v0, :cond_1b

    const/4 v2, 0x0

    :goto_19
    move-object v1, v2

    goto :goto_c

    :cond_1b
    invoke-virtual {v0}, Lcom/lge/gallery/common/LruCache$Entry;->get()Ljava/lang/Object;
    :try_end_1e
    .catchall {:try_start_e .. :try_end_1e} :catchall_20

    move-result-object v2

    goto :goto_19

    .line 76
    .end local v0    # "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    .end local v1    # "value":Ljava/lang/Object;, "TV;"
    :catchall_20
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
    .line 68
    .local p0, "this":Lcom/lge/gallery/common/LruCache;, "Lcom/lge/gallery/common/LruCache<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/lge/gallery/common/LruCache;->cleanUpWeakMap()V

    .line 69
    iget-object v1, p0, Lcom/lge/gallery/common/LruCache;->mLruMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    iget-object v1, p0, Lcom/lge/gallery/common/LruCache;->mWeakMap:Ljava/util/HashMap;

    new-instance v2, Lcom/lge/gallery/common/LruCache$Entry;

    iget-object v3, p0, Lcom/lge/gallery/common/LruCache;->mQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v2, p1, p2, v3}, Lcom/lge/gallery/common/LruCache$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/common/LruCache$Entry;
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_22

    .line 72
    .local v0, "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    if-nez v0, :cond_1d

    const/4 v1, 0x0

    :goto_1b
    monitor-exit p0

    return-object v1

    :cond_1d
    :try_start_1d
    invoke-virtual {v0}, Lcom/lge/gallery/common/LruCache$Entry;->get()Ljava/lang/Object;
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_22

    move-result-object v1

    goto :goto_1b

    .line 68
    .end local v0    # "entry":Lcom/lge/gallery/common/LruCache$Entry;, "Lcom/lge/gallery/common/LruCache$Entry<TK;TV;>;"
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1
.end method
