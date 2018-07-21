.class public Lcom/lge/gallery/data/cache/LocalCacheProvider;
.super Ljava/lang/Object;
.source "LocalCacheProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;,
        Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    return-void
.end method

.method public static appendExtraKey([BLjava/lang/String;)[B
    .registers 4
    .param p0, "key"    # [B
    .param p1, "exKey"    # Ljava/lang/String;

    .prologue
    .line 67
    if-nez p1, :cond_3

    .line 70
    .end local p0    # "key":[B
    :goto_2
    return-object p0

    .restart local p0    # "key":[B
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    goto :goto_2
.end method

.method public static getLocalCacheService(Landroid/content/Context;I)Lcom/lge/gallery/data/cache/AbstractImageCacheService;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I

    .prologue
    .line 21
    packed-switch p1, :pswitch_data_e

    .line 27
    invoke-static {p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;

    move-result-object v0

    :goto_7
    return-object v0

    .line 23
    :pswitch_8
    invoke-static {p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;

    move-result-object v0

    goto :goto_7

    .line 21
    nop

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_8
    .end packed-switch
.end method

.method public static getScreennailCache(Landroid/content/Context;)Lcom/lge/gallery/data/cache/AbstractImageCacheService;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-static {p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;

    move-result-object v0

    return-object v0
.end method

.method public static getThumbnailCache(Landroid/content/Context;)Lcom/lge/gallery/data/cache/AbstractImageCacheService;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-static {p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;

    move-result-object v0

    return-object v0
.end method

.method public static makeGroupThumbKey(Lcom/lge/gallery/data/core/Path;IIJ)[B
    .registers 8
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "col"    # I
    .param p2, "total"    # I
    .param p3, "version"    # J

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 75
    .local v0, "keyString":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/GalleryUtils;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method

.method public static makeKey(Lcom/lge/gallery/data/core/Path;I)[B
    .registers 9
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "type"    # I

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaItem;

    move-object v0, v1

    check-cast v0, Lcom/lge/gallery/data/core/MediaItem;

    .line 48
    .local v0, "mediaItem":Lcom/lge/gallery/data/core/MediaItem;
    if-eqz p0, :cond_d

    if-nez v0, :cond_f

    .line 49
    :cond_d
    const/4 v1, 0x0

    .line 51
    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaItem;->getDateInMs()J

    move-result-wide v4

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p1

    invoke-static/range {v1 .. v6}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;JZ)[B

    move-result-object v1

    goto :goto_e
.end method

.method public static makeKey(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;JZ)[B
    .registers 9
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "type"    # I
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "date"    # J
    .param p5, "isLock"    # Z

    .prologue
    .line 55
    if-eqz p0, :cond_31

    .line 56
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 57
    .local v0, "keyString":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/GalleryUtils;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 63
    .end local v0    # "keyString":Ljava/lang/StringBuffer;
    :goto_30
    return-object v1

    :cond_31
    const/4 v1, 0x0

    goto :goto_30
.end method

.method public static makeKeyByMediaInfo(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaItemInfo;I)[B
    .registers 10
    .param p0, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "mediaItemInfo"    # Lcom/lge/gallery/data/core/MediaItemInfo;
    .param p2, "type"    # I

    .prologue
    .line 40
    if-eqz p0, :cond_4

    if-nez p1, :cond_6

    .line 41
    :cond_4
    const/4 v0, 0x0

    .line 43
    :goto_5
    return-object v0

    :cond_6
    iget-object v3, p1, Lcom/lge/gallery/data/core/MediaItemInfo;->mFilePath:Ljava/lang/String;

    iget-wide v4, p1, Lcom/lge/gallery/data/core/MediaItemInfo;->mDateTakenInMs:J

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p2

    invoke-static/range {v1 .. v6}, Lcom/lge/gallery/data/cache/LocalCacheProvider;->makeKey(Lcom/lge/gallery/data/core/Path;ILjava/lang/String;JZ)[B

    move-result-object v0

    goto :goto_5
.end method
