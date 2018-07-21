.class Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
.super Ljava/lang/Object;
.source "FilterDeleteSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/FilterDeleteSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Request"
.end annotation


# instance fields
.field indexHint:I

.field path:Lcom/lge/gallery/data/core/Path;

.field type:I


# direct methods
.method public constructor <init>(ILcom/lge/gallery/data/core/Path;I)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "indexHint"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->type:I

    .line 42
    iput-object p2, p0, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->path:Lcom/lge/gallery/data/core/Path;

    .line 43
    iput p3, p0, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->indexHint:I

    .line 44
    return-void
.end method
