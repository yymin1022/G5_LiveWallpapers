.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "VrWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final KEY_FROM_GALLERY:Ljava/lang/String; = "from-gallery"

.field public static final KEY_URI:Ljava/lang/String; = "wallpaperContentUri"

.field private static final TAG:Ljava/lang/String; = "VrWallpaperService"

.field static sCachedCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;


# instance fields
.field private mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

.field private mCurrentEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

.field private mRealEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

.field private mSettings:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    .line 85
    return-void
.end method

.method static synthetic access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    return-object v0
.end method

.method static synthetic access$302(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;)Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;
    .param p1, "x1"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mRealEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    return-object p1
.end method

.method static synthetic access$400(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mSettings:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .registers 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    .line 44
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    invoke-direct {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mSettings:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    .line 45
    return-void
.end method

.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .registers 3

    .prologue
    .line 49
    const-string v0, "VrWallpaperService"

    const-string v1, "Create engine."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-direct {v0, p0, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCurrentEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    .line 51
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCurrentEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    return-object v0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 12
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v7, 0x0

    .line 56
    if-eqz p1, :cond_6b

    .line 57
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    const-string v6, "wallpaperContentUri"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "uriStr":Ljava/lang/String;
    const-string v5, "from-gallery"

    invoke-virtual {p1, v5, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 59
    .local v2, "isFromGallery":Ljava/lang/Boolean;
    if-eqz v4, :cond_6b

    .line 60
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 61
    .local v3, "uri":Landroid/net/Uri;
    const-string v5, "currentFromAsset"

    invoke-virtual {p1, v5, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 62
    .local v1, "isAsset":Z
    const-string v5, "VrWallpaperService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "temporary uri = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    if-eqz v1, :cond_70

    invoke-static {p0, v4}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->createCoverFromPath(Landroid/content/Context;Ljava/lang/String;)Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    .line 65
    .local v0, "cover":Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    :goto_4b
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mRealEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    if-eqz v5, :cond_75

    .line 66
    const/4 v5, 0x0

    sput-object v5, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->sCachedCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .line 67
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mRealEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-virtual {v5, v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 72
    :goto_57
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCurrentEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    if-eqz v5, :cond_60

    .line 73
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCurrentEngine:Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;

    invoke-virtual {v5, v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService$GLES20Engine;->setCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 75
    :cond_60
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_78

    .line 76
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v5, v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->setLastRequestedCover(Landroid/net/Uri;)V

    .line 82
    .end local v0    # "cover":Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    .end local v1    # "isAsset":Z
    .end local v2    # "isFromGallery":Ljava/lang/Boolean;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "uriStr":Ljava/lang/String;
    :cond_6b
    :goto_6b
    invoke-super {p0, p1, p2, p3}, Landroid/service/wallpaper/WallpaperService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v5

    return v5

    .line 63
    .restart local v1    # "isAsset":Z
    .restart local v2    # "isFromGallery":Ljava/lang/Boolean;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local v4    # "uriStr":Ljava/lang/String;
    :cond_70
    invoke-static {p0, v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->createCoverFromUri(Landroid/content/Context;Landroid/net/Uri;)Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    goto :goto_4b

    .line 70
    .restart local v0    # "cover":Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    :cond_75
    sput-object v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->sCachedCover:Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    goto :goto_57

    .line 78
    :cond_78
    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v5}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->clearLastRequestedCover()V

    goto :goto_6b
.end method
