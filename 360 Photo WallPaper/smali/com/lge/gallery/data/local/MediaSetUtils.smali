.class public Lcom/lge/gallery/data/local/MediaSetUtils;
.super Ljava/lang/Object;
.source "MediaSetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/local/MediaSetUtils$NameComparator;
    }
.end annotation


# static fields
.field public static final MIMETYPE_JPEG:Ljava/lang/String; = "image/jpeg"

.field public static final MIMETYPE_MP4:Ljava/lang/String; = "video/mp4"

.field public static final NAME_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/lge/gallery/data/core/MediaSet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/lge/gallery/data/local/MediaSetUtils$NameComparator;

    invoke-direct {v0}, Lcom/lge/gallery/data/local/MediaSetUtils$NameComparator;-><init>()V

    sput-object v0, Lcom/lge/gallery/data/local/MediaSetUtils;->NAME_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static addTopSetPath(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "pathtype"    # I
    .param p1, "basepath"    # Ljava/lang/String;
    .param p2, "newPath"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/lge/gallery/data/local/MediaSetUtils;->addTopSetPath(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static addTopSetPath(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 11
    .param p0, "pathtype"    # I
    .param p1, "basepath"    # Ljava/lang/String;
    .param p2, "newPath"    # Ljava/lang/String;
    .param p3, "addPrefix"    # Z

    .prologue
    const/4 v6, 0x0

    .line 75
    move-object v2, p1

    .line 76
    .local v2, "result":Ljava/lang/String;
    const-string v5, "/local"

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 77
    .local v1, "localpos":I
    const-string v5, ","

    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 78
    .local v3, "startpos":I
    const/4 v0, 0x0

    .line 79
    .local v0, "head":Ljava/lang/String;
    const/4 v4, 0x0

    .line 81
    .local v4, "tail":Ljava/lang/String;
    const/4 v5, 0x1

    if-ne p3, v5, :cond_89

    .line 82
    invoke-virtual {p1, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 83
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 84
    packed-switch p0, :pswitch_data_102

    .line 114
    :goto_22
    return-object v2

    .line 86
    :pswitch_23
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/all,"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 87
    goto :goto_22

    .line 89
    :pswitch_45
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/image,"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 90
    goto :goto_22

    .line 92
    :pswitch_67
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/video,"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 93
    goto :goto_22

    .line 98
    :cond_89
    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 99
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 100
    packed-switch p0, :pswitch_data_10c

    goto :goto_22

    .line 105
    :pswitch_99
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/image"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 106
    goto/16 :goto_22

    .line 102
    :pswitch_bc
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/all"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 103
    goto/16 :goto_22

    .line 108
    :pswitch_df
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ",/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/video"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 109
    goto/16 :goto_22

    .line 84
    :pswitch_data_102
    .packed-switch 0x1
        :pswitch_45
        :pswitch_67
        :pswitch_23
    .end packed-switch

    .line 100
    :pswitch_data_10c
    .packed-switch 0x1
        :pswitch_99
        :pswitch_df
        :pswitch_bc
    .end packed-switch
.end method

.method public static circularShiftRight([Ljava/lang/Object;II)V
    .registers 6
    .param p1, "i"    # I
    .param p2, "j"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "array":[Ljava/lang/Object;, "[TT;"
    aget-object v1, p0, p2

    .line 122
    .local v1, "temp":Ljava/lang/Object;, "TT;"
    move v0, p2

    .local v0, "k":I
    :goto_3
    if-le v0, p1, :cond_e

    .line 123
    add-int/lit8 v2, v0, -0x1

    aget-object v2, p0, v2

    aput-object v2, p0, v0

    .line 122
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 125
    :cond_e
    aput-object v1, p0, p1

    .line 126
    return-void
.end method

.method public static getBurstUnitItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/image/item/burst"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getCameraAlbumName(Landroid/content/Context;I)Ljava/lang/String;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bucketId"    # I

    .prologue
    .line 43
    const-class v1, Lcom/lge/gallery/data/local/MediaSetUtils;

    monitor-enter v1

    :try_start_3
    invoke-static {p0}, Lcom/lge/gallery/util/LocalBucketData;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/LocalBucketData;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, p0, p1, v2}, Lcom/lge/gallery/util/LocalBucketData;->getLocalizedBucketName(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_e

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_e
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getDownloadBucketId(Landroid/content/Context;Z)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "external"    # Z

    .prologue
    .line 55
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "path":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "download/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lge/gallery/util/GalleryUtils;->getBucketId(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public static declared-synchronized getFrontBucketId(Landroid/content/Context;)Ljava/util/ArrayList;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    const-class v1, Lcom/lge/gallery/data/local/MediaSetUtils;

    monitor-enter v1

    :try_start_3
    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->REORDER_CAMERA:Z

    if-nez v0, :cond_e

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_18

    .line 51
    :goto_c
    monitor-exit v1

    return-object v0

    :cond_e
    :try_start_e
    invoke-static {p0}, Lcom/lge/gallery/util/LocalBucketData;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/LocalBucketData;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/lge/gallery/util/LocalBucketData;->getFrontBucketId(Z)Ljava/util/ArrayList;
    :try_end_16
    .catchall {:try_start_e .. :try_end_16} :catchall_18

    move-result-object v0

    goto :goto_c

    .line 48
    :catchall_18
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getImageItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/image/item"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    return-object v0
.end method

.method public static getVideoItemPath(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/video/item"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/data/core/Path;->fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized isCameraAlbum(Landroid/content/Context;I)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bucketId"    # I

    .prologue
    .line 39
    const-class v1, Lcom/lge/gallery/data/local/MediaSetUtils;

    monitor-enter v1

    :try_start_3
    invoke-static {p0}, Lcom/lge/gallery/util/LocalBucketData;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/LocalBucketData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lge/gallery/util/LocalBucketData;->isCameraAlbum(I)Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_d

    move-result v0

    monitor-exit v1

    return v0

    :catchall_d
    move-exception v0

    monitor-exit v1

    throw v0
.end method
