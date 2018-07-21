.class Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;
.super Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;
.source "SphericalViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/app/SphericalViewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UiGestureHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/app/SphericalViewer;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/vr/app/SphericalViewer;)V
    .registers 2

    .prologue
    .line 50
    iput-object p1, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/app/SphericalViewer;Lcom/lge/gallery/vr/app/SphericalViewer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/vr/app/SphericalViewer;
    .param p2, "x1"    # Lcom/lge/gallery/vr/app/SphericalViewer$1;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;-><init>(Lcom/lge/gallery/vr/app/SphericalViewer;)V

    return-void
.end method


# virtual methods
.method public onHoldFinished()V
    .registers 3

    .prologue
    .line 74
    const-string v0, "SphericalViewer"

    const-string v1, "Hold finished."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-static {v0}, Lcom/lge/gallery/vr/app/SphericalViewer;->access$100(Lcom/lge/gallery/vr/app/SphericalViewer;)Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGyroController()Lcom/lge/gallery/vr/viewer/controller/SensorController;

    move-result-object v0

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/controller/SensorController;->startListening()V

    .line 76
    return-void
.end method

.method public onHoldStarted()V
    .registers 3

    .prologue
    .line 68
    const-string v0, "SphericalViewer"

    const-string v1, "Hold started."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-static {v0}, Lcom/lge/gallery/vr/app/SphericalViewer;->access$100(Lcom/lge/gallery/vr/app/SphericalViewer;)Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->getGyroController()Lcom/lge/gallery/vr/viewer/controller/SensorController;

    move-result-object v0

    invoke-interface {v0}, Lcom/lge/gallery/vr/viewer/controller/SensorController;->stopListening()V

    .line 70
    return-void
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v4, 0x1

    .line 53
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/app/SphericalViewer;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 54
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    .line 55
    .local v0, "currentVisibility":I
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-static {v2}, Lcom/lge/gallery/vr/app/SphericalViewer;->access$000(Lcom/lge/gallery/vr/app/SphericalViewer;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 56
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/lge/gallery/vr/app/SphericalViewer;->access$002(Lcom/lge/gallery/vr/app/SphericalViewer;Z)Z

    .line 57
    or-int/lit16 v0, v0, 0x1002

    .line 62
    :goto_1f
    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 63
    return v4

    .line 59
    :cond_23
    iget-object v2, p0, Lcom/lge/gallery/vr/app/SphericalViewer$UiGestureHandler;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-static {v2, v4}, Lcom/lge/gallery/vr/app/SphericalViewer;->access$002(Lcom/lge/gallery/vr/app/SphericalViewer;Z)Z

    .line 60
    and-int/lit16 v0, v0, -0x1003

    goto :goto_1f
.end method
