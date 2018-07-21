.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$3;
.super Ljava/lang/Object;
.source "VrWallpaperSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;


# direct methods
.method constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V
    .registers 2

    .prologue
    .line 149
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$3;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$3;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    iget-object v0, v0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    move-result-object v0

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->saveTouchOption(Z)V

    .line 153
    const/4 v0, 0x1

    return v0
.end method
