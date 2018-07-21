.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;
.super Landroid/app/Activity;
.source "VrWallpaperSetter.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    const-class v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 26
    .local v2, "uri":Landroid/net/Uri;
    if-nez v2, :cond_18

    .line 27
    sget-object v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->TAG:Ljava/lang/String;

    const-string v4, "Try to set 360 wallpaper with NULL uri."

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->finish()V

    .line 42
    :goto_17
    return-void

    .line 31
    :cond_18
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 32
    .local v1, "serviceIntent":Landroid/content/Intent;
    const-class v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 33
    const-string v3, "wallpaperContentUri"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    const-string v3, "from-gallery"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 35
    invoke-virtual {p0, v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 37
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.service.wallpaper.CHANGE_LIVE_WALLPAPER"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 38
    .local v0, "intent":Landroid/content/Intent;
    const-string v3, "android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT"

    new-instance v4, Landroid/content/ComponentName;

    const-class v5, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-direct {v4, p0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 40
    invoke-virtual {p0, v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->startActivity(Landroid/content/Intent;)V

    .line 41
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSetter;->finish()V

    goto :goto_17
.end method
