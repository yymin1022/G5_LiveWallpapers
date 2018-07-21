.class public Lcom/lge/gallery/data/core/MediaSource$PathId;
.super Ljava/lang/Object;
.source "MediaSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/MediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PathId"
.end annotation


# instance fields
.field public id:I

.field public path:Lcom/lge/gallery/data/core/Path;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;I)V
    .registers 3
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "id"    # I

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/lge/gallery/data/core/MediaSource$PathId;->path:Lcom/lge/gallery/data/core/Path;

    .line 65
    iput p2, p0, Lcom/lge/gallery/data/core/MediaSource$PathId;->id:I

    .line 66
    return-void
.end method
