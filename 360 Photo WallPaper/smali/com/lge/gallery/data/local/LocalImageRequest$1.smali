.class Lcom/lge/gallery/data/local/LocalImageRequest$1;
.super Ljava/lang/Object;
.source "LocalImageRequest.java"

# interfaces
.implements Lcom/lge/gallery/data/local/LocalImageRequest$TargetSizeChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/data/local/LocalImageRequest;-><init>(Lcom/lge/gallery/appinterface/GalleryApp;Lcom/lge/gallery/data/core/Path;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/data/local/LocalImageRequest;


# direct methods
.method constructor <init>(Lcom/lge/gallery/data/local/LocalImageRequest;)V
    .registers 2

    .prologue
    .line 46
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalImageRequest$1;->this$0:Lcom/lge/gallery/data/local/LocalImageRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange(II)V
    .registers 4
    .param p1, "requested"    # I
    .param p2, "adjusted"    # I

    .prologue
    .line 49
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalImageRequest$1;->this$0:Lcom/lge/gallery/data/local/LocalImageRequest;

    invoke-static {v0, p2}, Lcom/lge/gallery/data/local/LocalImageRequest;->access$002(Lcom/lge/gallery/data/local/LocalImageRequest;I)I

    .line 50
    return-void
.end method
