.class public abstract Lcom/lge/gallery/data/local/LocalMediaItem;
.super Lcom/lge/gallery/data/core/MediaItem;
.source "LocalMediaItem.java"


# static fields
.field public static final DEFALUT:I = 0x0

.field public static final IMAGE_MULTI_SHOT:I = 0x2

.field public static final IMAGE_PANORAMA:I = 0x1

.field public static final IMAGE_POP_OUT:I = 0x3

.field public static final IMAGE_VR:I = 0x64

.field private static final TAG:Ljava/lang/String; = "LocalMediaItem"

.field public static final VIDEO_MULTI_VIEW:I = 0xd

.field public static final VIDEO_POP_OUT:I = 0xe

.field public static final VIDEO_SLO_MO:I = 0xc

.field public static final VIDEO_SNAP:I = 0xa

.field public static final VIDEO_TIME_LAPSE:I = 0xb

.field public static final VIDEO_VR:I = 0x65


# instance fields
.field public bucketId:I

.field public caption:Ljava/lang/String;

.field public dateAddedInSec:J

.field public dateModifiedInSec:J

.field public dateTakenInMs:J

.field public filePath:Ljava/lang/String;

.field public fileSize:J

.field public id:I

.field public latitude:D

.field public longitude:D

.field protected final mBaseUri:Landroid/net/Uri;

.field protected mCameraMode:I

.field protected mContext:Landroid/content/Context;

.field protected final mCurrentSourceType:I

.field protected mProtectionType:I

