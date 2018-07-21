.class final Lcom/lge/gallery/data/core/MediaSet$1;
.super Ljava/lang/Object;
.source "MediaSet.java"

# interfaces
.implements Lcom/lge/gallery/util/Future;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/MediaSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/Future",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 1

    .prologue
    .line 351
    return-void
.end method

.method public get()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 365
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 348
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/MediaSet$1;->get()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 355
    const/4 v0, 0x0

    return v0
.end method

.method public isDone()Z
    .registers 2

    .prologue
    .line 360
    const/4 v0, 0x1

    return v0
.end method

.method public waitDone()V
    .registers 1

    .prologue
    .line 370
    return-void
.end method
