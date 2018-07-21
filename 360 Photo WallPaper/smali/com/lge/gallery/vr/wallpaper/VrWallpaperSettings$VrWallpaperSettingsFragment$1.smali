.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$1;
.super Ljava/lang/Object;
.source "VrWallpaperSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


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
    .line 125
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$1;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$1;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->access$100(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    .line 129
    const/4 v0, 0x1

    return v0
.end method
