.class Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
.super Lcom/lge/gallery/data/cache/AbstractImageCacheService;
.source "LocalCacheProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/cache/LocalCacheProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalCacheService"
.end annotation


# static fields
.field private static final IMAGE_CACHE_FILE:Ljava/lang/String; = "imgcache"

.field private static final IMAGE_CACHE_MAX_BYTES:I = 0xc800000

.field private static final IMAGE_CACHE_MAX_ENTRIES:I = 0x9c40

.field private static final IMAGE_CACHE_VERSION:I = 0x6

.field private static sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    const-string v2, "imgcache"

    const v3, 0x9c40

    const/high16 v4, 0xc800000

    const/4 v5, 0x6

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;-><init>(Landroid/content/Context;Ljava/lang/String;III)V

    .line 92
    return-void
.end method

.method static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 95
    const-class v2, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;

    monitor-enter v2

    :try_start_3
    sget-object v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;->sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;

    .line 96
    .local v0, "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    if-nez v0, :cond_e

    .line 97
    new-instance v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;

    .end local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    invoke-direct {v0, p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;-><init>(Landroid/content/Context;)V

    .line 98
    .restart local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    sput-object v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;->sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 100
    :cond_e
    monitor-exit v2

    return-object v0

    .line 95
    .end local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalCacheService;
    :catchall_10
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    const-string v0, "imgcache"

    return-object v0
.end method
