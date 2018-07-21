.class Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;
.super Ljava/lang/Object;
.source "AbstractSortedMediaSource.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/AbstractSortedMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IdComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/lge/gallery/data/core/MediaSource$PathId;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/data/core/AbstractSortedMediaSource$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/data/core/AbstractSortedMediaSource$1;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/lge/gallery/data/core/MediaSource$PathId;Lcom/lge/gallery/data/core/MediaSource$PathId;)I
    .registers 8
    .param p1, "p1"    # Lcom/lge/gallery/data/core/MediaSource$PathId;
    .param p2, "p2"    # Lcom/lge/gallery/data/core/MediaSource$PathId;

    .prologue
    .line 23
    iget-object v4, p1, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/Path;->getSuffix()Ljava/lang/String;

    move-result-object v2

    .line 24
    .local v2, "s1":Ljava/lang/String;
    iget-object v4, p2, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v4}, Lcom/lge/gallery/data/core/Path;->getSuffix()Ljava/lang/String;

    move-result-object v3

    .line 25
    .local v3, "s2":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 26
    .local v0, "len1":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 27
    .local v1, "len2":I
    if-ge v0, v1, :cond_18

    .line 28
    const/4 v4, -0x1

    .line 32
    :goto_17
    return v4

    .line 29
    :cond_18
    if-le v0, v1, :cond_1c

    .line 30
    const/4 v4, 0x1

    goto :goto_17

    .line 32
    :cond_1c
    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    goto :goto_17
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 21
    check-cast p1, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/core/AbstractSortedMediaSource$IdComparator;->compare(Lcom/lge/gallery/data/core/MediaSource$PathId;Lcom/lge/gallery/data/core/MediaSource$PathId;)I

    move-result v0

    return v0
.end method
