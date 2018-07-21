.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;
.super Landroid/preference/PreferenceFragment;
.source "VrWallpaperSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VrWallpaperSettingsFragment"
.end annotation


# instance fields
.field private mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

.field private mlistAdpater:Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;

.field final synthetic this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)V
    .registers 2

    .prologue
    .line 104
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->showVrImageSelectDialog()V

    return-void
.end method

.method static synthetic access$300(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mlistAdpater:Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;

    return-object v0
.end method

.method private makeVrWallpaperListItem([Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 11
    .param p1, "imageFileNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .local v2, "vrListItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;>;"
    new-instance v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07003f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;

    iget-object v6, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    iget-object v7, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-virtual {v7}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$GalleryCover;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;Landroid/content/Context;)V

    invoke-direct {v3, v4, v5}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;-><init>(Ljava/lang/String;Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 204
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x7f0c0000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "defaultImageNames":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "cnt":I
    :goto_30
    const/4 v3, 0x2

    if-ge v0, v3, :cond_66

    .line 206
    new-instance v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;

    aget-object v4, v1, v0

    new-instance v5, Lcom/lge/gallery/vr/wallpaper/AssetCover;

    iget-object v6, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-virtual {v6}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "images"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, p1, v0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/lge/gallery/vr/wallpaper/AssetCover;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {v3, v4, v5}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;-><init>(Ljava/lang/String;Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_30

    .line 210
    :cond_66
    return-object v2
.end method

.method private showVrImageSelectDialog()V
    .registers 4

    .prologue
    .line 161
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 162
    .local v0, "dialogBuilder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f070034

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 163
    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mlistAdpater:Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;

    new-instance v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;

    invoke-direct {v2, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$4;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 191
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070032

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$5;

    invoke-direct {v2, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$5;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 196
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 197
    return-void
.end method


# virtual methods
.method notifyCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 3
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    if-eqz v0, :cond_9

    .line 215
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->onCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V

    .line 217
    :cond_9
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 116
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 118
    :try_start_3
    new-instance v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f040027

    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "images"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->makeVrWallpaperListItem([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mlistAdpater:Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_23} :catch_7a

    .line 123
    :goto_23
    const-string v3, "preview_custom_prefs"

    invoke-virtual {p0, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    iput-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    .line 124
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    if-eqz v3, :cond_3b

    .line 125
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->mPreviewPreference:Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;

    new-instance v4, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$1;

    invoke-direct {v4, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$1;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    invoke-virtual {v3, v4}, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 134
    :cond_3b
    const-string v3, "360_degree_swtich"

    invoke-virtual {p0, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/SwitchPreference;

    .line 135
    .local v1, "switch360Degree":Landroid/preference/SwitchPreference;
    if-eqz v1, :cond_5a

    .line 136
    new-instance v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$2;

    invoke-direct {v3, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$2;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    invoke-virtual {v1, v3}, Landroid/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 144
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-static {v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->isGyroOptionOn()Z

    move-result v3

    invoke-virtual {v1, v3}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 147
    :cond_5a
    const-string v3, "360_gesture_swtich"

    invoke-virtual {p0, v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/SwitchPreference;

    .line 148
    .local v2, "switch360Gesture":Landroid/preference/SwitchPreference;
    if-eqz v2, :cond_79

    .line 149
    new-instance v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$3;

    invoke-direct {v3, p0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment$3;-><init>(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;)V

    invoke-virtual {v2, v3}, Landroid/preference/SwitchPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 156
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->this$0:Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;

    invoke-static {v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;->access$200(Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings;)Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperSettingManager;->isTouchOptionOn()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 158
    :cond_79
    return-void

    .line 120
    .end local v1    # "switch360Degree":Landroid/preference/SwitchPreference;
    .end local v2    # "switch360Gesture":Landroid/preference/SwitchPreference;
    :catch_7a
    move-exception v0

    .line 121
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_23
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 110
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 111
    const v0, 0x7f060002

    invoke-virtual {p0, v0}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperSettings$VrWallpaperSettingsFragment;->addPreferencesFromResource(I)V

    .line 112
    return-void
.end method
