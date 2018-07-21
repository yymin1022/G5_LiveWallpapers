.class Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;
.super Ljava/lang/Object;
.source "PanoramaRenderer.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TileProviderListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)V
    .registers 2

    .prologue
    .line 79
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
    .param p2, "x1"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$1;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;-><init>(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)V

    return-void
.end method


# virtual methods
.method public onLoaded(Lcom/lge/gallery/vr/viewer/data/TileProvider;)V
    .registers 8
    .param p1, "tileProvider"    # Lcom/lge/gallery/vr/viewer/data/TileProvider;

    .prologue
    .line 88
    const-string v2, "PanoramaRenderer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TileProvider loaded. : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->access$200(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    iget-object v3, v3, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-static {v4}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->access$100(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)Lcom/lge/gallery/vr/viewer/data/VrImage;

    move-result-object v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3, p1, v4, v5}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->prepareTiles(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/data/TileProvider;Lcom/lge/gallery/vr/viewer/data/VrImage;F)V

    .line 90
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_36
    invoke-interface {p1}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getWidthTileCount()I

    move-result v2

    if-ge v0, v2, :cond_56

    .line 91
    const/4 v1, 0x0

    .local v1, "jk":I
    :goto_3d
    invoke-interface {p1}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getHeightTileCount()I

    move-result v2

    if-ge v1, v2, :cond_53

    .line 92
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->access$200(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    move-result-object v2

    invoke-interface {p1, v0, v1}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getTile(II)Lcom/lge/gallery/vr/viewer/data/Tile;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->loadTexture(Lcom/lge/gallery/vr/viewer/data/Tile;)V

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_3d

    .line 90
    :cond_53
    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    .line 95
    .end local v1    # "jk":I
    :cond_56
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->access$302(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Z)Z

    .line 96
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->access$402(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Z)Z

    .line 97
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;->this$0:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    iget-object v2, v2, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v2}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 98
    return-void
.end method

.method public onStarted()V
    .registers 3

    .prologue
    .line 83
    const-string v0, "PanoramaRenderer"

    const-string v1, "Start creating TileProvider"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    return-void
.end method
