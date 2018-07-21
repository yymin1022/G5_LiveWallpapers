.class public Lcom/lge/gallery/contentmanager/FileOperationUtil;
.super Ljava/lang/Object;
.source "FileOperationUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/contentmanager/FileOperationUtil$1;,
        Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    }
.end annotation


# static fields
.field private static final ALBUM_RENAME_DB_UPDATE_JOB_UNIT:I = 0x200

.field private static final BUFFER_CHUNK:I = 0x1f4000

.field private static final CMD_SYNC:Ljava/lang/String; = "sync"

.field private static final DEBUG:Z = false

.field private static final EOF:I = -0x1

.field public static final ERROR_FILELOCK_USERINFO_MISMATCH:I = 0x5

.field public static final ERROR_FILE_ALREADY_EXIST:I = 0x3

.field public static final ERROR_FILE_SIZE_ZERO:I = 0x4

.field public static final ERROR_NONE:I = 0x0

.field public static final ERROR_NOT_ENOUGH_SPACE:I = 0x1

.field public static final ERROR_NO_SUCH_FILE_EXIST:I = 0x2

.field private static final EXTERNAL_MEDIA:Ljava/lang/String; = "external"

.field private static final RENAME_ALBUM_PROJ_BUCKET_DISP_NAME:I = 0x1

.field private static final RENAME_ALBUM_PROJ_DATA:I = 0x0

.field public static final RET_CODE_CANCEL:I = -0x2

.field public static final RET_CODE_FAIL:I = -0x1

.field public static final RET_CODE_MOVE_BY_RENAME:I = 0x1

.field public static final RET_CODE_MOVE_BY_STREAM:I = 0x2

.field public static final RET_CODE_OK:I = 0x0

.field private static final TAG:Ljava/lang/String; = "FileOperationUtil"

.field private static final TEMP_EXT:Ljava/lang/String; = ".tmp"

.field private static final USE_BUFFER_COPYING:Z = true

.field private static final USE_FAST_MOVING:Z = true

.field private static final USE_JAVA_BUFFER:Z = true

.field private static sBulkUpdateList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation
.end field

