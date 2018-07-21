.class public Lcom/lge/gallery/util/GalleryUtils;
.super Ljava/lang/Object;
.source "GalleryUtils.java"


# static fields
.field private static final APP_HEAP_IN_MB:J

.field private static final COLUMN_NAME_LOCK:Ljava/lang/String; = "is_lock"

.field public static final DEFAULT_OPERATION_DELAY:I = 0x1f4

.field private static final LONG_SIDE_RATIO:F = 1.7f

.field private static final MSG_CLEAR_OPERATION:I = 0x0

.field private static final ORDERBY_STR:Ljava/lang/String; = " COLLATE NOCASE ASC"

.field private static final RES_NAME_ACTIONBAR:Ljava/lang/String; = "action_bar"

.field private static final RES_NAME_ACTIONBAR_CONTAINER:Ljava/lang/String; = "action_bar_container"

.field private static final RES_NAME_STATUSBAR_HEIGHT:Ljava/lang/String; = "status_bar_height"

.field private static final TAG:Ljava/lang/String; = "GalleryUtils"

.field private static final mInstrumentation:Landroid/app/Instrumentation;

.field private static sContext:Landroid/content/Context;

.field private static volatile sCurrentThread:Ljava/lang/Thread;

.field private static sDelayOperationHandler:Landroid/os/Handler;

.field private static sDisplayHeight:I

.field private static sDisplayWidth:I

.field private static sOperationRequested:Z

.field private static sPixelDensity:F

.field private static volatile sWarned:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 58
    const/high16 v0, -0x40800000    # -1.0f

    sput v0, Lcom/lge/gallery/util/GalleryUtils;->sPixelDensity:F

    .line 63
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const/16 v2, 0x14

    shr-long/2addr v0, v2

    sput-wide v0, Lcom/lge/gallery/util/GalleryUtils;->APP_HEAP_IN_MB:J

    .line 64
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Application Heap = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-wide v2, Lcom/lge/gallery/util/GalleryUtils;->APP_HEAP_IN_MB:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    new-instance v0, Landroid/app/Instrumentation;

    invoke-direct {v0}, Landroid/app/Instrumentation;-><init>()V

    sput-object v0, Lcom/lge/gallery/util/GalleryUtils;->mInstrumentation:Landroid/app/Instrumentation;

    .line 151
    const/4 v0, 0x0

    sput-boolean v0, Lcom/lge/gallery/util/GalleryUtils;->sOperationRequested:Z

    .line 173
    new-instance v0, Lcom/lge/gallery/util/GalleryUtils$2;

    invoke-direct {v0}, Lcom/lge/gallery/util/GalleryUtils$2;-><init>()V

    sput-object v0, Lcom/lge/gallery/util/GalleryUtils;->sDelayOperationHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .registers 1
    .param p0, "x0"    # Z

    .prologue
    .line 50
    sput-boolean p0, Lcom/lge/gallery/util/GalleryUtils;->sOperationRequested:Z

    return p0
.end method

.method static synthetic access$100()Landroid/app/Instrumentation;
    .registers 1

    .prologue
    .line 50
    sget-object v0, Lcom/lge/gallery/util/GalleryUtils;->mInstrumentation:Landroid/app/Instrumentation;

    return-object v0
.end method

.method public static adjustActionBarPadding(Landroid/content/res/Resources;Landroid/view/View;)V
    .registers 6
    .param p0, "resource"    # Landroid/content/res/Resources;
    .param p1, "actionBar"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 199
    if-eqz p0, :cond_5

    if-nez p1, :cond_6

    .line 205
    :cond_5
    :goto_5
    return-void

    .line 202
    :cond_6
    sget v3, Lcom/lge/gallery/common/R$bool;->portrait_mode:I

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 203
    .local v0, "isPortrait":Z
    sget-object v3, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/lge/gallery/sys/NavigationBarHelper;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v1

    .line 204
    .local v1, "navbarHieght":I
    if-eqz v0, :cond_15

    move v1, v2

    .end local v1    # "navbarHieght":I
    :cond_15
    invoke-virtual {p1, v2, v2, v1, v2}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_5
