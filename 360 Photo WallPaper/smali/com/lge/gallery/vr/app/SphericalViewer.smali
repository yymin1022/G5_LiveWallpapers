.class public Lcom/lge/gallery/vr/app/SphericalViewer;
.super Landroid/app/Activity;
.source "SphericalViewer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;
    }
.end annotation


# static fields
.field private static final HIDE_FLAGS:I = 0x1002

.field protected static final SPHERE_RADIUS:F = 1.0f

.field private static final TAG:Ljava/lang/String; = "SphericalViewer"


# instance fields
.field private mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

.field private mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

.field protected mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

.field private mShowBar:Z

.field protected mSurfaceView:Landroid/opengl/GLSurfaceView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 50
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/vr/app/SphericalViewer;)Z
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/app/SphericalViewer;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mShowBar:Z

    return v0
.end method

.method static synthetic access$002(Lcom/lge/gallery/vr/app/SphericalViewer;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/app/SphericalViewer;
    .param p1, "x1"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mShowBar:Z

    return p1
.end method

.method static synthetic access$100(Lcom/lge/gallery/vr/app/SphericalViewer;)Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/app/SphericalViewer;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    return-object v0
.end method

.method private loadImageDataFromCache(Landroid/content/Intent;)Z
    .registers 13
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x0

    .line 124
    if-nez p1, :cond_4

    .line 142
    :cond_3
    :goto_3
    return v7

    .line 127
    :cond_4
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    .line 128
    .local v6, "uri":Landroid/net/Uri;
    const-string v8, "media-item-path"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 129
    .local v4, "itemPath":Ljava/lang/String;
    const-string v8, "device-id"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "deviceId":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_3

    if-eqz v4, :cond_3

    if-eqz v2, :cond_3

    .line 131
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/appinterface/GalleryApp;

    .line 132
    .local v0, "app":Lcom/lge/gallery/appinterface/GalleryApp;
    invoke-interface {v0}, Lcom/lge/gallery/appinterface/GalleryApp;->getImageCacheService()Lcom/lge/gallery/data/cache/ImageCacheService;

    move-result-object v1

    .line 133
    .local v1, "cacheService":Lcom/lge/gallery/data/cache/ImageCacheService;
    invoke-interface {v1, v4, v2}, Lcom/lge/gallery/data/cache/ImageCacheService;->getOscImageData(Ljava/lang/String;Ljava/lang/String;)Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;

    move-result-object v3

    .line 134
    .local v3, "imageData":Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
    if-eqz v3, :cond_3

    .line 135
    new-instance v5, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 136
    .local v5, "options":Landroid/graphics/BitmapFactory$Options;
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v7, v5, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 137
    iget-object v7, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    iget-object v8, v3, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    iget v9, v3, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    iget v10, v3, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    invoke-static {v8, v9, v10, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 139
    const/4 v7, 0x1

    goto :goto_3
.end method


# virtual methods
.method protected initializeView()V
    .registers 6

    .prologue
    .line 146
    sget v3, Lcom/lge/gallery/vr/viewer/R$layout;->panorama_main:I

    invoke-virtual {p0, v3}, Lcom/lge/gallery/vr/app/SphericalViewer;->setContentView(I)V

    .line 147
    sget v3, Lcom/lge/gallery/vr/viewer/R$id;->glsurfaceview:I

    invoke-virtual {p0, v3}, Lcom/lge/gallery/vr/app/SphericalViewer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;

    .line 148
    .local v2, "view":Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;
    iput-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 149
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    new-instance v3, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v4}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;-><init>(F)V

    invoke-direct {v0, v3}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;-><init>(Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;)V

    .line 150
    .local v0, "info":Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;
    new-instance v3, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;-><init>(Lcom/lge/gallery/vr/app/SphericalViewer;Lcom/lge/gallery/vr/app/SphericalViewer$1;)V

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->createGestureController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 151
    invoke-virtual {v0, v2}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->createSensorController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V

    .line 152
    iput-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    .line 153
    new-instance v1, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-direct {v1, v2, v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;)V

    .line 154
    .local v1, "renderer":Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 155
    iput-object v1, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    .line 156
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v3, 0x400

    .line 81
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/lge/gallery/vr/app/SphericalViewer;->requestWindowFeature(I)Z

    .line 82
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 83
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 84
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->initializeView()V

    .line 85
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 86
    .local v1, "uri":Landroid/net/Uri;
    if-nez v1, :cond_28

    .line 87
    const-string v2, "SphericalViewer"

    const-string v3, "Uri is null"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->finish()V

    .line 121
    :cond_27
    :goto_27
    return-void

    .line 91
    :cond_28
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/lge/gallery/vr/app/SphericalViewer;->loadImageDataFromCache(Landroid/content/Intent;)Z

    move-result v2

    if-nez v2, :cond_27

    .line 94
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/appinterface/GalleryApp;

    iget-object v3, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    const/4 v4, 0x0

    new-instance v5, Lcom/lge/gallery/vr/app/SphericalViewer$1;

    invoke-direct {v5, p0}, Lcom/lge/gallery/vr/app/SphericalViewer$1;-><init>(Lcom/lge/gallery/vr/app/SphericalViewer;)V

    invoke-static {v2, v1, v3, v4, v5}, Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper;->setImagePreferTile(Lcom/lge/gallery/appinterface/GalleryApp;Landroid/net/Uri;Lcom/lge/gallery/vr/viewer/renderer/Renderer;ILcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;)Lcom/lge/gallery/data/core/MediaItem;

    move-result-object v0

    .line 105
    .local v0, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-nez v0, :cond_4a

    .line 106
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->finish()V

    goto :goto_27

    .line 109
    :cond_4a
    new-instance v2, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    invoke-direct {v2, p0, v0}, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;-><init>(Landroid/content/Context;Lcom/lge/gallery/data/core/MediaItem;)V

    iput-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    .line 110
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    new-instance v3, Lcom/lge/gallery/vr/app/SphericalViewer$2;

    invoke-direct {v3, p0}, Lcom/lge/gallery/vr/app/SphericalViewer$2;-><init>(Lcom/lge/gallery/vr/app/SphericalViewer;)V

    invoke-virtual {v2, v3}, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->registerObserver(Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;)V

    .line 120
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->startListening()V

    goto :goto_27
.end method

.method protected onDestroy()V
    .registers 2

    .prologue
    .line 182
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 183
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    if-eqz v0, :cond_c

    .line 184
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mContentObserver:Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver;->stopListening()V

    .line 186
    :cond_c
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->destroy()V

    .line 187
    return-void
.end method

.method protected onPause()V
    .registers 2

    .prologue
    .line 175
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 176
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->onPause()V

    .line 177
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->pause()V

    .line 178
    return-void
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 160
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 161
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mShowBar:Z

    .line 162
    invoke-virtual {p0}, Lcom/lge/gallery/vr/app/SphericalViewer;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 163
    .local v0, "decorView":Landroid/view/View;
    const/16 v1, 0x1706

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 169
    iget-object v1, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/Renderer;

    invoke-interface {v1}, Lcom/lge/gallery/vr/viewer/renderer/Renderer;->resume()V

    .line 170
    iget-object v1, p0, Lcom/lge/gallery/vr/app/SphericalViewer;->mSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v1}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 171
    return-void
.end method
