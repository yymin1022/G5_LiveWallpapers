.class final Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;
.super Ljava/lang/Object;
.source "PanoramaViewHelper.java"

# interfaces
.implements Lcom/lge/gallery/data/core/VRMetadataLoader$VRMetadataListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->loadXmp(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/vr/viewer/renderer/Renderer;IZLcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Lcom/lge/gallery/appinterface/GalleryApp;

.field final synthetic val$force360:Z

.field final synthetic val$listener:Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

.field final synthetic val$maxSideLength:I

.field final synthetic val$renderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;


# direct methods
.method constructor <init>(Lcom/lge/gallery/vr/viewer/renderer/Renderer;Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;ZI)V
    .registers 6

    .prologue
    .line 68
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$renderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    iput-object p2, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$app:Lcom/lge/gallery/appinterface/GalleryApp;

    iput-object p3, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$listener:Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    iput-boolean p4, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$force360:Z

    iput p5, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$maxSideLength:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMetadataLoaded(Lcom/lge/gallery/data/core/MediaItem;ZLcom/lge/gallery/data/core/vr/PhotoSphereMetadata;)V
    .registers 10
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;
    .param p2, "is360"    # Z
    .param p3, "metadata"    # Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 71
    const-string v0, "PanoramaViewHelper"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VR Metadata loaded. : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    if-eqz p2, :cond_32

    .line 73
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$renderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    new-instance v1, Lcom/lge/gallery/vr/viewer/data/VrImage;

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$app:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v2}, Lcom/lge/gallery/appinterface/GalleryApp;->getThreadPool()Lcom/lge/gallery/util/ThreadPool;

    move-result-object v2

    invoke-direct {v1, v2, p1, p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;-><init>(Lcom/lge/gallery/util/ThreadPool;Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;)V

    invoke-interface {v0, v1}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->setVrImage(Lcom/lge/gallery/vr/viewer/data/VrImage;)V

    .line 74
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$listener:Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    invoke-interface {v0, v5, v5}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;->onLoadingFinished(ZZ)V

    .line 82
    :goto_31
    return-void

    .line 75
    :cond_32
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$force360:Z

    if-eqz v0, :cond_53

    .line 76
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$renderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaItem;->getFilePath()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$maxSideLength:I

    invoke-static {v2, v3}, Lcom/lge/gallery/vr/viewer/util/PanoramaViewerUtils;->createDecodingOptions(Ljava/lang/String;I)Landroid/graphics/BitmapFactory$Options;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 78
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$listener:Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    invoke-interface {v0, v4, v5}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;->onLoadingFinished(ZZ)V

    goto :goto_31

    .line 80
    :cond_53
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$1;->val$listener:Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;

    invoke-interface {v0, v4, v4}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;->onLoadingFinished(ZZ)V

    goto :goto_31
.end method
