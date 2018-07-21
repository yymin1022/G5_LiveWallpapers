.class Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;
.super Landroid/service/wallpaper/WallpaperService$Engine;
.source "KaleidoscopeLiveWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VideoEngine"
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mediaPlayer:Landroid/media/MediaPlayer;

.field final synthetic this$0:Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;


# direct methods
.method public constructor <init>(Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;)V
    .registers 10

    .prologue
    .line 26
    iput-object p1, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->this$0:Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;

    .line 27
    invoke-direct {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;-><init>(Landroid/service/wallpaper/WallpaperService;)V

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    .line 28
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "VideoEngine"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :try_start_16
    invoke-virtual {p1}, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 31
    const/high16 v1, 0x7f040000

    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 32
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    if-nez v6, :cond_27

    .line 52
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_26
    :goto_26
    return-void

    .line 35
    .restart local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_27
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 36
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    .line 37
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    .line 36
    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 38
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 39
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 40
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_4d} :catch_58
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_4d} :catch_61
    .catch Ljava/lang/SecurityException; {:try_start_16 .. :try_end_4d} :catch_6a

    .line 49
    .end local v6    # "afd":Landroid/content/res/AssetFileDescriptor;
    :goto_4d
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_26

    .line 50
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    goto :goto_26

    .line 41
    :catch_58
    move-exception v7

    .line 42
    .local v7, "ex":Ljava/io/IOException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4d

    .line 43
    .end local v7    # "ex":Ljava/io/IOException;
    :catch_61
    move-exception v7

    .line 44
    .local v7, "ex":Ljava/lang/IllegalArgumentException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4d

    .line 45
    .end local v7    # "ex":Ljava/lang/IllegalArgumentException;
    :catch_6a
    move-exception v7

    .line 46
    .local v7, "ex":Ljava/lang/SecurityException;
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer create failed:"

    invoke-static {v0, v1, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4d
.end method


# virtual methods
.method public onSurfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_19

    .line 58
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 59
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 62
    :cond_19
    return-void
.end method

.method public onSurfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceDestroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_15

    .line 79
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 80
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 82
    :cond_15
    return-void
.end method

.method public onVisibilityChanged(Z)V
    .registers 4
    .param p1, "visible"    # Z

    .prologue
    .line 66
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->TAG:Ljava/lang/String;

    const-string v1, "onVisibilityChanged"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    if-eqz p1, :cond_f

    .line 68
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 73
    :cond_e
    :goto_e
    return-void

    .line 69
    :cond_f
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 70
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 71
    iget-object v0, p0, Lcom/lge/lockscreen/livewallpaper/kaleidoscope/KaleidoscopeLiveWallpaperService$VideoEngine;->mediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    goto :goto_e
.end method
