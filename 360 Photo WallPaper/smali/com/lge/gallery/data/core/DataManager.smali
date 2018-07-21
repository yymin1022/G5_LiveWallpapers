.class public final Lcom/lge/gallery/data/core/DataManager;
.super Ljava/lang/Object;
.source "DataManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/DataManager$NotifyBroker;,
        Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;
    }
.end annotation


# static fields
.field public static final INCLUDE_ALL:I = 0x3

.field public static final INCLUDE_IMAGE:I = 0x1

.field public static final INCLUDE_LOCAL_ALL_ONLY:I = 0x7

.field public static final INCLUDE_LOCAL_IMAGE_ONLY:I = 0x5

.field public static final INCLUDE_LOCAL_ONLY:I = 0x4

.field public static final INCLUDE_LOCAL_VIDEO_ONLY:I = 0x6

.field public static final INCLUDE_VIDEO:I = 0x2

.field public static final LOCK:Ljava/lang/Object;

.field private static final TAG:Ljava/lang/String; = "DataManager"

.field private static final TOP_IMAGE_SET_PATH:Ljava/lang/String; = "/combo/{/local/image}"

.field private static final TOP_LOCAL_IMAGE_SET_PATH:Ljava/lang/String; = "/local/image"

.field private static final TOP_LOCAL_SET_PATH:Ljava/lang/String; = "/local/all"

.field private static final TOP_LOCAL_VIDEO_SET_PATH:Ljava/lang/String; = "/local/video"

.field private static final TOP_SET_PATH:Ljava/lang/String; = "/combo/{/local/all}"

.field private static final TOP_VIDEO_SET_PATH:Ljava/lang/String; = "/combo/{/local/video}"


# instance fields
.field private mActiveCount:I

.field private mApplication:Landroid/app/Application;

.field private final mDefaultMainHandler:Landroid/os/Handler;

.field private mNotifierMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/net/Uri;",
            "Lcom/lge/gallery/data/core/DataManager$NotifyBroker;",
            ">;"
        }
    .end annotation
.end field

.field private mSourceMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lge/gallery/data/core/MediaSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/lge/gallery/data/core/DataManager;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/app/Application;)V
    .registers 4
    .param p1, "application"    # Landroid/app/Application;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v0, 0x0

    iput v0, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mNotifierMap:Ljava/util/HashMap;

    .line 89
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    .line 93
    iput-object p1, p0, Lcom/lge/gallery/data/core/DataManager;->mApplication:Landroid/app/Application;

    .line 94
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/app/Application;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mDefaultMainHandler:Landroid/os/Handler;

    .line 95
    return-void
.end method


# virtual methods
.method public declared-synchronized addMediaSource(Lcom/lge/gallery/data/core/MediaSource;Z)V
    .registers 4
    .param p1, "source"    # Lcom/lge/gallery/data/core/MediaSource;
    .param p2, "needToResume"    # Z

    .prologue
    .line 98
    monitor-enter p0

    if-nez p1, :cond_5

    .line 105
    :cond_3
    :goto_3
    monitor-exit p0

    return-void

    .line 101
    :cond_5
    :try_start_5
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->addSource(Lcom/lge/gallery/data/core/MediaSource;)V

    .line 102
    if-eqz p2, :cond_3

    iget v0, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    if-lez v0, :cond_3

    .line 103
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaSource;->resume()V
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_12

    goto :goto_3

    .line 98
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method addSource(Lcom/lge/gallery/data/core/MediaSource;)V
    .registers 4
    .param p1, "source"    # Lcom/lge/gallery/data/core/MediaSource;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaSource;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method public cache(Lcom/lge/gallery/data/core/Path;I)V
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "flag"    # I

    .prologue
    .line 285
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 286
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-eqz v0, :cond_9

    .line 287
    invoke-virtual {v0, p2}, Lcom/lge/gallery/data/core/MediaObject;->cache(I)V

    .line 289
    :cond_9
    return-void
