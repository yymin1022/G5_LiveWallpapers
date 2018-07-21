.class Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "VrGestureHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CompositeGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)V
    .registers 2

    .prologue
    .line 26
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
    .param p2, "x1"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;-><init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)V

    return-void
.end method


# virtual methods
.method public handleHoldFinished()V
    .registers 4

    .prologue
    .line 102
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .line 103
    .local v1, "listener":Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onHoldFinished()V

    goto :goto_a

    .line 105
    .end local v1    # "listener":Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
    :cond_1a
    return-void
.end method

.method public handleHoldStarted()V
    .registers 4

    .prologue
    .line 96
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .line 97
    .local v1, "listener":Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;->onHoldStarted()V

    goto :goto_a

    .line 99
    .end local v1    # "listener":Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
    :cond_1a
    return-void
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 88
    const/4 v2, 0x0

    .line 89
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 90
    .local v1, "listener":Landroid/view/GestureDetector$SimpleOnGestureListener;
    invoke-virtual {v1, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 91
    goto :goto_b

    .line 92
    .end local v1    # "listener":Landroid/view/GestureDetector$SimpleOnGestureListener;
    :cond_1d
    return v2
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 29
    const/4 v2, 0x0

    .line 30
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 31
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 32
    goto :goto_b

    .line 33
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1d
    return v2
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 9
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 79
    const/4 v2, 0x0

    .line 80
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 81
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1, p2, p3, p4}, Landroid/view/GestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v3

    or-int/2addr v2, v3

    .line 82
    goto :goto_b

    .line 83
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1d
    return v2
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 72
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 73
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    goto :goto_a

    .line 75
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1a
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 9
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 63
    const/4 v2, 0x0

    .line 64
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 65
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1, p2, p3, p4}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v3

    or-int/2addr v2, v3

    .line 66
    goto :goto_b

    .line 67
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1d
    return v2
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .registers 5
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 38
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 39
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onShowPress(Landroid/view/MotionEvent;)V

    goto :goto_a

    .line 41
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1a
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 54
    const/4 v2, 0x0

    .line 55
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 56
    .local v1, "listener":Landroid/view/GestureDetector$SimpleOnGestureListener;
    invoke-virtual {v1, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 57
    goto :goto_b

    .line 58
    .end local v1    # "listener":Landroid/view/GestureDetector$SimpleOnGestureListener;
    :cond_1d
    return v2
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 45
    const/4 v2, 0x0

    .line 46
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$CompositeGestureListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$000(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    .line 47
    .local v1, "listener":Landroid/view/GestureDetector$OnGestureListener;
    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 48
    goto :goto_b

    .line 49
    .end local v1    # "listener":Landroid/view/GestureDetector$OnGestureListener;
    :cond_1d
    return v2
.end method
