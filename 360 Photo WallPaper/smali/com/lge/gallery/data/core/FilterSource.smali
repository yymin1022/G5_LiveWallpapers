.class public Lcom/lge/gallery/data/core/FilterSource;
.super Lcom/lge/gallery/data/core/MediaSource;
.source "FilterSource.java"


# static fields
.field private static final FILTER_BY_DELETE:I


# instance fields
.field private mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

.field private mMatcher:Lcom/lge/gallery/data/core/PathMatcher;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/appinterface/GalleryApp;)V
    .registers 5
    .param p1, "application"    # Lcom/lge/gallery/appinterface/GalleryApp;

    .prologue
    .line 28
    const-string v0, "filter"

    invoke-direct {p0, v0}, Lcom/lge/gallery/data/core/MediaSource;-><init>(Ljava/lang/String;)V

    .line 29
    iput-object p1, p0, Lcom/lge/gallery/data/core/FilterSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    .line 30
    new-instance v0, Lcom/lge/gallery/data/core/PathMatcher;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/PathMatcher;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/FilterSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    .line 31
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    const-string v1, "/filter/delete/*"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/lge/gallery/data/core/PathMatcher;->add(Ljava/lang/String;I)V

    .line 32
    return-void
.end method


# virtual methods
.method public createMediaObject(Lcom/lge/gallery/data/core/Path;)Lcom/lge/gallery/data/core/MediaObject;
    .registers 9
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    const/4 v5, 0x0

    .line 36
    iget-object v4, p0, Lcom/lge/gallery/data/core/FilterSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    invoke-virtual {v4, p1}, Lcom/lge/gallery/data/core/PathMatcher;->match(Lcom/lge/gallery/data/core/Path;)I

    move-result v1

    .line 37
    .local v1, "matchType":I
    iget-object v4, p0, Lcom/lge/gallery/data/core/FilterSource;->mApplication:Lcom/lge/gallery/appinterface/GalleryApp;

    invoke-interface {v4}, Lcom/lge/gallery/appinterface/GalleryApp;->getDataManager()Lcom/lge/gallery/data/core/DataManager;

    move-result-object v0

    .line 38
    .local v0, "dataManager":Lcom/lge/gallery/data/core/DataManager;
    packed-switch v1, :pswitch_data_3c

    .line 45
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad path: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 40
    :pswitch_29
    iget-object v4, p0, Lcom/lge/gallery/data/core/FilterSource;->mMatcher:Lcom/lge/gallery/data/core/PathMatcher;

    invoke-virtual {v4, v5}, Lcom/lge/gallery/data/core/PathMatcher;->getVar(I)Ljava/lang/String;

    move-result-object v3

    .line 41
    .local v3, "setsName":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lcom/lge/gallery/data/core/DataManager;->getMediaSetsFromString(Ljava/lang/String;)[Lcom/lge/gallery/data/core/MediaSet;

    move-result-object v2

    .line 42
    .local v2, "sets":[Lcom/lge/gallery/data/core/MediaSet;
    new-instance v4, Lcom/lge/gallery/data/core/FilterDeleteSet;

    aget-object v5, v2, v5

    invoke-direct {v4, p1, v5}, Lcom/lge/gallery/data/core/FilterDeleteSet;-><init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaSet;)V

    return-object v4

    .line 38
    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_29
    .end packed-switch
.end method
