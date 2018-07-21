.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;
.super Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;
.source "VrWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GLWallpaperView"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .line 123
    invoke-direct {p0, p2}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;-><init>(Landroid/content/Context;)V

    .line 124
    return-void
.end method


# virtual methods
.method public getHolder()Landroid/view/SurfaceHolder;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    return-object v0
.end method

.method public getViewHeight()I
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getViewWidth()I
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine$GLWallpaperView;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public onWallpaperDestroy()V
    .registers 1

    .prologue
    .line 132
    invoke-super {p0}, Lcom/lge/gallery/vr/viewer/view/GLSurfaceBaseView;->onDetachedFromWindow()V

    .line 133
    return-void
.end method
