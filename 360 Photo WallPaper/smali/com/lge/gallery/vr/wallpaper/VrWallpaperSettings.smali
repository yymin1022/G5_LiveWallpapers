.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;
.super Landroid/app/Activity;
.source "VrWallpaperSettings.java"

# interfaces
.implements Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;,
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;
    }
.end annotation


# static fields
.field private static final CLS_GALLERY:Ljava/lang/String; = "com.android.gallery3d.app.Gallery"

.field private static final DEFAULT_ASSET_COUNT:I = 0x2

.field private static final KEY_360_ONLY:Ljava/lang/String; = "vr-image-only"

.field private static final PKG_GALLERY:Ljava/lang/String; = "com.android.gallery3d"

.field private static final SELECT_PHOTO:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

.field private mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

.field private mSettingMgr:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-class v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 104
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mSettingMgr:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    return-object v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "imageReturnedIntent"    # Landroid/content/Intent;

    .prologue
    .line 233
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 234
    packed-switch p1, :pswitch_data_32

    .line 250
    :cond_6
    :goto_6
    return-void

    .line 236
    :pswitch_7
    const/4 v2, -0x1

    if-ne p2, v2, :cond_6

    .line 237
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 238
    .local v0, "imageUri":Landroid/net/Uri;
    if-eqz v0, :cond_6

    .line 239
    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-static {p0, v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->createCoverFromUri(Landroid/content/Context;Landroid/net/Uri;)Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->notifyCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 240
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 241
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "wallpaperContentUri"

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 242
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 243
    invoke-virtual {p0, v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_6

    .line 234
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_7
    .end packed-switch
.end method

.method public onCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 3
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 228
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->notifyCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 229
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 95
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 96
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    invoke-direct {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mSettingMgr:Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    .line 97
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    .line 98
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->registerListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V

    .line 99
    new-instance v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-direct {v0, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    .line 100
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->setRetainInstance(Z)V

    .line 101
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x1020002

    iget-object v2, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mFragment:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 102
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 222
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 223
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v0, p0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->unregisterListener(Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager$CoverChangeListener;)V

    .line 224
    return-void
.end method
