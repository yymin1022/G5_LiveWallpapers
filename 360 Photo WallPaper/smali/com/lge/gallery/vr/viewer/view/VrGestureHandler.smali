.class public Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
.super Ljava/lang/Object;
.source "VrGestureHandler.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/view/GestureHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;,
        Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;,
        Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;
    }
.end annotation


# instance fields
.field private mGestureListener:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

.field private mGestureListenerArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;",
            ">;"
        }
    .end annotation
.end field

.field private mIsHoldModeStarted:Z

.field private mScacleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

.field private mScaleListenerArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/ScaleGestureDetector$OnScaleGestureListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListenerArray:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScaleListenerArray:Ljava/util/ArrayList;

    .line 136
    new-instance v0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    invoke-direct {v0, p0, v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;-><init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListener:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    .line 137
    new-instance v0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;

    invoke-direct {v0, p0, v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;-><init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScacleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListenerArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScaleListenerArray:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getGestureListener()Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListener:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    return-object v0
.end method

.method public getScaleListener()Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScacleListener:Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    return-object v0
.end method

.method public declared-synchronized handleHoldEvent(Z)V
    .registers 3
    .param p1, "isStarted"    # Z

    .prologue
    .line 141
    monitor-enter p0

    if-eqz p1, :cond_10

    .line 142
    :try_start_3
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mIsHoldModeStarted:Z

    if-eq v0, p1, :cond_c

    .line 143
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListener:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->handleHoldStarted()V

    .line 149
    :cond_c
    :goto_c
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mIsHoldModeStarted:Z
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_16

    .line 150
    monitor-exit p0

    return-void

    .line 147
    :cond_10
    :try_start_10
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListener:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->handleHoldFinished()V
    :try_end_15
    .catchall {:try_start_10 .. :try_end_15} :catchall_16

    goto :goto_c

    .line 141
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListenerArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    return-void
.end method

.method public registerScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScaleListenerArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    return-void
.end method

.method public unregisterGestureListener(Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mGestureListenerArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 178
    return-void
.end method

.method public unregisterScaleGestureListener(Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->mScaleListenerArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 168
    return-void
.end method
