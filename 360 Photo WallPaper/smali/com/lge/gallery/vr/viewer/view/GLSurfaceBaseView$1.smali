.class Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView$1;
.super Landroid/os/Handler;
.source "GLSurfaceBaseView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;


# direct methods
.method constructor <init>(Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;)V
    .registers 2

    .prologue
    .line 42
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView$1;->this$0:Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 45
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_14

    .line 52
    :goto_5
    invoke-super {p0, p1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    .line 53
    return-void

    .line 47
    :pswitch_9
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView$1;->this$0:Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;

    invoke-static {v0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->access$000(Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;)Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/view/VrGestureHandler;->handleHoldEvent(Z)V

    goto :goto_5

    .line 45
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