.end method

.method public static assertInMainThread()V
    .registers 2

    .prologue
    .line 146
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    sget-object v1, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_16

    .line 147
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 149
    :cond_16
    return-void
.end method

.method public static assertNotInRenderThread()V
    .registers 3

    .prologue
    .line 110
    sget-boolean v0, Lcom/lge/gallery/util/GalleryUtils;->sWarned:Z

    if-nez v0, :cond_1b

    .line 111
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    sget-object v1, Lcom/lge/gallery/util/GalleryUtils;->sCurrentThread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_1b

    .line 112
    const/4 v0, 0x1

    sput-boolean v0, Lcom/lge/gallery/util/GalleryUtils;->sWarned:Z

    .line 113
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/Throwable;

    const-string v2, "Should not do this in render thread"

    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 116
    :cond_1b
    return-void
.end method

.method public static clearDoingOperation()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 154
    sput-boolean v1, Lcom/lge/gallery/util/GalleryUtils;->sOperationRequested:Z

    .line 155
    sget-object v0, Lcom/lge/gallery/util/GalleryUtils;->sDelayOperationHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 156
    return-void
.end method

.method public static dpToPixel(F)F
    .registers 2
    .param p0, "dp"    # F

    .prologue
    .line 92
    sget v0, Lcom/lge/gallery/util/GalleryUtils;->sPixelDensity:F

    mul-float/2addr v0, p0

    return v0
.end method

