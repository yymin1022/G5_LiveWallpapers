.class public Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;
.super Ljava/lang/Object;
.source "VirtualCamera.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$1;,
        Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$Builder;
    }
.end annotation


# instance fields
.field private mCenterX:F

.field private mCenterY:F

.field private mCenterZ:F

.field private mFov:F

.field private final mMaxFov:F

.field private final mMaxPitch:F

.field private final mMaxYaw:F

.field private final mMinFov:F

.field private final mMinPitch:F

.field private final mMinYaw:F

.field private mPitch:F

.field private mRoll:F

.field private mX:F

.field private mY:F

.field private mYaw:F

.field private mZ:F


# direct methods
.method private constructor <init>(FFFFFFFFFFFFF)V
    .registers 14
    .param p1, "minPitch"    # F
    .param p2, "maxPitch"    # F
    .param p3, "minYaw"    # F
    .param p4, "maxYaw"    # F
    .param p5, "minFov"    # F
    .param p6, "maxFov"    # F
    .param p7, "x"    # F
    .param p8, "y"    # F
    .param p9, "z"    # F
    .param p10, "pitch"    # F
    .param p11, "yaw"    # F
    .param p12, "roll"    # F
    .param p13, "fov"    # F

    .prologue
    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinPitch:F

    .line 137
    iput p2, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxPitch:F

    .line 138
    iput p3, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinYaw:F

    .line 139
    iput p4, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxYaw:F

    .line 140
    iput p5, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinFov:F

    .line 141
    iput p6, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxFov:F

    .line 142
    iput p7, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mX:F

    .line 143
    iput p8, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mY:F

    .line 144
    iput p9, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mZ:F

    .line 145
    iput p10, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mPitch:F

    .line 146
    iput p11, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mYaw:F

    .line 147
    iput p12, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mRoll:F

    .line 148
    iput p13, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mFov:F

    .line 149
    return-void
.end method

.method synthetic constructor <init>(FFFFFFFFFFFFFLcom/lge/gallery/vr/viewer/controller/VirtualCamera$1;)V
    .registers 15
    .param p1, "x0"    # F
    .param p2, "x1"    # F
    .param p3, "x2"    # F
    .param p4, "x3"    # F
    .param p5, "x4"    # F
    .param p6, "x5"    # F
    .param p7, "x6"    # F
    .param p8, "x7"    # F
    .param p9, "x8"    # F
    .param p10, "x9"    # F
    .param p11, "x10"    # F
    .param p12, "x11"    # F
    .param p13, "x12"    # F
    .param p14, "x13"    # Lcom/lge/gallery/vr/viewer/controller/VirtualCamera$1;

    .prologue
    .line 12
    invoke-direct/range {p0 .. p13}, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;-><init>(FFFFFFFFFFFFF)V

    return-void
.end method


# virtual methods
.method public getCenterX()F
    .registers 2

    .prologue
    .line 223
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterX:F

    return v0
.end method

.method public getCenterY()F
    .registers 2

    .prologue
    .line 231
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterY:F

    return v0
.end method

.method public getCenterZ()F
    .registers 2

    .prologue
    .line 239
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterZ:F

    return v0
.end method

.method public getFov()F
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mFov:F

    return v0
.end method

.method public getMaxFov()F
    .registers 2

    .prologue
    .line 267
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxFov:F

    return v0
.end method

.method public getMaxPitch()F
    .registers 2

    .prologue
    .line 251
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxPitch:F

    return v0
.end method

.method public getMaxYaw()F
    .registers 2

    .prologue
    .line 259
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxYaw:F

    return v0
.end method

.method public getMinFov()F
    .registers 2

    .prologue
    .line 263
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinFov:F

    return v0
.end method

.method public getMinPitch()F
    .registers 2

    .prologue
    .line 247
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinPitch:F

    return v0
.end method

.method public getMinYaw()F
    .registers 2

    .prologue
    .line 255
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinYaw:F

    return v0
.end method

.method public getPitch()F
    .registers 2

    .prologue
    .line 152
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mPitch:F

    return v0
.end method

.method public getRoll()F
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mRoll:F

    return v0
.end method

.method public getX()F
    .registers 2

    .prologue
    .line 199
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mX:F

    return v0
.end method

.method public getY()F
    .registers 2

    .prologue
    .line 207
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mY:F

    return v0
.end method

.method public getYaw()F
    .registers 2

    .prologue
    .line 165
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mYaw:F

    return v0
.end method

.method public getZ()F
    .registers 2

    .prologue
    .line 215
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mZ:F

    return v0
.end method

.method setCenterX(F)V
    .registers 2
    .param p1, "centerX"    # F

    .prologue
    .line 227
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterX:F

    .line 228
    return-void
.end method

.method setCenterY(F)V
    .registers 2
    .param p1, "centerY"    # F

    .prologue
    .line 235
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterY:F

    .line 236
    return-void
.end method

.method setCenterZ(F)V
    .registers 2
    .param p1, "centerZ"    # F

    .prologue
    .line 243
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mCenterZ:F

    .line 244
    return-void
.end method

.method setFov(F)V
    .registers 3
    .param p1, "fov"    # F

    .prologue
    .line 190
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxFov:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_b

    .line 191
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxFov:F

    .line 195
    :cond_8
    :goto_8
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mFov:F

    .line 196
    return-void

    .line 192
    :cond_b
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinFov:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 193
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinFov:F

    goto :goto_8
.end method

.method setPitch(F)V
    .registers 3
    .param p1, "pitch"    # F

    .prologue
    .line 156
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxPitch:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_b

    .line 157
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxPitch:F

    .line 161
    :cond_8
    :goto_8
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mPitch:F

    .line 162
    return-void

    .line 158
    :cond_b
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinPitch:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 159
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinPitch:F

    goto :goto_8
.end method

.method setRoll(F)V
    .registers 2
    .param p1, "roll"    # F

    .prologue
    .line 182
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mRoll:F

    .line 183
    return-void
.end method

.method setX(F)V
    .registers 2
    .param p1, "x"    # F

    .prologue
    .line 203
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mX:F

    .line 204
    return-void
.end method

.method setY(F)V
    .registers 2
    .param p1, "y"    # F

    .prologue
    .line 211
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mY:F

    .line 212
    return-void
.end method

.method public setYaw(F)V
    .registers 3
    .param p1, "yaw"    # F

    .prologue
    .line 169
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxYaw:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_b

    .line 170
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinYaw:F

    .line 174
    :cond_8
    :goto_8
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mYaw:F

    .line 175
    return-void

    .line 171
    :cond_b
    iget v0, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMinYaw:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 172
    iget p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mMaxYaw:F

    goto :goto_8
.end method

.method setZ(F)V
    .registers 2
    .param p1, "z"    # F

    .prologue
    .line 219
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/VirtualCamera;->mZ:F

    .line 220
    return-void
.end method
