.class public Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;
.super Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
.source "GesturePositionController.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
.implements Lcom/lge/gallery/vr/viewer/controller/SensorController;


# instance fields
.field private mCurrentSpan:F

.field private final mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

.field private mIsEnabled:Z

.field private mIsScalePrevented:Z

.field private final mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

.field private final mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;)V
    .registers 4
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "provider"    # Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 5
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "provider"    # Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;
    .param p3, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;-><init>()V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z

    .line 34
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .line 35
    iput-object p2, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .line 36
    iput-object p3, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .line 37
    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .registers 2

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z

    return v0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 132
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsScalePrevented:Z

    if-nez v0, :cond_1b

    .line 133
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeDistanceLazy(J)V

    .line 134
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_16

    .line 135
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    .line 137
    :cond_16
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 139
    :cond_1b
    const/4 v0, 0x1

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->stopLazyComputation()V

    .line 67
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_e

    .line 68
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    .line 70
    :cond_e
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 71
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 122
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v0, p3, p4}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeRotateLazy(FF)V

    .line 123
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_e

    .line 124
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 126
    :cond_e
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 127
    const/4 v0, 0x1

    return v0
.end method

.method public onHoldFinished()V
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_9

    .line 185
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onHoldFinished()V

    .line 187
    :cond_9
    return-void
.end method

.method public onHoldStarted()V
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_9

    .line 178
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onHoldStarted()V

    .line 180
    :cond_9
    return-void
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_9

    .line 115
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    .line 117
    :cond_9
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 118
    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 45
    iget-boolean v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsScalePrevented:Z

    if-nez v1, :cond_17

    .line 46
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v0

    .line 47
    .local v0, "span":F
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCurrentSpan:F

    sub-float/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeDistance(F)V

    .line 48
    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCurrentSpan:F

    .line 49
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 51
    .end local v0    # "span":F
    :cond_17
    const/4 v1, 0x1

    return v1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 3
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 56
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCurrentSpan:F

    .line 57
    const/4 v0, 0x1

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 2
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 62
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 104
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->getViewWidth()I

    move-result v1

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v2}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->getViewHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, p3, p4, v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeRotate(FFF)V

    .line 105
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_1f

    .line 106
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    .line 108
    :cond_1f
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 109
    const/4 v0, 0x1

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v0, :cond_9

    .line 77
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    .line 79
    :cond_9
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 80
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 95
    .local v0, "result":Z
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v1, :cond_c

    .line 96
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v1, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 98
    :cond_c
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 99
    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 84
    const/4 v0, 0x0

    .line 85
    .local v0, "result":Z
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    if-eqz v1, :cond_c

    .line 86
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mCustomListener:Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    invoke-virtual {v1, p1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    .line 88
    :cond_c
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 89
    return v0
.end method

.method public declared-synchronized setEnable(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 167
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z

    if-eq p1, v0, :cond_c

    .line 168
    if-nez p1, :cond_a

    .line 169
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->stopListening()V

    .line 171
    :cond_a
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 173
    :cond_c
    monitor-exit p0

    return-void

    .line 167
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setScalePrevented(Z)V
    .registers 2
    .param p1, "prevent"    # Z

    .prologue
    .line 40
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsScalePrevented:Z

    .line 41
    return-void
.end method

.method public declared-synchronized startListening()V
    .registers 2

    .prologue
    .line 144
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_12

    if-nez v0, :cond_7

    .line 149
    :goto_5
    monitor-exit p0

    return-void

    .line 147
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0, p0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->registerGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 148
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0, p0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->registerScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_12

    goto :goto_5

    .line 144
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopListening()V
    .registers 2

    .prologue
    .line 153
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mIsEnabled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_12

    if-nez v0, :cond_7

    .line 158
    :goto_5
    monitor-exit p0

    return-void

    .line 156
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0, p0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->unregisterGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    .line 157
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v0, p0}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->unregisterScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    :try_end_11
    .catchall {:try_start_7 .. :try_end_11} :catchall_12

    goto :goto_5

    .line 153
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method
