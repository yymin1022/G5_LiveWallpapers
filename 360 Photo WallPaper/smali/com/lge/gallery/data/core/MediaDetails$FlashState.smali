.class public Lcom/lge/gallery/data/core/MediaDetails$FlashState;
.super Ljava/lang/Object;
.source "MediaDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/MediaDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FlashState"
.end annotation


# static fields
.field private static final FLASH_FIRED_MASK:I = 0x1

.field private static final FLASH_FUNCTION_MASK:I = 0x20

.field private static final FLASH_MODE_MASK:I = 0x18

.field private static final FLASH_RED_EYE_MASK:I = 0x40

.field private static final FLASH_RETURN_MASK:I = 0x6


# instance fields
.field private mState:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    .line 46
    return-void
.end method


# virtual methods
.method public getFlashMode()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    and-int/lit8 v0, v0, 0x18

    shr-int/lit8 v0, v0, 0x3

    return v0
.end method

.method public getFlashReturn()I
    .registers 2

    .prologue
    .line 53
    iget v0, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    and-int/lit8 v0, v0, 0x6

    shr-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isFlashFired()Z
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFlashPresent()Z
    .registers 2

    .prologue
    .line 61
    iget v0, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isRedEyeModePresent()Z
    .registers 2

    .prologue
    .line 65
    iget v0, p0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;->mState:I

    and-int/lit8 v0, v0, 0x40

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
