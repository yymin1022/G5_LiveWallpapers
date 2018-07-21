.class Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;
.super Ljava/lang/Object;
.source "VrGestureHandler.java"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyScaleListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)V
    .registers 2

    .prologue
    .line 108
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;
    .param p2, "x1"    # Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$1;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;-><init>(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 6
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 111
    const/4 v2, 0x0

    .line 112
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$100(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

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

    check-cast v1, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 113
    .local v1, "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    invoke-interface {v1, p1}, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;->onScale(Landroid/view/ScaleGestureDetector;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 114
    goto :goto_b

    .line 115
    .end local v1    # "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    :cond_1d
    return v2
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 6
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 120
    const/4 v2, 0x0

    .line 121
    .local v2, "result":Z
    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v3}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$100(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

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

    check-cast v1, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 122
    .local v1, "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    invoke-interface {v1, p1}, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;->onScaleBegin(Landroid/view/ScaleGestureDetector;)Z

    move-result v3

    or-int/2addr v2, v3

    .line 123
    goto :goto_b

    .line 124
    .end local v1    # "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    :cond_1d
    return v2
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 129
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler$MyScaleListener;->this$0:Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    invoke-static {v2}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->access$100(Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;)Ljava/util/ArrayList;

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

    check-cast v1, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    .line 130
    .local v1, "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    invoke-interface {v1, p1}, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;->onScaleEnd(Landroid/view/ScaleGestureDetector;)V

    goto :goto_a

    .line 132
    .end local v1    # "listener":Landroid/view/ScaleGestureDetector$OnScaleGestureListener;
    :cond_1a
    return-void
.end method
