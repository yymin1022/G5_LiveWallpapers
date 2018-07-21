.class public Lcom/lge/gallery/data/local/LocalAlbumUtils;
.super Ljava/lang/Object;
.source "LocalAlbumUtils.java"


# static fields
.field private static final BUCKET_PROJECTION:[Ljava/lang/String;

.field private static final FILES_URI:Landroid/net/Uri;

.field public static final IS_CAMERA_MODE_FIELD_EXIST:Z

.field static final IS_LOCK_FIELD_EXIST:Z

.field public static final SPERICAL_CAMERA_ALBUM_NAME:Ljava/lang/String; = "DCIM/AccessoryCamera/C1"

.field public static final SPHERICAL_CAMERA_ALBUM_PATH_PREFIX:Ljava/lang/String; = "/local/all/"

.field private static final TAG:Ljava/lang/String; = "LocalAlbumUtils"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 24
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->FILES_URI:Landroid/net/Uri;

    .line 25
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->isLockColumnExist()Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_LOCK_FIELD_EXIST:Z

    .line 28
    const-string v0, "camera_mode"

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->isColumnExist(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    .line 30
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "bucket_display_name"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->BUCKET_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBucketName(Landroid/content/ContentResolver;I)Ljava/lang/String;
    .registers 3
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "bucketId"    # I

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/lge/gallery/data/local/LocalAlbumUtils;->getBucketName(Landroid/content/ContentResolver;ILcom/lge/gallery/data/core/Path;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBucketName(Landroid/content/ContentResolver;ILcom/lge/gallery/data/core/Path;)Ljava/lang/String;
    .registers 14
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "bucketId"    # I
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 39
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_LOCK_FIELD_EXIST:Z

    if-eqz v0, :cond_61

    const-string v10, " and is_lock = 0"

    .line 40
    .local v10, "selectionArgue":Ljava/lang/String;
    :goto_6
    sget-object v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->FILES_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "limit"

    const-string v3, "1"

    invoke-virtual {v0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 43
    .local v1, "uri":Landroid/net/Uri;
    const/4 v8, 0x0

    .line 44
    .local v8, "cursor":Landroid/database/Cursor;
    const-string v6, ""

    .line 46
    .local v6, "bucketName":Ljava/lang/String;
    :try_start_1b
    sget-object v2, Lcom/lge/gallery/data/local/LocalAlbumUtils;->BUCKET_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bucket_id = ?"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 49
    if-nez v8, :cond_64

    .line 50
    const-string v0, "LocalAlbumUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "query fail: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_5a} :catch_96
    .catchall {:try_start_1b .. :try_end_5a} :catchall_a4

    .line 63
    if-eqz v8, :cond_5f

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_5f
    move-object v7, v6

    .line 67
    .end local v6    # "bucketName":Ljava/lang/String;
    .local v7, "bucketName":Ljava/lang/String;
    :goto_60
    return-object v7

    .line 39
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v7    # "bucketName":Ljava/lang/String;
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v10    # "selectionArgue":Ljava/lang/String;
    :cond_61
    const-string v10, ""

    goto :goto_6

    .line 53
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v6    # "bucketName":Ljava/lang/String;
    .restart local v8    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "selectionArgue":Ljava/lang/String;
    :cond_64
    :try_start_64
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_8f

    .line 54
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 55
    if-eqz v6, :cond_77

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_8f

    .line 56
    :cond_77
    const-string v0, "LocalAlbumUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getBucketName: invalid bucketName , Name : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_8f} :catch_96
    .catchall {:try_start_64 .. :try_end_8f} :catchall_a4

    .line 63
    :cond_8f
    if-eqz v8, :cond_94

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_94
    :goto_94
    move-object v7, v6

    .line 67
    .end local v6    # "bucketName":Ljava/lang/String;
    .restart local v7    # "bucketName":Ljava/lang/String;
    goto :goto_60

    .line 60
    .end local v7    # "bucketName":Ljava/lang/String;
    .restart local v6    # "bucketName":Ljava/lang/String;
    :catch_96
    move-exception v9

    .line 61
    .local v9, "e":Ljava/lang/Exception;
    :try_start_97
    const-string v0, "LocalAlbumUtils"

    const-string v2, "Database query failed for any exception."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9e
    .catchall {:try_start_97 .. :try_end_9e} :catchall_a4

    .line 63
    if-eqz v8, :cond_94

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto :goto_94

    .line 63
    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_a4
    move-exception v0

    if-eqz v8, :cond_aa

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_aa
    throw v0
.end method
