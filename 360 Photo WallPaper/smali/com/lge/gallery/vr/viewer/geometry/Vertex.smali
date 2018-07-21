.class public Lcom/lge/gallery/vr/viewer/geometry/Vertex;
.super Ljava/lang/Object;
.source "Vertex.java"


# instance fields
.field public x:F

.field public y:F

.field public z:F


# direct methods
.method public constructor <init>(FFF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    .line 19
    iput p2, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    .line 20
    iput p3, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    .line 21
    return-void
.end method


# virtual methods
.method public final getDistance()F
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->squre()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public final multiply(Lcom/lge/gallery/vr/viewer/geometry/Vertex;)F
    .registers 5
    .param p1, "vertex"    # Lcom/lge/gallery/vr/viewer/geometry/Vertex;

    .prologue
    .line 42
    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    iget v1, p1, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    iget v2, p1, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    iget v2, p1, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public final normalize()F
    .registers 3

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->getDistance()F

    move-result v0

    .line 25
    .local v0, "distance":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_18

    .line 26
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    .line 27
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    .line 28
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    div-float/2addr v1, v0

    iput v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    .line 30
    :cond_18
    return v0
.end method

.method public final squre()F
    .registers 4

    .prologue
    .line 38
    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->x:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->y:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Vertex;->z:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    return v0
.end method
