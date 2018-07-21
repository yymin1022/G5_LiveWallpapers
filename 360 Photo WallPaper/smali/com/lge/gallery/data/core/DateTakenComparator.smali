.class public Lcom/lge/gallery/data/core/DateTakenComparator;
.super Ljava/lang/Object;
.source "DateTakenComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/lge/gallery/data/core/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static sComparator:Lcom/lge/gallery/data/core/DateTakenComparator;


# instance fields
.field private mManager:Lcom/lge/gallery/util/SortingOrderManager;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {p1}, Lcom/lge/gallery/util/SortingOrderManager;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/data/core/DateTakenComparator;->mManager:Lcom/lge/gallery/util/SortingOrderManager;

    .line 25
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/lge/gallery/data/core/DateTakenComparator;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    sget-object v0, Lcom/lge/gallery/data/core/DateTakenComparator;->sComparator:Lcom/lge/gallery/data/core/DateTakenComparator;

    if-nez v0, :cond_b

    .line 29
    new-instance v0, Lcom/lge/gallery/data/core/DateTakenComparator;

    invoke-direct {v0, p0}, Lcom/lge/gallery/data/core/DateTakenComparator;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lge/gallery/data/core/DateTakenComparator;->sComparator:Lcom/lge/gallery/data/core/DateTakenComparator;

    .line 31
    :cond_b
    sget-object v0, Lcom/lge/gallery/data/core/DateTakenComparator;->sComparator:Lcom/lge/gallery/data/core/DateTakenComparator;

    return-object v0
.end method


# virtual methods
.method public compare(Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/data/core/MediaItem;)I
    .registers 9
    .param p1, "item1"    # Lcom/lge/gallery/data/core/MediaItem;
    .param p2, "item2"    # Lcom/lge/gallery/data/core/MediaItem;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/lge/gallery/data/core/DateTakenComparator;->mManager:Lcom/lge/gallery/util/SortingOrderManager;

    .line 37
    .local v0, "manager":Lcom/lge/gallery/util/SortingOrderManager;
    invoke-virtual {v0}, Lcom/lge/gallery/util/SortingOrderManager;->getSortingOrder()I

    move-result v1

    .line 38
    .local v1, "sortOrder":I
    if-nez v1, :cond_15

    .line 39
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaItem;->getDateInMs()J

    move-result-wide v2

    invoke-virtual {p2}, Lcom/lge/gallery/data/core/MediaItem;->getDateInMs()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/lge/gallery/common/Utils;->compare(JJ)I

    move-result v2

    .line 41
    :goto_14
    return v2

    :cond_15
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaItem;->getDateInMs()J

    move-result-wide v2

    invoke-virtual {p2}, Lcom/lge/gallery/data/core/MediaItem;->getDateInMs()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/lge/gallery/common/Utils;->compare(JJ)I

    move-result v2

    neg-int v2, v2

    goto :goto_14
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 19
    check-cast p1, Lcom/lge/gallery/data/core/MediaItem;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/lge/gallery/data/core/MediaItem;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/core/DateTakenComparator;->compare(Lcom/lge/gallery/data/core/MediaItem;Lcom/lge/gallery/data/core/MediaItem;)I

    move-result v0

    return v0
.end method
