.class public Lcom/lge/gallery/data/cache/OscImageCacheService;
.super Lcom/lge/gallery/data/cache/AbstractImageCacheService;
.source "OscImageCacheService.java"


# static fields
.field private static final IMAGE_CACHE_FILE:Ljava/lang/String; = "oscimgcache"

.field private static final IMAGE_CACHE_MAX_BYTES:I = 0x19000000

.field private static final IMAGE_CACHE_MAX_ENTRIES:I = 0x2710

.field private static final IMAGE_CACHE_VERSION:I = 0x1

.field private static sInstance:Lcom/lge/gallery/data/cache/OscImageCacheService;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const-string v2, "oscimgcache"

    const/16 v3, 0x2710

    const/high16 v4, 0x19000000

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;-><init>(Landroid/content/Context;Ljava/lang/String;III)V

    .line 26
    return-void
.end method

.method static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/OscImageCacheService;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const-class v2, Lcom/lge/gallery/data/cache/OscImageCacheService;

    monitor-enter v2

    :try_start_3
    sget-object v0, Lcom/lge/gallery/data/cache/OscImageCacheService;->sInstance:Lcom/lge/gallery/data/cache/OscImageCacheService;

    .line 30
    .local v0, "cache":Lcom/lge/gallery/data/cache/OscImageCacheService;
    if-nez v0, :cond_e

    .line 31
    new-instance v0, Lcom/lge/gallery/data/cache/OscImageCacheService;

    .end local v0    # "cache":Lcom/lge/gallery/data/cache/OscImageCacheService;
    invoke-direct {v0, p0}, Lcom/lge/gallery/data/cache/OscImageCacheService;-><init>(Landroid/content/Context;)V

    .line 32
    .restart local v0    # "cache":Lcom/lge/gallery/data/cache/OscImageCacheService;
    sput-object v0, Lcom/lge/gallery/data/cache/OscImageCacheService;->sInstance:Lcom/lge/gallery/data/cache/OscImageCacheService;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 34
    :cond_e
    monitor-exit v2

    return-object v0

    .line 29
    .end local v0    # "cache":Lcom/lge/gallery/data/cache/OscImageCacheService;
    :catchall_10
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static makeKey(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 4
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 39
    .local v0, "keyString":Ljava/lang/StringBuffer;
    const-string v1, "+"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/GalleryUtils;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    const-string v0, "oscimgcache"

    return-object v0
.end method
