.class public Lcom/lge/gallery/data/util/BitmapPool;
.super Ljava/lang/Object;
.source "BitmapPool.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BitmapPool"


# instance fields
.field private final mHeight:I

.field private final mOneSize:Z

.field private final mPool:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final mPoolLimit:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "poolLimit"    # I

    .prologue
    const/4 v0, -0x1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mWidth:I

    .line 53
    iput v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mHeight:I

    .line 54
    iput p1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPoolLimit:I

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    .line 57
    return-void
.end method

.method public constructor <init>(III)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "poolLimit"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mWidth:I

    .line 45
    iput p2, p0, Lcom/lge/gallery/data/util/BitmapPool;->mHeight:I

    .line 46
    iput p3, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPoolLimit:I

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    .line 49
    return-void
.end method

.method private findCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    if-eqz v0, :cond_9

    .line 114
    invoke-virtual {p0}, Lcom/lge/gallery/data/util/BitmapPool;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 117
    :goto_8
    return-object v0

    .line 116
    :cond_9
    invoke-static {p1, p2, p3}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeBounds(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)V

    .line 117
    iget v0, p3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, p3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/lge/gallery/data/util/BitmapPool;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_8
.end method

.method private findCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 8
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "data"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    if-eqz v0, :cond_9

    .line 105
    invoke-virtual {p0}, Lcom/lge/gallery/data/util/BitmapPool;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 108
    :goto_8
    return-object v0

    .line 107
    :cond_9
    invoke-static {p1, p2, p3, p4, p5}, Lcom/lge/gallery/data/util/DecodeUtils;->decodeBounds(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)V

    .line 108
    iget v0, p5, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, p5, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/lge/gallery/data/util/BitmapPool;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_8
.end method