.field public mimeType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;JLandroid/content/Context;)V
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "version"    # J
    .param p4, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v0, 0x0

    .line 80
    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/data/core/MediaItem;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 66
    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->latitude:D

    .line 67
    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->longitude:D

    .line 81
    iput-object p4, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mContext:Landroid/content/Context;

    .line 82
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->getLocalSourceTypeFromPrefix(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mCurrentSourceType:I

    .line 83
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalMediaItem;->getMediaType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_21

    .line 84
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mBaseUri:Landroid/net/Uri;

    .line 88
    :goto_20
    return-void

    .line 86
    :cond_21
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mBaseUri:Landroid/net/Uri;

    goto :goto_20
.end method

.method private updateFromCursorInternal(Landroid/database/Cursor;Ljava/util/HashMap;)Z
    .registers 4
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
    .line 138
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 139
    :cond_8
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateFromCursor(Landroid/database/Cursor;)Z

    move-result v0

    .line 141
    :goto_c
    return v0

    :cond_d
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z

    move-result v0

    goto :goto_c
.end method


# virtual methods
.method public bulkDelete(Lcom/lge/gallery/contentmanager/BulkDeleteListener;)V
    .registers 5
    .param p1, "listener"    # Lcom/lge/gallery/contentmanager/BulkDeleteListener;

    .prologue
    .line 208
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 209
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "path":Ljava/lang/String;
    if-eqz p1, :cond_3f

    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mBaseUri:Landroid/net/Uri;

    invoke-static {v1, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Lcom/lge/gallery/contentmanager/BulkDeleteListener;->onDelete(Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3f

    .line 211
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/lge/gallery/util/StorageStateManager;->isMemoryFull(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_37

    .line 212
    new-instance v1, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 214
    :cond_37
    new-instance v1, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 217
    :cond_3f
    return-void
.end method

.method public getBaseUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mBaseUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getBucketId()I
    .registers 2

    .prologue
    .line 117
    iget v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->bucketId:I

    return v0
.end method

.method public getCameraMode()I
    .registers 2

    .prologue
    .line 221
    iget v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mCameraMode:I

    return v0
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
    .line 125
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDateInMs()J
    .registers 3

    .prologue
    .line 97
    iget-wide v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->dateTakenInMs:J

    return-wide v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 14

    .prologue
    const/4 v12, 0x1

    .line 157
    invoke-super {p0}, Lcom/lge/gallery/data/core/MediaItem;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v2

    .line 158
    .local v2, "details":Lcom/lge/gallery/data/core/MediaDetails;
    const/16 v6, 0xc8

    iget-object v7, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->filePath:Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 159
    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->caption:Ljava/lang/String;

    invoke-virtual {v2, v12, v6}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 161
    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    .line 162
    .local v0, "dateFormat":Ljava/text/DateFormat;
    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mContext:Landroid/content/Context;

    invoke-static {v6}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v5

    .line 164
    .local v5, "timeFormat":Ljava/text/DateFormat;
    iget-wide v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->dateTakenInMs:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "mDate":Ljava/lang/String;
    iget-wide v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->dateTakenInMs:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 167
    .local v4, "mTime":Ljava/lang/String;
    const-string v6, " "

    invoke-virtual {v3, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "dateTaken":Ljava/lang/String;
    const/4 v6, 0x3

    invoke-virtual {v2, v6, v1}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 171
    const/4 v6, 0x4

    iget-object v7, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mimeType:Ljava/lang/String;

    invoke-virtual {v2, v6, v7}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 173
    iget-wide v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->latitude:D

    iget-wide v8, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->longitude:D

    invoke-static {v6, v7, v8, v9}, Lcom/lge/gallery/util/MapUtils;->isValidLocation(DD)Z

    move-result v6

    if-eqz v6, :cond_5f

    .line 174
    const/4 v6, 0x5

    const/4 v7, 0x2

    new-array v7, v7, [D

    const/4 v8, 0x0

    iget-wide v10, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->latitude:D

    aput-wide v10, v7, v8

    iget-wide v8, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->longitude:D

    aput-wide v8, v7, v12

    invoke-virtual {v2, v6, v7}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 176
    :cond_5f
    iget-wide v6, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->fileSize:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_72

    .line 177
    const/16 v6, 0xd

    iget-wide v8, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->fileSize:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 180
    :cond_72
    return-object v2
.end method

.method public getEntryFilePaths()Ljava/util/ArrayList;
    .registers 4
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
    .line 146
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->filePath:Ljava/lang/String;

    if-nez v1, :cond_d

    .line 147
    const-string v1, "LocalMediaItem"

    const-string v2, "getEntryFilePaths: filePath is null."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    const/4 v0, 0x0

    .line 152
    :goto_c
    return-object v0

    .line 150
    :cond_d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .local v0, "filePaths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->filePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c
.end method

.method public getFilePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getLatLong([D)V
    .registers 6
    .param p1, "latLong"    # [D

    .prologue
    .line 107
    const/4 v0, 0x0

    iget-wide v2, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->latitude:D

    aput-wide v2, p1, v0

    .line 108
    const/4 v0, 0x1

    iget-wide v2, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->longitude:D

    aput-wide v2, p1, v0

    .line 109
    return-void
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->caption:Ljava/lang/String;

    return-object v0
.end method

.method public getProtectionType()I
    .registers 2

    .prologue
    .line 203
    iget v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mProtectionType:I

    return v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 189
    iget-wide v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->fileSize:J

    return-wide v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 198
    iget v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mCurrentSourceType:I

    return v0
.end method

.method public hasDng()Z
    .registers 2

    .prologue
    .line 225
    const/4 v0, 0x0

    return v0
.end method

.method public setDownloadedSize(J)V
    .registers 3
    .param p1, "downloadedSize"    # J

    .prologue
    .line 230
    return-void
.end method

.method public updateContent(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/lge/gallery/data/local/LocalMediaItem;->getCursorKeyMap()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V

    .line 122
    return-void
.end method

.method public updateContent(Landroid/database/Cursor;Ljava/util/HashMap;)V
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
    .line 129
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    if-nez p1, :cond_3

    .line 135
    :cond_2
    :goto_2
    return-void

    .line 132
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/data/local/LocalMediaItem;->updateFromCursorInternal(Landroid/database/Cursor;Ljava/util/HashMap;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 133
    invoke-static {}, Lcom/lge/gallery/data/local/LocalMediaItem;->nextVersionNumber()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lge/gallery/data/local/LocalMediaItem;->mDataVersion:J

    goto :goto_2
.end method

.method protected abstract updateFromCursor(Landroid/database/Cursor;)Z
.end method

.method protected updateFromCursor(Landroid/database/Cursor;Ljava/util/HashMap;)Z
    .registers 4
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
    .line 113
    .local p2, "cursorKeyMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    return v0
.end method
