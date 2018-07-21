.class public final Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;
.super Ljava/lang/Object;
.source "GalleryDecodeUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/decoder/GalleryDecodeUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Size"
.end annotation


# instance fields
.field public final height:I

.field public final width:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p1, p0, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;->width:I

    .line 37
    iput p2, p0, Lcom/lge/gallery/decoder/GalleryDecodeUtils$Size;->height:I

    .line 38
    return-void
.end method
