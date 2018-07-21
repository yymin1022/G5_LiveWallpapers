.class final Lcom/lge/gallery/util/GalleryUtils$2;
.super Landroid/os/Handler;
.source "GalleryUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/util/GalleryUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 173
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 176
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/lge/gallery/util/GalleryUtils;->access$002(Z)Z

    .line 177
    return-void
.end method
