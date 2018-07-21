.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;
.super Landroid/service/wallpaper/WallpaperService$Engine;
.source "VrWallpaperService.java"

# interfaces
.implements Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GLES20Engine"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;,
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;
    }
.end annotation


# instance fields
.field private mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

.field private mContext:Landroid/content/Context;

.field private mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

.field private mIsFromGallery:Z

.field private mIsrendererSet:Z

.field private mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

.field private mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

.field private mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

.field final synthetic this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    .line 147
    invoke-direct {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;-><init>(Landroid/service/wallpaper/WallpaperService;)V

    .line 148
    iput-object p2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mContext:Landroid/content/Context;

    .line 149
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setTouchEventsEnabled(Z)V

    .line 150
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)V
    .registers 1
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setImage()V

    return-void
.end method

.method private setImage()V
    .registers 5

    .prologue
    .line 212
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-interface {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->isValid()Z

    move-result v1

    if-nez v1, :cond_2a

    .line 213
    :cond_c
    const-string v1, "VrWallpaperService"

    const-string v2, "Cover is not there."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getDefaultCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v1

    iput-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 215
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v1

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-virtual {v1, v2}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->storeCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 217
    :cond_2a
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-interface {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getPreviewBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 218
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_37

    .line 219
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v1, v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 221
    :cond_37
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-interface {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->isObservable()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 222
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    if-eqz v1, :cond_48

    .line 223
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->unregister()V

    .line 225
    :cond_48
    new-instance v1, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    new-instance v2, Landroid/os/Handler;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-direct {v1, p0, v2, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;Landroid/os/Handler;Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    iput-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    .line 226
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->register()V

    .line 228
    :cond_61
    return-void
.end method


# virtual methods
.method public onCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 2
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 208
    invoke-direct {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setImage()V

    .line 209
    return-void
.end method

.method public onCreate(Landroid/view/SurfaceHolder;)V
    .registers 7
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 164
    const-string v0, "VrWallpaperService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCreate : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->isPreview()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->isPreview()Z

    move-result v0

    if-nez v0, :cond_29

    .line 166
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$302(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .line 173
    :cond_29
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->isPreview()Z

    move-result v0

    if-eqz v0, :cond_b8

    .line 174
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->isTemporaryQuried()Z

    move-result v0

    if-nez v0, :cond_b6

    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->isLastRequestedExist()Z

    move-result v0

    if-eqz v0, :cond_b6

    move v0, v1

    :goto_48
    iput-boolean v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mIsFromGallery:Z

    .line 175
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getPreviewCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 185
    :goto_56
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onCreate(Landroid/view/SurfaceHolder;)V

    .line 186
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    .line 187
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    new-instance v3, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v4}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;-><init>(F)V

    invoke-direct {v0, v3}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;-><init>(Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    .line 188
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->createGestureController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V

    .line 189
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGestureController()Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->setEnable(Z)V

    .line 190
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGestureController()Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->setScalePrevented(Z)V

    .line 191
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0, v3, v1}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->createSensorController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;I)V

    .line 193
    new-instance v0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    invoke-direct {v0, v3, v4}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    .line 194
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    .line 198
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0, v2}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->setRenderMode(I)V

    .line 200
    invoke-direct {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setImage()V

    .line 201
    iput-boolean v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mIsrendererSet:Z

    .line 202
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->registerListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V

    .line 203
    return-void

    :cond_b6
    move v0, v2

    .line 174
    goto :goto_48

    .line 177
    :cond_b8
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->isStoredCoverExist()Z

    move-result v0

    if-nez v0, :cond_de

    .line 178
    sget-object v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->sCachedCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 179
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->storeCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 183
    :goto_d3
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->setLoaded()V

    goto/16 :goto_56

    .line 181
    :cond_de
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getStoredCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    goto :goto_d3
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    .line 254
    const-string v0, "VrWallpaperService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->isPreview()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    iget-boolean v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mIsFromGallery:Z

    if-eqz v0, :cond_30

    .line 256
    const-string v0, "VrWallpaperService"

    const-string v1, "Clear temporary cover."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->clearLastRequestedCover()V

    .line 259
    :cond_30
    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService$Engine;->onDestroy()V

    .line 260
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->unregisterListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V

    .line 261
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    if-eqz v0, :cond_48

    .line 262
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->unregister()V

    .line 263
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mObserver:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;

    .line 265
    :cond_48
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->onWallpaperDestroy()V

    .line 266
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->destroy()V

    .line 267
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 232
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 233
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .registers 5
    .param p1, "visible"    # Z

    .prologue
    .line 237
    const-string v0, "VrWallpaperService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "visibility changed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onVisibilityChanged(Z)V

    .line 239
    iget-boolean v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mIsrendererSet:Z

    if-eqz v0, :cond_51

    .line 240
    if-eqz p1, :cond_52

    .line 241
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGyroController()Lcom/lge/gallery/vr/viewer/controller/SensorController;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$400(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->isGyroOptionOn()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/SensorController;->setEnable(Z)V

    .line 242
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderInfo:Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGestureController()Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$400(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->isTouchOptionOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->setEnable(Z)V

    .line 243
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->resume()V

    .line 244
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->onResume()V

    .line 250
    :cond_51
    :goto_51
    return-void

    .line 246
    :cond_52
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mBaseView:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->onPause()V

    .line 247
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->pause()V

    goto :goto_51
.end method

.method public setCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 5
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 153
    const-string v0, "VrWallpaperService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "New image set : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mRenderer:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->destroy()V

    .line 155
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 156
    invoke-direct {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setImage()V

    .line 157
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->isPreview()Z

    move-result v0

    if-nez v0, :cond_35

    .line 158
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->storeCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 160
    :cond_35
    return-void
.end method