# virtual methods
.method public declared-synchronized clear()V
    .registers 2

    .prologue
    .line 99
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 100
    monitor-exit p0

    return-void

    .line 99
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public decode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 9
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "fileDescriptor"    # Ljava/io/FileDescriptor;
    .param p3, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 153
    if-nez p3, :cond_9

    .line 154
    new-instance p3, Landroid/graphics/BitmapFactory$Options;

    .end local p3    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 156
    .restart local p3    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_9
    iget v2, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ge v2, v4, :cond_f

    .line 157
    iput v4, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 159
    :cond_f
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 160
    iget v2, p3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ne v2, v4, :cond_32

    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/data/util/BitmapPool;->findCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    :goto_1b
    iput-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 163
    :try_start_1d
    invoke-static {p1, p2, p3}, Lcom/lge/gallery/data/util/DecodeUtils;->decode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 164
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_31

    iget-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eq v2, v0, :cond_31

    .line 165
    iget-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2}, Lcom/lge/gallery/data/util/BitmapPool;->recycle(Landroid/graphics/Bitmap;)V

    .line 166
    const/4 v2, 0x0

    iput-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
    :try_end_31
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d .. :try_end_31} :catch_34

    .line 176
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_31
    :goto_31
    return-object v0

    :cond_32
    move-object v2, v3

    .line 160
    goto :goto_1b

    .line 169
    :catch_34
    move-exception v1

    .line 170
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    iget-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_3a

    .line 171
    throw v1

    .line 173
    :cond_3a
    const-string v2, "BitmapPool"

    const-string v4, "decode fail with a given bitmap, try decode to a new bitmap"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v2, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2}, Lcom/lge/gallery/data/util/BitmapPool;->recycle(Landroid/graphics/Bitmap;)V

    .line 175
    iput-object v3, p3, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 176
    invoke-static {p1, p2, p3}, Lcom/lge/gallery/data/util/DecodeUtils;->decode(Lcom/lge/gallery/util/ThreadPool$JobContext;Ljava/io/FileDescriptor;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_31
.end method

.method public decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;
    .param p2, "data"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I
    .param p5, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 122
    if-nez p5, :cond_9

    .line 123
    new-instance p5, Landroid/graphics/BitmapFactory$Options;

    .end local p5    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {p5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 125
    .restart local p5    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_9
    iget v2, p5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ge v2, v4, :cond_f

    .line 126
    iput v4, p5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 128
    :cond_f
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 129
    iget v2, p5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ne v2, v4, :cond_32

    invoke-direct/range {p0 .. p5}, Lcom/lge/gallery/data/util/BitmapPool;->findCachedBitmap(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    :goto_1b
    iput-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 132
    :try_start_1d
    invoke-static {p1, p2, p3, p4, p5}, Lcom/lge/gallery/data/util/DecodeUtils;->decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 133
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_31

    iget-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-eq v2, v0, :cond_31

    .line 134
    iget-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2}, Lcom/lge/gallery/data/util/BitmapPool;->recycle(Landroid/graphics/Bitmap;)V

    .line 135
    const/4 v2, 0x0

    iput-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
    :try_end_31
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d .. :try_end_31} :catch_34

    .line 145
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_31
    :goto_31
    return-object v0

    :cond_32
    move-object v2, v3

    .line 129
    goto :goto_1b

    .line 138
    :catch_34
    move-exception v1

    .line 139
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    iget-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_3a

    .line 140
    throw v1

    .line 142
    :cond_3a
    const-string v2, "BitmapPool"

    const-string v4, "decode fail with a given bitmap, try decode to a new bitmap"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v2, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2}, Lcom/lge/gallery/data/util/BitmapPool;->recycle(Landroid/graphics/Bitmap;)V

    .line 144
    iput-object v3, p5, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 145
    invoke-static {p1, p2, p3, p4, p5}, Lcom/lge/gallery/data/util/DecodeUtils;->decode(Lcom/lge/gallery/util/ThreadPool$JobContext;[BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_31
.end method

.method public declared-synchronized getBitmap()Landroid/graphics/Bitmap;
    .registers 4

    .prologue
    .line 61
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 62
    iget-object v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 63
    .local v0, "size":I
    if-lez v0, :cond_1a

    iget-object v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1c

    :goto_18
    monitor-exit p0

    return-object v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_18

    .line 61
    .end local v0    # "size":I
    :catchall_1c
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getBitmap(II)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 68
    monitor-enter p0

    :try_start_1
    iget-boolean v2, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    if-nez v2, :cond_31

    const/4 v2, 0x1

    :goto_6
    invoke-static {v2}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 69
    iget-object v2, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_11
    if-ltz v1, :cond_36

    .line 70
    iget-object v2, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 71
    .local v0, "b":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v2, p1, :cond_33

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ne v2, p2, :cond_33

    .line 72
    iget-object v2, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;
    :try_end_2f
    .catchall {:try_start_1 .. :try_end_2f} :catchall_38

    .line 75
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :goto_2f
    monitor-exit p0

    return-object v2

    .line 68
    .end local v1    # "i":I
    :cond_31
    const/4 v2, 0x0

    goto :goto_6

    .line 69
    .restart local v0    # "b":Landroid/graphics/Bitmap;
    .restart local v1    # "i":I
    :cond_33
    add-int/lit8 v1, v1, -0x1

    goto :goto_11

    .line 75
    .end local v0    # "b":Landroid/graphics/Bitmap;
    :cond_36
    const/4 v2, 0x0

    goto :goto_2f

    .line 68
    .end local v1    # "i":I
    :catchall_38
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public recycle(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 82
    if-nez p1, :cond_3

    .line 96
    :goto_2
    return-void

    .line 85
    :cond_3
    iget-boolean v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mOneSize:Z

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mWidth:I

    if-ne v0, v1, :cond_17

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mHeight:I

    if-eq v0, v1, :cond_1b

    .line 87
    :cond_17
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_2

    .line 90
    :cond_1b
    monitor-enter p0

    .line 91
    :try_start_1c
    iget-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPoolLimit:I

    if-lt v0, v1, :cond_2c

    .line 92
    iget-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 94
    :cond_2c
    iget-object v0, p0, Lcom/lge/gallery/data/util/BitmapPool;->mPool:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    monitor-exit p0

    goto :goto_2

    :catchall_33
    move-exception v0

    monitor-exit p0
    :try_end_35
    .catchall {:try_start_1c .. :try_end_35} :catchall_33

    throw v0
.end method
