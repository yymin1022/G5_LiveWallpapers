.class Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;
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
    name = "NotifySizeChanged"
.end annotation


# instance fields
.field private final mSize:I

.field final synthetic this$0:Lcom/lge/gallery/app/AlbumDataAdapter;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;I)V
    .registers 3
    .param p2, "size"    # I

    .prologue
    .line 343
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 344
    iput p2, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;->mSize:I

    .line 345
    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 349
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    iget v1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$NotifySizeChanged;->mSize:I

    invoke-static {v0, v1}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$500(Lcom/lge/gallery/app/AlbumDataAdapter;I)V

    .line 350
    return-void
.end method
