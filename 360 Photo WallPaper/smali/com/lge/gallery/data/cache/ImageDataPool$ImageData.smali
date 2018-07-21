.class public Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;
.super Ljava/lang/Object;
.source "ImageDataPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/cache/ImageDataPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageData"
.end annotation


# instance fields
.field public mData:[B

.field public mLength:I

.field public mOffset:I


# direct methods
.method private constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    .line 32
    return-void
.end method

.method synthetic constructor <init>(ILcom/lge/gallery/data/cache/ImageDataPool$1;)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "x1"    # Lcom/lge/gallery/data/cache/ImageDataPool$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;-><init>(I)V

    return-void
.end method

.method public constructor <init>([BII)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mData:[B

    .line 26
    iput p2, p0, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mOffset:I

    .line 27
    iput p3, p0, Lcom/lge/gallery/data/cache/ImageDataPool$ImageData;->mLength:I

    .line 28
    return-void
.end method
