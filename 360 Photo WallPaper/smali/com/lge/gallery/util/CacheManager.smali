.class public Lcom/lge/gallery/util/CacheManager;
.super Ljava/lang/Object;
.source "CacheManager.java"


# static fields
.field private static final KEY_CACHE_UP_TO_DATE:Ljava/lang/String; = "cache-up-to-date"

.field private static final TAG:Ljava/lang/String; = "CacheManager"

.field private static sCacheMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lge/gallery/common/BlobCache;",
            ">;"
        }
    .end annotation
.end field

.field private static sOldCheckDone:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    .line 35
    const/4 v0, 0x0

    sput-boolean v0, Lcom/lge/gallery/util/CacheManager;->sOldCheckDone:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCache(Landroid/content/Context;Ljava/lang/String;III)Lcom/lge/gallery/common/BlobCache;
    .registers 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "maxEntries"    # I
    .param p3, "maxBytes"    # I
    .param p4, "version"    # I

    .prologue
    .line 42
    sget-object v9, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    monitor-enter v9

    .line 43
    :try_start_3
    sget-boolean v2, Lcom/lge/gallery/util/CacheManager;->sOldCheckDone:Z

    if-nez v2, :cond_d

    .line 44
    invoke-static {p0}, Lcom/lge/gallery/util/CacheManager;->removeOldFilesIfNecessary(Landroid/content/Context;)V

    .line 45
    const/4 v2, 0x1

    sput-boolean v2, Lcom/lge/gallery/util/CacheManager;->sOldCheckDone:Z

    .line 47
    :cond_d
    sget-object v2, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/lge/gallery/common/BlobCache;

    .line 48
    .local v6, "cache":Lcom/lge/gallery/common/BlobCache;
    if-nez v6, :cond_57

    .line 49
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v7

    .line 50
    .local v7, "cacheDir":Ljava/io/File;
    if-eqz v7, :cond_57

    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_37
    .catchall {:try_start_3 .. :try_end_37} :catchall_52

    move-result-object v1

    .line 53
    .local v1, "path":Ljava/lang/String;
    :try_start_38
    new-instance v0, Lcom/lge/gallery/common/BlobCache;

    const/4 v4, 0x0

    move v2, p2

    move v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/common/BlobCache;-><init>(Ljava/lang/String;IIZI)V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_41} :catch_48
    .catchall {:try_start_38 .. :try_end_41} :catchall_52

    .line 55
    .end local v6    # "cache":Lcom/lge/gallery/common/BlobCache;
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    :try_start_41
    sget-object v2, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_46} :catch_55
    .catchall {:try_start_41 .. :try_end_46} :catchall_52

    .line 61
    .end local v1    # "path":Ljava/lang/String;
    .end local v7    # "cacheDir":Ljava/io/File;
    :goto_46
    :try_start_46
    monitor-exit v9

    return-object v0

    .line 56
    .end local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .restart local v1    # "path":Ljava/lang/String;
    .restart local v6    # "cache":Lcom/lge/gallery/common/BlobCache;
    .restart local v7    # "cacheDir":Ljava/io/File;
    :catch_48
    move-exception v8

    move-object v0, v6

    .line 57
    .end local v6    # "cache":Lcom/lge/gallery/common/BlobCache;
    .restart local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .local v8, "e":Ljava/io/IOException;
    :goto_4a
    const-string v2, "CacheManager"

    const-string v3, "Cannot instantiate cache!"

    invoke-static {v2, v3, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_46

    .line 62
    .end local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .end local v1    # "path":Ljava/lang/String;
    .end local v7    # "cacheDir":Ljava/io/File;
    .end local v8    # "e":Ljava/io/IOException;
    :catchall_52
    move-exception v2

    monitor-exit v9
    :try_end_54
    .catchall {:try_start_46 .. :try_end_54} :catchall_52

    throw v2

    .line 56
    .restart local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .restart local v1    # "path":Ljava/lang/String;
    .restart local v7    # "cacheDir":Ljava/io/File;
    :catch_55
    move-exception v8

    goto :goto_4a

    .end local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .end local v1    # "path":Ljava/lang/String;
    .end local v7    # "cacheDir":Ljava/io/File;
    .restart local v6    # "cache":Lcom/lge/gallery/common/BlobCache;
    :cond_57
    move-object v0, v6

    .end local v6    # "cache":Lcom/lge/gallery/common/BlobCache;
    .restart local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    goto :goto_46
.end method

.method public static removeCache(Landroid/content/Context;Ljava/lang/String;)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    .line 106
    .local v1, "cacheDir":Ljava/io/File;
    if-eqz v1, :cond_41

    .line 107
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "prefix":Ljava/lang/String;
    sget-object v3, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/common/BlobCache;

    .line 110
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    if-eqz v0, :cond_41

    .line 111
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 112
    sget-object v3, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_41
    return-void
.end method

.method private static removeOldFilesIfNecessary(Landroid/content/Context;)V
    .registers 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 69
    .local v4, "pref":Landroid/content/SharedPreferences;
    const/4 v3, 0x0

    .line 71
    .local v3, "n":I
    :try_start_5
    const-string v7, "cache-up-to-date"

    const/4 v8, 0x0

    invoke-interface {v4, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_b} :catch_f

    move-result v3

    .line 75
    :goto_c
    if-eqz v3, :cond_18

    .line 102
    :cond_e
    :goto_e
    return-void

    .line 72
    :catch_f
    move-exception v6

    .line 73
    .local v6, "t":Ljava/lang/Throwable;
    const-string v7, "CacheManager"

    const-string v8, "Fail to get KEY_CACHE_UP_TO_DATE"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 79
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_18
    :try_start_18
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "cache-up-to-date"

    const/4 v9, 0x1

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_26} :catch_e9

    .line 84
    :goto_26
    invoke-virtual {p0}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    .line 85
    .local v1, "cacheDir":Ljava/io/File;
    if-eqz v1, :cond_e

    .line 86
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 87
    .local v5, "prefix":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "imgcache"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 88
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "imgcache_screen"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 89
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "smallimgcache"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 90
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "rev_geocoding"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 91
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "bookmark"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 92
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "cloudimgcache"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/lge/gallery/common/BlobCache;->deleteFiles(Ljava/lang/String;)V

    .line 93
    sget-object v8, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    monitor-enter v8

    .line 94
    :try_start_ca
    sget-object v7, Lcom/lge/gallery/util/CacheManager;->sCacheMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d4
    :goto_d4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/common/BlobCache;

    .line 95
    .local v0, "cache":Lcom/lge/gallery/common/BlobCache;
    if-eqz v0, :cond_d4

    .line 98
    invoke-virtual {v0}, Lcom/lge/gallery/common/BlobCache;->notifyCacheDeleted()V

    goto :goto_d4

    .line 100
    .end local v0    # "cache":Lcom/lge/gallery/common/BlobCache;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_e6
    move-exception v7

    monitor-exit v8
    :try_end_e8
    .catchall {:try_start_ca .. :try_end_e8} :catchall_e6

    throw v7

    .line 80
    .end local v1    # "cacheDir":Ljava/io/File;
    .end local v5    # "prefix":Ljava/lang/String;
    :catch_e9
    move-exception v6

    .line 81
    .restart local v6    # "t":Ljava/lang/Throwable;
    const-string v7, "CacheManager"

    const-string v8, "Fail to edit KEY_CACHE_UP_TO_DATE"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_26

    .line 100
    .end local v6    # "t":Ljava/lang/Throwable;
    .restart local v1    # "cacheDir":Ljava/io/File;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v5    # "prefix":Ljava/lang/String;
    :cond_f3
    :try_start_f3
    monitor-exit v8
    :try_end_f4
    .catchall {:try_start_f3 .. :try_end_f4} :catchall_e6

    goto/16 :goto_e
.end method
