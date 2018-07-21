.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;
.super Ljava/lang/Object;
.source "VrWallpaperSettings.java"

# interfaces
.implements Lcom/lge/gallery/vr/wallpaper/WallpaperCover;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GalleryCover"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;->mContext:Landroid/content/Context;

    .line 51
    return-void
.end method


# virtual methods
.method public getPreviewBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method public getThumbnailIcon()Landroid/graphics/drawable/Drawable;
    .registers 7

    .prologue
    .line 81
    :try_start_0
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 82
    .local v3, "pkgMgr":Landroid/content/pm/PackageManager;
    const-string v4, "com.android.gallery3d"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 83
    .local v1, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v3, v1}, Landroid/content/pm/PackageManager;->getApplicationIcon(Landroid/content/pm/ApplicationInfo;)Landroid/graphics/drawable/Drawable;
    :try_end_10
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_10} :catch_12

    move-result-object v0

    .line 88
    .end local v1    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "pkgMgr":Landroid/content/pm/PackageManager;
    :goto_11
    return-object v0

    .line 85
    :catch_12
    move-exception v2

    .line 86
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-static {}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Failed to get Gallery icon"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAsset()Z
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public isObservable()Z
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x0

    return v0
.end method

.method public isValid()Z
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method
