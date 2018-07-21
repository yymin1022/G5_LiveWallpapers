.class Lcom/lge/gallery/data/local/BurstImage$ChangeNotifierForItem;
.super Lcom/lge/gallery/data/core/ChangeNotifier;
.source "BurstImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/BurstImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChangeNotifierForItem"
.end annotation


# direct methods
.method public constructor <init>(Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/lge/gallery/data/core/ChangeNotifier;-><init>(Lcom/lge/gallery/data/core/MediaSet;Landroid/net/Uri;Lcom/lge/gallery/appinterface/GalleryApp;)V

    .line 55
    invoke-interface {p2}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/lge/gallery/data/core/DataManager;->registerChangeNotifier(Landroid/net/Uri;Lcom/lge/gallery/data/core/DataManager$MediaChangeNotifier;)V

    .line 56
    return-void
.end method
