.class public abstract Lcom/lge/gallery/data/core/MediaSource;
.super Ljava/lang/Object;
.source "MediaSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/MediaSource$PathId;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaSource"


# instance fields
.field private mPrefix:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/lge/gallery/data/core/MediaSource;->mPrefix:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public abstract createMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
.end method

.method public findPathByUri(Landroid/net/Uri;)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 39
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDefaultSetOf(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p1, "item"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 51
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaSource;->mPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 96
    const/4 v0, 0x0

    return v0
.end method

.method public getTotalTargetCacheSize()J
    .registers 3

    .prologue
    .line 59
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getTotalUsedCacheSize()J
    .registers 3

    .prologue
    .line 55
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public mapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;)V
    .registers 11
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
    .line 78
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 79
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_43

    .line 80
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/data/core/MediaSource$PathId;

    .line 81
    .local v3, "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    iget-object v5, v3, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v5}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v2

    .line 82
    .local v2, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v2, :cond_1b

    .line 84
    :try_start_15
    iget-object v5, v3, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {p0, v5}, Lcom/lge/gallery/data/core/MediaSource;->createMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_1a} :catch_27

    move-result-object v2

    .line 89
    :cond_1b
    :goto_1b
    if-eqz v2, :cond_24

    .line 90
    iget v5, v3, Lcom/lge/gallery/data/core/MediaSource$PathId;->id:I

    check-cast v2, Lcom/lge/gallery/data/core/MediaItem;

    .end local v2    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    invoke-interface {p2, v5, v2}, Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;->consume(ILcom/lge/gallery/data/core/MediaItem;)V

    .line 79
    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 85
    .restart local v2    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    :catch_27
    move-exception v4

    .line 86
    .local v4, "th":Ljava/lang/Throwable;
    const-string v5, "MediaSource"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "cannot create media object: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1b

    .line 93
    .end local v2    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    .end local v3    # "pid":Lcom/lge/gallery/data/core/MediaSource$PathId;
    .end local v4    # "th":Ljava/lang/Throwable;
    :cond_43
    return-void
.end method

.method public pause()V
    .registers 1

    .prologue
    .line 45
    return-void
.end method

.method public resume()V
    .registers 1

    .prologue
    .line 48
    return-void
.end method
