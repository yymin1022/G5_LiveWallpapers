.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;
.super Ljava/lang/Object;
.source "VrWallpaperImageListItem.java"


# instance fields
.field private mItemImage:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

.field private mItemTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "image"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->mItemTitle:Ljava/lang/String;

    .line 18
    iput-object p2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->mItemImage:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 19
    return-void
.end method


# virtual methods
.method public getVRItemImage()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->mItemImage:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    return-object v0
.end method

.method public getVRItemTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 22
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->mItemTitle:Ljava/lang/String;

    return-object v0
.end method
