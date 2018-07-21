.class public Lcom/lge/gallery/data/local/MediaSetUtils$NameComparator;
.super Ljava/lang/Object;
.source "MediaSetUtils.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/local/MediaSetUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NameComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/lge/gallery/data/core/MediaSet;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/lge/gallery/data/core/MediaSet;Lcom/lge/gallery/data/core/MediaSet;)I
    .registers 6
    .param p1, "set1"    # Lcom/lge/gallery/data/core/MediaSet;
    .param p2, "set2"    # Lcom/lge/gallery/data/core/MediaSet;

    .prologue
    .line 62
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 63
    .local v0, "result":I
    if-eqz v0, :cond_f

    .line 66
    .end local v0    # "result":I
    :goto_e
    return v0

    .restart local v0    # "result":I
    :cond_f
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/MediaSet;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/lge/gallery/data/core/MediaSet;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_e
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 60
    check-cast p1, Lcom/lge/gallery/data/core/MediaSet;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/lge/gallery/data/core/MediaSet;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/lge/gallery/data/local/MediaSetUtils$NameComparator;->compare(Lcom/lge/gallery/data/core/MediaSet;Lcom/lge/gallery/data/core/MediaSet;)I

    move-result v0

    return v0
.end method
