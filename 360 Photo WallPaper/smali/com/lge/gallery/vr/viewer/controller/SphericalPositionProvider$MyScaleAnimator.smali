.class Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;
.super Ljava/lang/Object;
.source "SphericalPositionProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyScaleAnimator"
.end annotation


# static fields
.field private static final ANIM_NOT_NEEDED:J = -0x1L

.field private static final ANIM_TIME_SCALE:J = 0xfaL


# instance fields
.field private mCurrentPos:F

.field private mEndPos:F

.field private mScaleInterpolator:Landroid/animation/TimeInterpolator;

.field private mStartPos:F

.field private mStartTime:J


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    .line 170
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mScaleInterpolator:Landroid/animation/TimeInterpolator;

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$1;

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;-><init>()V

    return-void
.end method


# virtual methods
.method getInterpolation(J)F
    .registers 10
    .param p1, "currTime"    # J

    .prologue
    const-wide/16 v4, -0x1

    const/high16 v1, -0x40800000    # -1.0f

    .line 185
    iget-wide v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_b

    .line 198
    :cond_a
    :goto_a
    return v1

    .line 188
    :cond_b
    iget-wide v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    sub-long v2, p1, v2

    long-to-float v2, v2

    const/high16 v3, 0x437a0000    # 250.0f

    div-float v0, v2, v3

    .line 189
    .local v0, "current":F
    const/4 v2, 0x0

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-ltz v2, :cond_23

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-ltz v2, :cond_28

    .line 190
    :cond_23
    iput-wide v4, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    .line 191
    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mEndPos:F

    goto :goto_a

    .line 194
    :cond_28
    const v2, 0x3c75c28f    # 0.015f

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-ltz v2, :cond_a

    .line 197
    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartPos:F

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mEndPos:F

    iget v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartPos:F

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mScaleInterpolator:Landroid/animation/TimeInterpolator;

    invoke-interface {v3, v0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    iput v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mCurrentPos:F

    .line 198
    iget v1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mCurrentPos:F

    goto :goto_a
.end method

.method isAnimating()Z
    .registers 5

    .prologue
    .line 202
    iget-wide v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method setStartTime(FFJ)V
    .registers 6
    .param p1, "start"    # F
    .param p2, "end"    # F
    .param p3, "time"    # J

    .prologue
    .line 173
    iput-wide p3, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    .line 174
    iput p1, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartPos:F

    .line 175
    iput p2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mEndPos:F

    .line 176
    return-void
.end method

.method stopAnimation()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 179
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartTime:J

    .line 180
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mStartPos:F

    .line 181
    iput v2, p0, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider$MyScaleAnimator;->mEndPos:F

    .line 182
    return-void
.end method
