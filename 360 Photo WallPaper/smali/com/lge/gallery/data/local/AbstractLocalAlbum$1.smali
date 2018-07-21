.class Lcom/lge/gallery/data/local/AbstractLocalAlbum$1;
.super Ljava/lang/Object;
.source "AbstractLocalAlbum.java"

# interfaces
.implements Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/data/local/AbstractLocalAlbum;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/appinterface/GalleryApp;ZLjava/lang/String;Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/data/local/AbstractLocalAlbum;


# direct methods
.method constructor <init>(Lcom/lge/gallery/data/local/AbstractLocalAlbum;)V
    .registers 2

    .prologue
    .line 106
    iput-object p1, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum$1;->this$0:Lcom/lge/gallery/data/local/AbstractLocalAlbum;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sortChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V
    .registers 5
    .param p1, "sortEvent"    # Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .param p2, "prevOder"    # I
    .param p3, "currentOrder"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lcom/lge/gallery/data/local/AbstractLocalAlbum$1;->this$0:Lcom/lge/gallery/data/local/AbstractLocalAlbum;

    iget-object v0, v0, Lcom/lge/gallery/data/local/AbstractLocalAlbum;->mNotifier:Lcom/lge/gallery/data/core/ChangeNotifier;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/ChangeNotifier;->fakeChange()V

    .line 110
    return-void
.end method
