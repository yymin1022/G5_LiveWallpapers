.class Lcom/lge/gallery/app/AlbumDataAdapter$1;
.super Lcom/lge/gallery/common/SynchronizedHandler;
.source "AlbumDataAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/app/AlbumDataAdapter;-><init>(Lcom/lge/gallery/app/Lockable;Lcom/lge/gallery/data/core/MediaSet;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/app/AlbumDataAdapter;


# direct methods
.method constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter;Lcom/lge/gallery/app/Lockable;)V
    .registers 3
    .param p2, "x0"    # Lcom/lge/gallery/app/Lockable;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-direct {p0, p2}, Lcom/lge/gallery/common/SynchronizedHandler;-><init>(Lcom/lge/gallery/app/Lockable;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 82
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_44

    .line 102
    :cond_5
    :goto_5
    return-void

    .line 84
    :pswitch_6
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_5

    .line 87
    :pswitch_e
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 88
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/lge/gallery/common/LoadingListener;->onLoadingStarted()V

    goto :goto_5

    .line 92
    :pswitch_20
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 93
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/lge/gallery/common/LoadingListener;->onLoadingFinished()V

    goto :goto_5

    .line 97
    :pswitch_32
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 98
    iget-object v0, p0, Lcom/lge/gallery/app/AlbumDataAdapter$1;->this$0:Lcom/lge/gallery/app/AlbumDataAdapter;

    invoke-static {v0}, Lcom/lge/gallery/app/AlbumDataAdapter;->access$100(Lcom/lge/gallery/app/AlbumDataAdapter;)Lcom/lge/gallery/common/LoadingListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/lge/gallery/common/LoadingListener;->onLoadingInitially()V

    goto :goto_5

    .line 82
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_e
        :pswitch_20
        :pswitch_6
        :pswitch_32
    .end packed-switch
.end method
