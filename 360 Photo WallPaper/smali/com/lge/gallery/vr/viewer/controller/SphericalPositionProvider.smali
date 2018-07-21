.class public Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;
.super Ljava/lang/Object;
.source "SphericalPositionProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$1;,
        Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;
    }
.end annotation


# static fields
.field private static final FLING_DECREASE_FACTOR:F = 0.95f

.field private static final FLING_MIN:F = 0.1f

.field private static final FLING_UNIT:F = 1200.0f

.field private static final MAX_Z:F


# instance fields
.field private mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

.field private final mDefaultZ:F

.field private mIsFixed:Z

.field private final mMaxDistance:F

.field private final mMinDistance:F

.field private mMinZ:F

.field private final mRadius:F

.field private mRemainPitch:F

.field private mRemainYaw:F

.field private mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;


# direct methods
.method public constructor <init>(F)V
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;-><init>(FZ)V

    .line 33
    return-void
.end method

.method public constructor <init>(FZ)V
    .registers 8
    .param p1, "radius"    # F
    .param p2, "isFixed"    # Z

    .prologue
    const/high16 v4, 0x42f00000    # 120.0f

    const/high16 v3, 0x42700000    # 60.0f

    const/4 v2, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;-><init>(Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$1;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    .line 36
    iput-boolean p2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mIsFixed:Z

    .line 37
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRadius:F

    .line 38
    const v0, 0x3fd9999a    # 1.7f

    mul-float/2addr v0, p1

    neg-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinZ:F

    .line 39
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    invoke-direct {v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;-><init>()V

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMinFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMaxFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setFov(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMaxYaw(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMinYaw(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    const/high16 v1, 0x42b40000    # 90.0f

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMaxPitch(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    const/high16 v1, -0x3d4c0000    # -90.0f

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->setMinPitch(F)Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;->create()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    .line 42
    iput v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinDistance:F

    .line 43
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMaxFov()F

    move-result v0

    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinZ:F

    invoke-direct {p0, v0, v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeCurrentDistance(FF)F

    move-result v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMaxDistance:F

    .line 44
    if-eqz p2, :cond_6b

    .line 45
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinZ:F

    .line 46
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mDefaultZ:F

    .line 47
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mDefaultZ:F

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setZ(F)V

    .line 48
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v0, v4}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setFov(F)V

    .line 53
    :goto_6a
    return-void

    .line 50
    :cond_6b
    const/high16 v0, 0x3fc00000    # 1.5f

    div-float v0, p1, v0

    neg-float v0, v0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mDefaultZ:F

    .line 51
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mDefaultZ:F

    invoke-direct {p0, v4, v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeCurrentDistance(FF)F

    move-result v0

    invoke-direct {p0, v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->adjustDistance(F)V

    goto :goto_6a
.end method

.method private adjustDistance(F)V
    .registers 7
    .param p1, "currentDistance"    # F

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 122
    const/4 v1, 0x0

    .line 123
    .local v1, "z":F
    const/4 v0, 0x0

    .line 124
    .local v0, "fov":F
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMaxFov()F

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gez v2, :cond_2b

    .line 125
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMinFov()F

    move-result v0

    .line 126
    sub-float v2, v0, p1

    div-float v1, v2, v0

    .line 134
    :goto_1a
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_58

    .line 135
    const/4 v1, 0x0

    .line 139
    :cond_20
    :goto_20
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setZ(F)V

    .line 140
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2, v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setFov(F)V

    .line 141
    return-void

    .line 127
    :cond_2b
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMaxFov()F

    move-result v2

    mul-float/2addr v2, v4

    invoke-static {p1, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gez v2, :cond_4d

    .line 128
    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRadius:F

    neg-float v1, v2

    .line 129
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMinFov()F

    move-result v2

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMaxFov()F

    move-result v3

    sub-float v3, p1, v3

    div-float/2addr v3, v4

    add-float v0, v2, v3

    goto :goto_1a

    .line 131
    :cond_4d
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getMaxFov()F

    move-result v0

    .line 132
    sub-float v2, v0, p1

    div-float v1, v2, v0

    goto :goto_1a

    .line 136
    :cond_58
    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinZ:F

    cmpg-float v2, v1, v2

    if-gez v2, :cond_20

    .line 137
    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinZ:F

    goto :goto_20
.end method

.method private calculateDistanceToDegree(FF)F
    .registers 5
    .param p1, "f"    # F
    .param p2, "total"    # F

    .prologue
    .line 156
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getFov()F

    move-result v0

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getZ()F

    move-result v1

    neg-float v1, v1

    mul-float/2addr v1, p1

    add-float/2addr v1, p1

    mul-float/2addr v0, v1

    div-float/2addr v0, p2

    return v0
.end method

.method private calculateRemained()V
    .registers 6

    .prologue
    const v4, 0x3f733333    # 0.95f

    const v3, 0x3dcccccd    # 0.1f

    const/4 v2, 0x0

    const v1, -0x42333333    # -0.1f

    .line 100
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    cmpg-float v0, v0, v3

    if-gez v0, :cond_18

    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_18

    .line 101
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    .line 103
    :cond_18
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    cmpg-float v0, v0, v3

    if-gez v0, :cond_26

    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_26

    .line 104
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    .line 106
    :cond_26
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    mul-float/2addr v0, v4

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    .line 107
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    mul-float/2addr v0, v4

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    .line 108
    return-void
.end method

.method private computeCurrentDistance(FF)F
    .registers 5
    .param p1, "fov"    # F
    .param p2, "z"    # F

    .prologue
    .line 118
    mul-float v0, p2, p1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRadius:F

    div-float/2addr v0, v1

    sub-float v0, p1, v0

    return v0
.end method


# virtual methods
.method public addPitch(F)V
    .registers 4
    .param p1, "p"    # F

    .prologue
    .line 71
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getPitch()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setPitch(F)V

    .line 72
    return-void
.end method

.method public addYaw(F)V
    .registers 4
    .param p1, "y"    # F

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getYaw()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setYaw(F)V

    .line 76
    return-void
.end method

.method public computeDistance(F)V
    .registers 4
    .param p1, "diff"    # F

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mIsFixed:Z

    if-eqz v0, :cond_5

    .line 115
    :goto_4
    return-void

    .line 114
    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v0}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getFov()F

    move-result v0

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getZ()F

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeCurrentDistance(FF)F

    move-result v0

    const/high16 v1, 0x40a00000    # 5.0f

    div-float v1, p1, v1

    add-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->adjustDistance(F)V

    goto :goto_4
.end method

.method public computeDistanceLazy(J)V
    .registers 6
    .param p1, "curTimeInMillis"    # J

    .prologue
    .line 144
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->isAnimating()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 145
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->stopAnimation()V

    .line 147
    :cond_d
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getFov()F

    move-result v1

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getZ()F

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->computeCurrentDistance(FF)F

    move-result v0

    .line 148
    .local v0, "currentDistance":F
    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinDistance:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-lez v1, :cond_2d

    .line 149
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMinDistance:F

    invoke-virtual {v1, v0, v2, p1, p2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->setStartTime(FFJ)V

    .line 153
    :goto_2c
    return-void

    .line 151
    :cond_2d
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mMaxDistance:F

    invoke-virtual {v1, v0, v2, p1, p2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->setStartTime(FFJ)V

    goto :goto_2c
.end method

.method public computeRotate(FFF)V
    .registers 7
    .param p1, "dx"    # F
    .param p2, "dy"    # F
    .param p3, "max"    # F

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mIsFixed:Z

    if-eqz v0, :cond_5

    .line 84
    :goto_4
    return-void

    .line 82
    :cond_5
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getPitch()F

    move-result v1

    invoke-direct {p0, p2, p3}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->calculateDistanceToDegree(FF)F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setPitch(F)V

    .line 83
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getYaw()F

    move-result v1

    invoke-direct {p0, p1, p3}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->calculateDistanceToDegree(FF)F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setYaw(F)V

    goto :goto_4
.end method

.method public computeRotateLazy(FF)V
    .registers 6
    .param p1, "velX"    # F
    .param p2, "velY"    # F

    .prologue
    const/high16 v2, 0x44960000    # 1200.0f

    .line 87
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mIsFixed:Z

    if-eqz v0, :cond_7

    .line 92
    :goto_6
    return-void

    .line 90
    :cond_7
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    div-float v1, p2, v2

    neg-float v1, v1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    .line 91
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    div-float v1, p1, v2

    neg-float v1, v1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    goto :goto_6
.end method

.method public getmCamera()Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    return-object v0
.end method

.method public stopLazyComputation()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 95
    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    .line 96
    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    .line 97
    return-void
.end method

.method public updatePosition(J)Z
    .registers 10
    .param p1, "currentTimeInMiils"    # J

    .prologue
    const/4 v1, 0x0

    const/4 v5, 0x0

    .line 56
    iget-boolean v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mIsFixed:Z

    if-eqz v2, :cond_7

    .line 66
    :cond_6
    :goto_6
    return v1

    .line 59
    :cond_7
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->calculateRemained()V

    .line 60
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getPitch()F

    move-result v3

    iget v4, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    add-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setPitch(F)V

    .line 61
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mCamera:Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;

    invoke-virtual {v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->getYaw()F

    move-result v3

    iget v4, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    add-float/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->setYaw(F)V

    .line 62
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    invoke-virtual {v2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->isAnimating()Z

    move-result v0

    .line 63
    .local v0, "needToRefresh":Z
    if-eqz v0, :cond_37

    .line 64
    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mScaleAnim:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;

    invoke-virtual {v2, p1, p2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->getInterpolation(J)F

    move-result v2

    invoke-direct {p0, v2}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->adjustDistance(F)V

    .line 66
    :cond_37
    if-nez v0, :cond_51

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    cmpl-float v2, v2, v5

    if-gtz v2, :cond_51

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    cmpl-float v2, v2, v5

    if-gtz v2, :cond_51

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainPitch:F

    cmpg-float v2, v2, v5

    if-ltz v2, :cond_51

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->mRemainYaw:F

    cmpg-float v2, v2, v5

    if-gez v2, :cond_6

    :cond_51
    const/4 v1, 0x1

    goto :goto_6
.end method
