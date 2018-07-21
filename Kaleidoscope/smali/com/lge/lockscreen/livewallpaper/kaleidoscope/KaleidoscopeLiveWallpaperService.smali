.class public Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "KaleidoscopeLiveWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .registers 2

    .prologue
    .line 18
    new-instance v0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;

    invoke-direct {v0, p0}, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;-><init>(Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;)V

    return-object v0
.end method
