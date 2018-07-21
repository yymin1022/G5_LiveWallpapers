.class final Lcom/lge/gallery/util/StorageStateManager$1;
.super Ljava/lang/Object;
.source "StorageStateManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/util/StorageStateManager;->showToast(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$duration:I

.field final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 4

    .prologue
    .line 961
    iput-object p1, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$string:Ljava/lang/String;

    iput p3, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$duration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 964
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->access$000()Landroid/widget/Toast;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 965
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->access$000()Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    .line 968
    :cond_d
    iget-object v0, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$string:Ljava/lang/String;

    iget v2, p0, Lcom/lge/gallery/util/StorageStateManager$1;->val$duration:I

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/util/StorageStateManager;->access$002(Landroid/widget/Toast;)Landroid/widget/Toast;

    .line 969
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->access$000()Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 970
    return-void
.end method