.end method

.method public delete(Lcom/lge/gallery/data/core/Path;)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 251
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObjectWrapper(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 252
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_e

    .line 253
    const-string v1, "DataManager"

    const-string v2, "Cannot get the media object."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    :goto_d
    return-void

    .line 256
    :cond_e
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaObject;->delete()V

    goto :goto_d
.end method

.method public findPathByUri(Landroid/net/Uri;)Lcom/lge/gallery/data/core/Path;
    .registers 7
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 292
    if-nez p1, :cond_5

    move-object v1, v3

    .line 301
    :goto_4
    return-object v1

    .line 295
    :cond_5
    iget-object v4, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaSource;

    .line 296
    .local v2, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-virtual {v2, p1}, Lcom/lge/gallery/data/core/MediaSource;->findPathByUri(Landroid/net/Uri;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    .line 297
    .local v1, "path":Lcom/lge/gallery/data/core/Path;
    if-eqz v1, :cond_f

    goto :goto_4

    .end local v1    # "path":Lcom/lge/gallery/data/core/Path;
    .end local v2    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_22
    move-object v1, v3

    .line 301
    goto :goto_4
.end method

.method public getContentUri(Lcom/lge/gallery/data/core/Path;)Landroid/net/Uri;
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 260
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 261
    .local v0, "mediaobject":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_2a

    .line 262
    const-string v1, "DataManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DataManager.getContentUri() Path not found! ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    const/4 v1, 0x0

    .line 265
    :goto_29
    return-object v1

    :cond_2a
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaObject;->getContentUri()Landroid/net/Uri;

    move-result-object v1

    goto :goto_29
.end method

.method public getDataSource(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaSource;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 387
    iget-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSource;

    return-object v0
.end method

.method public getDefaultSetOf(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/Path;
    .registers 5
    .param p1, "item"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 305
    iget-object v1, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSource;

    .line 306
    .local v0, "source":Lcom/lge/gallery/data/core/MediaSource;
    if-nez v0, :cond_10

    const/4 v1, 0x0

    :goto_f
    return-object v1

    :cond_10
    invoke-virtual {v0, p1}, Lcom/lge/gallery/data/core/MediaSource;->getDefaultSetOf(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    goto :goto_f
.end method

.method public getDetails(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaDetails;
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 277
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 278
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_c

    .line 279
    new-instance v1, Lcom/lge/gallery/data/core/MediaDetails;

    invoke-direct {v1}, Lcom/lge/gallery/data/core/MediaDetails;-><init>()V

    .line 281
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaObject;->getDetails()Lcom/lge/gallery/data/core/MediaDetails;

    move-result-object v1

    goto :goto_b
.end method

.method public getMediaItemsFromString(Ljava/lang/String;)[Lcom/lge/gallery/data/core/MediaItem;
    .registers 7
    .param p1, "segment"    # Ljava/lang/String;

    .prologue
    .line 183
    invoke-static {p1}, Lcom/lge/gallery/data/core/Path;->splitSequence(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 184
    .local v2, "seq":[Ljava/lang/String;
    array-length v1, v2

    .line 185
    .local v1, "n":I
    new-array v3, v1, [Lcom/lge/gallery/data/core/MediaItem;

    .line 186
    .local v3, "sets":[Lcom/lge/gallery/data/core/MediaItem;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_17

    .line 187
    aget-object v4, v2, v0

    invoke-virtual {p0, v4}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/MediaItem;

    aput-object v4, v3, v0

    .line 186
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 189
    :cond_17
    return-object v3
.end method

.method public getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 9
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    const/4 v1, 0x0

    .line 137
    const-class v4, Lcom/lge/gallery/data/core/Path;

    monitor-enter v4

    .line 138
    if-nez p1, :cond_9

    .line 139
    :try_start_6
    monitor-exit v4

    move-object v0, v1

    .line 156
    :goto_8
    return-object v0

    .line 141
    :cond_9
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 142
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-eqz v0, :cond_14

    .line 143
    monitor-exit v4

    goto :goto_8

    .line 157
    .end local v0    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    :catchall_11
    move-exception v3

    monitor-exit v4
    :try_end_13
    .catchall {:try_start_6 .. :try_end_13} :catchall_11

    throw v3

    .line 146
    .restart local v0    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    :cond_14
    :try_start_14
    iget-object v3, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/data/core/MediaSource;

    .line 147
    .local v2, "source":Lcom/lge/gallery/data/core/MediaSource;
    if-nez v2, :cond_3d

    .line 148
    const-string v3, "DataManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot find media source for path: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    monitor-exit v4

    move-object v0, v1

    goto :goto_8

    .line 152
    :cond_3d
    invoke-virtual {v2, p1}, Lcom/lge/gallery/data/core/MediaSource;->createMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v1

    .line 153
    .local v1, "object":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v1, :cond_5b

    .line 154
    const-string v3, "DataManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot create media object: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    :cond_5b
    monitor-exit v4
    :try_end_5c
    .catchall {:try_start_14 .. :try_end_5c} :catchall_11

    move-object v0, v1

    goto :goto_8
.end method

.method public getMediaObject(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 161
    invoke-static {p1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    return-object v0
.end method

.method public getMediaObjectWrapper(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 7
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 237
    const/4 v2, 0x0

    .line 239
    .local v2, "obj":Lcom/lge/gallery/data/core/MediaObject;
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_4} :catch_7
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_4} :catch_11

    move-result-object v2

    :goto_5
    move-object v3, v2

    .line 247
    :goto_6
    return-object v3

    .line 240
    :catch_7
    move-exception v1

    .line 241
    .local v1, "e":Ljava/lang/RuntimeException;
    const-string v3, "DataManager"

    const-string v4, "Cannot get the media object."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    const/4 v2, 0x0

    .line 246
    goto :goto_5

    .line 243
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catch_11
    move-exception v0

    .line 244
    .local v0, "ae":Ljava/lang/AssertionError;
    const-string v3, "DataManager"

    const-string v4, "The object is already exist."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObjectWrapper(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v3

    goto :goto_6
.end method

.method public getMediaObjectWrapper(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 233
    invoke-static {p1}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/DataManager;->getMediaObjectWrapper(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    return-object v0
.end method

.method public getMediaSet(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaSet;
    .registers 3
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 165
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSet;

    return-object v0
.end method

.method public getMediaSet(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaSet;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSet;

    return-object v0
.end method

.method public getMediaSetsFromString(Ljava/lang/String;)[Lcom/lge/gallery/data/core/MediaSet;
    .registers 7
    .param p1, "segment"    # Ljava/lang/String;

    .prologue
    .line 173
    invoke-static {p1}, Lcom/lge/gallery/data/core/Path;->splitSequence(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 174
    .local v2, "seq":[Ljava/lang/String;
    array-length v1, v2

    .line 175
    .local v1, "n":I
    new-array v3, v1, [Lcom/lge/gallery/data/core/MediaSet;

    .line 176
    .local v3, "sets":[Lcom/lge/gallery/data/core/MediaSet;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_15

    .line 177
    aget-object v4, v2, v0

    invoke-virtual {p0, v4}, Lcom/lge/gallery/data/core/DataManager;->getMediaSet(Ljava/lang/String;)Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v4

    aput-object v4, v3, v0

    .line 176
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 179
    :cond_15
    return-object v3
.end method

.method public getMediaType(Lcom/lge/gallery/data/core/Path;)I
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 269
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 270
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_8

    .line 271
    const/4 v1, 0x1

    .line 273
    :goto_7
    return v1

    :cond_8
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaObject;->getMediaType()I

    move-result v1

    goto :goto_7
.end method

.method public getSourceSize()I
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public getSupportedOperations(Lcom/lge/gallery/data/core/Path;)I
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 225
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 226
    .local v0, "obj":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_8

    .line 227
    const/4 v1, 0x0

    .line 229
    :goto_7
    return v1

    :cond_8
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaObject;->getSupportedOperations()I

    move-result v1

    goto :goto_7
.end method

.method public getTopSetPath(I)Ljava/lang/String;
    .registers 3
    .param p1, "typeBits"    # I

    .prologue
    .line 112
    packed-switch p1, :pswitch_data_1c

    .line 119
    :pswitch_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 113
    :pswitch_9
    const-string v0, "/combo/{/local/image}"

    .line 118
    :goto_b
    return-object v0

    .line 114
    :pswitch_c
    const-string v0, "/combo/{/local/video}"

    goto :goto_b

    .line 115
    :pswitch_f
    const-string v0, "/combo/{/local/all}"

    goto :goto_b

    .line 116
    :pswitch_12
    const-string v0, "/local/image"

    goto :goto_b

    .line 117
    :pswitch_15
    const-string v0, "/local/video"

    goto :goto_b

    .line 118
    :pswitch_18
    const-string v0, "/local/all"

    goto :goto_b

    .line 112
    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_3
        :pswitch_12
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method

.method public getTotalTargetCacheSize()J
    .registers 7

    .prologue
    .line 321
    const-wide/16 v2, 0x0

    .line 322
    .local v2, "sum":J
    iget-object v4, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaSource;

    .line 323
    .local v1, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaSource;->getTotalTargetCacheSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 324
    goto :goto_c

    .line 325
    .end local v1    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_1e
    return-wide v2
.end method

.method public getTotalUsedCacheSize()J
    .registers 7

    .prologue
    .line 311
    const-wide/16 v2, 0x0

    .line 312
    .local v2, "sum":J
    iget-object v4, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaSource;

    .line 313
    .local v1, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaSource;->getTotalUsedCacheSize()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 314
    goto :goto_c

    .line 315
    .end local v1    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_1e
    return-wide v2
.end method

.method public mapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;I)V
    .registers 15
    .param p2, "consumer"    # Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;
    .param p3, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/Path;",
            ">;",
            "Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 199
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/Path;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 203
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 204
    .local v5, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v5, :cond_33

    .line 205
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/lge/gallery/data/core/Path;

    .line 206
    .local v6, "path":Lcom/lge/gallery/data/core/Path;
    invoke-virtual {v6}, Lcom/lge/gallery/data/core/Path;->getPrefix()Ljava/lang/String;

    move-result-object v7

    .line 207
    .local v7, "prefix":Ljava/lang/String;
    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 208
    .local v1, "group":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    if-nez v1, :cond_26

    .line 209
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "group":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .restart local v1    # "group":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    invoke-virtual {v4, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    :cond_26
    new-instance v9, Lcom/lge/gallery/data/core/MediaSource$PathId;

    add-int v10, v2, p3

    invoke-direct {v9, v6, v10}, Lcom/lge/gallery/data/core/MediaSource$PathId;-><init>(Lcom/lge/gallery/data/core/Path;I)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 216
    .end local v1    # "group":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;"
    .end local v6    # "path":Lcom/lge/gallery/data/core/Path;
    .end local v7    # "prefix":Ljava/lang/String;
    :cond_33
    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 217
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 218
    .restart local v7    # "prefix":Ljava/lang/String;
    iget-object v9, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v9, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/lge/gallery/data/core/MediaSource;

    .line 219
    .local v8, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    invoke-virtual {v8, v9, p2}, Lcom/lge/gallery/data/core/MediaSource;->mapMediaItems(Ljava/util/ArrayList;Lcom/lge/gallery/data/core/MediaSet$ItemConsumer;)V

    goto :goto_3b

    .line 221
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaSource$PathId;>;>;"
    .end local v7    # "prefix":Ljava/lang/String;
    .end local v8    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_5f
    return-void
.end method

.method public pause()V
    .registers 4

    .prologue
    .line 351
    iget v2, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    if-nez v2, :cond_22

    .line 352
    iget-object v2, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaSource;

    .line 353
    .local v1, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaSource;->pause()V

    goto :goto_12

    .line 356
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_22
    return-void
.end method

.method public peekMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 3
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 129
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    return-object v0
.end method

.method public peekMediaSet(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaSet;
    .registers 3
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 133
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaSet;

    return-object v0
.end method

.method public registerChangeNotifier(Landroid/net/Uri;Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;)V
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "notifier"    # Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;

    .prologue
    .line 329
    const/4 v1, 0x0

    .line 330
    .local v1, "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    iget-object v4, p0, Lcom/lge/gallery/data/core/DataManager;->mNotifierMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 331
    :try_start_4
    iget-object v3, p0, Lcom/lge/gallery/data/core/DataManager;->mNotifierMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;

    move-object v1, v0

    .line 332
    if-nez v1, :cond_27

    .line 333
    new-instance v2, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;

    iget-object v3, p0, Lcom/lge/gallery/data/core/DataManager;->mDefaultMainHandler:Landroid/os/Handler;

    invoke-direct {v2, v3}, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;-><init>(Landroid/os/Handler;)V
    :try_end_17
    .catchall {:try_start_4 .. :try_end_17} :catchall_2c

    .line 334
    .end local v1    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    .local v2, "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    :try_start_17
    iget-object v3, p0, Lcom/lge/gallery/data/core/DataManager;->mApplication:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v5, 0x1

    invoke-virtual {v3, p1, v5, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 336
    iget-object v3, p0, Lcom/lge/gallery/data/core/DataManager;->mNotifierMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_26
    .catchall {:try_start_17 .. :try_end_26} :catchall_2f

    move-object v1, v2

    .line 338
    .end local v2    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    .restart local v1    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    :cond_27
    :try_start_27
    monitor-exit v4
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_2c

    .line 339
    invoke-virtual {v1, p2}, Lcom/lge/gallery/data/core/DataManager$NotifyBroker;->registerNotifier(Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;)V

    .line 340
    return-void

    .line 338
    :catchall_2c
    move-exception v3

    :goto_2d
    :try_start_2d
    monitor-exit v4
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2c

    throw v3

    .end local v1    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    .restart local v2    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    :catchall_2f
    move-exception v3

    move-object v1, v2

    .end local v2    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    .restart local v1    # "broker":Lcom/lge/gallery/data/core/DataManager$NotifyBroker;
    goto :goto_2d
.end method

.method public requestDownload(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaObject$ProgressListener;)Lcom/lge/gallery/util/ThreadPool$Job;
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "listener"    # Lcom/lge/gallery/data/core/MediaObject$ProgressListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lge/gallery/data/core/Path;",
            "Lcom/lge/gallery/data/core/MediaObject$ProgressListener;",
            ")",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 359
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v0

    .line 360
    .local v0, "media":Lcom/lge/gallery/data/core/MediaObject;
    if-nez v0, :cond_8

    .line 361
    const/4 v1, 0x0

    .line 363
    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0, p2}, Lcom/lge/gallery/data/core/MediaObject;->requestDownload(Lcom/lge/gallery/data/core/MediaObject$ProgressListener;)Lcom/lge/gallery/util/ThreadPool$Job;

    move-result-object v1

    goto :goto_7
.end method

.method public resume()V
    .registers 5

    .prologue
    .line 343
    iget v2, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/lge/gallery/data/core/DataManager;->mActiveCount:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_23

    .line 344
    iget-object v2, p0, Lcom/lge/gallery/data/core/DataManager;->mSourceMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/MediaSource;

    .line 345
    .local v1, "source":Lcom/lge/gallery/data/core/MediaSource;
    invoke-virtual {v1}, Lcom/lge/gallery/data/core/MediaSource;->resume()V

    goto :goto_13

    .line 348
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "source":Lcom/lge/gallery/data/core/MediaSource;
    :cond_23
    return-void
.end method
