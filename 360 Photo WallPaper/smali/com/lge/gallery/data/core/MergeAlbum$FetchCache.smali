.class Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;
.super Ljava/lang/Object;
.source "MergeAlbum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/MergeAlbum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FetchCache"
.end annotation


# instance fields
.field private final PAGE_SIZE:I

.field private mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

.field private mCacheRef:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private mStartPos:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/MediaSet;I)V
    .registers 3
    .param p1, "baseSet"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "pagesize"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 46
    iput p2, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->PAGE_SIZE:I

    .line 47
    return-void
.end method


# virtual methods
.method public getItem(I)Lcom/lge/gallery/data/core/MediaItem;
    .registers 8
    .param p1, "index"    # I

    .prologue
    .line 54
    const/4 v3, 0x0

    .line 55
    .local v3, "needLoading":Z
    const/4 v0, 0x0

    .line 56
    .local v0, "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    iget-object v1, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mCacheRef:Ljava/lang/ref/SoftReference;

    .line 57
    .local v1, "cacheRef":Ljava/lang/ref/SoftReference;, "Ljava/lang/ref/SoftReference<Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;>;"
    if-eqz v1, :cond_11

    iget v4, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mStartPos:I

    if-lt p1, v4, :cond_11

    iget v4, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mStartPos:I

    iget v5, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->PAGE_SIZE:I

    add-int/2addr v4, v5

    if-lt p1, v4, :cond_35

    .line 59
    :cond_11
    const/4 v3, 0x1

    .line 67
    :cond_12
    :goto_12
    if-eqz v3, :cond_25

    .line 68
    iget-object v4, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    iget v5, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->PAGE_SIZE:I

    invoke-virtual {v4, p1, v5}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v0

    .line 69
    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mCacheRef:Ljava/lang/ref/SoftReference;

    .line 70
    iput p1, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mStartPos:I

    .line 73
    :cond_25
    monitor-enter v0

    .line 74
    :try_start_26
    iget v4, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mStartPos:I

    sub-int v2, p1, v4

    .line 75
    .local v2, "idx":I
    if-ltz v2, :cond_32

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_3f

    .line 76
    :cond_32
    const/4 v4, 0x0

    monitor-exit v0
    :try_end_34
    .catchall {:try_start_26 .. :try_end_34} :catchall_47

    .line 79
    :goto_34
    return-object v4

    .line 61
    .end local v2    # "idx":I
    :cond_35
    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    check-cast v0, Ljava/util/ArrayList;

    .line 62
    .restart local v0    # "cache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    if-nez v0, :cond_12

    .line 63
    const/4 v3, 0x1

    goto :goto_12

    .line 79
    .restart local v2    # "idx":I
    :cond_3f
    :try_start_3f
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/MediaItem;

    monitor-exit v0

    goto :goto_34

    .line 80
    .end local v2    # "idx":I
    :catchall_47
    move-exception v4

    monitor-exit v0
    :try_end_49
    .catchall {:try_start_3f .. :try_end_49} :catchall_47

    throw v4
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/core/MergeAlbum$FetchCache;->mCacheRef:Ljava/lang/ref/SoftReference;

    .line 51
    return-void
.end method