.field private static sSharedBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sSharedBuffer:Ljava/nio/ByteBuffer;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method static checkStorageSpace(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z
    .registers 10
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromFile"    # Ljava/io/File;
    .param p2, "toFile"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 579
    if-eqz p1, :cond_6

    if-nez p2, :cond_2a

    .line 580
    :cond_6
    const-string v1, "FileOperationUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "File parameter is null, fromFile : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "toFile : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v4

    .line 591
    :cond_29
    :goto_29
    return v1

    .line 584
    :cond_2a
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 585
    .local v2, "fileSize":J
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 587
    .local v0, "filePath":Ljava/lang/String;
    invoke-static {p0, v0, v2, v3}, Lcom/lge/gallery/util/StorageStateManager;->hasAvailableSpaceForSize(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v5

    if-eq v5, v1, :cond_29

    .line 590
    const-string v1, "FileOperationUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not enough space. filePath : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " fileSize : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v4

    .line 591
    goto :goto_29
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 597
    if-eqz p0, :cond_5

    .line 598
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_6

    .line 603
    :cond_5
    :goto_5
    return-void

    .line 600
    :catch_6
    move-exception v0

    .line 601
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "FileOperationUtil"

    const-string v2, "failed to close."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method

.method private static copyByBuffer(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;Lcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 16
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromFile"    # Ljava/io/File;
    .param p2, "toFile"    # Ljava/io/File;
    .param p3, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;

    .prologue
    .line 445
    const/4 v7, 0x0

    .line 446
    .local v7, "isCanceled":Z
    const/4 v8, 0x0

    .line 447
    .local v8, "result":I
    const/4 v2, 0x0

    .line 448
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 450
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_4
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_9
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_4 .. :try_end_9} :catch_31
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_54
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_7f
    .catchall {:try_start_4 .. :try_end_9} :catchall_3b

    .line 451
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_9
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_9 .. :try_end_e} :catch_b1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_e} :catch_aa
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_e} :catch_a3
    .catchall {:try_start_9 .. :try_end_e} :catchall_9c

    .line 452
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    :try_start_e
    invoke-static {v3, v5, p3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyStreamByJavaBuffer(Ljava/io/FileInputStream;Ljava/io/FileOutputStream;Lcom/lge/gallery/contentmanager/ContentsOperationOptions;)Z
    :try_end_11
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_e .. :try_end_11} :catch_b5
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_11} :catch_ad
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_11} :catch_a6
    .catchall {:try_start_e .. :try_end_11} :catchall_9f

    move-result v9

    if-nez v9, :cond_2f

    const/4 v7, 0x1

    .line 467
    :goto_15
    invoke-static {v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 468
    invoke-static {v5}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 469
    if-nez v8, :cond_1f

    if-eqz v7, :cond_29

    .line 470
    :cond_1f
    const-string v9, "FileOperationUtil"

    const-string v10, "Invalid file is deleted."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 473
    :cond_29
    if-eqz v7, :cond_ba

    .line 474
    const/4 v8, -0x2

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 477
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :cond_2e
    :goto_2e
    return v8

    .line 452
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :cond_2f
    const/4 v7, 0x0

    goto :goto_15

    .line 454
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catch_31
    move-exception v1

    .line 455
    .local v1, "fe":Lcom/lge/gallery/contentmanager/FileNotFoundException;
    :goto_32
    const/4 v8, -0x1

    .line 456
    :try_start_33
    new-instance v9, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v10, "Exception while open stream."

    invoke-direct {v9, v10}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_3b
    .catchall {:try_start_33 .. :try_end_3b} :catchall_3b

    .line 467
    .end local v1    # "fe":Lcom/lge/gallery/contentmanager/FileNotFoundException;
    :catchall_3b
    move-exception v9

    :goto_3c
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 468
    invoke-static {v4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 469
    if-nez v8, :cond_46

    if-eqz v7, :cond_50

    .line 470
    :cond_46
    const-string v10, "FileOperationUtil"

    const-string v11, "Invalid file is deleted."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 473
    :cond_50
    if-eqz v7, :cond_53

    .line 474
    const/4 v8, -0x2

    :cond_53
    throw v9

    .line 457
    :catch_54
    move-exception v6

    .line 458
    .local v6, "ie":Ljava/io/IOException;
    :goto_55
    :try_start_55
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    .line 459
    invoke-static {p0, p1, p2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->checkStorageSpace(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z

    move-result v9

    if-nez v9, :cond_67

    .line 460
    const/4 v8, -0x1

    .line 461
    new-instance v9, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v10, "Storage is not enough."

    invoke-direct {v9, v10}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_67
    .catchall {:try_start_55 .. :try_end_67} :catchall_3b

    .line 467
    :cond_67
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 468
    invoke-static {v4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 469
    if-nez v8, :cond_71

    if-eqz v7, :cond_7b

    .line 470
    :cond_71
    const-string v9, "FileOperationUtil"

    const-string v10, "Invalid file is deleted."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 473
    :cond_7b
    if-eqz v7, :cond_2e

    .line 474
    const/4 v8, -0x2

    goto :goto_2e

    .line 463
    .end local v6    # "ie":Ljava/io/IOException;
    :catch_7f
    move-exception v0

    .line 464
    .local v0, "e":Ljava/lang/Exception;
    :goto_80
    :try_start_80
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_3b

    .line 465
    const/4 v8, -0x1

    .line 467
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 468
    invoke-static {v4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 469
    if-nez v8, :cond_8e

    if-eqz v7, :cond_98

    .line 470
    :cond_8e
    const-string v9, "FileOperationUtil"

    const-string v10, "Invalid file is deleted."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 473
    :cond_98
    if-eqz v7, :cond_2e

    .line 474
    const/4 v8, -0x2

    goto :goto_2e

    .line 467
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catchall_9c
    move-exception v9

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3c

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catchall_9f
    move-exception v9

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3c

    .line 463
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_a3
    move-exception v0

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_80

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_a6
    move-exception v0

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_80

    .line 457
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_aa
    move-exception v6

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_55

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_ad
    move-exception v6

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_55

    .line 454
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_b1
    move-exception v1

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_32

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_b5
    move-exception v1

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_32

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :cond_ba
    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_2e
.end method

.method private static final copyChannel(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)I
    .registers 20
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromFile"    # Ljava/io/File;
    .param p2, "toFile"    # Ljava/io/File;

    .prologue
    .line 333
    const/4 v15, 0x0

    .line 334
    .local v15, "result":I
    const/4 v10, 0x0

    .line 335
    .local v10, "fis":Ljava/io/FileInputStream;
    const/4 v12, 0x0

    .line 336
    .local v12, "fos":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 337
    .local v3, "inputChannel":Ljava/nio/channels/FileChannel;
    const/4 v8, 0x0

    .line 339
    .local v8, "outputChannel":Ljava/nio/channels/FileChannel;
    :try_start_5
    new-instance v11, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_c
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_5 .. :try_end_c} :catch_3f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_c} :catch_65
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_c} :catch_91
    .catchall {:try_start_5 .. :try_end_c} :catchall_49

    .line 340
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .local v11, "fis":Ljava/io/FileInputStream;
    :try_start_c
    new-instance v13, Ljava/io/FileOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v13, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_13
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_c .. :try_end_13} :catch_c4
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_13} :catch_bd
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_13} :catch_b6
    .catchall {:try_start_c .. :try_end_13} :catchall_af

    .line 341
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .local v13, "fos":Ljava/io/FileOutputStream;
    :try_start_13
    invoke-virtual {v11}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    .line 342
    invoke-virtual {v13}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v8

    .line 343
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v6

    .line 344
    .local v6, "size":J
    const-wide/16 v4, 0x0

    invoke-virtual/range {v3 .. v8}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J
    :try_end_24
    .catch Lcom/lge/gallery/contentmanager/FileNotFoundException; {:try_start_13 .. :try_end_24} :catch_c8
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_24} :catch_c0
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_24} :catch_b9
    .catchall {:try_start_13 .. :try_end_24} :catchall_b2

    .line 358
    invoke-static {v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v11}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v8}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    invoke-static {v13}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 362
    if-eqz v15, :cond_cd

    .line 363
    const-string v4, "FileOperationUtil"

    const-string v5, "Invalid file is deleted."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .line 367
    .end local v6    # "size":J
    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    :cond_3e
    :goto_3e
    return v15

    .line 345
    :catch_3f
    move-exception v9

    .line 346
    .local v9, "fe":Lcom/lge/gallery/contentmanager/FileNotFoundException;
    :goto_40
    const/4 v15, -0x1

    .line 347
    :try_start_41
    new-instance v4, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    const-string v5, "Exception while open stream."

    invoke-direct {v4, v5}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_49
    .catchall {:try_start_41 .. :try_end_49} :catchall_49

    .line 358
    .end local v9    # "fe":Lcom/lge/gallery/contentmanager/FileNotFoundException;
    :catchall_49
    move-exception v4

    :goto_4a
    invoke-static {v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v10}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v8}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    invoke-static {v12}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 362
    if-eqz v15, :cond_64

    .line 363
    const-string v5, "FileOperationUtil"

    const-string v16, "Invalid file is deleted."

    move-object/from16 v0, v16

    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    :cond_64
    throw v4

    .line 348
    :catch_65
    move-exception v14

    .line 349
    .local v14, "ie":Ljava/io/IOException;
    :goto_66
    :try_start_66
    invoke-virtual {v14}, Ljava/io/IOException;->printStackTrace()V

    .line 350
    invoke-static/range {p0 .. p2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->checkStorageSpace(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_78

    .line 351
    const/4 v15, -0x1

    .line 352
    new-instance v4, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v5, "Storage is not enough."

    invoke-direct {v4, v5}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_78
    .catchall {:try_start_66 .. :try_end_78} :catchall_49

    .line 358
    :cond_78
    invoke-static {v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v10}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v8}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    invoke-static {v12}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 362
    if-eqz v15, :cond_3e

    .line 363
    const-string v4, "FileOperationUtil"

    const-string v5, "Invalid file is deleted."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    goto :goto_3e

    .line 354
    .end local v14    # "ie":Ljava/io/IOException;
    :catch_91
    move-exception v2

    .line 355
    .local v2, "e":Ljava/lang/Exception;
    :goto_92
    :try_start_92
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_49

    .line 356
    const/4 v15, -0x1

    .line 358
    invoke-static {v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 359
    invoke-static {v10}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 360
    invoke-static {v8}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    invoke-static {v12}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 362
    if-eqz v15, :cond_3e

    .line 363
    const-string v4, "FileOperationUtil"

    const-string v5, "Invalid file is deleted."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    goto :goto_3e

    .line 358
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    :catchall_af
    move-exception v4

    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_4a

    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "fos":Ljava/io/FileOutputStream;
    :catchall_b2
    move-exception v4

    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_4a

    .line 354
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    :catch_b6
    move-exception v2

    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_92

    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "fos":Ljava/io/FileOutputStream;
    :catch_b9
    move-exception v2

    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_92

    .line 348
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    :catch_bd
    move-exception v14

    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_66

    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "fos":Ljava/io/FileOutputStream;
    :catch_c0
    move-exception v14

    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto :goto_66

    .line 345
    .end local v10    # "fis":Ljava/io/FileInputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    :catch_c4
    move-exception v9

    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_40

    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "fos":Ljava/io/FileOutputStream;
    :catch_c8
    move-exception v9

    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_40

    .end local v10    # "fis":Ljava/io/FileInputStream;
    .end local v12    # "fos":Ljava/io/FileOutputStream;
    .restart local v6    # "size":J
    .restart local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v13    # "fos":Ljava/io/FileOutputStream;
    :cond_cd
    move-object v12, v13

    .end local v13    # "fos":Ljava/io/FileOutputStream;
    .restart local v12    # "fos":Ljava/io/FileOutputStream;
    move-object v10, v11

    .end local v11    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_3e
.end method

.method private static final declared-synchronized copyStreamByJavaBuffer(Ljava/io/FileInputStream;Ljava/io/FileOutputStream;Lcom/lge/gallery/contentmanager/ContentsOperationOptions;)Z
    .registers 8
    .param p0, "fis"    # Ljava/io/FileInputStream;
    .param p1, "fos"    # Ljava/io/FileOutputStream;
    .param p2, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 403
    const-class v3, Lcom/lge/gallery/contentmanager/FileOperationUtil;

    monitor-enter v3

    if-eqz p0, :cond_8

    if-nez p1, :cond_a

    .line 418
    :cond_8
    :goto_8
    monitor-exit v3

    return v2

    .line 406
    :cond_a
    const v4, 0x1f4000

    :try_start_d
    new-array v0, v4, [B

    .line 407
    .local v0, "buffer":[B
    const/4 v1, -0x1

    .line 409
    .local v1, "read":I
    :goto_10
    if-eqz p2, :cond_16

    iget-boolean v4, p2, Lcom/lge/gallery/contentmanager/ContentsOperationOptions;->mCancel:Z

    if-nez v4, :cond_8

    .line 412
    :cond_16
    invoke-virtual {p0, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    .line 413
    const/4 v4, -0x1

    if-ne v1, v4, :cond_1f

    .line 418
    const/4 v2, 0x1

    goto :goto_8

    .line 416
    :cond_1f
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_23
    .catchall {:try_start_d .. :try_end_23} :catchall_24

    goto :goto_10

    .line 403
    .end local v0    # "buffer":[B
    .end local v1    # "read":I
    :catchall_24
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method private static final declared-synchronized copyStreamByNativeBuffer(Ljava/io/FileInputStream;Ljava/io/FileOutputStream;Lcom/lge/gallery/contentmanager/ContentsOperationOptions;)Z
    .registers 10
    .param p0, "fis"    # Ljava/io/FileInputStream;
    .param p1, "fos"    # Ljava/io/FileOutputStream;
    .param p2, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 372
    const-class v5, Lcom/lge/gallery/contentmanager/FileOperationUtil;

    monitor-enter v5

    if-eqz p0, :cond_8

    if-nez p1, :cond_a

    .line 398
    :cond_8
    :goto_8
    monitor-exit v5

    return v4

    .line 375
    :cond_a
    :try_start_a
    invoke-static {}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->getBuffer()Ljava/nio/ByteBuffer;
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_26

    move-result-object v0

    .line 376
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .line 377
    .local v1, "inputChannel":Ljava/nio/channels/FileChannel;
    const/4 v2, 0x0

    .line 379
    .local v2, "outputChannel":Ljava/nio/channels/FileChannel;
    :try_start_10
    invoke-virtual {p0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 380
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    .line 381
    const/4 v3, -0x1

    .line 383
    .local v3, "read":I
    :goto_19
    if-eqz p2, :cond_29

    iget-boolean v6, p2, Lcom/lge/gallery/contentmanager/ContentsOperationOptions;->mCancel:Z
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_42

    if-eqz v6, :cond_29

    .line 395
    :try_start_1f
    invoke-static {v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 396
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V
    :try_end_25
    .catchall {:try_start_1f .. :try_end_25} :catchall_26

    goto :goto_8

    .line 372
    .end local v0    # "buffer":Ljava/nio/ByteBuffer;
    .end local v1    # "inputChannel":Ljava/nio/channels/FileChannel;
    .end local v2    # "outputChannel":Ljava/nio/channels/FileChannel;
    .end local v3    # "read":I
    :catchall_26
    move-exception v4

    monitor-exit v5

    throw v4

    .line 386
    .restart local v0    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v1    # "inputChannel":Ljava/nio/channels/FileChannel;
    .restart local v2    # "outputChannel":Ljava/nio/channels/FileChannel;
    .restart local v3    # "read":I
    :cond_29
    :try_start_29
    invoke-virtual {v1, v0}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I
    :try_end_2c
    .catchall {:try_start_29 .. :try_end_2c} :catchall_42

    move-result v3

    .line 387
    const/4 v6, -0x1

    if-ne v3, v6, :cond_38

    .line 395
    :try_start_30
    invoke-static {v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 396
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V
    :try_end_36
    .catchall {:try_start_30 .. :try_end_36} :catchall_26

    .line 398
    const/4 v4, 0x1

    goto :goto_8

    .line 390
    :cond_38
    :try_start_38
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 391
    invoke-virtual {v2, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 392
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;
    :try_end_41
    .catchall {:try_start_38 .. :try_end_41} :catchall_42

    goto :goto_19

    .line 395
    .end local v3    # "read":I
    :catchall_42
    move-exception v4

    :try_start_43
    invoke-static {v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    .line 396
    invoke-static {v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v4
    :try_end_4a
    .catchall {:try_start_43 .. :try_end_4a} :catchall_26
.end method

.method public static final copyToDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toDir"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .param p4, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 292
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 293
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_14

    .line 294
    :cond_11
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 296
    :cond_14
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFileNameIncludeEXT(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 299
    .local v1, "toPath":Ljava/lang/String;
    invoke-static {p0, p1, v1, p3, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyToPathByBuffer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I

    move-result v2

    return v2
.end method

.method public static final copyToPath(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toPath"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .param p4, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 309
    invoke-static {p0, p1, p2, p3, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyToPathByBuffer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I

    move-result v0

    return v0
.end method

.method public static final declared-synchronized copyToPathByBuffer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 11
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toPath"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .param p4, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 425
    const-class v3, Lcom/lge/gallery/contentmanager/FileOperationUtil;

    monitor-enter v3

    :try_start_3
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 426
    .local v0, "fromFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_30

    .line 427
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2d

    .line 425
    .end local v0    # "fromFile":Ljava/io/File;
    :catchall_2d
    move-exception v2

    monitor-exit v3

    throw v2

    .line 429
    .restart local v0    # "fromFile":Ljava/io/File;
    :cond_30
    :try_start_30
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_55

    .line 430
    new-instance v2, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not a file."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 432
    :cond_55
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 433
    .local v1, "toFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_62

    .line 434
    if-eqz p3, :cond_68

    .line 440
    :cond_62
    invoke-static {p0, v0, v1, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyByBuffer(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;Lcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    :try_end_65
    .catchall {:try_start_30 .. :try_end_65} :catchall_2d

    move-result v2

    monitor-exit v3

    return v2

    .line 437
    :cond_68
    :try_start_68
    new-instance v2, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is already exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_87
    .catchall {:try_start_68 .. :try_end_87} :catchall_2d
.end method

.method public static forceSyncStorage(Z)Z
    .registers 9
    .param p0, "wait"    # Z

    .prologue
    .line 606
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 607
    .local v4, "start":J
    const/4 v2, 0x0

    .line 609
    .local v2, "result":Z
    :try_start_5
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    const-string v7, "sync"

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 610
    .local v1, "proc":Ljava/lang/Process;
    if-eqz p0, :cond_14

    .line 611
    invoke-virtual {v1}, Ljava/lang/Process;->waitFor()I
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_14} :catch_16
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_14} :catch_20
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_14} :catch_2a

    .line 616
    :cond_14
    const/4 v2, 0x1

    .line 629
    .end local v1    # "proc":Ljava/lang/Process;
    :goto_15
    return v2

    .line 617
    :catch_16
    move-exception v0

    .line 618
    .local v0, "e":Ljava/io/IOException;
    const-string v6, "FileOperationUtil"

    const-string v7, "IOException from a sync command"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    const/4 v2, 0x0

    .line 625
    goto :goto_15

    .line 620
    .end local v0    # "e":Ljava/io/IOException;
    :catch_20
    move-exception v0

    .line 621
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v6, "FileOperationUtil"

    const-string v7, "InterruptedException from a sync command"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 622
    const/4 v2, 0x0

    .line 625
    goto :goto_15

    .line 623
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_2a
    move-exception v3

    .line 624
    .local v3, "t":Ljava/lang/Throwable;
    const-string v6, "FileOperationUtil"

    const-string v7, "Unknown error : "

    invoke-static {v6, v7, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15
.end method

.method private static getBuffer()Ljava/nio/ByteBuffer;
    .registers 1

    .prologue
    .line 82
    sget-object v0, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sSharedBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_d

    .line 83
    const v0, 0x1f4000

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sSharedBuffer:Ljava/nio/ByteBuffer;

    .line 85
    :cond_d
    sget-object v0, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sSharedBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public static final getDngPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 539
    const-string v4, "jpg"

    invoke-static {p0}, Lcom/lge/gallery/contentmanager/StringUtil;->pickEXTName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 548
    :cond_d
    :goto_d
    return-object v3

    .line 542
    :cond_e
    invoke-static {p0}, Lcom/lge/gallery/contentmanager/StringUtil;->pickParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 543
    .local v2, "filePath":Ljava/lang/String;
    invoke-static {p0}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 544
    .local v1, "fileName":Ljava/lang/String;
    if-eqz v2, :cond_d

    if-eqz v1, :cond_d

    .line 547
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 548
    .local v0, "builder":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".dng"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_d
.end method

.method private static getTempFile(Ljava/lang/String;)Ljava/io/File;
    .registers 8
    .param p0, "toPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;
        }
    .end annotation

    .prologue
    .line 481
    const-string v4, ".tmp"

    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 482
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 483
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 484
    .local v0, "len":I
    new-instance v1, Ljava/io/File;

    const-string v4, ".tmp"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v4, v0, v4

    invoke-virtual {v2, v4, v0}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 485
    .local v1, "newFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 486
    new-instance v4, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is already exist."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 489
    .end local v0    # "len":I
    .end local v1    # "newFile":Ljava/io/File;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_4b
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 490
    .local v3, "toFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_61

    .line 491
    const-string v4, ".tmp"

    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_62

    .line 492
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 497
    :cond_61
    return-object v3

    .line 494
    :cond_62
    new-instance v4, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is already exist."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static isValidName(Ljava/lang/String;)Z
    .registers 8
    .param p0, "toName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 633
    if-nez p0, :cond_4

    .line 645
    :cond_3
    :goto_3
    return v3

    .line 636
    :cond_4
    const/4 v1, 0x0

    .line 638
    .local v1, "fs":Landroid/os/StatFs;
    :try_start_5
    new-instance v2, Landroid/os/StatFs;

    invoke-direct {v2, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_a} :catch_f
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_29

    .end local v1    # "fs":Landroid/os/StatFs;
    .local v2, "fs":Landroid/os/StatFs;
    move-object v1, v2

    .line 645
    .end local v2    # "fs":Landroid/os/StatFs;
    .restart local v1    # "fs":Landroid/os/StatFs;
    :goto_b
    if-eqz v1, :cond_3

    const/4 v3, 0x1

    goto :goto_3

    .line 639
    :catch_f
    move-exception v0

    .line 640
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v4, "FileOperationUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid name : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 642
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_29
    move-exception v0

    .line 643
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "FileOperationUtil"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "check valid name : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method public static final makeDir(Landroid/app/Activity;Ljava/lang/String;Z)Z
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "dir"    # Ljava/lang/String;
    .param p2, "checkOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 554
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 555
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 556
    new-instance v1, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is already exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 558
    :cond_2b
    if-eqz p2, :cond_2e

    .line 573
    :cond_2d
    :goto_2d
    return v1

    .line 561
    :cond_2e
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 564
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_59

    .line 565
    new-instance v1, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is already exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 567
    :cond_59
    invoke-static {p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->isValidName(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_65

    .line 568
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 570
    :cond_65
    invoke-static {p0, v0, v0}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->checkStorageSpace(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_73

    .line 571
    new-instance v1, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v2, "Storage is not enough."

    invoke-direct {v1, v2}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 573
    :cond_73
    const/4 v1, 0x0

    goto :goto_2d
.end method

.method private static makeUpdateList(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)V
    .registers 22
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "renameData"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 194
    const-string v1, "external"

    invoke-static {v1}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 195
    .local v2, "uri":Landroid/net/Uri;
    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "_data"

    aput-object v5, v3, v1

    const/4 v1, 0x1

    const-string v5, "bucket_display_name"

    aput-object v5, v3, v1

    .line 197
    .local v3, "prjection":[Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_data LIKE \""

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "/%\""

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 198
    .local v4, "selection":Ljava/lang/String;
    const/4 v8, 0x0

    .line 200
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_31
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 202
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 203
    .local v17, "values":Landroid/content/ContentValues;
    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v13

    .line 204
    .local v13, "prevPath":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$200(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v16

    .line 205
    .local v16, "targetPath":Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFolderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 206
    .local v10, "newAlbumName":Ljava/lang/String;
    invoke-static {v13}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFolderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 207
    .local v11, "prevAlbumName":Ljava/lang/String;
    const-string v14, "_data=?"

    .line 209
    .local v14, "selectionArgs":Ljava/lang/String;
    const-string v1, "_data"

    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$200(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v0, v1, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    sget-object v1, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/16 v18, 0x0

    invoke-static/range {p1 .. p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v6, v18

    invoke-virtual {v5, v14, v6}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 215
    :goto_7f
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_106

    .line 216
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 217
    .local v12, "prevFullPath":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 218
    .local v7, "bucketDisplayName":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v12, v13, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v15

    .line 220
    .local v15, "targetFullPath":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Landroid/content/ContentValues;->clear()V

    .line 221
    const-string v1, "_data"

    move-object/from16 v0, v17

    invoke-virtual {v0, v1, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f6

    .line 223
    const-string v1, "title"

    move-object/from16 v0, v17

    invoke-virtual {v0, v1, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    :cond_ac
    :goto_ac
    sget-object v1, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    invoke-static {v2}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/16 v18, 0x0

    aput-object v12, v6, v18

    invoke-virtual {v5, v14, v6}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ca
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_31 .. :try_end_ca} :catch_cb
    .catchall {:try_start_31 .. :try_end_ca} :catchall_ef

    goto :goto_7f

    .line 233
    .end local v7    # "bucketDisplayName":Ljava/lang/String;
    .end local v10    # "newAlbumName":Ljava/lang/String;
    .end local v11    # "prevAlbumName":Ljava/lang/String;
    .end local v12    # "prevFullPath":Ljava/lang/String;
    .end local v13    # "prevPath":Ljava/lang/String;
    .end local v14    # "selectionArgs":Ljava/lang/String;
    .end local v15    # "targetFullPath":Ljava/lang/String;
    .end local v16    # "targetPath":Ljava/lang/String;
    .end local v17    # "values":Landroid/content/ContentValues;
    :catch_cb
    move-exception v9

    .line 234
    .local v9, "e":Landroid/database/sqlite/SQLiteException;
    :try_start_cc
    new-instance v1, Landroid/database/sqlite/SQLiteException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteException occured - Query with Uri : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", selection : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/database/sqlite/SQLiteException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_ef
    .catchall {:try_start_cc .. :try_end_ef} :catchall_ef

    .line 238
    .end local v9    # "e":Landroid/database/sqlite/SQLiteException;
    :catchall_ef
    move-exception v1

    if-eqz v8, :cond_f5

    .line 239
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_f5
    throw v1

    .line 224
    .restart local v7    # "bucketDisplayName":Ljava/lang/String;
    .restart local v10    # "newAlbumName":Ljava/lang/String;
    .restart local v11    # "prevAlbumName":Ljava/lang/String;
    .restart local v12    # "prevFullPath":Ljava/lang/String;
    .restart local v13    # "prevPath":Ljava/lang/String;
    .restart local v14    # "selectionArgs":Ljava/lang/String;
    .restart local v15    # "targetFullPath":Ljava/lang/String;
    .restart local v16    # "targetPath":Ljava/lang/String;
    .restart local v17    # "values":Landroid/content/ContentValues;
    :cond_f6
    if-eqz v7, :cond_ac

    :try_start_f8
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ac

    .line 226
    const-string v1, "bucket_display_name"

    move-object/from16 v0, v17

    invoke-virtual {v0, v1, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_105
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_f8 .. :try_end_105} :catch_cb
    .catchall {:try_start_f8 .. :try_end_105} :catchall_ef

    goto :goto_ac

    .line 238
    .end local v7    # "bucketDisplayName":Ljava/lang/String;
    .end local v12    # "prevFullPath":Ljava/lang/String;
    .end local v15    # "targetFullPath":Ljava/lang/String;
    :cond_106
    if-eqz v8, :cond_10b

    .line 239
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 242
    :cond_10b
    return-void
.end method

.method public static final moveToDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toDir"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .param p4, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 504
    invoke-static {p0, p1, p2, p3, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyToDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I

    move-result v0

    .line 505
    .local v0, "ret":I
    if-nez v0, :cond_e

    .line 506
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 508
    :cond_e
    return v0
.end method

.method public static final moveToPath(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromPath"    # Ljava/lang/String;
    .param p2, "toPath"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .param p4, "options"    # Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;,
            Lcom/lge/gallery/contentmanager/AlbumAlreadyExistException;
        }
    .end annotation

    .prologue
    .line 516
    invoke-static {p0, p1, p2}, Lcom/lge/gallery/util/StorageStateManager;->hasSameStorageLocation(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 517
    invoke-static {p0, p1, p2, p3}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->renameTo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 518
    const/4 v0, 0x1

    .line 529
    :cond_d
    :goto_d
    return v0

    .line 520
    :cond_e
    const/4 v0, -0x1

    goto :goto_d

    .line 525
    :cond_10
    invoke-static {p0, p1, p2, p3, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->copyToPathByBuffer(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZLcom/lge/gallery/contentmanager/ContentsOperationOptions;)I

    move-result v0

    .line 526
    .local v0, "ret":I
    if-nez v0, :cond_d

    .line 527
    const/4 v0, 0x2

    goto :goto_d
.end method

.method protected static renameDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/io/File;)Z
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromName"    # Ljava/lang/String;
    .param p2, "toName"    # Ljava/lang/String;
    .param p3, "fromFile"    # Ljava/io/File;
    .param p4, "toFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 134
    new-instance v0, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is already exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_25
    invoke-static {p0, p3, p4}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->renameDirTo(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 137
    const/4 v0, 0x1

    .line 142
    :goto_2c
    return v0

    .line 139
    :cond_2d
    invoke-static {p2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->isValidName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_39

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 142
    :cond_39
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method private static final renameDirTo(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z
    .registers 8
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "fromName"    # Ljava/io/File;
    .param p2, "toName"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    .line 149
    .local v2, "isRenameSuccedded":Z
    if-eqz v2, :cond_36

    .line 150
    new-instance v1, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;-><init>(Lcom/lge/gallery/contentmanager/FileOperationUtil$1;)V

    .line 151
    .local v1, "fileData":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$102(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;

    .line 152
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$202(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;

    .line 154
    :try_start_1a
    invoke-static {p0, v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->updateDirectoryWithChildren(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 155
    const-string v3, "FileOperationUtil"

    const-string v4, "Renamming album has been completed"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const/4 v3, 0x1

    .line 167
    .end local v1    # "fileData":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    :goto_28
    return v3

    .line 158
    .restart local v1    # "fileData":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    :cond_29
    const-string v3, "FileOperationUtil"

    const-string v4, "Renamming album hasn\'t been completed"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 160
    invoke-static {p0, v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->restoreRenaming(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)V
    :try_end_36
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1a .. :try_end_36} :catch_38

    .line 167
    .end local v1    # "fileData":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    :cond_36
    :goto_36
    const/4 v3, 0x0

    goto :goto_28

    .line 162
    .restart local v1    # "fileData":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    :catch_38
    move-exception v0

    .line 163
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 164
    const-string v3, "FileOperationUtil"

    const-string v4, "fail to rename album : "

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_36
.end method

.method public static final renameTo(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 10
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "fromName"    # Ljava/lang/String;
    .param p2, "toName"    # Ljava/lang/String;
    .param p3, "useTempFileName"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lge/gallery/contentmanager/FileAlreadyExistException;,
            Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;,
            Lcom/lge/gallery/contentmanager/FileNotFoundException;,
            Lcom/lge/gallery/contentmanager/AlbumAlreadyExistException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 93
    .local v0, "fromFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_a7

    .line 94
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 95
    .local v2, "toFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_64

    .line 96
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 97
    invoke-static {p0, p1, p2, v0, v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->renameDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    .line 118
    :goto_20
    return v1

    .line 100
    :cond_21
    invoke-virtual {v0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 101
    const/4 v1, 0x1

    goto :goto_20

    .line 103
    :cond_29
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_48

    .line 104
    new-instance v3, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is already exist"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 106
    :cond_48
    invoke-static {p2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->isValidName(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_54

    .line 107
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 109
    :cond_54
    invoke-static {p0, v0, v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->checkStorageSpace(Landroid/app/Activity;Ljava/io/File;Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_62

    .line 110
    new-instance v3, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;

    const-string v4, "Storage is not enough."

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 112
    :cond_62
    const/4 v1, 0x0

    goto :goto_20

    .line 116
    :cond_64
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_8e

    .line 117
    invoke-static {p0, p2}, Lcom/lge/gallery/contentmanager/DBUtil;->hasGalleryItem(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_75

    .line 118
    invoke-static {p0, p1, p2, v0, v2}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->renameDir(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    goto :goto_20

    .line 120
    :cond_75
    new-instance v3, Lcom/lge/gallery/contentmanager/AlbumAlreadyExistException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is already exist"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/AlbumAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 122
    :cond_8e
    new-instance v3, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is already exist"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/FileAlreadyExistException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 126
    .end local v2    # "toFile":Ljava/io/File;
    :cond_a7
    new-instance v3, Lcom/lge/gallery/contentmanager/FileNotFoundException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No such file : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/lge/gallery/contentmanager/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static restoreRenaming(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)V
    .registers 4
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "renameData"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 183
    new-instance v0, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;-><init>(Lcom/lge/gallery/contentmanager/FileOperationUtil$1;)V

    .line 184
    .local v0, "data":Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    invoke-static {p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$102(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;

    .line 185
    invoke-static {p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$202(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;

    .line 186
    invoke-static {p0, v0}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->makeUpdateList(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)V

    .line 187
    invoke-static {p0}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->updateDB(Landroid/app/Activity;)Z

    .line 188
    return-void
.end method

.method private static updateDB(Landroid/app/Activity;)Z
    .registers 15
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 245
    sget-object v9, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 246
    .local v5, "listSize":I
    const/4 v6, 0x1

    .line 247
    .local v6, "result":Z
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 248
    .local v1, "cr":Landroid/content/ContentResolver;
    const-string v9, "external"

    invoke-static {v9}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "authority":Ljava/lang/String;
    const/4 v8, 0x0

    .line 250
    .local v8, "updateTransaction":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    const-string v9, "FileOperationUtil"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updateDB - totalSize : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    const/16 v4, 0x200

    .line 252
    .local v4, "jobUnit":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_35
    if-ge v3, v5, :cond_88

    .line 253
    const-string v9, "FileOperationUtil"

    const-string v10, "start index : %d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    add-int v9, v3, v4

    invoke-static {v9, v5}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 255
    .local v7, "size":I
    new-instance v8, Ljava/util/ArrayList;

    .end local v8    # "updateTransaction":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    sget-object v9, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    invoke-virtual {v9, v3, v7}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 258
    .restart local v8    # "updateTransaction":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :try_start_5d
    invoke-virtual {v1, v0, v8}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_60
    .catch Landroid/os/TransactionTooLargeException; {:try_start_5d .. :try_end_60} :catch_62
    .catch Landroid/os/RemoteException; {:try_start_5d .. :try_end_60} :catch_8e
    .catch Landroid/content/OperationApplicationException; {:try_start_5d .. :try_end_60} :catch_98
    .catch Ljava/lang/ClassCastException; {:try_start_5d .. :try_end_60} :catch_a2
    .catchall {:try_start_5d .. :try_end_60} :catchall_ac

    .line 252
    :cond_60
    :goto_60
    add-int/2addr v3, v4

    goto :goto_35

    .line 259
    :catch_62
    move-exception v2

    .line 260
    .local v2, "e":Landroid/os/TransactionTooLargeException;
    :try_start_63
    const-string v9, "FileOperationUtil"

    const-string v10, "TransactionTooLargeException "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 261
    const-string v9, "FileOperationUtil"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "jobUnit : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    div-int/lit8 v4, v4, 0x2
    :try_end_84
    .catchall {:try_start_63 .. :try_end_84} :catchall_ac

    .line 263
    sub-int/2addr v3, v4

    .line 264
    if-nez v4, :cond_60

    .line 265
    const/4 v6, 0x0

    .line 280
    .end local v2    # "e":Landroid/os/TransactionTooLargeException;
    .end local v7    # "size":I
    :cond_88
    sget-object v9, Lcom/lge/gallery/contentmanager/FileOperationUtil;->sBulkUpdateList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 281
    return v6

    .line 268
    .restart local v7    # "size":I
    :catch_8e
    move-exception v2

    .line 269
    .local v2, "e":Landroid/os/RemoteException;
    :try_start_8f
    const-string v9, "FileOperationUtil"

    const-string v10, "RemoteException "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 270
    const/4 v6, 0x0

    goto :goto_60

    .line 271
    .end local v2    # "e":Landroid/os/RemoteException;
    :catch_98
    move-exception v2

    .line 272
    .local v2, "e":Landroid/content/OperationApplicationException;
    const-string v9, "FileOperationUtil"

    const-string v10, "OperationApplicationException "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 273
    const/4 v6, 0x0

    goto :goto_60

    .line 274
    .end local v2    # "e":Landroid/content/OperationApplicationException;
    :catch_a2
    move-exception v2

    .line 275
    .local v2, "e":Ljava/lang/ClassCastException;
    const-string v9, "FileOperationUtil"

    const-string v10, "fail to cast "

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_aa
    .catchall {:try_start_8f .. :try_end_aa} :catchall_ac

    .line 276
    const/4 v6, 0x0

    goto :goto_60

    .line 277
    .end local v2    # "e":Ljava/lang/ClassCastException;
    :catchall_ac
    move-exception v9

    throw v9
.end method

.method private static updateDirectoryWithChildren(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Z
    .registers 4
    .param p0, "act"    # Landroid/app/Activity;
    .param p1, "renameData"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-static {p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_c

    .line 173
    const/4 v0, 0x0

    .line 178
    :goto_b
    return v0

    .line 175
    :cond_c
    invoke-static {p0, p1}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->makeUpdateList(Landroid/app/Activity;Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)V

    .line 177
    invoke-static {p0}, Lcom/lge/gallery/contentmanager/FileOperationUtil;->updateDB(Landroid/app/Activity;)Z

    move-result v0

    .line 178
    .local v0, "result":Z
    goto :goto_b
.end method
