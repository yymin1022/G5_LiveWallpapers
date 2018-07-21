.class public Lcom/lge/gallery/vr/wallpaper/AssetCover;
.super Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;
.source "AssetCover.java"


# instance fields
.field private final mAssetPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;-><init>(Landroid/content/Context;)V

    .line 22
    iput-object p2, p0, Lcom/lge/gallery/vr/wallpaper/AssetCover;->mAssetPath:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/AssetCover;->mAssetPath:Ljava/lang/String;

    return-object v0
.end method

.method public isAsset()Z
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x1

    return v0
.end method

.method public isValid()Z
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method protected openInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/AssetCover;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/AssetCover;->mAssetPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
