.class public Lcom/lge/gallery/util/AllFolderManager;
.super Ljava/lang/Object;
.source "AllFolderManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ShowAllFolderManager"

.field private static final lock:Ljava/lang/Object;

.field private static sManager:Lcom/lge/gallery/util/AllFolderManager;


# instance fields
.field private mAllfolderQueryString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/lge/gallery/util/AllFolderManager;->lock:Ljava/lang/Object;

    .line 38
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/gallery/util/AllFolderManager;->sManager:Lcom/lge/gallery/util/AllFolderManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/util/AllFolderManager;->mAllfolderQueryString:Ljava/lang/String;

    .line 33
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/util/AllFolderManager;->mAllfolderQueryString:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public static getAllfolderQueryString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 121
    sget-object v2, Lcom/lge/gallery/util/AllFolderManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 122
    :try_start_3
    sget-object v0, Lcom/lge/gallery/util/AllFolderManager;->sManager:Lcom/lge/gallery/util/AllFolderManager;

    .line 123
    .local v0, "manager":Lcom/lge/gallery/util/AllFolderManager;
    if-nez v0, :cond_a

    .line 124
    const/4 v1, 0x0

    monitor-exit v2

    .line 126
    :goto_9
    return-object v1

    :cond_a
    iget-object v1, v0, Lcom/lge/gallery/util/AllFolderManager;->mAllfolderQueryString:Ljava/lang/String;

    monitor-exit v2

    goto :goto_9

    .line 127
    :catchall_e
    move-exception v1

    monitor-exit v2
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/AllFolderManager;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    sget-object v2, Lcom/lge/gallery/util/AllFolderManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 42
    :try_start_3
    sget-object v0, Lcom/lge/gallery/util/AllFolderManager;->sManager:Lcom/lge/gallery/util/AllFolderManager;

    .line 43
    .local v0, "manager":Lcom/lge/gallery/util/AllFolderManager;
    if-nez v0, :cond_e

    .line 44
    new-instance v0, Lcom/lge/gallery/util/AllFolderManager;

    .end local v0    # "manager":Lcom/lge/gallery/util/AllFolderManager;
    invoke-direct {v0, p0}, Lcom/lge/gallery/util/AllFolderManager;-><init>(Landroid/content/Context;)V

    .line 45
    .restart local v0    # "manager":Lcom/lge/gallery/util/AllFolderManager;
    sput-object v0, Lcom/lge/gallery/util/AllFolderManager;->sManager:Lcom/lge/gallery/util/AllFolderManager;

    .line 47
    :cond_e
    const-string v1, "ShowAllFolderManager"

    const-string v3, "ShowAllFolderManager:getInstance."

    invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    monitor-exit v2

    return-object v0

    .line 49
    .end local v0    # "manager":Lcom/lge/gallery/util/AllFolderManager;
    :catchall_17
    move-exception v1

    monitor-exit v2
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v1
.end method

