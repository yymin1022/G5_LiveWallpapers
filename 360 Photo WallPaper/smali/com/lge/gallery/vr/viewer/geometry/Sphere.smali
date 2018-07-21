.class public Lcom/lge/gallery/vr/viewer/geometry/Sphere;
.super Ljava/lang/Object;
.source "Sphere.java"


# static fields
.field private static final FLOAT_SIZE:I = 0x4

.field private static final NUM_COLOR:I = 0x4

.field private static final NUM_COORD:I = 0x3

.field private static final NUM_NORMAL:I = 0x3

.field private static final NUM_TEXTURECOORD:I = 0x2


# instance fields
.field private mInterleavedBuffer:Ljava/nio/FloatBuffer;

.field private final mNumColor:I

.field private final mNumCoord:I

.field private final mNumNormal:I

.field private final mNumOfVertices:I

.field private final mNumTextureCoord:I

.field private mRadius:F

.field private mSlices:I

.field private mSquash:F

.field private mStacks:I

.field private final mStride:I

.field private mVBOHandle:[I


# direct methods
.method public constructor <init>(IIFFZZZ)V
    .registers 11
    .param p1, "stacks"    # I
    .param p2, "slices"    # I
    .param p3, "radius"    # F
    .param p4, "squash"    # F
    .param p5, "useNormal"    # Z
    .param p6, "useColor"    # Z
    .param p7, "useTexture"    # Z

    .prologue
    const/4 v0, 0x3

    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v2, 0x1

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mVBOHandle:[I

    .line 39
    iput v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    .line 40
    if-eqz p5, :cond_40

    :goto_e
    iput v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    .line 41
    if-eqz p6, :cond_42

    const/4 v0, 0x4

    :goto_13
    iput v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    .line 42
    if-eqz p7, :cond_18

    const/4 v1, 0x2

    :cond_18
    iput v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    .line 43
    iput p1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    .line 44
    iput p2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    .line 45
    iput p3, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    .line 46
    iput p4, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSquash:F

    .line 47
    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumOfVertices:I

    .line 48
    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStride:I

    .line 49
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->createVBO()V

    .line 50
    return-void

    :cond_40
    move v0, v1

    .line 40
    goto :goto_e

    :cond_42
    move v0, v1

    .line 41
    goto :goto_13
.end method

.method private createInterleavedData()V
    .registers 25

    .prologue
    .line 84
    const/4 v13, 0x0

    .line 85
    .local v13, "tempIndex":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    move/from16 v19, v0

    add-int v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    move/from16 v19, v0

    add-int v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    move/from16 v19, v0

    add-int v12, v18, v19

    .line 86
    .local v12, "size":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumOfVertices:I

    move/from16 v18, v0

    mul-int v18, v18, v12

    move/from16 v0, v18

    new-array v5, v0, [F

    .line 87
    .local v5, "interleavedArray":[F
    const/4 v8, 0x0

    .local v8, "phiIdx":I
    :goto_2c
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_235

    .line 88
    const v18, 0x40490fdb    # (float)Math.PI

    add-int/lit8 v19, v8, 0x0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    mul-float v19, v19, v20

    const/high16 v20, 0x3f000000    # 0.5f

    sub-float v19, v19, v20

    mul-float v6, v18, v19

    .line 89
    .local v6, "phi0":F
    const v18, 0x40490fdb    # (float)Math.PI

    add-int/lit8 v19, v8, 0x1

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    mul-float v19, v19, v20

    const/high16 v20, 0x3f000000    # 0.5f

    sub-float v19, v19, v20

    mul-float v7, v18, v19

    .line 90
    .local v7, "phi1":F
    float-to-double v0, v6

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v2, v0

    .line 91
    .local v2, "cosPhi0":F
    float-to-double v0, v6

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v9, v0

    .line 92
    .local v9, "sinPhi0":F
    float-to-double v0, v7

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v3, v0

    .line 93
    .local v3, "cosPhi1":F
    float-to-double v0, v7

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v10, v0

    .line 94
    .local v10, "sinPhi1":F
    const/4 v4, 0x0

    .line 95
    .local v4, "cosTheta":F
    const/4 v11, 0x0

    .line 96
    .local v11, "sinTheta":F
    const/16 v17, 0x0

    .local v17, "thetaIdx":I
    :goto_a4
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_231

    .line 97
    const v18, 0x40c90fdb

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v19, v0

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v18, v0

    const-wide/high16 v20, 0x3ff0000000000000L    # 1.0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    move/from16 v22, v0

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v22, v0

    div-double v20, v20, v22

    mul-double v18, v18, v20

    move-wide/from16 v0, v18

    double-to-float v0, v0

    move/from16 v16, v0

    .line 98
    .local v16, "theta":F
    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v4, v0

    .line 99
    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->sin(D)D

    move-result-wide v18

    move-wide/from16 v0, v18

    double-to-float v11, v0

    .line 101
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .local v14, "tempIndex":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v18, v0

    mul-float v18, v18, v2

    mul-float v18, v18, v4

    aput v18, v5, v13

    .line 102
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v19, v0

    mul-float v19, v19, v3

    mul-float v19, v19, v4

    aput v19, v5, v18

    .line 103
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSquash:F

    move/from16 v19, v0

    mul-float v19, v19, v9

    mul-float v18, v18, v19

    aput v18, v5, v14

    .line 104
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSquash:F

    move/from16 v20, v0

    mul-float v20, v20, v10

    mul-float v19, v19, v20

    aput v19, v5, v18

    .line 105
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .restart local v14    # "tempIndex":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v18, v0

    mul-float v19, v2, v11

    mul-float v18, v18, v19

    aput v18, v5, v13

    .line 106
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mRadius:F

    move/from16 v19, v0

    mul-float v20, v3, v11

    mul-float v19, v19, v20

    aput v19, v5, v18

    .line 108
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    move/from16 v18, v0

    if-eqz v18, :cond_240

    .line 109
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    mul-float v18, v2, v4

    aput v18, v5, v14

    .line 110
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    mul-float v19, v3, v4

    aput v19, v5, v18

    .line 111
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .restart local v14    # "tempIndex":I
    aput v9, v5, v13

    .line 112
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    aput v10, v5, v18

    .line 113
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    mul-float v18, v2, v11

    aput v18, v5, v14

    .line 114
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    mul-float v19, v3, v11

    aput v19, v5, v18

    .line 117
    :goto_188
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    move/from16 v18, v0

    if-eqz v18, :cond_1c8

    .line 118
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .restart local v14    # "tempIndex":I
    const/16 v18, 0x0

    aput v18, v5, v13

    .line 119
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    const/16 v19, 0x0

    aput v19, v5, v18

    .line 120
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    const/16 v18, 0x0

    aput v18, v5, v14

    .line 121
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    const/16 v19, 0x0

    aput v19, v5, v18

    .line 122
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .restart local v14    # "tempIndex":I
    const/16 v18, 0x0

    aput v18, v5, v13

    .line 123
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    const/16 v19, 0x0

    aput v19, v5, v18

    .line 124
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    const/16 v18, 0x0

    aput v18, v5, v14

    .line 125
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    const/16 v19, 0x0

    aput v19, v5, v18

    .line 128
    :cond_1c8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    move/from16 v18, v0

    if-eqz v18, :cond_22c

    .line 129
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v18, v0

    const/high16 v19, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    mul-float v15, v18, v19

    .line 130
    .local v15, "texX":F
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "tempIndex":I
    .restart local v14    # "tempIndex":I
    aput v15, v5, v13

    .line 131
    add-int v18, v12, v14

    add-int/lit8 v18, v18, -0x1

    aput v15, v5, v18

    .line 132
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    add-int/lit8 v18, v8, 0x0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    const/high16 v19, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    div-float v19, v19, v20

    mul-float v18, v18, v19

    aput v18, v5, v14

    .line 133
    add-int v18, v12, v13

    add-int/lit8 v18, v18, -0x1

    add-int/lit8 v19, v8, 0x1

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    mul-float v19, v19, v20

    aput v19, v5, v18

    .line 135
    .end local v15    # "texX":F
    :cond_22c
    add-int/2addr v13, v12

    .line 96
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_a4

    .line 87
    .end local v16    # "theta":F
    :cond_231
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2c

    .line 138
    .end local v2    # "cosPhi0":F
    .end local v3    # "cosPhi1":F
    .end local v4    # "cosTheta":F
    .end local v6    # "phi0":F
    .end local v7    # "phi1":F
    .end local v9    # "sinPhi0":F
    .end local v10    # "sinPhi1":F
    .end local v11    # "sinTheta":F
    .end local v17    # "thetaIdx":I
    :cond_235
    invoke-static {v5}, Lcom/lge/gallery/vr/viewer/util/GLHelper;->makeFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mInterleavedBuffer:Ljava/nio/FloatBuffer;

    .line 139
    return-void

    .end local v13    # "tempIndex":I
    .restart local v2    # "cosPhi0":F
    .restart local v3    # "cosPhi1":F
    .restart local v4    # "cosTheta":F
    .restart local v6    # "phi0":F
    .restart local v7    # "phi1":F
    .restart local v9    # "sinPhi0":F
    .restart local v10    # "sinPhi1":F
    .restart local v11    # "sinTheta":F
    .restart local v14    # "tempIndex":I
    .restart local v16    # "theta":F
    .restart local v17    # "thetaIdx":I
    :cond_240
    move v13, v14

    .end local v14    # "tempIndex":I
    .restart local v13    # "tempIndex":I
    goto/16 :goto_188
.end method


# virtual methods
.method public createVBO()V
    .registers 7

    .prologue
    const v5, 0x8892

    const/4 v4, 0x0

    .line 74
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    add-int v0, v1, v2

    .line 75
    .local v0, "size":I
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->createInterleavedData()V

    .line 76
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mVBOHandle:[I

    invoke-static {v1, v2, v4}, Landroid/opengl/GLES20;->glGenBuffers(I[II)V

    .line 77
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mVBOHandle:[I

    aget v1, v1, v4

    invoke-static {v5, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 78
    mul-int/lit8 v1, v0, 0x4

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumOfVertices:I

    mul-int/2addr v1, v2

    iget-object v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mInterleavedBuffer:Ljava/nio/FloatBuffer;

    const v3, 0x88e4

    invoke-static {v5, v1, v2, v3}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 80
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 81
    return-void
.end method

.method public draw(IIIII)V
    .registers 12
    .param p1, "vertexLocation"    # I
    .param p2, "normalLocation"    # I
    .param p3, "colorLocation"    # I
    .param p4, "textureLocation"    # I
    .param p5, "textureID"    # I

    .prologue
    const/16 v2, 0x1406

    const/4 v3, 0x0

    .line 54
    const/16 v0, 0xb44

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 55
    const/16 v0, 0x404

    invoke-static {v0}, Landroid/opengl/GLES20;->glCullFace(I)V

    .line 56
    const v0, 0x8892

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mVBOHandle:[I

    aget v1, v1, v3

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    .line 57
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    iget v4, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStride:I

    move v0, p1

    move v5, v3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 59
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 60
    if-ltz p3, :cond_37

    .line 61
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    iget v4, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStride:I

    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    iget v5, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    add-int/2addr v0, v5

    mul-int/lit8 v5, v0, 0x4

    move v0, p3

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 63
    invoke-static {p3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 65
    :cond_37
    if-ltz p4, :cond_50

    if-lez p5, :cond_50

    .line 66
    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumTextureCoord:I

    iget v4, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStride:I

    iget v0, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumCoord:I

    iget v5, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumColor:I

    add-int/2addr v0, v5

    iget v5, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mNumNormal:I

    add-int/2addr v0, v5

    mul-int/lit8 v5, v0, 0x4

    move v0, p4

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    .line 68
    invoke-static {p4}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 70
    :cond_50
    const/4 v0, 0x5

    iget v1, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mSlices:I

    add-int/lit8 v1, v1, 0x1

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/lge/gallery/vr/viewer/geometry/Sphere;->mStacks:I

    add-int/lit8 v2, v2, -0x1

    mul-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x2

    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 71
    return-void
.end method
