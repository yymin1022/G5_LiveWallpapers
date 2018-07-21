.class public Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;
.super Landroid/preference/Preference;
.source "VrPreviewPreference.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

.field private mImage:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    const-string v0, "VrPreviewPreference"

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->TAG:Ljava/lang/String;

    .line 34
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    .line 36
    const v0, 0x7f040022

    invoke-virtual {p0, v0}, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->setLayoutResource(I)V

    .line 37
    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 42
    const v3, 0x7f0e005e

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 44
    .local v2, "imageView":Landroid/widget/ImageView;
    if-nez v2, :cond_16

    .line 45
    const-string v3, "VrPreviewPreference"

    const-string v4, "Cannot find ImageView (R.id.vr_preivew_pref_image)"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :cond_15
    :goto_15
    return-void

    .line 49
    :cond_16
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_7c

    .line 50
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :cond_1f
    :goto_1f
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_15

    .line 61
    const-string v3, "VrPreviewPreference"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mImage icon "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " imageView : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/widget/ImageView;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is set."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 52
    :cond_7c
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mCoverManager:Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperCoverManager;->getPreviewCover()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v0

    .line 53
    .local v0, "cover":Lcom/lge/gallery/vr/wallpaper/WallpaperCover;
    if-eqz v0, :cond_1f

    .line 54
    invoke-interface {v0}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getThumbnailIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 55
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 56
    iput-object v1, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    goto :goto_1f
.end method

.method public onCoverChanged(Lcom/lge/gallery/vr/wallpaper/WallpaperCover;)V
    .registers 3
    .param p1, "cover"    # Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    .prologue
    .line 69
    if-eqz p1, :cond_b

    .line 70
    invoke-interface {p1}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getThumbnailIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->mImage:Landroid/graphics/drawable/Drawable;

    .line 71
    invoke-virtual {p0}, Lcom/lge/gallery/vr/wallpaper/VrPreviewPreference;->notifyChanged()V

    .line 73
    :cond_b
    return-void
.end method
