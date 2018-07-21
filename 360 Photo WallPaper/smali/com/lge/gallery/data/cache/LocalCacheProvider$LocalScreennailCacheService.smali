.class Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
.super Lcom/lge/gallery/data/cache/AbstractImageCacheService;
.source "LocalCacheProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/cache/LocalCacheProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalScreennailCacheService"
.end annotation


# static fields
.field private static final IMAGE_CACHE_FILE:Ljava/lang/String; = "imgcache_screen"

.field private static final IMAGE_CACHE_MAX_BYTES:I = 0x6400000

.field private static final IMAGE_CACHE_MAX_ENTRIES:I = 0x4e20

.field private static final IMAGE_CACHE_VERSION:I = 0x1

.field private static sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    const-string v2, "imgcache_screen"

    const/16 v3, 0x4e20

    const/high16 v4, 0x6400000

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/data/cache/AbstractImageCacheService;-><init>(Landroid/content/Context;Ljava/lang/String;III)V

    .line 119
    return-void
.end method

.method static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 122
    const-class v2, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;

    monitor-enter v2

    :try_start_3
    sget-object v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;->sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;

    .line 123
    .local v0, "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    if-nez v0, :cond_e

    .line 124
    new-instance v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;

    .end local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    invoke-direct {v0, p0}, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;-><init>(Landroid/content/Context;)V

    .line 125
    .restart local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    sput-object v0, Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;->sInstance:Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_10

    .line 127
    :cond_e
    monitor-exit v2

    return-object v0

    .line 122
    .end local v0    # "cache":Lcom/lge/gallery/data/cache/LocalCacheProvider$LocalScreennailCacheService;
    :catchall_10
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 132
    const-string v0, "imgcache_screen"

    return-object v0
.end method
