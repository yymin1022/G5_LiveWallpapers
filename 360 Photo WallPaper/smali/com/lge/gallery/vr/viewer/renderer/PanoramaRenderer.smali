.class public Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
.super Ljava/lang/Object;
.source "PanoramaRenderer.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;
.implements Lcom/lge/gallery/vr/viewer/renderer/Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$1;,
        Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;
    }
.end annotation


# static fields
.field private static final CAMERA_Z:F = -0.01f

.field private static final DEBUG:Z = false

.field private static final LOG_FPS:Z = false

.field private static final MAX_DRAWING_TIME:I = 0x10

.field private static final MAX_FPS:I = 0x3e

.field private static final SPHERE_RADIUS:F = 1.0f

.field private static final TAG:Ljava/lang/String; = "PanoramaRenderer"

.field protected static final Z_FAR:F = 100.0f

.field protected static final Z_NEAR:F = 0.1f


# instance fields
.field private mAreLllTilesLoaded:Z

.field protected mCamera:[F

.field private mCurrentBitmap:Landroid/graphics/Bitmap;

.field private mFrameCount:I

.field private mFrameCountingStart:J

.field public mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

.field private mHeight:I

.field protected volatile mIsPaused:Z

.field private mIsUploaded:Z

.field private mLastDrawFinishTime:J

.field private mMVPMatrix:[F

.field private mModelMatrix:[F

.field private mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

.field protected mProjectionMatrix:[F

.field private mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

.field private final mSensorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lge/gallery/vr/viewer/controller/SensorController;",
            ">;"
        }
    .end annotation
.end field

.field private mSphere:Lcom/lge/gallery/vr/viewer/geometry/Sphere;

.field private final mTargetFrameTime:I

.field private mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

.field private mTextureIds:[I

.field private mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

.field private mTileProviderListener:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;

.field private final mUseFpsLimiter:Z

.field protected mView:[F

.field private mVrImage:Lcom/lge/gallery/vr/viewer/data/VrImage;

.field private mWidth:I


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;)V
    .registers 4
    .param p1, "base"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "renderInfo"    # Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;

    .prologue
    .line 102
    const/16 v0, 0x3e

    invoke-direct {p0, p1, p2, v0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;I)V

    .line 103
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;I)V
    .registers 8
    .param p1, "base"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "renderInfo"    # Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;
    .param p3, "maxFps"    # I

    .prologue
    const/4 v0, 0x1

    const/16 v1, 0x10

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-array v2, v0, [I

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    .line 75
    new-instance v2, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;-><init>(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$1;)V

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProviderListener:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;

    .line 76
    new-instance v2, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    invoke-direct {v2}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    .line 106
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .line 107
    new-array v2, v1, [F

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCamera:[F

    .line 108
    new-array v2, v1, [F

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mView:[F

    .line 109
    new-array v2, v1, [F

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    .line 110
    new-array v2, v1, [F

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mProjectionMatrix:[F

    .line 111
    new-array v2, v1, [F

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    .line 112
    new-instance v2, Lcom/lge/gallery/vr/viewer/shader/TileProgram;

    invoke-direct {v2}, Lcom/lge/gallery/vr/viewer/shader/TileProgram;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    .line 113
    new-instance v2, Lcom/lge/gallery/vr/viewer/shader/DefaultProgram;

    invoke-direct {v2}, Lcom/lge/gallery/vr/viewer/shader/DefaultProgram;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    .line 114
    invoke-interface {p2}, Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;->getPositionProvider()Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    move-result-object v2

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .line 115
    invoke-interface {p2}, Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;->getSensorControllers()Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSensorList:Ljava/util/List;

    .line 116
    const/16 v2, 0x3e

    if-ge p3, v2, :cond_5e

    :goto_4d
    iput-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mUseFpsLimiter:Z

    .line 117
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mUseFpsLimiter:Z

    if-eqz v0, :cond_60

    const-wide v0, 0x408f400000000000L    # 1000.0

    int-to-double v2, p3

    div-double/2addr v0, v2

    double-to-int v0, v0

    :goto_5b
    iput v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTargetFrameTime:I

    .line 118
    return-void

    .line 116
    :cond_5e
    const/4 v0, 0x0

    goto :goto_4d

    :cond_60
    move v0, v1

    .line 117
    goto :goto_5b
.end method

.method static synthetic access$100(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)Lcom/lge/gallery/vr/viewer/data/VrImage;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mVrImage:Lcom/lge/gallery/vr/viewer/data/VrImage;

    return-object v0
.end method

.method static synthetic access$200(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;)Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    return-object v0
.end method

.method static synthetic access$302(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mAreLllTilesLoaded:Z

    return p1
.end method

.method static synthetic access$402(Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    return p1
.end method

.method private delayRender()V
    .registers 11

    .prologue
    const-wide/16 v8, 0x0

    .line 140
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 141
    .local v0, "end":J
    iget-wide v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mLastDrawFinishTime:J

    cmp-long v4, v4, v8

    if-eqz v4, :cond_1b

    .line 142
    iget-wide v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mLastDrawFinishTime:J

    iget v6, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTargetFrameTime:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    sub-long v2, v4, v0

    .line 143
    .local v2, "wait":J
    cmp-long v4, v2, v8

    if-lez v4, :cond_1b

    .line 144
    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    .line 147
    .end local v2    # "wait":J
    :cond_1b
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mLastDrawFinishTime:J

    .line 148
    return-void
.end method

.method private drawSphere()V
    .registers 10

    .prologue
    const/4 v0, 0x1

    const/4 v2, -0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    .line 282
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-nez v1, :cond_a

    .line 305
    :goto_9
    return-void

    .line 285
    :cond_a
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->useProgram()V

    .line 286
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->getVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    move-result-object v8

    .line 287
    .local v8, "vs":Lcom/lge/gallery/vr/viewer/shader/VertexShader;
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->getFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    move-result-object v6

    .line 288
    .local v6, "fs":Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aget v1, v1, v3

    if-lez v1, :cond_5f

    move v7, v0

    .line 289
    .local v7, "hasTexture":Z
    :goto_22
    if-eqz v7, :cond_61

    .line 290
    const v1, 0x84c0

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 291
    const/16 v1, 0xde1

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aget v4, v4, v3

    invoke-static {v1, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 292
    invoke-virtual {v6}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getTextureSamplerHandle()I

    move-result v1

    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 293
    invoke-virtual {v6}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getTextureFlagUniformHandle()I

    move-result v1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 300
    :goto_41
    invoke-virtual {v8}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getUniformMVP()I

    move-result v1

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    invoke-static {v1, v0, v3, v4, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 301
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSphere:Lcom/lge/gallery/vr/viewer/geometry/Sphere;

    invoke-virtual {v8}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getAttrPosition()I

    move-result v1

    if-eqz v7, :cond_69

    invoke-virtual {v8}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getAttrTextCoord()I

    move-result v4

    :goto_56
    iget-object v5, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aget v5, v5, v3

    move v3, v2

    invoke-virtual/range {v0 .. v5}, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->draw(IIIII)V

    goto :goto_9

    .end local v7    # "hasTexture":Z
    :cond_5f
    move v7, v3

    .line 288
    goto :goto_22

    .line 295
    .restart local v7    # "hasTexture":Z
    :cond_61
    invoke-virtual {v6}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getColorUniformHandle()I

    move-result v1

    invoke-static {v1, v4, v4, v4, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    goto :goto_41

    :cond_69
    move v4, v2

    .line 301
    goto :goto_56
.end method

.method private drawTiles()V
    .registers 12

    .prologue
    const/4 v4, 0x0

    .line 263
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mVrImage:Lcom/lge/gallery/vr/viewer/data/VrImage;

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mAreLllTilesLoaded:Z

    if-nez v1, :cond_a

    .line 279
    :cond_9
    return-void

    .line 266
    :cond_a
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->useProgram()V

    .line 267
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->getVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;

    move-result-object v10

    .line 268
    .local v10, "vs":Lcom/lge/gallery/vr/viewer/shader/VertexShader;
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/shader/Program;->getFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;

    move-result-object v7

    .line 269
    .local v7, "fs":Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
    invoke-virtual {v10}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getUniformMVP()I

    move-result v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    invoke-static {v1, v2, v4, v3, v4}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 270
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->countTextures()I

    move-result v9

    .line 271
    .local v9, "totalCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2c
    if-ge v8, v9, :cond_9

    .line 272
    iget-boolean v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    if-nez v1, :cond_9

    .line 275
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    invoke-virtual {v1, v8}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->getTexture(I)Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    move-result-object v0

    .line 276
    .local v0, "texture":Lcom/lge/gallery/vr/viewer/ui/TiledTexture;
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-virtual {v10}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getAttrPosition()I

    move-result v2

    invoke-virtual {v10}, Lcom/lge/gallery/vr/viewer/shader/VertexShader;->getAttrTextCoord()I

    move-result v3

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->getTextureId()I

    move-result v4

    invoke-virtual {v7}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getTextureSamplerHandle()I

    move-result v5

    invoke-virtual {v7}, Lcom/lge/gallery/vr/viewer/shader/FragmentShader;->getTextureFlagUniformHandle()I

    move-result v6

    invoke-virtual/range {v0 .. v6}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->draw(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;IIIII)V

    .line 271
    add-int/lit8 v8, v8, 0x1

    goto :goto_2c
.end method

.method private outputFps()V
    .registers 9

    .prologue
    .line 308
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 309
    .local v2, "now":J
    iget-wide v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCountingStart:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_15

    .line 310
    iput-wide v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCountingStart:J

    .line 318
    :cond_e
    :goto_e
    iget v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCount:I

    .line 319
    return-void

    .line 311
    :cond_15
    iget-wide v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCountingStart:J

    sub-long v4, v2, v4

    const-wide/32 v6, 0x3b9aca00

    cmp-long v4, v4, v6

    if-lez v4, :cond_e

    .line 312
    iget v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCount:I

    int-to-double v4, v4

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    mul-double/2addr v4, v6

    iget-wide v6, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCountingStart:J

    sub-long v6, v2, v6

    long-to-double v6, v6

    div-double v0, v4, v6

    .line 314
    .local v0, "fps":D
    const-string v4, "PanoramaRenderer"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "fps: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iput-wide v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCountingStart:J

    .line 316
    const/4 v4, 0x0

    iput v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mFrameCount:I

    goto :goto_e
.end method


# virtual methods
.method public destroy()V
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_c

    .line 208
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 209
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 211
    :cond_c
    return-void
.end method

.method protected drawInternal()V
    .registers 13

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 151
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->getmCamera()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    move-result-object v11

    .line 152
    .local v11, "camera":Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 153
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    invoke-virtual {v11}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getZ()F

    move-result v2

    invoke-static {v0, v1, v4, v4, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 154
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    invoke-virtual {v11}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getPitch()F

    move-result v2

    move v5, v4

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 155
    iget-object v5, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    invoke-virtual {v11}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getYaw()F

    move-result v7

    move v6, v1

    move v8, v4

    move v9, v3

    move v10, v4

    invoke-static/range {v5 .. v10}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 156
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mView:[F

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mModelMatrix:[F

    move v3, v1

    move v5, v1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 157
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mProjectionMatrix:[F

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mMVPMatrix:[F

    move v3, v1

    move v5, v1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 158
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->drawSphere()V

    .line 159
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->drawTiles()V

    .line 160
    return-void
.end method

.method protected freeResources()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 214
    iput-boolean v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    .line 215
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aget v0, v0, v2

    if-lez v0, :cond_13

    .line 216
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 217
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aput v2, v0, v2

    .line 219
    :cond_13
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .registers 10
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    const/4 v1, 0x0

    .line 125
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->prepareDraw()Z

    move-result v7

    .line 126
    .local v7, "refresh":Z
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->getmCamera()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    move-result-object v6

    .line 127
    .local v6, "camera":Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mView:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 128
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mView:[F

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mView:[F

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCamera:[F

    move v3, v1

    move v5, v1

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 129
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mProjectionMatrix:[F

    invoke-virtual {v6}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getFov()F

    move-result v2

    iget v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mWidth:I

    int-to-float v3, v3

    iget v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mHeight:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    const v4, 0x3dcccccd    # 0.1f

    const/high16 v5, 0x42c80000    # 100.0f

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->perspectiveM([FIFFFF)V

    .line 130
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->drawInternal()V

    .line 131
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    if-nez v0, :cond_3e

    if-eqz v7, :cond_3e

    .line 132
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 134
    :cond_3e
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mUseFpsLimiter:Z

    if-eqz v0, :cond_45

    .line 135
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->delayRender()V

    .line 137
    :cond_45
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .registers 8
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v3, 0x0

    .line 223
    const-string v0, "PanoramaRenderer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSurfaceChanged : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    iput p2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mWidth:I

    .line 225
    iput p3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mHeight:I

    .line 226
    invoke-static {v3, v3, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 230
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .registers 11
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    const/16 v1, 0x48

    const/4 v5, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    .line 234
    const-string v0, "PanoramaRenderer"

    const-string v2, "onSurfaceCreated"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    invoke-static {v4, v4, v4, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 236
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/shader/Program;->createProgram()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 237
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mRenderProgram:Lcom/lge/gallery/vr/viewer/shader/Program;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/shader/Program;->createProgram()I

    move-result v0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 241
    new-instance v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;

    const/4 v7, 0x1

    move v2, v1

    move v4, v3

    move v6, v5

    invoke-direct/range {v0 .. v7}, Lcom/lge/gallery/vr/viewer/geometry/Sphere;-><init>(IIFFZZZ)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSphere:Lcom/lge/gallery/vr/viewer/geometry/Sphere;

    .line 242
    return-void
.end method

.method public pause()V
    .registers 5

    .prologue
    .line 194
    const-string v2, "PanoramaRenderer"

    const-string v3, "Renderer paused."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    .line 196
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->freeResources()V

    .line 197
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSensorList:Ljava/util/List;

    monitor-enter v3

    .line 198
    :try_start_10
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSensorList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/vr/viewer/controller/SensorController;

    .line 199
    .local v0, "controller":Lcom/lge/gallery/vr/viewer/controller/SensorController;
    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/controller/SensorController;->stopListening()V

    goto :goto_16

    .line 201
    .end local v0    # "controller":Lcom/lge/gallery/vr/viewer/controller/SensorController;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_26
    move-exception v2

    monitor-exit v3
    :try_end_28
    .catchall {:try_start_10 .. :try_end_28} :catchall_26

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_29
    :try_start_29
    monitor-exit v3
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_26

    .line 202
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->unloadAll()V

    .line 203
    return-void
.end method

.method protected prepareDraw()Z
    .registers 12

    .prologue
    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 163
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    if-nez v0, :cond_37

    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_37

    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    if-nez v0, :cond_37

    .line 164
    iput-boolean v5, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    .line 165
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->createTexture(Landroid/graphics/Bitmap;)I

    move-result v3

    aput v3, v0, v1

    .line 166
    const-string v0, "PanoramaRenderer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "New texture uploaded. : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureIds:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_37
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    if-nez v0, :cond_53

    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mAreLllTilesLoaded:Z

    if-eqz v0, :cond_53

    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    if-nez v0, :cond_53

    .line 169
    const-string v0, "PanoramaRenderer"

    const-string v3, "Reload images"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    iput-boolean v5, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsUploaded:Z

    .line 171
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTextureHolder:Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->uploadAll(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V

    .line 173
    :cond_53
    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 177
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCamera:[F

    const v4, 0x3c23d70a    # 0.01f

    const/high16 v9, 0x3f800000    # 1.0f

    move v3, v2

    move v5, v2

    move v6, v2

    move v7, v2

    move v8, v2

    move v10, v2

    invoke-static/range {v0 .. v10}, Landroid/opengl/Matrix;->setLookAtM([FIFFFFFFFFF)V

    .line 178
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->updatePosition(J)Z

    move-result v0

    return v0
.end method

.method public resume()V
    .registers 5

    .prologue
    .line 183
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSensorList:Ljava/util/List;

    monitor-enter v3

    .line 184
    :try_start_3
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mSensorList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/vr/viewer/controller/SensorController;

    .line 185
    .local v0, "controller":Lcom/lge/gallery/vr/viewer/controller/SensorController;
    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/controller/SensorController;->startListening()V

    goto :goto_9

    .line 187
    .end local v0    # "controller":Lcom/lge/gallery/vr/viewer/controller/SensorController;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_19
    move-exception v2

    monitor-exit v3
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1c
    :try_start_1c
    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_19

    .line 188
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mIsPaused:Z

    .line 189
    const-string v2, "PanoramaRenderer"

    const-string v3, "Renderer resumed."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mVrImage:Lcom/lge/gallery/vr/viewer/data/VrImage;

    .line 247
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 248
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->getmCamera()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    move-result-object v0

    const/high16 v1, 0x43870000    # 270.0f

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setYaw(F)V

    .line 249
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mGLSurfaceView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 250
    return-void
.end method

.method public setVrImage(Lcom/lge/gallery/vr/viewer/data/VrImage;)V
    .registers 3
    .param p1, "image"    # Lcom/lge/gallery/vr/viewer/data/VrImage;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mVrImage:Lcom/lge/gallery/vr/viewer/data/VrImage;

    .line 255
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mAreLllTilesLoaded:Z

    .line 256
    if-eqz p1, :cond_f

    .line 257
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mCurrentBitmap:Landroid/graphics/Bitmap;

    .line 258
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer;->mTileProviderListener:Lcom/lge/gallery/vr/viewer/renderer/PanoramaRenderer$TileProviderListener;

    invoke-virtual {p1, v0}, Lcom/lge/gallery/vr/viewer/data/VrImage;->loadTileProvider(Lcom/lge/gallery/vr/viewer/data/VrImage$OnTileProviderLoadingListener;)V

    .line 260
    :cond_f
    return-void
.end method
