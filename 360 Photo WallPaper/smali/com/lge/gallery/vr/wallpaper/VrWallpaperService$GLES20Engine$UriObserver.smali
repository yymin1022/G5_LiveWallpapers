.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;
.super Landroid/database/ContentObserver;
.source "VrWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UriObserver"
.end annotation


# instance fields
.field private mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

.field final synthetic this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;Landroid/os/Handler;Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 4
    .param p2, "handler"    # Landroid/os/Handler;
    .param p3, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .line 100
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 101
    iput-object p3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 102
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 4
    .param p1, "self"    # Z

    .prologue
    .line 114
    const-string v0, "VrWallpaperService"

    const-string v1, "Changed notified"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-interface {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->isValid()Z

    move-result v0

    if-nez v0, :cond_14

    .line 116
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->access$100(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)V

    .line 118
    :cond_14
    return-void
.end method

.method public register()V
    .registers 4

    .prologue
    .line 105
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->access$000(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->mCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    invoke-interface {v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 106
    return-void
.end method

.method public unregister()V
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$UriObserver;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->access$000(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 110
    return-void
.end method
