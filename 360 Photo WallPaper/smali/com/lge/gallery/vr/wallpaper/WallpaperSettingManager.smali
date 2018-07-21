.class public Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;
.super Ljava/lang/Object;
.source "WallpaperSettingManager.java"


# static fields
.field private static final PREF_KEY_USE_GYRO:Ljava/lang/String; = "useGyro"

.field private static final PREF_KEY_USE_TOUCHMODE:Ljava/lang/String; = "useTouch"


# instance fields
.field private mPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string v0, "settings"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->mPreferences:Landroid/content/SharedPreferences;

    .line 22
    return-void
.end method


# virtual methods
.method public isGyroOptionOn()Z
    .registers 4

    .prologue
    .line 25
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->mPreferences:Landroid/content/SharedPreferences;

    const-string v1, "useGyro"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isTouchOptionOn()Z
    .registers 4

    .prologue
    .line 34
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->mPreferences:Landroid/content/SharedPreferences;

    const-string v1, "useTouch"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public saveGyroOption(Z)V
    .registers 4
    .param p1, "isOn"    # Z

    .prologue
    .line 29
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "useGyro"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 30
    return-void
.end method

.method public saveTouchOption(Z)V
    .registers 4
    .param p1, "isOn"    # Z

    .prologue
    .line 38
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "useTouch"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 39
    return-void
.end method
