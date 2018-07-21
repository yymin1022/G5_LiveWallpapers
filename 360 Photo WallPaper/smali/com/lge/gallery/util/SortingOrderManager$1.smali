.class Lcom/lge/gallery/util/SortingOrderManager$1;
.super Ljava/lang/Object;
.source "SortingOrderManager.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lge/gallery/util/SortingOrderManager;->register()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lge/gallery/util/SortingOrderManager;


# direct methods
.method constructor <init>(Lcom/lge/gallery/util/SortingOrderManager;)V
    .registers 2

    .prologue
    .line 80
    iput-object p1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 8
    .param p1, "pref"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 83
    if-eqz p1, :cond_4e

    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v1}, Lcom/lge/gallery/util/SortingOrderManager;->access$000(Lcom/lge/gallery/util/SortingOrderManager;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 84
    const-string v1, "sort"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 85
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v1}, Lcom/lge/gallery/util/SortingOrderManager;->access$100(Lcom/lge/gallery/util/SortingOrderManager;)I

    move-result v0

    .line 86
    .local v0, "order":I
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v1}, Lcom/lge/gallery/util/SortingOrderManager;->access$200(Lcom/lge/gallery/util/SortingOrderManager;)I

    move-result v1

    if-eq v0, v1, :cond_4e

    .line 87
    const-string v1, "SortingOrderManger"

    const-string v2, "sorting order is changed."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    iget-object v2, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v2}, Lcom/lge/gallery/util/SortingOrderManager;->access$200(Lcom/lge/gallery/util/SortingOrderManager;)I

    move-result v2

    invoke-static {v1, v2}, Lcom/lge/gallery/util/SortingOrderManager;->access$302(Lcom/lge/gallery/util/SortingOrderManager;I)I

    .line 89
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v1, v0}, Lcom/lge/gallery/util/SortingOrderManager;->access$202(Lcom/lge/gallery/util/SortingOrderManager;I)I

    .line 90
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    sget-object v2, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->GLOBAL:Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    iget-object v3, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v3}, Lcom/lge/gallery/util/SortingOrderManager;->access$300(Lcom/lge/gallery/util/SortingOrderManager;)I

    move-result v3

    iget-object v4, p0, Lcom/lge/gallery/util/SortingOrderManager$1;->this$0:Lcom/lge/gallery/util/SortingOrderManager;

    invoke-static {v4}, Lcom/lge/gallery/util/SortingOrderManager;->access$200(Lcom/lge/gallery/util/SortingOrderManager;)I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Lcom/lge/gallery/util/SortingOrderManager;->access$400(Lcom/lge/gallery/util/SortingOrderManager;Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V

    .line 96
    .end local v0    # "order":I
    :cond_4e
    return-void
.end method
