.class public abstract Lcom/lge/gallery/data/core/AbstractSortedMediaSource;
.super Lcom/lge/gallery/data/core/MediaSource;
.source "AbstractSortedMediaSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/AbstractSortedMediaSource$1;,
        Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;
    }
.end annotation


# static fields
.field public static final sIdComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaSource$PathId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 18
    new-instance v0, Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;-><init>(Lcom/lge/gallery/data/core/AbstractSortedMediaSource$1;)V

    sput-object v0, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->sIdComparator:Ljava/util/Comparator;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/core/MediaSource;-><init>(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method private processMapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;Z)V
    .registers 16
    .param p2, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;
    .param p3, "isImage"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSource$PathId;",
            ">;",
            "Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    sget-object v10, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->sIdComparator:Ljava/util/Comparator;

    invoke-static {p1, v10}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 67
    .local v6, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-ge v1, v6, :cond_67

    .line 68
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .line 71
    .local v7, "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v2, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v10, v7, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v10}, Lcom/lge/gallery/data/core/Path;->getSuffix()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 73
    .local v9, "startId":I
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    add-int/lit8 v4, v1, 0x1

    .local v4, "j":I
    :goto_2a
    if-ge v4, v6, :cond_42

    .line 77
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .line 78
    .local v8, "pid2":Lcom/lge/gallery/data/core/MediaSource$PathId;
    iget-object v10, v8, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v10}, Lcom/lge/gallery/data/core/Path;->getSuffix()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 79
    .local v0, "curId":I
    sub-int v10, v0, v9

    const/16 v11, 0x1f4

    if-lt v10, v11, :cond_5b

    .line 85
    .end local v0    # "curId":I
    .end local v8    # "pid2":Lcom/lge/gallery/data/core/MediaSource$PathId;
    :cond_42
    invoke-virtual {p0, p3, v2}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->getMediaItemsById(ZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v3

    .line 86
    .local v3, "items":[Lcom/lge/gallery/data/core/MediaItem;
    move v5, v1

    .local v5, "k":I
    :goto_47
    if-ge v5, v4, :cond_65

    .line 87
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .line 88
    .restart local v8    # "pid2":Lcom/lge/gallery/data/core/MediaSource$PathId;
    iget v10, v8, Lcom/lge/gallery/data/core/MediaSource$PathId;->id:I

    sub-int v11, v5, v1

    aget-object v11, v3, v11

    invoke-interface {p2, v10, v11}, Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;->consume(ILcom/lge/gallery/data/core/MediaItem;)V

    .line 86
    add-int/lit8 v5, v5, 0x1

    goto :goto_47

    .line 82
    .end local v3    # "items":[Lcom/lge/gallery/data/core/MediaItem;
    .end local v5    # "k":I
    .restart local v0    # "curId":I
    :cond_5b
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    add-int/lit8 v4, v4, 0x1

    goto :goto_2a

    .line 91
    .end local v0    # "curId":I
    .end local v8    # "pid2":Lcom/lge/gallery/data/core/MediaSource$PathId;
    .restart local v3    # "items":[Lcom/lge/gallery/data/core/MediaItem;
    .restart local v5    # "k":I
    :cond_65
    move v1, v4

    .line 92
    goto :goto_a

    .line 93
    .end local v2    # "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v3    # "items":[Lcom/lge/gallery/data/core/MediaItem;
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v7    # "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    .end local v9    # "startId":I
    :cond_67
    return-void
.end method


# virtual methods
.method protected abstract getImageItemPath()Lcom/lge/gallery/data/core/Path;
.end method

.method protected abstract getMediaItemsById(ZLjava/util/ArrayList;)[Lcom/lge/gallery/data/core/MediaItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)[",
            "Lcom/lge/gallery/data/core/MediaItem;"
        }
    .end annotation
.end method

.method protected abstract getVideoItemPath()Lcom/lge/gallery/data/core/Path;
.end method

.method public mapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;)V
    .registers 10
    .param p2, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaSource$PathId;",
            ">;",
            "Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .local v1, "imageList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v5, "videoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 46
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    if-ge v0, v2, :cond_33

    .line 47
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .line 50
    .local v4, "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    iget-object v6, v4, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v6}, Lcom/lge/gallery/data/core/Path;->getParent()Lcom/lge/gallery/data/core/Path;

    move-result-object v3

    .line 51
    .local v3, "parent":Lcom/lge/gallery/data/core/Path;
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->getImageItemPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v6

    if-ne v3, v6, :cond_29

    .line 52
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    :cond_26
    :goto_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 53
    :cond_29
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->getVideoItemPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v6

    if-ne v3, v6, :cond_26

    .line 54
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 58
    .end local v3    # "parent":Lcom/lge/gallery/data/core/Path;
    .end local v4    # "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    :cond_33
    const/4 v6, 0x1

    invoke-direct {p0, v1, p2, v6}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->processMapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;Z)V

    .line 59
    const/4 v6, 0x0

    invoke-direct {p0, v5, p2, v6}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource;->processMapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;Z)V

    .line 60
    return-void
.end method
