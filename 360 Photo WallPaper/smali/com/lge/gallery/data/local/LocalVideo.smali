.class public Lcom/lge/gallery/data/local/LocalVideo;
.super Lcom/lge/gallery/data/local/LocalMediaItem;
.source "LocalVideo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;
    }
.end annotation


# static fields
.field public static final CURSOR_INDEX_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final ITEM_PATH:Lcom/lge/gallery/data/core/Path;

.field protected static final NOT_INIT:I = -0x1

.field public static final PROJECTION:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "LocalVideo"


# instance fields
.field public durationInSec:I

.field private height:I

.field protected final mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field protected mCachedOperation:I

.field public resolution:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 54
    const-string v3, "/local/video/item"

    invoke-static {v3}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v3

    sput-object v3, Lcom/lge/gallery/data/local/LocalVideo;->ITEM_PATH:Lcom/lge/gallery/data/core/Path;

    .line 60
    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v3}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    sput-object v3, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    .line 61
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 64
    invoke-static {}, Lcom/lge/gallery/data/local/LocalVideo;->updateProjection()V

    .line 65
    const/4 v1, 0x0

    .line 66
    .local v1, "jk":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_3c

    .line 67
    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_39

    .line 68
    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    sget-object v4, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    aget-object v4, v4, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "jk":I
    .local v2, "jk":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v2

    .line 66
    .end local v2    # "jk":I
    .restart local v1    # "jk":I
    :cond_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 71
    :cond_3c
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "context"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 115
    invoke-static {}, Lcom/lge/gallery/data/local/LocalVideo;->nextVersionNumber()J

    move-result-wide v0

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 266
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    .line 116
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 117
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;I)V
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "context"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "id"    # I

    .prologue
    .line 96
    invoke-static {}, Lcom/lge/gallery/data/local/LocalVideo;->nextVersionNumber()J

    move-result-wide v2

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, p1, v2, v3, v1}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 266
    const/4 v1, -0x1

    iput v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    .line 97
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 98
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v1}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mBaseUri:Landroid/net/Uri;

    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    invoke-static {v1, v2, v3, p3}, Lcom/lge/gallery/contentmanager/DBUtil;->getItemCursorById(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    .line 100
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_39

    .line 101
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot get cursor for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 104
    :cond_39
    :try_start_39
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 105
    sget-object v1, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v1}, Lcom/lge/gallery/data/local/LocalVideo;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    :try_end_44
    .catchall {:try_start_39 .. :try_end_44} :catchall_61

    .line 110
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 112
    return-void

    .line 107
    :cond_48
    :try_start_48
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot find data for: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_61
    .catchall {:try_start_48 .. :try_end_61} :catchall_61

    .line 110
    :catchall_61
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;Landroid/database/Cursor;Ljava/util/HashMap;)V
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p3, "cursor"    # Landroid/database/Cursor;
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p4, "cursorKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/lge/gallery/data/local/LocalVideo;->nextVersionNumber()J

    move-result-wide v0

    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/lge/gallery/data/local/LocalMediaItem;-><init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V

    .line 266
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    .line 91
    iput-object p2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 92
    if-nez p4, :cond_14

    sget-object p4, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .end local p4    # "cursorKey":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :cond_14
    invoke-virtual {p0, p3, p4}, Lcom/lge/gallery/data/local/LocalVideo;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 93
    return-void
.end method

.method private clearCachedOperation()V
    .registers 2

    .prologue
    .line 268
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    .line 269
    return-void
.end method

.method private updateCameraMode()V
    .registers 1

    .prologue
    .line 149
    return-void
.end method

.method private static updateProjection()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 74
    sget-object v1, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xd

    aput-object v3, v1, v2

    .line 75
    const/16 v0, 0xf

    .local v0, "i":I
    :goto_9
    const/16 v1, 0x13

    if-gt v0, v1, :cond_14

    .line 76
    sget-object v1, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    aput-object v3, v1, v0

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 78
    :cond_14
    return-void
.end method

.method private updateWidthAndHeight()V
    .registers 4

    .prologue
    .line 152
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2a

    .line 153
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "token":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2a

    .line 155
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->width:I

    .line 156
    const/4 v1, 0x1

    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->height:I

    .line 159
    .end local v0    # "token":[Ljava/lang/String;
    :cond_2a
    return-void
.end method


