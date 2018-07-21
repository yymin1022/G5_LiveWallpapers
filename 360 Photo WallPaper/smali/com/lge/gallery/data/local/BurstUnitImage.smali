.class public Lcom/lge/gallery/data/local/BurstUnitImage;
.super Lcom/lge/gallery/data/local/BurstImage;
.source "BurstUnitImage.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BurstUnitImage"


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 13
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p5, "burstId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Lcom/lge/gallery/appinterface/GalleryApp;",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 32
    .local p4, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/lge/gallery/data/local/BurstImage;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;Ljava/lang/String;I)V

    .line 33
    return-void
.end method


# virtual methods
.method public delete()V
    .registers 8

    .prologue
    .line 52
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 53
    iget-object v0, p0, Lcom/lge/gallery/data/local/BurstUnitImage;->mBaseUri:Landroid/net/Uri;

    .line 55
    .local v0, "baseUri":Landroid/net/Uri;
    :try_start_5
    iget-object v2, p0, Lcom/lge/gallery/data/local/BurstUnitImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v6, p0, Lcom/lge/gallery/data/local/BurstUnitImage;->id:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1c} :catch_1d

    .line 65
    return-void

    .line 57
    :catch_1d
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "BurstUnitImage"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Delete error : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    iget-object v2, p0, Lcom/lge/gallery/data/local/BurstUnitImage;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 60
    new-instance v2, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 62
    :cond_4e
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getEntryFilePaths()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v0, "filePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/BurstUnitImage;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    return-object v0
.end method

.method public getSubMediaItem(II)Ljava/util/ArrayList;
    .registers 4
    .param p1, "start"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public getSubMediaItemCount()I
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x0

    return v0
.end method

.method setBurstCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 43
    return-void
.end method
