.class public Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;
.super Landroid/opengl/GLSurfaceView;
.source "GLSurfaceBaseView.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;


# static fields
.field private static final MSG_HOLD:I = 0x1


# instance fields
.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

.field private final mLongPressTimeout:I

.field private mScaleDetector:Landroid/view/ScaleGestureDetector;

.field private mTouchEventHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->setEGLContextClientVersion(I)V

    .line 36
    new-instance v0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-direct {v0}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    .line 37
    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->getGestureListener()Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 38
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 39
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->getGestureListener()Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 40
    new-instance v0, Landroid/view/ScaleGestureDetector;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    .line 41
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mLongPressTimeout:I

    .line 42
    new-instance v0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView$1;

    invoke-direct {v0, p0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView$1;-><init>(Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mTouchEventHandler:Landroid/os/Handler;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;)Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    return-object v0
.end method


# virtual methods
.method public getViewHeight()I
    .registers 2

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->getHeight()I

    move-result v0

    return v0
.end method

.method public getViewWidth()I
    .registers 2

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->getWidth()I

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x1

    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_28

    .line 70
    :goto_8
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 71
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 72
    return v4

    .line 61
    :pswitch_13
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mTouchEventHandler:Landroid/os/Handler;

    iget v1, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mLongPressTimeout:I

    int-to-long v2, v1

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_8

    .line 64
    :pswitch_1c
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mTouchEventHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 65
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->handleHoldEvent(Z)V

    goto :goto_8

    .line 59
    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_13
        :pswitch_1c
    .end packed-switch
.end method

.method public registerGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->registerGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 88
    return-void
.end method

.method public registerScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->registerScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 78
    return-void
.end method

.method public unregisterGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->unregisterGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 93
    return-void
.end method

.method public unregisterScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->mGestureHandler:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->unregisterScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 83
    return-void
.end method