# virtual methods
.method public delete()V
    .registers 8

    .prologue
    .line 284
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 285
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 287
    .local v0, "baseUri":Landroid/net/Uri;
    :try_start_5
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v6, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_1c} :catch_1d

    .line 298
    return-void

    .line 289
    :catch_1d
    move-exception v1

    .line 291
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "LocalVideo"

    const-string v3, "Delete error in localVideo"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 293
    new-instance v2, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 295
    :cond_39
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v3, ""

    invoke-direct {v2, v3}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getBrokenImage(Landroid/app/Activity;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 339
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 340
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 341
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/lge/gallery/common/R$drawable;->ic_gallery_broken_vod_empty2_thumbnail:I

    invoke-static {v1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public getContentUri()Landroid/net/Uri;
    .registers 3

    .prologue
    .line 306
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mBaseUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected getCursorKeyMap()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    sget-object v0, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    return-object v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 6

    .prologue
    .line 316
    invoke-super {p0}, Lcom/lge/gallery/data/local/LocalMediaItem;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v0

    .line 317
    .local v0, "details":Lcom/lge/gallery/data/core/MediaDetails;
    iget v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    .line 318
    .local v1, "s":I
    if-lez v1, :cond_19

    .line 319
    const/16 v2, 0x8

    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    invoke-static {v3, v4}, Lcom/lge/gallery/util/GalleryUtils;->formatDuration(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 322
    :cond_19
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    if-eqz v2, :cond_24

    .line 323
    const/16 v2, 0xb

    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 325
    :cond_24
    return-object v0
.end method

.method public getDurationString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 81
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    invoke-static {v0, v1}, Lcom/lge/gallery/util/GalleryUtils;->formatDuration(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 335
    iget v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->height:I

    return v0
.end method

.method public getMediaType()I
    .registers 2

    .prologue
    .line 311
    const/4 v0, 0x4

    return v0
.end method

.method public getSupportedOperations()I
    .registers 4

    .prologue
    .line 273
    iget v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_8

    .line 274
    iget v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    .line 278
    :goto_7
    return v0

    .line 276
    :cond_8
    const/16 v0, 0x485

    .line 277
    .local v0, "operation":I
    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCachedOperation:I

    goto :goto_7
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 330
    iget v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->width:I

    return v0
.end method

.method public is360()Z
    .registers 3

    .prologue
    .line 347
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalVideo;->getCameraMode()I

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    .registers 5
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 142
    :goto_2
    return-void

    .line 123
    :cond_3
    const-string v0, "_id"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    .line 124
    const-string v0, "title"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->caption:Ljava/lang/String;

    .line 125
    const-string v0, "mime_type"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mimeType:Ljava/lang/String;

    .line 126
    const-string v0, "latitude"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->latitude:D

    .line 127
    const-string v0, "longitude"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->longitude:D

    .line 128
    const-string v0, "datetaken"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateTakenInMs:J

    .line 129
    const-string v0, "date_added"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateAddedInSec:J

    .line 130
    const-string v0, "date_modified"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateModifiedInSec:J

    .line 131
    const-string v0, "_data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->filePath:Ljava/lang/String;

    .line 132
    const-string v0, "duration"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    div-int/lit16 v0, v0, 0x3e8

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    .line 133
    const-string v0, "bucket_id"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->bucketId:I

    .line 134
    const-string v0, "_size"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->fileSize:J

    .line 135
    const-string v0, "resolution"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    .line 136
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    if-eqz v0, :cond_105

    .line 137
    const-string v0, "camera_mode"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCameraMode:I

    .line 139
    :cond_105
    sget-object v0, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalVideo;->mProtectionType:I

    .line 140
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->updateWidthAndHeight()V

    .line 141
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->updateCameraMode()V

    goto/16 :goto_2
.end method

.method public requestImage(I)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 8
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    new-instance v0, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalVideo;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v2

    iget-object v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->filePath:Ljava/lang/String;

    iget v5, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/local/LocalVideo$LocalVideoRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;I)V

    return-object v0
.end method

.method public requestLargeImage()Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Lcom/lge/gallery/decoder/GalleryRegionDecoder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 261
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot regquest a large image to a local video!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public rotate(I)V
    .registers 2
    .param p1, "degrees"    # I

    .prologue
    .line 302
    return-void
.end method

.method public update()Lcom/lge/gallery/data/core/MediaObject;
    .registers 7

    .prologue
    const/4 v4, 0x0

    .line 352
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 353
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v3}, Lcom/lge/gallery/appinterface/GalleryApp;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 354
    .local v1, "resolver":Landroid/content/ContentResolver;
    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mBaseUri:Landroid/net/Uri;

    .line 355
    .local v2, "uri":Landroid/net/Uri;
    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->PROJECTION:[Ljava/lang/String;

    iget v5, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    invoke-static {v1, v2, v3, v5}, Lcom/lge/gallery/contentmanager/DBUtil;->getItemCursorById(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    .line 356
    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_18

    move-object p0, v4

    .line 369
    .end local p0    # "this":Lcom/lge/gallery/data/local/LocalVideo;
    :goto_17
    return-object p0

    .line 360
    .restart local p0    # "this":Lcom/lge/gallery/data/local/LocalVideo;
    :cond_18
    :try_start_18
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_40

    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    const-string v5, "_id"

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iget v5, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    if-ne v3, v5, :cond_40

    .line 361
    sget-object v3, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, v0, v3}, Lcom/lge/gallery/data/local/LocalVideo;->loadFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)V
    :try_end_39
    .catchall {:try_start_18 .. :try_end_39} :catchall_45

    .line 366
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 368
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->clearCachedOperation()V

    goto :goto_17

    .line 366
    :cond_40
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move-object p0, v4

    goto :goto_17

    :catchall_45
    move-exception v3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v3
.end method

.method protected updateFromCursor(Landroid/database/Cursor;)Z
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 168
    sget-object v0, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/data/local/LocalVideo;->updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z

    move-result v0

    return v0
.end method

.method protected updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z
    .registers 9
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 173
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_4

    .line 174
    const/4 v2, 0x0

    .line 204
    :goto_3
    return v2

    .line 176
    :cond_4
    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_198

    :cond_c
    sget-object v0, Lcom/lge/gallery/data/local/LocalVideo;->CURSOR_INDEX_MAP:Ljava/util/HashMap;

    .line 178
    .local v0, "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_e
    new-instance v1, Lcom/lge/gallery/util/UpdateHelper;

    invoke-direct {v1}, Lcom/lge/gallery/util/UpdateHelper;-><init>()V

    .line 179
    .local v1, "uh":Lcom/lge/gallery/util/UpdateHelper;
    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    const-string v2, "_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->id:I

    .line 180
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->caption:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->caption:Ljava/lang/String;

    .line 181
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->mimeType:Ljava/lang/String;

    const-string v2, "mime_type"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mimeType:Ljava/lang/String;

    .line 182
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->latitude:D

    const-string v2, "latitude"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->latitude:D

    .line 183
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->longitude:D

    const-string v2, "longitude"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(DD)D

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->longitude:D

    .line 184
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateTakenInMs:J

    const-string v2, "datetaken"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateTakenInMs:J

    .line 186
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateAddedInSec:J

    const-string v2, "date_added"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateAddedInSec:J

    .line 188
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateModifiedInSec:J

    const-string v2, "date_modified"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->dateModifiedInSec:J

    .line 190
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->filePath:Ljava/lang/String;

    const-string v2, "_data"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->filePath:Ljava/lang/String;

    .line 191
    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    const-string v2, "duration"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    div-int/lit16 v2, v2, 0x3e8

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->durationInSec:I

    .line 193
    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->bucketId:I

    const-string v2, "bucket_id"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->bucketId:I

    .line 194
    iget-wide v4, p0, Lcom/lge/gallery/data/local/LocalVideo;->fileSize:J

    const-string v2, "_size"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/lge/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->fileSize:J

    .line 195
    iget-object v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    const-string v2, "resolution"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->resolution:Ljava/lang/String;

    .line 196
    sget-boolean v2, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    if-eqz v2, :cond_171

    .line 197
    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCameraMode:I

    const-string v2, "camera_mode"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mCameraMode:I

    .line 199
    :cond_171
    iget v3, p0, Lcom/lge/gallery/data/local/LocalVideo;->mProtectionType:I

    sget-object v2, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/lge/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/lge/gallery/data/local/LocalVideo;->mProtectionType:I

    .line 200
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->updateWidthAndHeight()V

    .line 201
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->updateCameraMode()V

    .line 202
    invoke-direct {p0}, Lcom/lge/gallery/data/local/LocalVideo;->clearCachedOperation()V

    .line 204
    invoke-virtual {v1}, Lcom/lge/gallery/util/UpdateHelper;->isUpdated()Z

    move-result v2

    goto/16 :goto_3

    .end local v0    # "keyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v1    # "uh":Lcom/lge/gallery/util/UpdateHelper;
    :cond_198
    move-object v0, p2

    .line 176
    goto/16 :goto_e
.end method
