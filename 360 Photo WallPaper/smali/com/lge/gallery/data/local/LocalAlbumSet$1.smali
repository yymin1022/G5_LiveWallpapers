.class Lcom/lge/gallery/data/local/LocalAlbumSet$1;
.super Ljava/lang/Object;
.source "LocalAlbumSet.java"

# interfaces
.implements Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/data/local/LocalAlbumSet;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/data/local/LocalAlbumSet;


# direct methods
.method constructor <init>(Lcom/lge/gallery/data/local/LocalAlbumSet;)V
    .registers 2

    .prologue
    .line 142
    iput-object p1, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$1;->this$0:Lcom/lge/gallery/data/local/LocalAlbumSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sortChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V
    .registers 5
    .param p1, "sortEvent"    # Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .param p2, "prevOrder"    # I
    .param p3, "currentOrder"    # I

    .prologue
    .line 145
    if-eq p2, p3, :cond_1d

    .line 146
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$1;->this$0:Lcom/lge/gallery/data/local/LocalAlbumSet;

    invoke-static {v0}, Lcom/lge/gallery/data/local/LocalAlbumSet;->access$000(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 147
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$1;->this$0:Lcom/lge/gallery/data/local/LocalAlbumSet;

    invoke-static {v0}, Lcom/lge/gallery/data/local/LocalAlbumSet;->access$100(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 148
    iget-object v0, p0, Lcom/lge/gallery/data/local/LocalAlbumSet$1;->this$0:Lcom/lge/gallery/data/local/LocalAlbumSet;

    invoke-static {v0}, Lcom/lge/gallery/data/local/LocalAlbumSet;->access$200(Lcom/lge/gallery/data/local/LocalAlbumSet;)Lcom/lge/gallery/data/core/ChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 150
    :cond_1d
    return-void
.end method
