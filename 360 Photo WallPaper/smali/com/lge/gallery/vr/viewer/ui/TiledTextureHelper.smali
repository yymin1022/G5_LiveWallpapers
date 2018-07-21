.class public Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;
.super Ljava/lang/Object;
.source "TiledTextureHelper.java"


# static fields
.field private static final PI_DIV_BY_2:F = 1.5707964f

.field private static final TAG:Ljava/lang/String;

.field private static final TWO_PI:F = 6.2831855f


# instance fields
.field private mTexturePool:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray",
            "<",
            "Lcom/lge/gallery/vr/viewer/ui/TiledTexture;",
            ">;"
        }
    .end annotation
.end field

.field private mTileHeightCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-class v0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    return-void
.end method

.method private genrateTextures(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;[[Lcom/lge/gallery/vr/viewer/data/Point;ILcom/lge/gallery/vr/viewer/data/TileProvider;)V
    .registers 21
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "points"    # [[Lcom/lge/gallery/vr/viewer/data/Point;
    .param p3, "tessellation"    # I
    .param p4, "provider"    # Lcom/lge/gallery/vr/viewer/data/TileProvider;

    .prologue
    .line 80
    invoke-interface/range {p4 .. p4}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getWidthTileCount()I

    move-result v11

    .line 81
    .local v11, "widthTileCount":I
    invoke-interface/range {p4 .. p4}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getHeightTileCount()I

    move-result v3

    .line 82
    .local v3, "heightTileCount":I
    filled-new-array {v11, v3}, [I

    move-result-object v12

    const-class v13, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    invoke-static {v13, v12}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [[Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    .line 83
    .local v9, "textures":[[Lcom/lge/gallery/vr/viewer/ui/TiledTexture;
    const/4 v2, 0x0

    .line 84
    .local v2, "heightOffset":I
    const/4 v10, 0x0

    .line 85
    .local v10, "widthOffset":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_17
    if-ge v2, v3, :cond_70

    .line 86
    const/4 v10, 0x0

    .line 87
    const/4 v5, 0x0

    .local v5, "jk":I
    :goto_1b
    if-ge v10, v11, :cond_6b

    .line 88
    aget-object v12, v9, v10

    new-instance v13, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    mul-int v14, v10, v3

    add-int/2addr v14, v2

    move/from16 v0, p3

    invoke-direct {v13, v14, v0}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;-><init>(II)V

    aput-object v13, v12, v2

    .line 90
    aget-object v12, v9, v10

    aget-object v12, v12, v2

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->setAssociatedCanvas(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V

    .line 91
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .local v8, "pointList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/vr/viewer/data/Point;>;"
    const/4 v6, 0x0

    .local v6, "lm":I
    :goto_3a
    add-int/lit8 v12, p3, 0x1

    if-ge v6, v12, :cond_54

    .line 93
    const/4 v7, 0x0

    .local v7, "n":I
    :goto_3f
    add-int/lit8 v12, p3, 0x1

    if-ge v7, v12, :cond_51

    .line 94
    add-int v12, v5, v7

    aget-object v12, p2, v12

    add-int v13, v4, v6

    aget-object v12, v12, v13

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    add-int/lit8 v7, v7, 0x1

    goto :goto_3f

    .line 92
    :cond_51
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a

    .line 97
    .end local v7    # "n":I
    :cond_54
    aget-object v12, v9, v10

    aget-object v13, v12, v2

    const/4 v12, 0x0

    new-array v12, v12, [Lcom/lge/gallery/vr/viewer/data/Point;

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Lcom/lge/gallery/vr/viewer/data/Point;

    check-cast v12, [Lcom/lge/gallery/vr/viewer/data/Point;

    invoke-virtual {v13, v12}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->fillVertext([Lcom/lge/gallery/vr/viewer/data/Point;)V

    .line 98
    add-int/lit8 v10, v10, 0x1

    .line 87
    add-int v5, v5, p3

    goto :goto_1b

    .line 100
    .end local v6    # "lm":I
    .end local v8    # "pointList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/vr/viewer/data/Point;>;"
    :cond_6b
    add-int/lit8 v2, v2, 0x1

    .line 85
    add-int v4, v4, p3

    goto :goto_17

    .line 102
    .end local v5    # "jk":I
    :cond_70
    const/4 v4, 0x0

    :goto_71
    if-ge v4, v11, :cond_8f

    .line 103
    const/4 v5, 0x0

    .restart local v5    # "jk":I
    :goto_74
    if-ge v5, v3, :cond_8c

    .line 104
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-interface/range {p4 .. p4}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getCurrentTileLevel()I

    move-result v13

    invoke-static {v4, v5, v13}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->makeTileKey(III)J

    move-result-wide v14

    aget-object v13, v9, v4

    aget-object v13, v13, v5

    invoke-virtual {v12, v14, v15, v13}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    .line 103
    add-int/lit8 v5, v5, 0x1

    goto :goto_74

    .line 102
    :cond_8c
    add-int/lit8 v4, v4, 0x1

    goto :goto_71

    .line 107
    .end local v5    # "jk":I
    :cond_8f
    return-void
.end method

.method private static makeTileKey(III)J
    .registers 10
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "level"    # I

    .prologue
    const/16 v6, 0x10

    .line 140
    int-to-long v0, p0

    .line 141
    .local v0, "result":J
    shl-long v2, v0, v6

    int-to-long v4, p1

    or-long v0, v2, v4

    .line 142
    shl-long v2, v0, v6

    int-to-long v4, p2

    or-long v0, v2, v4

    .line 143
    return-wide v0
.end method


# virtual methods
.method public clone()Landroid/util/LongSparseArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/LongSparseArray",
            "<",
            "Lcom/lge/gallery/vr/viewer/ui/TiledTexture;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clone()Landroid/util/LongSparseArray;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->clone()Landroid/util/LongSparseArray;

    move-result-object v0

    return-object v0
.end method

.method public countTextures()I
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    return v0
.end method

.method public declared-synchronized getTexture(I)Lcom/lge/gallery/vr/viewer/ui/TiledTexture;
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 136
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized loadTexture(Lcom/lge/gallery/vr/viewer/data/Tile;)V
    .registers 6
    .param p1, "tile"    # Lcom/lge/gallery/vr/viewer/data/Tile;

    .prologue
    .line 118
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lcom/lge/gallery/vr/viewer/data/Tile;->getHorizontalOffset()I

    move-result v1

    iget v2, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTileHeightCount:I

    invoke-virtual {p1}, Lcom/lge/gallery/vr/viewer/data/Tile;->getVerticalOffset()I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p1}, Lcom/lge/gallery/vr/viewer/data/Tile;->getLevel()I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->makeTileKey(III)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    invoke-virtual {v0, p1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->setTile(Lcom/lge/gallery/vr/viewer/data/Tile;)V
    :try_end_21
    .catchall {:try_start_1 .. :try_end_21} :catchall_23

    .line 121
    monitor-exit p0

    return-void

    .line 118
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public prepareTiles(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/data/TileProvider;Lcom/lge/gallery/vr/viewer/data/VrImage;F)V
    .registers 43
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "provider"    # Lcom/lge/gallery/vr/viewer/data/TileProvider;
    .param p3, "image"    # Lcom/lge/gallery/vr/viewer/data/VrImage;
    .param p4, "distance"    # F

    .prologue
    .line 33
    invoke-interface/range {p2 .. p2}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getWidthTileCount()I

    move-result v32

    .line 34
    .local v32, "widthTileCount":I
    invoke-interface/range {p2 .. p2}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getHeightTileCount()I

    move-result v10

    .line 35
    .local v10, "heightTileCount":I
    move-object/from16 v0, p0

    iput v10, v0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTileHeightCount:I

    .line 36
    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getPhotoSphereMetaData()Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    move-result-object v19

    .line 37
    .local v19, "metaData":Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    move-object/from16 v0, v19

    iget v8, v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->fullPanoWidthPixels:I

    .line 38
    .local v8, "fullPanoWidth":I
    invoke-interface/range {p2 .. p2}, Lcom/lge/gallery/vr/viewer/data/TileProvider;->getTileSize()I

    move-result v33

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    int-to-float v0, v8

    move/from16 v34, v0

    div-float v33, v33, v34

    const v34, 0x40c90fdb

    mul-float v25, v33, v34

    .line 39
    .local v25, "tileUnit":F
    const v33, 0x3d4ccccd    # 0.05f

    div-float v33, v25, v33

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v34

    move-wide/from16 v0, v34

    double-to-int v0, v0

    move/from16 v23, v0

    .line 40
    .local v23, "tessel":I
    mul-int v33, v23, v32

    add-int/lit8 v27, v33, 0x1

    .line 41
    .local v27, "totalHorizontalVertexCount":I
    mul-int v33, v23, v10

    add-int/lit8 v28, v33, 0x1

    .line 42
    .local v28, "totalVerticalVertexCount":I
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v33, v0

    div-float v26, v25, v33

    .line 43
    .local v26, "tileWidth":F
    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v33, v0

    div-float v24, v25, v33

    .line 44
    .local v24, "tileHeight":F
    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getHorizontalCircumference()F

    move-result v33

    add-int/lit8 v34, v32, -0x1

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    mul-float v34, v34, v25

    sub-float v16, v33, v34

    .line 45
    .local v16, "lastTileWidth":F
    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getVerticalCircumference()F

    move-result v33

    add-int/lit8 v34, v10, -0x1

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    mul-float v34, v34, v25

    sub-float v14, v33, v34

    .line 46
    .local v14, "lastTileHeight":F
    div-float v17, v16, v25

    .line 47
    .local v17, "lastTileWidthRatio":F
    div-float v15, v14, v25

    .line 48
    .local v15, "lastTileHeightRatio":F
    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getVerticalStartPos()F

    move-result v33

    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getVerticalCircumference()F

    move-result v34

    add-float v33, v33, v34

    const v34, 0x3fc90fdb

    sub-float v30, v33, v34

    .line 49
    .local v30, "verticalStart":F
    invoke-virtual/range {p3 .. p3}, Lcom/lge/gallery/vr/viewer/data/VrImage;->getHorizontalStartPos()F

    move-result v33

    move/from16 v0, v33

    neg-float v11, v0

    .line 50
    .local v11, "horizontalStart":F
    sub-int v33, v27, v23

    add-int/lit8 v18, v33, -0x1

    .line 51
    .local v18, "maxVert":I
    sget-object v33, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->TAG:Ljava/lang/String;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "tileUnit = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", tessel = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", tw = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", th = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", ltw = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", lth = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", hs = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    const-string v35, ", vs = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    filled-new-array/range {v27 .. v28}, [I

    move-result-object v33

    const-class v34, Lcom/lge/gallery/vr/viewer/data/Point;

    move-object/from16 v0, v34

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [[Lcom/lge/gallery/vr/viewer/data/Point;

    .line 54
    .local v20, "pointArray":[[Lcom/lge/gallery/vr/viewer/data/Point;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_117
    move/from16 v0, v28

    if-ge v12, v0, :cond_1ae

    .line 55
    const/16 v29, 0x0

    .line 56
    .local v29, "vPos":F
    move/from16 v0, v23

    if-ge v12, v0, :cond_19e

    .line 57
    int-to-float v0, v12

    move/from16 v33, v0

    mul-float v34, v24, v15

    mul-float v33, v33, v34

    sub-float v29, v33, v30

    .line 61
    :goto_12a
    const/4 v13, 0x0

    .local v13, "jk":I
    :goto_12b
    move/from16 v0, v27

    if-ge v13, v0, :cond_1aa

    .line 62
    int-to-float v0, v13

    move/from16 v33, v0

    mul-float v31, v33, v26

    .line 63
    .local v31, "widthDist":F
    move/from16 v0, v18

    if-le v13, v0, :cond_14c

    .line 64
    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v33, v0

    mul-float v33, v33, v26

    sub-int v34, v13, v18

    move/from16 v0, v34

    int-to-float v0, v0

    move/from16 v34, v0

    mul-float v35, v26, v17

    mul-float v34, v34, v35

    add-float v31, v33, v34

    .line 66
    :cond_14c
    const v33, 0x3fc90fdb

    sub-float v33, v31, v33

    const v34, 0x40490fdb    # (float)Math.PI

    sub-float v34, v11, v34

    sub-float v9, v33, v34

    .line 67
    .local v9, "hPos":F
    move/from16 v0, v29

    float-to-double v0, v0

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->sin(D)D

    move-result-wide v34

    move-wide/from16 v0, v34

    double-to-float v0, v0

    move/from16 v21, v0

    .line 68
    .local v21, "sinTheta":F
    float-to-double v0, v9

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->sin(D)D

    move-result-wide v34

    move-wide/from16 v0, v34

    double-to-float v0, v0

    move/from16 v22, v0

    .line 69
    .local v22, "sinTheta2":F
    move/from16 v0, v29

    float-to-double v0, v0

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    move-wide/from16 v0, v34

    double-to-float v6, v0

    .line 70
    .local v6, "cosTheta":F
    float-to-double v0, v9

    move-wide/from16 v34, v0

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    move-wide/from16 v0, v34

    double-to-float v7, v0

    .line 71
    .local v7, "cosTheta2":F
    aget-object v33, v20, v13

    new-instance v34, Lcom/lge/gallery/vr/viewer/data/Point;

    mul-float v35, v6, v7

    mul-float v35, v35, p4

    mul-float v36, v21, p4

    mul-float v37, v22, v6

    mul-float v37, v37, p4

    invoke-direct/range {v34 .. v37}, Lcom/lge/gallery/vr/viewer/data/Point;-><init>(FFF)V

    aput-object v34, v33, v12

    .line 61
    add-int/lit8 v13, v13, 0x1

    goto :goto_12b

    .line 59
    .end local v6    # "cosTheta":F
    .end local v7    # "cosTheta2":F
    .end local v9    # "hPos":F
    .end local v13    # "jk":I
    .end local v21    # "sinTheta":F
    .end local v22    # "sinTheta2":F
    .end local v31    # "widthDist":F
    :cond_19e
    int-to-float v0, v12

    move/from16 v33, v0

    mul-float v33, v33, v24

    sub-float v33, v33, v30

    sub-float v34, v25, v14

    sub-float v29, v33, v34

    goto :goto_12a

    .line 54
    .restart local v13    # "jk":I
    :cond_1aa
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_117

    .line 75
    .end local v13    # "jk":I
    .end local v29    # "vPos":F
    :cond_1ae
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    move/from16 v3, v23

    move-object/from16 v4, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->genrateTextures(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;[[Lcom/lge/gallery/vr/viewer/data/Point;ILcom/lge/gallery/vr/viewer/data/TileProvider;)V

    .line 76
    return-void
.end method

.method public declared-synchronized unloadAll()V
    .registers 3

    .prologue
    .line 124
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 125
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v1, v0}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    invoke-virtual {v1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->unload()V
    :try_end_15
    .catchall {:try_start_2 .. :try_end_15} :catchall_1a

    .line 124
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 127
    :cond_18
    monitor-exit p0

    return-void

    .line 124
    :catchall_1a
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized uploadAll(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V
    .registers 4
    .param p1, "canvas"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    .line 130
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    :try_start_2
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 131
    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/ui/TiledTextureHelper;->mTexturePool:Landroid/util/LongSparseArray;

    invoke-virtual {v1, v0}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;

    invoke-virtual {v1, p1}, Lcom/lge/gallery/vr/viewer/ui/TiledTexture;->upload(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)I
    :try_end_15
    .catchall {:try_start_2 .. :try_end_15} :catchall_1a

    .line 130
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 133
    :cond_18
    monitor-exit p0

    return-void

    .line 130
    :catchall_1a
    move-exception v1

    monitor-exit p0

    throw v1
.end method