.method public static dpToPixel(I)I
    .registers 2
    .param p0, "dp"    # I

    .prologue
    .line 96
    int-to-float v0, p0

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->dpToPixel(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public static fakeBusy(Lcom/lge/gallery/util/ThreadPool$JobContext;I)V
    .registers 6
    .param p0, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p1, "timeout"    # I

    .prologue
    .line 124
    new-instance v0, Landroid/os/ConditionVariable;

    invoke-direct {v0}, Landroid/os/ConditionVariable;-><init>()V

    .line 125
    .local v0, "cv":Landroid/os/ConditionVariable;
    new-instance v1, Lcom/lge/gallery/util/GalleryUtils$1;

    invoke-direct {v1, v0}, Lcom/lge/gallery/util/GalleryUtils$1;-><init>(Landroid/os/ConditionVariable;)V

    invoke-interface {p0, v1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 130
    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/os/ConditionVariable;->block(J)Z

    .line 131
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Lcom/lge/gallery/util/ThreadPool$JobContext;->setCancelListener(Lcom/lge/gallery/util/ThreadPool$CancelListener;)V

    .line 132
    return-void
.end method

.method public static formatDuration(Landroid/content/Context;I)Ljava/lang/String;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "duration"    # I

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 332
    div-int/lit16 v1, p1, 0xe10

    .line 333
    .local v1, "h":I
    mul-int/lit16 v4, v1, 0xe10

    sub-int v4, p1, v4

    div-int/lit8 v2, v4, 0x3c

    .line 334
    .local v2, "m":I
    mul-int/lit16 v4, v1, 0xe10

    mul-int/lit8 v5, v2, 0x3c

    add-int/2addr v4, v5

    sub-int v3, p1, v4

    .line 336
    .local v3, "s":I
    if-nez v1, :cond_2d

    .line 337
    sget v4, Lcom/lge/gallery/common/R$string;->details_ms:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v9, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, "durationValue":Ljava/lang/String;
    :goto_2c
    return-object v0

    .line 339
    .end local v0    # "durationValue":Ljava/lang/String;
    :cond_2d
    sget v4, Lcom/lge/gallery/common/R$string;->details_hms:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "durationValue":Ljava/lang/String;
    goto :goto_2c
.end method

.method public static formatLatitudeLongitude(Ljava/lang/String;DD)Ljava/lang/String;
    .registers 10
    .param p0, "format"    # Ljava/lang/String;
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D

    .prologue
    .line 142
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static generateKey(I)V
    .registers 2
    .param p0, "key"    # I

    .prologue
    .line 296
    new-instance v0, Lcom/lge/gallery/util/GalleryUtils$3;

    invoke-direct {v0, p0}, Lcom/lge/gallery/util/GalleryUtils$3;-><init>(I)V

    invoke-virtual {v0}, Lcom/lge/gallery/util/GalleryUtils$3;->start()V

    .line 308
    return-void
.end method

.method public static getActionBarContainerId(Landroid/content/res/Resources;)I
    .registers 4
    .param p0, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 184
    if-nez p0, :cond_4

    .line 185
    const/4 v0, 0x0

    .line 187
    :goto_3
    return v0

    :cond_4
    const-string v0, "action_bar_container"

    const-string v1, "id"

    const-string v2, "android"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_3
.end method

.method public static getActionBarId(Landroid/content/res/Resources;)I
    .registers 4
    .param p0, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 192
    if-nez p0, :cond_4

    .line 193
    const/4 v0, 0x0

    .line 195
    :goto_3
    return v0

    :cond_4
    const-string v0, "action_bar"

    const-string v1, "id"

    const-string v2, "android"

    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_3
.end method

.method public static getAlbumOrderString()Ljava/lang/String;
    .registers 1

    .prologue
    .line 240
    const-string v0, " COLLATE NOCASE ASC"

    return-object v0
.end method

.method public static getApplicationHeapSizeInMbytes()J
    .registers 2

    .prologue
    .line 88
    sget-wide v0, Lcom/lge/gallery/util/GalleryUtils;->APP_HEAP_IN_MB:J

    return-wide v0
.end method

.method public static getBucketId(Ljava/lang/String;)I
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 321
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public static getBytes(Ljava/lang/String;)[B
    .registers 9
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 311
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    new-array v6, v7, [B

    .line 312
    .local v6, "result":[B
    const/4 v4, 0x0

    .line 313
    .local v4, "output":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v5, v4

    .end local v4    # "output":I
    .local v5, "output":I
    :goto_10
    if-ge v2, v3, :cond_25

    aget-char v1, v0, v2

    .line 314
    .local v1, "ch":C
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "output":I
    .restart local v4    # "output":I
    and-int/lit16 v7, v1, 0xff

    int-to-byte v7, v7

    aput-byte v7, v6, v5

    .line 315
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "output":I
    .restart local v5    # "output":I
    shr-int/lit8 v7, v1, 0x8

    int-to-byte v7, v7

    aput-byte v7, v6, v4

    .line 313
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 317
    .end local v1    # "ch":C
    :cond_25
    return-object v6
.end method

.method public static getDisplayHeight()I
    .registers 1

    .prologue
    .line 212
    sget v0, Lcom/lge/gallery/util/GalleryUtils;->sDisplayHeight:I

    return v0
.end method

.method public static getDisplayWidth()I
    .registers 1

    .prologue
    .line 208
    sget v0, Lcom/lge/gallery/util/GalleryUtils;->sDisplayWidth:I

    return v0
.end method

.method public static getDownloadedFileUri(Landroid/content/ContentResolver;Ljava/lang/String;)Landroid/net/Uri;
    .registers 13
    .param p0, "contentResolver"    # Landroid/content/ContentResolver;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 345
    const/4 v6, 0x0

    .line 347
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_data = \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 349
    if-eqz v6, :cond_4f

    .line 350
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 351
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 352
    .local v8, "id":I
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    int-to-long v2, v8

    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3f} :catch_5f
    .catchall {:try_start_2 .. :try_end_3f} :catchall_8b

    move-result-object v0

    .line 358
    if-eqz v6, :cond_45

    .line 360
    :try_start_42
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_45} :catch_46

    .line 366
    .end local v8    # "id":I
    :cond_45
    :goto_45
    return-object v0

    .line 361
    .restart local v8    # "id":I
    :catch_46
    move-exception v9

    .line 362
    .local v9, "t":Ljava/lang/Throwable;
    const-string v1, "GalleryUtils"

    const-string v2, "close fail"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_45

    .line 358
    .end local v8    # "id":I
    .end local v9    # "t":Ljava/lang/Throwable;
    :cond_4f
    if-eqz v6, :cond_54

    .line 360
    :try_start_51
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_51 .. :try_end_54} :catch_56

    :cond_54
    :goto_54
    move-object v0, v10

    .line 366
    goto :goto_45

    .line 361
    :catch_56
    move-exception v9

    .line 362
    .restart local v9    # "t":Ljava/lang/Throwable;
    const-string v0, "GalleryUtils"

    const-string v1, "close fail"

    invoke-static {v0, v1, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_54

    .line 355
    .end local v9    # "t":Ljava/lang/Throwable;
    :catch_5f
    move-exception v7

    .line 356
    .local v7, "e":Ljava/lang/Exception;
    :try_start_60
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fail to query,  error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7c
    .catchall {:try_start_60 .. :try_end_7c} :catchall_8b

    .line 358
    if-eqz v6, :cond_54

    .line 360
    :try_start_7e
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_81
    .catch Ljava/lang/Throwable; {:try_start_7e .. :try_end_81} :catch_82

    goto :goto_54

    .line 361
    :catch_82
    move-exception v9

    .line 362
    .restart local v9    # "t":Ljava/lang/Throwable;
    const-string v0, "GalleryUtils"

    const-string v1, "close fail"

    invoke-static {v0, v1, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_54

    .line 358
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v9    # "t":Ljava/lang/Throwable;
    :catchall_8b
    move-exception v0

    if-eqz v6, :cond_91

    .line 360
    :try_start_8e
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_91
    .catch Ljava/lang/Throwable; {:try_start_8e .. :try_end_91} :catch_92

    .line 363
    :cond_91
    :goto_91
    throw v0

    .line 361
    :catch_92
    move-exception v9

    .line 362
    .restart local v9    # "t":Ljava/lang/Throwable;
    const-string v1, "GalleryUtils"

    const-string v2, "close fail"

    invoke-static {v1, v2, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_91
.end method

.method public static getLocalSourceTypeFromPrefix(Ljava/lang/String;)I
    .registers 2
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 244
    const/4 v0, 0x0

    return v0
.end method

.method public static getRealMetrics(Landroid/content/Context;Landroid/util/DisplayMetrics;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "metrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 82
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 84
    .local v0, "wm":Landroid/view/WindowManager;
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 85
    return-void
.end method

.method public static getRealStatusBarHeight()I
    .registers 6

    .prologue
    .line 230
    const/4 v1, 0x0

    .line 231
    .local v1, "result":I
    sget-object v2, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "status_bar_height"

    const-string v4, "dimen"

    const-string v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 233
    .local v0, "resourceId":I
    if-lez v0, :cond_1d

    .line 234
    sget-object v2, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 236
    :cond_1d
    return v1
.end method

.method public static getRealStatusBarHeight(Z)I
    .registers 2
    .param p0, "useStatusBar"    # Z

    .prologue
    .line 226
    if-eqz p0, :cond_7

    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->getRealStatusBarHeight()I

    move-result v0

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public static getStatusBarHeight(Landroid/app/Activity;)I
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 216
    if-nez p0, :cond_4

    .line 217
    const/4 v1, 0x0

    .line 222
    :goto_3
    return v1

    .line 219
    :cond_4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 220
    .local v0, "rectgle":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 222
    iget v1, v0, Landroid/graphics/Rect;->top:I

    goto :goto_3
.end method

.method public static initialize(Landroid/content/Context;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    sput-object p0, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    .line 71
    sget v1, Lcom/lge/gallery/util/GalleryUtils;->sPixelDensity:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_20

    .line 72
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 73
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    invoke-static {p0, v0}, Lcom/lge/gallery/util/GalleryUtils;->getRealMetrics(Landroid/content/Context;Landroid/util/DisplayMetrics;)V

    .line 74
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    sput v1, Lcom/lge/gallery/util/GalleryUtils;->sPixelDensity:F

    .line 75
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    sput v1, Lcom/lge/gallery/util/GalleryUtils;->sDisplayWidth:I

    .line 76
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    sput v1, Lcom/lge/gallery/util/GalleryUtils;->sDisplayHeight:I

    .line 77
    invoke-static {v0}, Lcom/lge/gallery/util/ThumbnailUtil;->initialize(Landroid/util/DisplayMetrics;)V

    .line 79
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :cond_20
    return-void
.end method

.method public static isCameraAvailable(Landroid/content/Context;)Z
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 135
    const/4 v0, 0x1

    return v0
.end method

.method public static isColumnExist(Ljava/lang/String;)Z
    .registers 12
    .param p0, "columnName"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 271
    if-nez p0, :cond_4

    .line 292
    :goto_3
    return v9

    .line 274
    :cond_4
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    .line 275
    .local v10, "uri":Landroid/net/Uri;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    aput-object p0, v2, v9

    .line 276
    .local v2, "proj":[Ljava/lang/String;
    const/4 v9, 0x1

    .line 277
    .local v9, "isExist":Z
    const/4 v6, 0x0

    .line 279
    .local v6, "c":Landroid/database/Cursor;
    :try_start_11
    sget-object v7, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    .line 280
    .local v7, "context":Landroid/content/Context;
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v10}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "limit"

    const-string v4, "1"

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_2d} :catch_4c
    .catchall {:try_start_11 .. :try_end_2d} :catchall_6c

    move-result-object v6

    .line 287
    if-eqz v6, :cond_33

    .line 288
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 291
    .end local v7    # "context":Landroid/content/Context;
    :cond_33
    :goto_33
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "camera_mode column exist = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 283
    :catch_4c
    move-exception v8

    .line 284
    .local v8, "e":Ljava/lang/Exception;
    :try_start_4d
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No such field : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_65
    .catchall {:try_start_4d .. :try_end_65} :catchall_6c

    .line 285
    const/4 v9, 0x0

    .line 287
    if-eqz v6, :cond_33

    .line 288
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_33

    .line 287
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_6c
    move-exception v0

    if-eqz v6, :cond_72

    .line 288
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_72
    throw v0
.end method

.method public static isConnectedToSphericalCamera(Landroid/content/Context;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 389
    if-nez p0, :cond_4

    .line 403
    :cond_3
    :goto_3
    return v2

    .line 392
    :cond_4
    const-string v3, "wifi"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 393
    .local v1, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_3

    .line 396
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 397
    .local v0, "ssid":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 398
    const-string v3, "\""

    const-string v4, ""

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 399
    const-string v3, ".OSC"

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 400
    const/4 v2, 0x1

    goto :goto_3
.end method

.method public static isDoingOperation()Z
    .registers 2

    .prologue
    .line 159
    const-wide/16 v0, 0x1f4

    invoke-static {v0, v1}, Lcom/lge/gallery/util/GalleryUtils;->isDoingOperation(J)Z

    move-result v0

    return v0
.end method

.method public static isDoingOperation(J)Z
    .registers 6
    .param p0, "delay"    # J

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 163
    sget-boolean v2, Lcom/lge/gallery/util/GalleryUtils;->sOperationRequested:Z

    if-eqz v2, :cond_e

    .line 164
    const-string v1, "GalleryUtils"

    const-string v2, "isDoingOperation: operation is already requested."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :goto_d
    return v0

    .line 167
    :cond_e
    sput-boolean v0, Lcom/lge/gallery/util/GalleryUtils;->sOperationRequested:Z

    .line 168
    sget-object v0, Lcom/lge/gallery/util/GalleryUtils;->sDelayOperationHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    move v0, v1

    .line 169
    goto :goto_d
.end method

.method public static isLockColumnExist()Z
    .registers 11

    .prologue
    .line 249
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    .line 250
    .local v10, "uri":Landroid/net/Uri;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "is_lock"

    aput-object v1, v2, v0

    .line 251
    .local v2, "proj":[Ljava/lang/String;
    const/4 v9, 0x1

    .line 252
    .local v9, "isExist":Z
    const/4 v6, 0x0

    .line 254
    .local v6, "c":Landroid/database/Cursor;
    :try_start_10
    sget-object v7, Lcom/lge/gallery/util/GalleryUtils;->sContext:Landroid/content/Context;

    .line 255
    .local v7, "context":Landroid/content/Context;
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v10}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v3, "limit"

    const-string v4, "1"

    invoke-virtual {v1, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_2c} :catch_4b
    .catchall {:try_start_10 .. :try_end_2c} :catchall_5a

    move-result-object v6

    .line 262
    if-eqz v6, :cond_32

    .line 263
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 266
    .end local v7    # "context":Landroid/content/Context;
    :cond_32
    :goto_32
    const-string v0, "GalleryUtils"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "is_lock column exist = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    return v9

    .line 258
    :catch_4b
    move-exception v8

    .line 259
    .local v8, "e":Ljava/lang/Exception;
    :try_start_4c
    const-string v0, "GalleryUtils"

    const-string v1, "No such field : is_lock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catchall {:try_start_4c .. :try_end_53} :catchall_5a

    .line 260
    const/4 v9, 0x0

    .line 262
    if-eqz v6, :cond_32

    .line 263
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_32

    .line 262
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_5a
    move-exception v0

    if-eqz v6, :cond_60

    .line 263
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_60
    throw v0
.end method

.method public static isOneSideTooLong(II)Z
    .registers 5
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    const v2, 0x3fd9999a    # 1.7f

    .line 326
    if-lez p1, :cond_c

    int-to-float v0, p0

    int-to-float v1, p1

    div-float/2addr v0, v1

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_15

    :cond_c
    if-lez p0, :cond_17

    int-to-float v0, p1

    int-to-float v1, p0

    div-float/2addr v0, v1

    cmpl-float v0, v0, v2

    if-lez v0, :cond_17

    :cond_15
    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static setRenderThread()V
    .registers 1

    .prologue
    .line 106
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/util/GalleryUtils;->sCurrentThread:Ljava/lang/Thread;

    .line 107
    return-void
.end method

.method public static startImageEditor(Landroid/app/Activity;Landroid/net/Uri;)Z
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 370
    if-eqz p0, :cond_6

    if-nez p1, :cond_8

    :cond_6
    move v1, v2

    .line 385
    :goto_7
    return v1

    .line 374
    :cond_8
    :try_start_8
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.EDIT"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "image/*"

    invoke-virtual {v3, p1, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_22
    .catch Landroid/content/ActivityNotFoundException; {:try_start_8 .. :try_end_22} :catch_23

    goto :goto_7

    .line 379
    :catch_23
    move-exception v0

    .line 380
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v1, "GalleryUtils"

    const-string v3, "failed to start edit activity"

    invoke-static {v1, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 381
    sget v1, Lcom/lge/gallery/common/R$string;->activity_not_found:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    move v1, v2

    .line 383
    goto :goto_7
.end method

.method public static final toMile(D)D
    .registers 4
    .param p0, "meter"    # D

    .prologue
    .line 119
    const-wide v0, 0x4099240000000000L    # 1609.0

    div-double v0, p0, v0

    return-wide v0
.end method
