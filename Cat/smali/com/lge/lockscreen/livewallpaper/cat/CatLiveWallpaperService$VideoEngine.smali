.class Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;
.super Landroid/service/wallpaper/WallpaperService$Engine;
.source "CatLiveWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VideoEngine"
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field final synthetic this$0:Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;


# direct methods
.method public constructor <init>(Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;)V
    .registers 10

    .prologue
    .line 29
    iput-object p1, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->this$0:Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;

    .line 30
    invoke-direct {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;-><init>(Landroid/service/wallpaper/WallpaperService;)V

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 31
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "VideoEngine"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    :try_start_19
    invoke-virtual {p1}, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 34
    const/high16 v1, 0x7f040000

    .line 33
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 35
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    if-nez v6, :cond_2a

    .line 55
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_29
    :goto_29
    return-void

    .line 38
    .restart local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_2a
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 39
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    .line 40
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    .line 39
    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 41
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 42
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 43
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_50
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_50} :catch_5b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_19 .. :try_end_50} :catch_64
    .catch Ljava/lang/SecurityException; {:try_start_19 .. :try_end_50} :catch_6d

    .line 52
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_50
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_29

    .line 53
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    goto :goto_29

    .line 44
    :catch_5b
    move-exception v7

    .line 45
    .local v7, "ex":Ljava/io/IOException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_50

    .line 46
    .end local v7    # "ex":Ljava/io/IOException;
    :catch_64
    move-exception v7

    .line 47
    .local v7, "ex":Ljava/lang/IllegalArgumentException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_50

    .line 48
    .end local v7    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_6d
    move-exception v7

    .line 49
    .local v7, "ex":Ljava/lang/SecurityException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_50
.end method


# virtual methods
.method public onSurfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_19

    .line 61
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 62
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 65
    :cond_19
    return-void
.end method

.method public onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceDestroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_15

    .line 82
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 83
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 85
    :cond_15
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 69
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onVisibilityChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    if-eqz p1, :cond_f

    .line 71
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 76
    :cond_e
    :goto_e
    return-void

    .line 72
    :cond_f
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 73
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 74
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/cat/CatLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto :goto_e
.end method
