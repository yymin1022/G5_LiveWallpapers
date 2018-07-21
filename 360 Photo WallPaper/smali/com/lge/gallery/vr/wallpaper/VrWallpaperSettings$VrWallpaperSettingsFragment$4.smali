.class Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;
.super Ljava/lang/Object;
.source "VrWallpaperSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->showVrImageSelectDialog()V
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
    .line 163
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 10
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "position"    # I

    .prologue
    const/4 v6, 0x1

    .line 166
    if-nez p2, :cond_3d

    .line 167
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.GET_CONTENT"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 168
    .local v3, "photoPickerIntent":Landroid/content/Intent;
    const-string v4, "com.android.gallery3d"

    const-string v5, "com.android.gallery3d.app.Gallery"

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 169
    const-string v4, "image/*"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    const-string v4, "vr-image-only"

    invoke-virtual {v3, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 172
    :try_start_1b
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v3, v5}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_25} :catch_26

    .line 189
    .end local v3    # "photoPickerIntent":Landroid/content/Intent;
    :cond_25
    :goto_25
    return-void

    .line 173
    .restart local v3    # "photoPickerIntent":Landroid/content/Intent;
    :catch_26
    move-exception v1

    .line 174
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Landroid/content/Intent;

    .end local v3    # "photoPickerIntent":Landroid/content/Intent;
    const-string v4, "android.intent.action.GET_CONTENT"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 175
    .restart local v3    # "photoPickerIntent":Landroid/content/Intent;
    const-string v4, "image/*"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 176
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v3, v6}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_25

    .line 178
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "photoPickerIntent":Landroid/content/Intent;
    :cond_3d
    if-lez p2, :cond_25

    .line 179
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-static {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->access$300(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;

    invoke-virtual {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->getVRItemImage()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    .line 180
    .local v0, "cover":Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    iget-object v4, v4, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-static {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->access$400(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->storeCover(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 181
    new-instance v2, Landroid/content/Intent;

    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/lge/gallery/vr/wallpaper/VrWallpaperService;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 182
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, "wallpaperContentUri"

    invoke-interface {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 183
    const-string v4, "currentFromAsset"

    invoke-virtual {v2, v4, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 184
    invoke-virtual {v2, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 185
    iget-object v4, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;->this$1:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    invoke-virtual {v4}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_25
.end method
