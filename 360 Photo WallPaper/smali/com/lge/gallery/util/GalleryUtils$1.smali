.class final Lcom/lge/gallery/util/GalleryUtils$1;
.super Ljava/lang/Object;
.source "GalleryUtils.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$CancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/util/GalleryUtils;->fakeBusy(Lcom/lge/gallery/util/ThreadPool$JobContext;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$cv:Landroid/os/ConditionVariable;


# direct methods
.method constructor <init>(Landroid/os/ConditionVariable;)V
    .registers 2

    .prologue
    .line 125
    iput-object p1, p0, Lcom/lge/gallery/util/GalleryUtils$1;->val$cv:Landroid/os/ConditionVariable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/lge/gallery/util/GalleryUtils$1;->val$cv:Landroid/os/ConditionVariable;

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 128
    return-void
.end method
