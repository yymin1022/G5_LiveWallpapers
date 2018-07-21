.class public Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "VrWallpaperImageListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mListItem:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "textViewResourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p3, "listItem":Ljava/util/List;, "Ljava/util/List<Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 33
    iput-object p1, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->mContext:Landroid/content/Context;

    .line 34
    iput-object p3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->mListItem:Ljava/util/List;

    .line 35
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 39
    move-object v1, p2

    .line 41
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_5a

    .line 42
    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->mContext:Landroid/content/Context;

    const-string v4, "layout_inflater"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 43
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v3, 0x7f040027

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 44
    new-instance v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;

    invoke-direct {v2}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;-><init>()V

    .line 45
    .local v2, "viewHolder":Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;
    const v3, 0x7f0e0060

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;->listItemTitle:Landroid/widget/TextView;

    .line 46
    const v3, 0x7f0e005f

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;->listItemImage:Landroid/widget/ImageView;

    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :goto_33
    iget-object v4, v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;->listItemImage:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->mListItem:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->getVRItemImage()Lcom/lge/gallery/vr/wallpaper/WallpaperCover;

    move-result-object v3

    invoke-interface {v3}, Lcom/lge/gallery/vr/wallpaper/WallpaperCover;->getThumbnailIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 53
    iget-object v4, v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;->listItemTitle:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter;->mListItem:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListItem;->getVRItemTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    return-object v1

    .line 49
    .end local v2    # "viewHolder":Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;
    :cond_5a
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;

    .restart local v2    # "viewHolder":Lcom/lge/gallery/vr/wallpaper/VrWallpaperImageListAdapter$ViewHolder;
    goto :goto_33
.end method
