.class Lcom/lge/gallery/vr/app/SphericalViewer$2;
.super Ljava/lang/Object;
.source "SphericalViewer.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/data/SingleContentItemObserver$SingleMediaItemObserver;


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
    .line 110
    iput-object p1, p0, Lcom/lge/gallery/vr/app/SphericalViewer$2;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 2
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 118
    return-void
.end method

.method public onRemoved(Lcom/lge/gallery/data/core/MediaItem;)V
    .registers 3
    .param p1, "item"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/lge/gallery/vr/app/SphericalViewer$2;->this$0:Lcom/lge/gallery/vr/app/SphericalViewer;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/app/SphericalViewer;->finish()V

    .line 114
    return-void
.end method
