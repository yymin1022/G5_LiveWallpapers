.class public Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;
.super Ljava/lang/Object;
.source "PanoramaViewHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;
    }
.end annotation


# static fields
.field public static final MAX_SIDE_LENGTH:I

.field private static final MIN_HEAP_FOR_RUNNING:I = 0x50

.field public static final NO_LIMITATION:I = 0x0

.field private static final TAG:Ljava/lang/String; = "PanoramaViewHelper"


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 31
    invoke-static {}, Lcom/lge/gallery/util/GalleryUtils;->getApplicationHeapSizeInMbytes()J

    move-result-wide v0

    const-wide/16 v2, 0x50

    sub-long/2addr v0, v2

    const/16 v2, 0x11

    shl-long/2addr v0, v2

    long-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    mul-int/lit8 v0, v0, 0x2

    sput v0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->MAX_SIDE_LENGTH:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method private static loadXmp(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/vr/viewer/renderer/Renderer;IZLcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)V
    .registers 12
    .param p0, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;
    .param p2, "renderer"    # Lcom/lge/gallery/vr/viewer/renderer/Renderer;
    .param p3, "maxSideLength"    # I
    .param p4, "force360"    # Z
    .param p5, "listener"    # Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    .prologue
    .line 68
    new-instance v0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;

    move-object v1, p2

    move-object v2, p0

    move-object v3, p5

    move v4, p4

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;-><init>(Lcom/lge/gallery/vr/viewer/renderer/Renderer;Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;ZI)V

    invoke-virtual {p1, p0, v0}, Lcom/lge/gallery/data/core/MediaItem;->loadVRMetadata(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V

    .line 84
    return-void
.end method

.method public static setImagePreferTile(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/net/Uri;Lcom/lge/gallery/vr/viewer/renderer/Renderer;ILcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)Lcom/lge/gallery/data/core/MediaItem;
    .registers 15
    .param p0, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "renderer"    # Lcom/lge/gallery/vr/viewer/renderer/Renderer;
    .param p3, "maxSize"    # I
    .param p4, "listener"    # Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    .prologue
    const/4 v3, 0x0

    .line 40
    invoke-interface {p0}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v9

    .line 41
    .local v9, "manager":Lcom/lge/gallery/data/core/DataManager;
    const/4 v2, 0x0

    .line 42
    .local v2, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-nez p3, :cond_39

    sget v4, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->MAX_SIDE_LENGTH:I

    .line 45
    .local v4, "maxSideLength":I
    :goto_a
    :try_start_a
    invoke-virtual {v9, p1}, Lcom/lge/gallery/data/core/DataManager;->findPathByUri(Landroid/net/Uri;)Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v9, v1}, Lcom/lge/gallery/data/core/DataManager;->getMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/lge/gallery/data/core/MediaItem;

    move-object v2, v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_16} :catch_40

    .line 49
    :goto_16
    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Lcom/lge/gallery/data/core/MediaItem;->getMediaType()I

    move-result v1

    const/4 v5, 0x2

    if-eq v1, v5, :cond_5a

    .line 50
    :cond_1f
    const-string v1, "PanoramaViewHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot show the file : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v3

    .line 63
    .end local v2    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :goto_38
    return-object v2

    .line 42
    .end local v4    # "maxSideLength":I
    .restart local v2    # "item":Lcom/lge/gallery/data/core/MediaItem;
    :cond_39
    sget v1, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->MAX_SIDE_LENGTH:I

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v4

    goto :goto_a

    .line 46
    .restart local v4    # "maxSideLength":I
    :catch_40
    move-exception v7

    .line 47
    .local v7, "e":Ljava/lang/Exception;
    const-string v1, "PanoramaViewHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot access the item : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16

    .line 53
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_5a
    sget-boolean v8, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    .line 54
    .local v8, "isCameraModeExist":Z
    if-eqz v8, :cond_75

    .line 55
    invoke-virtual {v2}, Lcom/lge/gallery/data/core/MediaItem;->is360()Z

    move-result v1

    if-nez v1, :cond_6d

    .line 56
    const-string v1, "PanoramaViewHelper"

    const-string v5, "Not a VR image"

    invoke-static {v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v3

    .line 57
    goto :goto_38

    .line 59
    :cond_6d
    const/4 v5, 0x1

    move-object v1, p0

    move-object v3, p2

    move-object v6, p4

    invoke-static/range {v1 .. v6}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->loadXmp(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/vr/viewer/renderer/Renderer;IZLcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)V

    goto :goto_38

    .line 61
    :cond_75
    const/4 v5, 0x0

    move-object v1, p0

    move-object v3, p2

    move-object v6, p4

    invoke-static/range {v1 .. v6}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->loadXmp(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/vr/viewer/renderer/Renderer;IZLcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)V

    goto :goto_38
.end method
