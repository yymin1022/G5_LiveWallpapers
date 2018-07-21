.class public abstract Lcom/lge/gallery/data/core/MediaItem;
.super Lcom/lge/gallery/data/core/MediaObject;
.source "MediaItem.java"


# static fields
.field public static final CACHED_IMAGE_QUALITY:I = 0x5f

.field public static final MICROTHUMBNAIL_TARGET_SIZE:I = 0xc8

.field public static final MIME_TYPE_JPEG:Ljava/lang/String; = "image/jpeg"

.field public static final THUMBNAIL_TARGET_SIZE:I = 0x280

.field public static final TYPE_LARGE_SCREENNAIL:I = 0x3

.field public static final TYPE_MICROTHUMBNAIL:I = 0x2

.field public static final TYPE_THUMBNAIL:I = 0x1

.field private static sBrokenImage:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private static sBrokenVideo:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 44
    sput-object v0, Lcom/lge/gallery/data/core/MediaItem;->sBrokenImage:Ljava/lang/ref/WeakReference;

    .line 45
    sput-object v0, Lcom/lge/gallery/data/core/MediaItem;->sBrokenVideo:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/data/core/Path;J)V
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "version"    # J

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/data/core/MediaObject;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 46
    new-instance v0, Lcom/lge/gallery/data/core/VRMetadataLoader;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/core/VRMetadataLoader;-><init>(Lcom/lge/gallery/data/core/MediaItem;)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/MediaItem;->mMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;

    .line 50
    return-void
.end method

.method public static getTargetSize(I)I
    .registers 3
    .param p0, "type"    # I

    .prologue
    .line 179
    packed-switch p0, :pswitch_data_16

    .line 187
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "should only request thumb/microthumb from cache"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :pswitch_b
    const/16 v0, 0x280

    .line 185
    :goto_d
    return v0

    .line 183
    :pswitch_e
    const/16 v0, 0xc8

    goto :goto_d

    .line 185
    :pswitch_11
    invoke-static {}, Lcom/lge/gallery/util/ThumbnailUtil;->getLargeScreenNailSize()I

    move-result v0

    goto :goto_d

    .line 179
    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_b
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method public static isLargeScreenNailSupported(Lcom/lge/gallery/data/core/MediaItem;)Z
    .registers 2
    .param p0, "mediaItem"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 172
    if-nez p0, :cond_4

    .line 173
    const/4 v0, 0x0

    .line 175
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v0

    goto :goto_3
.end method


# virtual methods
.method protected clearVRCache()V
    .registers 1

    .prologue
    .line 57
    return-void
.end method

.method public getBrokenImage(Landroid/app/Activity;)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaItem;->getMediaType()I

    move-result v0

    .line 96
    .local v0, "mediaType":I
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 97
    .local v1, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 98
    const/4 v2, 0x2

    if-ne v0, v2, :cond_36

    .line 99
    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenImage:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1c

    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenImage:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2d

    .line 100
    :cond_1c
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/lge/gallery/common/R$drawable;->ic_gallery_broken_empty2_thumbnail:I

    invoke-static {v3, v4, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenImage:Ljava/lang/ref/WeakReference;

    .line 103
    :cond_2d
    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenImage:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    .line 111
    :goto_35
    return-object v2

    .line 104
    :cond_36
    const/4 v2, 0x4

    if-ne v0, v2, :cond_5f

    .line 105
    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenVideo:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_45

    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenVideo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_56

    .line 106
    :cond_45
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/lge/gallery/common/R$drawable;->ic_gallery_broken_vod_empty2_thumbnail:I

    invoke-static {v3, v4, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenVideo:Ljava/lang/ref/WeakReference;

    .line 109
    :cond_56
    sget-object v2, Lcom/lge/gallery/data/core/MediaItem;->sBrokenVideo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    goto :goto_35

    .line 111
    :cond_5f
    const/4 v2, 0x0

    goto :goto_35
.end method

.method public getCameraMode()I
    .registers 2

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method public getDateInMs()J
    .registers 3

    .prologue
    .line 60
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getDownloadedFilePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDownloadedSize()J
    .registers 3

    .prologue
    .line 156
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getFaces()[Lcom/lge/gallery/data/core/Face;
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getFilePath()Ljava/lang/String;
.end method

.method public getFullImageRotation()I
    .registers 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaItem;->getRotation()I

    move-result v0

    return v0
.end method

.method public abstract getHeight()I
.end method

.method public getLargeScreenNail()Lcom/lge/gallery/nail/ScreenNail;
    .registers 2

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaItem;->getScreenNail()Lcom/lge/gallery/nail/ScreenNail;

    move-result-object v0

    return-object v0
.end method

.method public getLatLong([D)V
    .registers 6
    .param p1, "latLong"    # [D

    .prologue
    const-wide/16 v2, 0x0

    .line 68
    const/4 v0, 0x0

    aput-wide v2, p1, v0

    .line 69
    const/4 v0, 0x1

    aput-wide v2, p1, v0

    .line 70
    return-void
.end method

.method public abstract getMimeType()Ljava/lang/String;
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method public getProtectionType()I
    .registers 2

    .prologue
    .line 168
    const/4 v0, 0x0

    return v0
.end method

.method public getRotation()I
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public getScreenNail()Lcom/lge/gallery/nail/ScreenNail;
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 91
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSubMediaItem(II)Ljava/util/ArrayList;
    .registers 5
    .param p1, "start"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 131
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    return-object v0
.end method

.method public getSubMediaItemCount()I
    .registers 2

    .prologue
    .line 126
    const/4 v0, 0x1

    return v0
.end method

.method public getTags()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getWidth()I
.end method

.method public is360()Z
    .registers 2

    .prologue
    .line 140
    const/4 v0, 0x0

    return v0
.end method

.method public isDownloaded()Z
    .registers 2

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method

.method public isNotStitched()Z
    .registers 2

    .prologue
    .line 160
    const/4 v0, 0x0

    return v0
.end method

.method public loadVRMetadata(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V
    .registers 4
    .param p1, "app"    # Lcom/lge/gallery/appinterface/GalleryApp;
    .param p2, "listener"    # Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaItem;->mMetadataLoader:Lcom/lge/gallery/data/core/VRMetadataLoader;

    invoke-virtual {v0, p1, p2}, Lcom/lge/gallery/data/core/VRMetadataLoader;->load(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;)V

    .line 54
    return-void
.end method

.method public abstract requestImage(I)Lcom/lge/gallery/util/ThreadPool$Job;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end method

.method public abstract requestLargeImage()Lcom/lge/gallery/util/ThreadPool$Job;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/lge/gallery/util/ThreadPool$Job",
            "<",
            "Lcom/lge/gallery/decoder/GalleryRegionDecoder;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setDownloadedSize(J)V
.end method

.method public setLargeScreenNail(Lcom/lge/gallery/nail/ScreenNail;)V
    .registers 2
    .param p1, "s"    # Lcom/lge/gallery/nail/ScreenNail;

    .prologue
    .line 115
    return-void
.end method

.method public updateDownloaded()Z
    .registers 2

    .prologue
    .line 148
    const/4 v0, 0x0

    return v0
.end method

.method public updateNotStitched()Z
    .registers 2

    .prologue
    .line 164
    const/4 v0, 0x0

    return v0
.end method
