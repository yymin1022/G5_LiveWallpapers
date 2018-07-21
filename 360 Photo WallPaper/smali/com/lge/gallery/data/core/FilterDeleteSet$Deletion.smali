.class Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
.super Ljava/lang/Object;
.source "FilterDeleteSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/FilterDeleteSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Deletion"
.end annotation


# instance fields
.field index:I

.field path:Lcom/lge/gallery/data/core/Path;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;I)V
    .registers 3
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "index"    # I

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->path:Lcom/lge/gallery/data/core/Path;

    .line 53
    iput p2, p0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    .line 54
    return-void
.end method