.method public static hasLocalSource(Landroid/content/Context;Z)Z
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isAllMode"    # Z

    .prologue
    .line 54
    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v4, "limit"

    const-string v5, "1"

    invoke-virtual {v2, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 56
    .local v1, "uriImages":Landroid/net/Uri;
    sget-object v2, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v4, "limit"

    const-string v5, "1"

    invoke-virtual {v2, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v13

    .line 58
    .local v13, "uriVideos":Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 59
    .local v0, "cr":Landroid/content/ContentResolver;
    const/4 v10, 0x0

    .line 60
    .local v10, "cursorImages":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 61
    .local v11, "cursorVideos":Landroid/database/Cursor;
    if-eqz p1, :cond_4c

    invoke-static {}, Lcom/lge/gallery/util/AllFolderManager;->getAllfolderQueryString()Ljava/lang/String;

    move-result-object v3

    .line 64
    .local v3, "whereClause":Ljava/lang/String;
    :goto_30
    :try_start_30
    sget-object v2, Lcom/lge/gallery/util/MediaConstants;->BUCKET_PROJECTION_IMAGES:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 66
    if-eqz v10, :cond_4e

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_3d} :catch_79
    .catchall {:try_start_30 .. :try_end_3d} :catchall_8c

    move-result v2

    if-lez v2, :cond_4e

    .line 67
    const/4 v2, 0x1

    .line 78
    if-eqz v10, :cond_46

    .line 79
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 81
    :cond_46
    if-eqz v11, :cond_4b

    .line 82
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 85
    :cond_4b
    :goto_4b
    return v2

    .line 61
    .end local v3    # "whereClause":Ljava/lang/String;
    :cond_4c
    const/4 v3, 0x0

    goto :goto_30

    .line 70
    .restart local v3    # "whereClause":Ljava/lang/String;
    :cond_4e
    :try_start_4e
    sget-object v6, Lcom/lge/gallery/util/MediaConstants;->BUCKET_PROJECTION_VIDEOS:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, v0

    move-object v5, v13

    move-object v7, v3

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 72
    if-eqz v11, :cond_6d

    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_5e} :catch_79
    .catchall {:try_start_4e .. :try_end_5e} :catchall_8c

    move-result v2

    if-lez v2, :cond_6d

    .line 73
    const/4 v2, 0x1

    .line 78
    if-eqz v10, :cond_67

    .line 79
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 81
    :cond_67
    if-eqz v11, :cond_4b

    .line 82
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    goto :goto_4b

    .line 78
    :cond_6d
    if-eqz v10, :cond_72

    .line 79
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 81
    :cond_72
    if-eqz v11, :cond_77

    .line 82
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 85
    :cond_77
    :goto_77
    const/4 v2, 0x0

    goto :goto_4b

    .line 75
    :catch_79
    move-exception v12

    .line 76
    .local v12, "e":Ljava/lang/Exception;
    :try_start_7a
    const-string v2, "ShowAllFolderManager"

    const-string v4, "failed to query."

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_81
    .catchall {:try_start_7a .. :try_end_81} :catchall_8c

    .line 78
    if-eqz v10, :cond_86

    .line 79
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 81
    :cond_86
    if-eqz v11, :cond_77

    .line 82
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    goto :goto_77

    .line 78
    .end local v12    # "e":Ljava/lang/Exception;
    :catchall_8c
    move-exception v2

    if-eqz v10, :cond_92

    .line 79
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 81
    :cond_92
    if-eqz v11, :cond_97

    .line 82
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_97
    throw v2
.end method

.method public static makeAllfolderQueryString(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    if-nez p0, :cond_3

    .line 118
    :goto_2
    return-void

    .line 100
    :cond_3
    sget-object v4, Lcom/lge/gallery/util/AllFolderManager;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 101
    :try_start_6
    sget-object v1, Lcom/lge/gallery/util/AllFolderManager;->sManager:Lcom/lge/gallery/util/AllFolderManager;

    .line 102
    .local v1, "manager":Lcom/lge/gallery/util/AllFolderManager;
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_16

    .line 103
    const/4 v3, 0x0

    iput-object v3, v1, Lcom/lge/gallery/util/AllFolderManager;->mAllfolderQueryString:Ljava/lang/String;

    .line 104
    monitor-exit v4

    goto :goto_2

    .line 117
    .end local v1    # "manager":Lcom/lge/gallery/util/AllFolderManager;
    :catchall_13
    move-exception v3

    monitor-exit v4
    :try_end_15
    .catchall {:try_start_6 .. :try_end_15} :catchall_13

    throw v3

    .line 107
    .restart local v1    # "manager":Lcom/lge/gallery/util/AllFolderManager;
    :cond_16
    :try_start_16
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "bucket_id NOT IN("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_48

    .line 110
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_24
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_3a

    .line 111
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ","

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_24

    .line 113
    :cond_3a
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 114
    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .end local v0    # "i":I
    :cond_48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/lge/gallery/util/AllFolderManager;->mAllfolderQueryString:Ljava/lang/String;

    .line 117
    monitor-exit v4
    :try_end_4f
    .catchall {:try_start_16 .. :try_end_4f} :catchall_13

    goto :goto_2
.end method

.method public static updateAllfolderQueryString(Landroid/content/Context;)V
    .registers 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    return-void
.end method
