.class public Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
.super Ljava/lang/Object;
.source "WallpaperCoverManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static sManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsTemporaryCoverQueried:Z

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPreference:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mListeners:Ljava/util/ArrayList;

    .line 51
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    .line 52
    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    .line 53
    return-void
.end method

.method public static createCoverFromPath(Landroid/content/Context;Ljava/lang/String;)Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 60
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/AssetCover;

    invoke-direct {v0, p0, p1}, Lcom/lge/gallery/vr/wallpaper/AssetCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method public static createCoverFromUri(Landroid/content/Context;Landroid/net/Uri;)Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 56
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/UriCover;

    invoke-direct {v0, p0, p1}, Lcom/lge/gallery/vr/wallpaper/UriCover;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    const-class v1, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->sManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    if-eqz v0, :cond_b

    .line 36
    sget-object v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->sManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_15

    .line 39
    :goto_9
    monitor-exit v1

    return-object v0

    .line 38
    :cond_b
    :try_start_b
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-direct {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->sManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    .line 39
    sget-object v0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->sManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
    :try_end_14
    .catchall {:try_start_b .. :try_end_14} :catchall_15

    goto :goto_9

    .line 35
    :catchall_15
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public clearLastRequestedCover()V
    .registers 3

    .prologue
    .line 137
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lastUri"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lastFromAsset"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 138
    return-void
.end method

.method public getDefaultCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 7

    .prologue
    .line 90
    :try_start_0
    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "images"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "imageFiles":[Ljava/lang/String;
    if-eqz v1, :cond_39

    array-length v2, v1

    if-lez v2, :cond_39

    .line 92
    new-instance v2, Lcom/lge/gallery/vr/wallpaper/AssetCover;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "images"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/lge/gallery/vr/wallpaper/AssetCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_34} :catch_35

    .line 97
    .end local v1    # "imageFiles":[Ljava/lang/String;
    :goto_34
    return-object v2

    .line 94
    :catch_35
    move-exception v0

    .line 95
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 97
    .end local v0    # "e":Ljava/io/IOException;
    :cond_39
    const/4 v2, 0x0

    goto :goto_34
.end method

.method public getPreviewCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 5

    .prologue
    .line 75
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "lastUri"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "uri":Ljava/lang/String;
    if-eqz v0, :cond_26

    .line 77
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "lastFromAsset"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 78
    new-instance v1, Lcom/lge/gallery/vr/wallpaper/AssetCover;

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/lge/gallery/vr/wallpaper/AssetCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 85
    :goto_1d
    return-object v1

    .line 80
    :cond_1e
    new-instance v1, Lcom/lge/gallery/vr/wallpaper/UriCover;

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/lge/gallery/vr/wallpaper/UriCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1d

    .line 82
    :cond_26
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->isEverSet()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 83
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getStoredCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v1

    goto :goto_1d

    .line 85
    :cond_31
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getDefaultCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v1

    goto :goto_1d
.end method

.method public getStoredCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 5

    .prologue
    .line 64
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "currentUri"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "uri":Ljava/lang/String;
    if-eqz v0, :cond_26

    .line 66
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "currentFromAsset"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 67
    new-instance v1, Lcom/lge/gallery/vr/wallpaper/AssetCover;

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/lge/gallery/vr/wallpaper/AssetCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 71
    :goto_1d
    return-object v1

    .line 69
    :cond_1e
    new-instance v1, Lcom/lge/gallery/vr/wallpaper/UriCover;

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/lge/gallery/vr/wallpaper/UriCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1d

    .line 71
    :cond_26
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getDefaultCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v1

    goto :goto_1d
.end method

.method public isEverSet()Z
    .registers 4

    .prologue
    .line 145
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "hasEverSet"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isLastRequestedExist()Z
    .registers 5

    .prologue
    const/4 v0, 0x1

    .line 119
    monitor-enter p0

    const/4 v1, 0x1

    :try_start_3
    iput-boolean v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mIsTemporaryCoverQueried:Z

    .line 120
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v2, "lastUri"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_14

    move-result-object v1

    if-eqz v1, :cond_12

    :goto_10
    monitor-exit p0

    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_10

    .line 119
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isStoredCoverExist()Z
    .registers 4

    .prologue
    .line 115
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "currentUri"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public declared-synchronized isTemporaryQuried()Z
    .registers 2

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mIsTemporaryCoverQueried:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized registerListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;

    .prologue
    .line 43
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 44
    monitor-exit p0

    return-void

    .line 43
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLastRequestedCover(Landroid/net/Uri;)V
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 124
    monitor-enter p0

    if-nez p1, :cond_5

    .line 130
    :goto_3
    monitor-exit p0

    return-void

    .line 127
    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lastUri"

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "lastFromAsset"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mIsTemporaryCoverQueried:Z
    :try_end_22
    .catchall {:try_start_5 .. :try_end_22} :catchall_23

    goto :goto_3

    .line 124
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setLoaded()V
    .registers 4

    .prologue
    .line 141
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "hasEverSet"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 142
    return-void
.end method

.method public storeCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 7
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 101
    if-nez p1, :cond_3

    .line 112
    :goto_2
    return-void

    .line 104
    :cond_3
    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mPreference:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "currentUri"

    invoke-interface {p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "currentFromAsset"

    invoke-interface {p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->isAsset()Z

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 106
    sget-object v2, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "New wallpaper stored : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    monitor-enter p0

    .line 108
    :try_start_3d
    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_43
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;

    .line 109
    .local v1, "l":Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;
    invoke-interface {v1, p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;->onCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    goto :goto_43

    .line 111
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "l":Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;
    :catchall_53
    move-exception v2

    monitor-exit p0
    :try_end_55
    .catchall {:try_start_3d .. :try_end_55} :catchall_53

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_56
    :try_start_56
    monitor-exit p0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_53

    goto :goto_2
.end method

.method public declared-synchronized unregisterListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;

    .prologue
    .line 47
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 48
    monitor-exit p0

    return-void

    .line 47
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
