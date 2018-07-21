.class Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;
.super Ljava/lang/Object;
.source "AlbumDataAdapter.java"

# interfaces
.implements Lcom/lge/gallery/data/core/ContentListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/app/AlbumDataAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySourceListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/app/AlbumDataAdapter;


# direct methods
.method private constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;)V
    .registers 2

    .prologue
    .line 259
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/AlbumDataAdapter$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter;
    .param p2, "x1"    # Lcom/lge/gallery/app/AlbumDataAdapter$1;

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;-><init>(Lcom/lge/gallery/app/AlbumDataAdapter;)V

    return-void
.end method


# virtual methods
.method public onContentDirty()V
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$300(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 262
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$MySourceListener;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$300(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/app/AlbumDataAdapter$ReloadTask;->notifyDirty()V

    .line 264
    :cond_11
    return-void
.end method
