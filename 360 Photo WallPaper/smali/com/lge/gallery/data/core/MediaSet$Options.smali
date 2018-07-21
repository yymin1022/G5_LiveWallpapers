.class public final Lcom/lge/gallery/data/core/MediaSet$Options;
.super Ljava/lang/Object;
.source "MediaSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/MediaSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Options"
.end annotation


# instance fields
.field private mIsCanceled:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isCancelRequested()Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/lge/gallery/data/core/MediaSet$Options;->mIsCanceled:Z

    return v0
.end method

.method public requestCancel()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/core/MediaSet$Options;->mIsCanceled:Z

    .line 51
    return-void
.end method
