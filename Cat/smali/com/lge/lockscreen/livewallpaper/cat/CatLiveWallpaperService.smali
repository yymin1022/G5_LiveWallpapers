.class public Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "CatLiveWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .registers 2

    .prologue
    .line 20
    new-instance v0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;

    invoke-direct {v0, p0}, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;-><init>(Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;)V

    return-object v0
.end method
