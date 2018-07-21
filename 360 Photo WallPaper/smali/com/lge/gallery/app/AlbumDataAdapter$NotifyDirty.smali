.class Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;
.super Ljava/lang/Object;
.source "AlbumDataAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/app/AlbumDataAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotifyDirty"
.end annotation


# instance fields
.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/lge/gallery/app/AlbumDataAdapter;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 356
    .local p2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 357
    iput-object p2, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;->mItems:Ljava/util/ArrayList;

    .line 358
    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 362
    iget-object v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 363
    .local v1, "index":I
    iget-object v2, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifyDirty;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v2, v1}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$600(Lcom/lge/gallery/app/AlbumDataAdapter;I)V

    goto :goto_6

    .line 365
    .end local v1    # "index":I
    :cond_1c
    return-void
.end method
