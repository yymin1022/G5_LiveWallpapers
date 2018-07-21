.class Lcom/lge/gallery/vr/app/SphericalViewer$1;
.super Ljava/lang/Object;
.source "SphericalViewer.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/data/PanoramaViewHelper$MetadataLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/vr/app/SphericalViewer;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/vr/app/SphericalViewer;


# direct methods
.method constructor <init>(Lcom/lge/gallery/vr/app/SphericalViewer;)V
    .registers 2

    .prologue
    .line 95
    iput-object p1, p0, Lcom/lge/gallery/vr/app/SphericalViewer$1;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadingFinished(ZZ)V
    .registers 6
    .param p1, "hasXmp"    # Z
    .param p2, "isStarted"    # Z

    .prologue
    .line 98
    const-string v0, "SphericalViewer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "is 360 image : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", force : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    if-nez p2, :cond_29

    .line 100
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer$1;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/app/SphericalViewer;->finish()V

    .line 103
    :cond_29
    return-void
.end method
