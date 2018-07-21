.class public Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
.super Ljava/lang/Object;
.source "VirtualCamera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mCenterX:F

.field private mCenterY:F

.field private mCenterZ:F

.field private mFov:F

.field private mMaxFov:F

.field private mMaxPitch:F

.field private mMaxYaw:F

.field private mMinFov:F

.field private mMinPitch:F

.field private mMinYaw:F

.field private mPitch:F

.field private mRoll:F

.field private mX:F

.field private mY:F

.field private mYaw:F

.field private mZ:F


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
    .registers 16

    .prologue
    .line 49
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinPitch:F

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxPitch:F

    iget v3, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinYaw:F

    iget v4, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxYaw:F

    iget v5, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinFov:F

    iget v6, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxFov:F

    iget v7, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mX:F

    iget v8, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mY:F

    iget v9, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mZ:F

    iget v10, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mPitch:F

    iget v11, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mYaw:F

    iget v12, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mRoll:F

    iget v13, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mFov:F

    const/4 v14, 0x0

    invoke-direct/range {v0 .. v14}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;-><init>(FFFFFFFFFFFFFLcom/lge/gallery/vr/viewer/controller/VirtualCamera$1;)V

    return-object v0
.end method

.method public setCenterX(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "centerX"    # F

    .prologue
    .line 99
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mCenterX:F

    .line 100
    return-object p0
.end method

.method public setCenterY(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "centerY"    # F

    .prologue
    .line 104
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mCenterY:F

    .line 105
    return-object p0
.end method

.method public setCenterZ(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "centerZ"    # F

    .prologue
    .line 109
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mCenterZ:F

    .line 110
    return-object p0
.end method

.method public setFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "fov"    # F

    .prologue
    .line 129
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mFov:F

    .line 130
    return-object p0
.end method

.method public setMaxFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "maxFov"    # F

    .prologue
    .line 79
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxFov:F

    .line 80
    return-object p0
.end method

.method public setMaxPitch(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "maxPitch"    # F

    .prologue
    .line 59
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxPitch:F

    .line 60
    return-object p0
.end method

.method public setMaxYaw(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "maxYaw"    # F

    .prologue
    .line 69
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMaxYaw:F

    .line 70
    return-object p0
.end method

.method public setMinFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "minFov"    # F

    .prologue
    .line 74
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinFov:F

    .line 75
    return-object p0
.end method

.method public setMinPitch(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "minPitch"    # F

    .prologue
    .line 54
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinPitch:F

    .line 55
    return-object p0
.end method

.method public setMinYaw(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "minYaw"    # F

    .prologue
    .line 64
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mMinYaw:F

    .line 65
    return-object p0
.end method

.method public setPitch(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "pitch"    # F

    .prologue
    .line 114
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mPitch:F

    .line 115
    return-object p0
.end method

.method public setRoll(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "roll"    # F

    .prologue
    .line 124
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mRoll:F

    .line 125
    return-object p0
.end method

.method public setX(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "x"    # F

    .prologue
    .line 84
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mX:F

    .line 85
    return-object p0
.end method

.method public setY(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "y"    # F

    .prologue
    .line 89
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mY:F

    .line 90
    return-object p0
.end method

.method public setYaw(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "yaw"    # F

    .prologue
    .line 119
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mYaw:F

    .line 120
    return-object p0
.end method

.method public setZ(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    .registers 2
    .param p1, "z"    # F

    .prologue
    .line 94
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->mZ:F

    .line 95
    return-object p0
.end method
