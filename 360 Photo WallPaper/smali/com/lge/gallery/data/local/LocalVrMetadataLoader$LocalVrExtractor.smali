.class final Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;
.super Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;
.source "LocalVrMetadataLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/LocalVrMetadataLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LocalVrExtractor"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LocalVrExtractor"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 37
    return-void
.end method


# virtual methods
.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    .registers 13
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 41
    new-instance v9, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    invoke-direct {v9}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;-><init>()V

    .line 42
    .local v9, "metadata":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    const/4 v7, 0x0

    .line 44
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_6
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/lge/gallery/data/local/ImageXmpTable;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/lge/gallery/data/local/ImageXmpTable;->FULL_PROJECTION:[Ljava/lang/String;

    const-string v3, "image_id = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 46
    if-eqz v7, :cond_2c

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_57

    .line 47
    :cond_2c
    const-string v0, "LocalVrExtractor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No item in table. : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    sget-object v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->DEFAULT_METADATA:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_48} :catch_6a
    .catchall {:try_start_6 .. :try_end_48} :catchall_83

    .line 55
    if-eqz v7, :cond_4d

    .line 57
    :try_start_4a
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4d} :catch_4e

    .line 63
    :cond_4d
    :goto_4d
    return-object v0

    .line 58
    :catch_4e
    move-exception v10

    .line 59
    .local v10, "t":Ljava/lang/Throwable;
    const-string v1, "LocalVrExtractor"

    const-string v2, "close fail"

    invoke-static {v1, v2, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4d

    .line 50
    .end local v10    # "t":Ljava/lang/Throwable;
    :cond_57
    :try_start_57
    invoke-virtual {v9, v7}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->loadFromCursor(Landroid/database/Cursor;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_5a} :catch_6a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_83

    .line 55
    if-eqz v7, :cond_5f

    .line 57
    :try_start_5c
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_5c .. :try_end_5f} :catch_61

    :cond_5f
    :goto_5f
    move-object v0, v9

    .line 63
    goto :goto_4d

    .line 58
    :catch_61
    move-exception v10

    .line 59
    .restart local v10    # "t":Ljava/lang/Throwable;
    const-string v0, "LocalVrExtractor"

    const-string v1, "close fail"

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5f

    .line 51
    .end local v10    # "t":Ljava/lang/Throwable;
    :catch_6a
    move-exception v8

    .line 52
    .local v8, "e":Ljava/lang/Exception;
    :try_start_6b
    const-string v0, "LocalVrExtractor"

    const-string v1, "No metadata in image "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    sget-object v9, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->DEFAULT_METADATA:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    :try_end_74
    .catchall {:try_start_6b .. :try_end_74} :catchall_83

    .line 55
    if-eqz v7, :cond_5f

    .line 57
    :try_start_76
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_79
    .catch Ljava/lang/Throwable; {:try_start_76 .. :try_end_79} :catch_7a

    goto :goto_5f

    .line 58
    :catch_7a
    move-exception v10

    .line 59
    .restart local v10    # "t":Ljava/lang/Throwable;
    const-string v0, "LocalVrExtractor"

    const-string v1, "close fail"

    invoke-static {v0, v1, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5f

    .line 55
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v10    # "t":Ljava/lang/Throwable;
    :catchall_83
    move-exception v0

    if-eqz v7, :cond_89

    .line 57
    :try_start_86
    invoke-interface {v7}, Landroid/database/Cursor;->close()V
    :try_end_89
    .catch Ljava/lang/Throwable; {:try_start_86 .. :try_end_89} :catch_8a

    .line 60
    :cond_89
    :goto_89
    throw v0

    .line 58
    :catch_8a
    move-exception v10

    .line 59
    .restart local v10    # "t":Ljava/lang/Throwable;
    const-string v1, "LocalVrExtractor"

    const-string v2, "close fail"

    invoke-static {v1, v2, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_89
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/local/LocalVrMetadataLoader$LocalVrExtractor;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    move-result-object v0

    return-object v0
.end method
