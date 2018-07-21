.class public abstract Lcom/lge/gallery/data/core/MediaObject;
.super Ljava/lang/Object;
.source "MediaObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/MediaObject$ProgressListener;
    }
.end annotation


# static fields
.field public static final CACHE_FLAG_FULL:I = 0x2

.field public static final CACHE_FLAG_NO:I = 0x0

.field public static final CACHE_FLAG_SCREENNAIL:I = 0x1

.field public static final CACHE_STATUS_CACHED_FULL:I = 0x3

.field public static final CACHE_STATUS_CACHED_SCREENNAIL:I = 0x2

.field public static final CACHE_STATUS_CACHING:I = 0x1

.field public static final CACHE_STATUS_NOT_CACHED:I = 0x0

.field public static final INVALID_DATA_VERSION:J = -0x1L

.field public static final SUPPORT_ALL:I = -0x1

.field public static final SUPPORT_CACHE:I = 0x100

.field public static final SUPPORT_CROP:I = 0x8

.field public static final SUPPORT_DELETE:I = 0x1

.field public static final SUPPORT_DOWNLOAD:I = 0x20000

.field public static final SUPPORT_DOWNLOAD_FOR_SHARE:I = 0x2000000

.field public static final SUPPORT_EDIT:I = 0x200

.field public static final SUPPORT_FULL_IMAGE:I = 0x40

.field public static final SUPPORT_INFO:I = 0x400

.field public static final SUPPORT_NONE:I = 0x0

.field public static final SUPPORT_PLAY:I = 0x80

.field public static final SUPPORT_ROTATE:I = 0x2

.field public static final SUPPORT_SHARE:I = 0x4

.field public static final SUPPORT_SHARELINK:I = 0x80000

.field public static final SUPPORT_SLIDESHOW:I = 0x800

.field public static final SUPPORT_TRIM:I = 0x100000

.field private static final TAG:Ljava/lang/String; = "MediaObject"

.field private static sVersionSerial:J


# instance fields
.field protected mBaseUri:Landroid/net/Uri;

.field protected mDataVersion:J

.field private mIgnoreToDecode:Z

.field protected final mPath:Lcom/lge/gallery/data/core/Path;

.field private mPrevVersion:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 63
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/lge/gallery/data/core/MediaObject;->sVersionSerial:J

    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;J)V
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "version"    # J

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    invoke-virtual {p1, p0}, Lcom/lge/gallery/data/core/Path;->setObject(Lcom/lge/gallery/data/core/MediaObject;)V

    .line 78
    iput-object p1, p0, Lcom/lge/gallery/data/core/MediaObject;->mPath:Lcom/lge/gallery/data/core/Path;

    .line 79
    iput-wide p2, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    .line 80
    return-void
.end method

.method public static declared-synchronized nextVersionNumber()J
    .registers 6

    .prologue
    .line 143
    const-class v1, Lcom/lge/gallery/data/core/MediaObject;

    monitor-enter v1

    :try_start_3
    sget-wide v2, Lcom/lge/gallery/data/core/MediaObject;->sVersionSerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lcom/lge/gallery/data/core/MediaObject;->sVersionSerial:J
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_c

    monitor-exit v1

    return-wide v2

    :catchall_c
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public Import()Z
    .registers 2

    .prologue
    .line 114
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bulkDelete(Lcom/lge/gallery/contentmanager/BulkDeleteListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/contentmanager/BulkDeleteListener;

    .prologue
    .line 94
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public cache(I)V
    .registers 3
    .param p1, "flag"    # I

    .prologue
    .line 139
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public delete()V
    .registers 2

    .prologue
    .line 91
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public download(Landroid/content/Context;Ljava/util/ArrayList;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/Path;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p2, "selected":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/Path;>;"
    return-void
.end method

.method public getBaseUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mBaseUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getCacheFlag()I
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public getCacheSize()J
    .registers 2

    .prologue
    .line 135
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getCacheStatus()I
    .registers 2

    .prologue
    .line 131
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getContentUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 106
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getDataVersion()J
    .registers 3

    .prologue
    .line 123
    iget-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    return-wide v0
.end method

.method public getDetails()Lcom/lge/gallery/data/core/MediaDetails;
    .registers 2

    .prologue
    .line 118
    new-instance v0, Lcom/lge/gallery/data/core/MediaDetails;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaDetails;-><init>()V

    .line 119
    .local v0, "details":Lcom/lge/gallery/data/core/MediaDetails;
    return-object v0
.end method

.method public getDirectory()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getEntryFilePaths()Ljava/util/ArrayList;
    .registers 2
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
    .line 98
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 160
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMediaType()I
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public getPath()Lcom/lge/gallery/data/core/Path;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mPath:Lcom/lge/gallery/data/core/Path;

    return-object v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 164
    const/4 v0, 0x0

    return v0
.end method

.method public getSupportedOperations()I
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public getUrl()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 156
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isIgnoreToDecode()Z
    .registers 5

    .prologue
    .line 176
    iget-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mPrevVersion:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_31

    iget-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    iget-wide v2, p0, Lcom/lge/gallery/data/core/MediaObject;->mPrevVersion:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_31

    .line 177
    iget-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    iput-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mPrevVersion:J

    .line 178
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mIgnoreToDecode:Z

    .line 179
    const-string v0, "MediaObject"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "version is changed to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    :cond_31
    iget-boolean v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mIgnoreToDecode:Z

    return v0
.end method

.method public requestDownload(Lcom/lge/gallery/data/core/MediaObject$ProgressListener;)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/data/core/MediaObject$ProgressListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/MediaObject$ProgressListener;",
            ")",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public rotate(I)V
    .registers 3
    .param p1, "degrees"    # I

    .prologue
    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setIgnoreToDecode(Z)V
    .registers 4
    .param p1, "ignore"    # Z

    .prologue
    .line 171
    iget-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mDataVersion:J

    iput-wide v0, p0, Lcom/lge/gallery/data/core/MediaObject;->mPrevVersion:J

    .line 172
    iput-boolean p1, p0, Lcom/lge/gallery/data/core/MediaObject;->mIgnoreToDecode:Z

    .line 173
    return-void
.end method

.method public update()Lcom/lge/gallery/data/core/MediaObject;
    .registers 1

    .prologue
    .line 147
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->assertNotInRenderThread()V

    .line 148
    return-object p0
.end method
