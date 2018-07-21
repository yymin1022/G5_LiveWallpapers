.class public Lcom/lge/gallery/decoder/BmpRegionDecoder;
.super Ljava/lang/Object;
.source "BmpRegionDecoder.java"

# interfaces
.implements Lcom/lge/gallery/decoder/GalleryRegionDecoder;


# static fields
.field public static final BMP:Ljava/lang/String; = "bmp"

.field private static final HEADER_SIZE_INFO_LEN:I = 0x4

.field private static final INST_BY_ARRAY:I = 0x4

.field private static final INST_BY_FD:I = 0x2

.field private static final INST_BY_NAME:I = 0x1

.field private static final INST_BY_STREAM:I = 0x3

.field private static final MAGIC_KEY_1ST:B = 0x42t

.field private static final MAGIC_KEY_2ND:B = 0x4dt

.field private static final MAGIC_MIN_HEADER_LEN:I = 0x28

.field private static final MAX_SIZE:I = 0x400

.field private static final OFFSET_BYTES_PER_PIXEL_FOR_OS2:I = 0x18

.field private static final OFFSET_BYTES_PER_PIXEL_FOR_WIN:I = 0x1c

.field private static final OFFSET_FILE_SIZE:I = 0x2

.field private static final OFFSET_HEADER_SIZE:I = 0xe

.field private static final OFFSET_LENGTH_INFO:I = 0x12

.field private static final OFFSET_START_POS:I = 0xa

.field private static final PERFORMANCE_LOGGING:Z = false

.field private static final SIZE_INFO_LENGTH_FOR_OS2:I = 0x2

.field private static final SIZE_INFO_LENGTH_FOR_WIN:I = 0x4

.field private static final TAG:Ljava/lang/String; = "BMPRegionDecoder"

.field private static final TIME_OUT:I = 0x1388

.field private static final TOTAL_READ_DATA:I = 0x1e

.field private static final TYPE_NONE:I = 0x0

.field private static final TYPE_OS2:I = 0x2

.field private static final TYPE_WINDOW:I = 0x1

.field private static final USE_REAL_IMAGE:Z = true


# instance fields
.field private config:Landroid/graphics/Bitmap$Config;

.field private isRecycled:Z

.field private mBaseHeader:[B

.field private mBytePerPixel:I

.field private mCurrentOffsetBytePerPixel:I

.field private mCurrentSizeInfoLen:I

.field private mFChannel:Ljava/nio/channels/FileChannel;

.field private mFD:Ljava/io/FileDescriptor;

.field private mFIS:Ljava/io/InputStream;

.field private mFilePath:Ljava/lang/String;

.field private mHeaderSize:I

.field private mHeight:I

.field private mIndex:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mInstanceBy:I

.field private mIsLoaded:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPaint:Landroid/graphics/Paint;

.field private mRegionDecoder:Landroid/graphics/Bitmap;

.field private mSampleSize:I

.field private mStartPosition:J

.field private mWidth:I


# direct methods
.method public constructor <init>(Ljava/io/FileDescriptor;Z)V
    .registers 11
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 336
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    .line 47
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    .line 48
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->config:Landroid/graphics/Bitmap$Config;

    .line 49
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 50
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 51
    const/4 v1, 0x1

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    .line 52
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mMatrix:Landroid/graphics/Matrix;

    .line 57
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    .line 59
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 60
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    .line 64
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 65
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 83
    const/4 v1, 0x4

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 84
    const/16 v1, 0x1c

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 337
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 338
    .local v2, "start":J
    invoke-direct {p0, p1}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseHeaderInfo(Ljava/io/FileDescriptor;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 339
    const-string v1, "BMPRegionDecoder"

    const-string v4, "Exception while parsing BMP file."

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 342
    :cond_53
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 343
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 344
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 352
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v0, v1, v4}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->prepareInstanceValues(Landroid/graphics/BitmapFactory$Options;II)V

    .line 360
    const/4 v1, 0x2

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    .line 361
    iput-object p1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFD:Ljava/io/FileDescriptor;

    .line 362
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 11
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 309
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    .line 47
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    .line 48
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->config:Landroid/graphics/Bitmap$Config;

    .line 49
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 50
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 51
    const/4 v1, 0x1

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    .line 52
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mMatrix:Landroid/graphics/Matrix;

    .line 57
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    .line 59
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 60
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    .line 64
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 65
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 83
    const/4 v1, 0x4

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 84
    const/16 v1, 0x1c

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 310
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 311
    .local v2, "start":J
    invoke-direct {p0, p1}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseHeaderInfo(Ljava/io/InputStream;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 312
    const-string v1, "BMPRegionDecoder"

    const-string v4, "Exception while parsing BMP file."

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 315
    :cond_53
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 316
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 317
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 325
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v0, v1, v4}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->prepareInstanceValues(Landroid/graphics/BitmapFactory$Options;II)V

    .line 333
    const/4 v1, 0x3

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    .line 334
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 12
    .param p1, "pathName"    # Ljava/lang/String;
    .param p2, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    .line 47
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    .line 48
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->config:Landroid/graphics/Bitmap$Config;

    .line 49
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 50
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 51
    iput v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    .line 52
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mMatrix:Landroid/graphics/Matrix;

    .line 57
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    .line 59
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 60
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    .line 64
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 65
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 83
    const/4 v1, 0x4

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 84
    const/16 v1, 0x1c

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 282
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 283
    .local v2, "start":J
    invoke-direct {p0, p1}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseHeaderInfo(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 284
    const-string v1, "BMPRegionDecoder"

    const-string v4, "Exception while parsing BMP file."

    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 287
    :cond_53
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 288
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 289
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 297
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v0, v1, v4}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->prepareInstanceValues(Landroid/graphics/BitmapFactory$Options;II)V

    .line 305
    iput v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    .line 306
    iput-object p1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFilePath:Ljava/lang/String;

    .line 307
    return-void
.end method

.method public constructor <init>([BIIZ)V
    .registers 14
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "isShareable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    .line 47
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    .line 48
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->config:Landroid/graphics/Bitmap$Config;

    .line 49
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 50
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 51
    const/4 v1, 0x1

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    .line 52
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mMatrix:Landroid/graphics/Matrix;

    .line 57
    iput-boolean v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    .line 59
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 60
    iput v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 63
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    .line 64
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 65
    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 83
    iput v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 84
    const/16 v1, 0x1c

    iput v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 366
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 367
    .local v2, "start":J
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 368
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 369
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 377
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v4, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-direct {p0, v0, v1, v4}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->prepareInstanceValues(Landroid/graphics/BitmapFactory$Options;II)V

    .line 385
    iput v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    .line 386
    return-void
.end method

.method private close(Ljava/io/Closeable;)V
    .registers 5
    .param p1, "c"    # Ljava/io/Closeable;

    .prologue
    .line 209
    if-nez p1, :cond_3

    .line 219
    :goto_2
    return-void

    .line 213
    :cond_3
    :try_start_3
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_7
    .catchall {:try_start_3 .. :try_end_6} :catchall_10

    goto :goto_2

    .line 214
    :catch_7
    move-exception v0

    .line 215
    .local v0, "e":Ljava/lang/Exception;
    :try_start_8
    const-string v1, "BMPRegionDecoder"

    const-string v2, "failed to close."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    goto :goto_2

    .line 216
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_10
    move-exception v1

    throw v1
.end method

.method public static computeSampleSizeLarger(III)I
    .registers 7
    .param p0, "w"    # I
    .param p1, "h"    # I
    .param p2, "minSideLength"    # I

    .prologue
    const/4 v1, 0x1

    .line 608
    div-int v2, p0, p2

    div-int v3, p1, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 609
    .local v0, "initialSize":I
    if-gt v0, v1, :cond_c

    .line 613
    :goto_b
    return v1

    :cond_c
    const/16 v1, 0x8

    if-gt v0, v1, :cond_15

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->prevPowerOf2(I)I

    move-result v1

    goto :goto_b

    :cond_15
    div-int/lit8 v1, v0, 0x8

    mul-int/lit8 v1, v1, 0x8

    goto :goto_b
.end method

.method private convertRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 10
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 572
    const-string v5, "BMPRegionDecoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Original Rect="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    div-int v3, v5, v6

    .line 574
    .local v3, "reqW":I
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v5

    iget v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    div-int v2, v5, v6

    .line 575
    .local v2, "reqH":I
    iget v5, p1, Landroid/graphics/Rect;->left:I

    iget v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    div-int v0, v5, v6

    .line 576
    .local v0, "left":I
    iget v5, p1, Landroid/graphics/Rect;->top:I

    iget v6, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    div-int v4, v5, v6

    .line 577
    .local v4, "top":I
    new-instance v1, Landroid/graphics/Rect;

    add-int v5, v0, v3

    add-int v6, v4, v2

    invoke-direct {v1, v0, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 578
    .local v1, "out":Landroid/graphics/Rect;
    const-string v5, "BMPRegionDecoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Converted Rect="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    return-object v1
.end method

.method private decodeOriginal(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v0, 0x0

    .line 407
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    packed-switch v1, :pswitch_data_1a

    .line 413
    :goto_6
    return-object v0

    .line 409
    :pswitch_7
    iget-object v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFilePath:Ljava/lang/String;

    const-string v1, "bmp"

    invoke-static {v0, p1, v1}, Lcom/lge/gallery/decoder/DecoderSwitcher;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_6

    .line 411
    :pswitch_10
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFD:Ljava/io/FileDescriptor;

    const-string v2, "bmp"

    invoke-static {v1, v0, p1, v2}, Lcom/lge/gallery/decoder/DecoderSwitcher;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_6

    .line 407
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_7
        :pswitch_10
    .end packed-switch
.end method

.method private decodeRealRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    const/4 v0, 0x1

    .line 483
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    if-eq v1, v0, :cond_a

    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mInstanceBy:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_11

    .line 484
    .local v0, "useChannel":Z
    :cond_a
    :goto_a
    if-eqz v0, :cond_13

    .line 485
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->decodeRegionByFChannel(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 487
    :goto_10
    return-object v1

    .line 483
    .end local v0    # "useChannel":Z
    :cond_11
    const/4 v0, 0x0

    goto :goto_a

    .line 487
    .restart local v0    # "useChannel":Z
    :cond_13
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->decodeRegionByStream(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_10
.end method

.method private decodeRegionByFChannel(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 27
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 431
    const/16 v16, 0x0

    .line 432
    .local v16, "tBitmap":Landroid/graphics/Bitmap;
    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v21, v0

    if-eqz v21, :cond_18

    .line 433
    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v16, v0

    .line 434
    const/16 v21, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 436
    :cond_18
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->width()I

    move-result v20

    .line 437
    .local v20, "width":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Rect;->height()I

    move-result v10

    .line 438
    .local v10, "height":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_3f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ne v10, v0, :cond_3f

    .line 439
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->decodeOriginal(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 472
    :cond_3e
    :goto_3e
    return-object v6

    .line 441
    :cond_3f
    move-object/from16 v15, p1

    .line 442
    .local v15, "r":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    move/from16 v21, v0

    mul-int v21, v21, v20

    invoke-static/range {v21 .. v21}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 443
    .local v7, "buffer":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    move/from16 v21, v0

    mul-int v21, v21, v20

    rem-int/lit8 v13, v21, 0x4

    .line 444
    .local v13, "paddingBytes":I
    if-nez v13, :cond_e6

    const/4 v13, 0x0

    .line 445
    :goto_5a
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1, v10, v13}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->getRegionHeader(III)[B

    move-result-object v19

    .line 446
    .local v19, "temp":[B
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 447
    .local v9, "fc":Ljava/nio/channels/FileChannel;
    const/4 v6, 0x0

    .line 449
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    :try_start_67
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v17, v0

    .line 450
    .local v17, "targetPosition":I
    const/4 v14, 0x0

    .line 451
    .local v14, "position":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_74
    if-ge v11, v10, :cond_f2

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    iget v0, v15, Landroid/graphics/Rect;->bottom:I

    move/from16 v23, v0

    sub-int v22, v22, v23

    add-int v22, v22, v11

    invoke-virtual/range {v21 .. v22}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v21

    iget v0, v15, Landroid/graphics/Rect;->left:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    move/from16 v23, v0

    mul-int v22, v22, v23

    add-int v14, v21, v22

    .line 453
    int-to-long v0, v14

    move-wide/from16 v22, v0

    move-wide/from16 v0, v22

    invoke-virtual {v9, v0, v1}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 454
    invoke-virtual {v9, v7}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    .line 455
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v21

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    move/from16 v23, v0

    mul-int v23, v23, v20

    move-object/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v19

    move/from16 v3, v17

    move/from16 v4, v23

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 456
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    move/from16 v21, v0

    mul-int v21, v21, v20

    add-int v17, v17, v21

    .line 457
    const/4 v12, 0x0

    .local v12, "jk":I
    move/from16 v18, v17

    .end local v17    # "targetPosition":I
    .local v18, "targetPosition":I
    :goto_d9
    if-ge v12, v13, :cond_ea

    .line 458
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "targetPosition":I
    .restart local v17    # "targetPosition":I
    const/16 v21, 0x0

    aput-byte v21, v19, v18

    .line 457
    add-int/lit8 v12, v12, 0x1

    move/from16 v18, v17

    .end local v17    # "targetPosition":I
    .restart local v18    # "targetPosition":I
    goto :goto_d9

    .line 444
    .end local v6    # "bitmap":Landroid/graphics/Bitmap;
    .end local v9    # "fc":Ljava/nio/channels/FileChannel;
    .end local v11    # "i":I
    .end local v12    # "jk":I
    .end local v14    # "position":I
    .end local v18    # "targetPosition":I
    .end local v19    # "temp":[B
    :cond_e6
    rsub-int/lit8 v13, v13, 0x4

    goto/16 :goto_5a

    .line 460
    .restart local v6    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v9    # "fc":Ljava/nio/channels/FileChannel;
    .restart local v11    # "i":I
    .restart local v12    # "jk":I
    .restart local v14    # "position":I
    .restart local v18    # "targetPosition":I
    .restart local v19    # "temp":[B
    :cond_ea
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 451
    add-int/lit8 v11, v11, 0x1

    move/from16 v17, v18

    .end local v18    # "targetPosition":I
    .restart local v17    # "targetPosition":I
    goto :goto_74

    .line 462
    .end local v12    # "jk":I
    :cond_f2
    const/16 v21, 0x0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v22, v0

    const-string v23, "bmp"

    move-object/from16 v0, v19

    move/from16 v1, v21

    move/from16 v2, v22

    move-object/from16 v3, p2

    move-object/from16 v4, v23

    invoke-static {v0, v1, v2, v3, v4}, Lcom/lge/gallery/decoder/DecoderSwitcher;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_108
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_108} :catch_155
    .catchall {:try_start_67 .. :try_end_108} :catchall_15a

    move-result-object v6

    .line 467
    .end local v11    # "i":I
    .end local v14    # "position":I
    .end local v17    # "targetPosition":I
    :goto_109
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    .line 468
    if-nez v6, :cond_3e

    .line 469
    const-string v21, "BMPRegionDecoder"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "w="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", height="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    const-string v21, "BMPRegionDecoder"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "padbytes="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3e

    .line 463
    :catch_155
    move-exception v8

    .line 464
    .local v8, "e":Ljava/lang/Exception;
    :try_start_156
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_159
    .catchall {:try_start_156 .. :try_end_159} :catchall_15a

    goto :goto_109

    .line 465
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_15a
    move-exception v21

    throw v21
.end method

.method private decodeRegionByStream(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 477
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getBMPType(I)I
    .registers 2
    .param p0, "size"    # I

    .prologue
    .line 116
    const/16 v0, 0x28

    if-lt p0, v0, :cond_6

    .line 117
    const/4 v0, 0x1

    .line 119
    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x2

    goto :goto_5
.end method

.method private getRegionHeader(III)[B
    .registers 10
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "paddingBytes"    # I

    .prologue
    const/4 v3, 0x0

    const/16 v5, 0x10

    .line 418
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    array-length v1, v1

    iget v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    mul-int/2addr v2, p1

    add-int/2addr v2, p3

    mul-int/2addr v2, p2

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 420
    .local v0, "temp":[B
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    iget-object v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 421
    const/4 v1, 0x2

    const/4 v2, 0x4

    new-instance v3, Ljava/math/BigInteger;

    array-length v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->setHeaderValue([BII[B)V

    .line 423
    const/16 v1, 0x12

    iget v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    new-instance v3, Ljava/math/BigInteger;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->setHeaderValue([BII[B)V

    .line 425
    iget v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    add-int/lit8 v1, v1, 0x12

    iget v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    new-instance v3, Ljava/math/BigInteger;

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->setHeaderValue([BII[B)V

    .line 427
    return-object v0
.end method

.method private manageDecodingOption(Landroid/graphics/BitmapFactory$Options;II)V
    .registers 8
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    const/4 v3, 0x1

    .line 590
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/16 v2, 0x400

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/common/BitmapUtils;->computeSampleSizeLarger(III)I

    move-result v0

    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 592
    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iput v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    .line 593
    const/4 v0, 0x0

    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 594
    iget-object v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->config:Landroid/graphics/Bitmap$Config;

    iput-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 595
    iget v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mSampleSize:I

    if-le v0, v3, :cond_26

    .line 596
    iget-object v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 597
    iget-object v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 599
    :cond_26
    return-void
.end method

.method private parseHeaderInfo(Ljava/io/FileDescriptor;)Z
    .registers 3
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .prologue
    .line 142
    if-nez p1, :cond_4

    .line 143
    const/4 v0, 0x0

    .line 145
    :goto_3
    return v0

    :cond_4
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-direct {p0, v0}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseHeaderInfo(Ljava/io/FileInputStream;)Z

    move-result v0

    goto :goto_3
.end method

.method private parseHeaderInfo(Ljava/io/FileInputStream;)Z
    .registers 14
    .param p1, "stream"    # Ljava/io/FileInputStream;

    .prologue
    .line 149
    if-nez p1, :cond_4

    .line 150
    const/4 v7, 0x0

    .line 205
    :goto_3
    return v7

    .line 153
    :cond_4
    :try_start_4
    iput-object p1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 154
    const/16 v7, 0x1e

    new-array v1, v7, [B

    .line 155
    .local v1, "buffer":[B
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v7

    if-gez v7, :cond_14

    .line 156
    const/4 v7, 0x0

    goto :goto_3

    .line 158
    :cond_14
    const/4 v7, 0x0

    aget-byte v7, v1, v7

    const/16 v8, 0x42

    if-ne v7, v8, :cond_22

    const/4 v7, 0x1

    aget-byte v7, v1, v7

    const/16 v8, 0x4d

    if-eq v7, v8, :cond_30

    .line 159
    :cond_22
    const-string v7, "BMPRegionDecoder"

    const-string v8, "The file is not BMP format."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 161
    const/4 v7, 0x0

    goto :goto_3

    .line 163
    :cond_30
    const/4 v6, 0x0

    .line 165
    .local v6, "type":I
    const/16 v7, 0xa

    const/4 v8, 0x4

    invoke-static {v1, v7, v8}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v7

    int-to-long v8, v7

    iput-wide v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 166
    const/16 v7, 0xe

    const/4 v8, 0x4

    invoke-static {v1, v7, v8}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v7

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    .line 167
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    add-int/lit8 v7, v7, 0xe

    int-to-long v8, v7

    iget-wide v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    cmp-long v7, v8, v10

    if-eqz v7, :cond_51

    .line 168
    const/4 v7, 0x0

    goto :goto_3

    .line 170
    :cond_51
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    invoke-static {v7}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->getBMPType(I)I

    move-result v6

    .line 172
    const/4 v7, 0x2

    if-ne v6, v7, :cond_61

    .line 173
    const/4 v7, 0x2

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 174
    const/16 v7, 0x18

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 176
    :cond_61
    const/16 v7, 0x12

    iget v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    invoke-static {v1, v7, v8}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v7

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 177
    const/16 v7, 0x16

    iget v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    invoke-static {v1, v7, v8}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v7

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 181
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    const/4 v8, 0x2

    invoke-static {v1, v7, v8}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v7

    div-int/lit8 v7, v7, 0x8

    iput v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 184
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iget v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    mul-int/2addr v7, v8

    rem-int/lit8 v5, v7, 0x4

    .line 185
    .local v5, "paddingBytes":I
    if-nez v5, :cond_a6

    const/4 v5, 0x0

    .line 186
    :goto_8a
    iget-wide v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    long-to-int v4, v8

    .line 187
    .local v4, "nextPosition":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8e
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    if-ge v3, v7, :cond_a9

    .line 188
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    iget v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iget v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    mul-int/2addr v7, v8

    add-int/2addr v7, v4

    add-int v4, v7, v5

    .line 187
    add-int/lit8 v3, v3, 0x1

    goto :goto_8e

    .line 185
    .end local v3    # "i":I
    .end local v4    # "nextPosition":I
    :cond_a6
    rsub-int/lit8 v5, v5, 0x4

    goto :goto_8a

    .line 192
    .restart local v3    # "i":I
    .restart local v4    # "nextPosition":I
    :cond_a9
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    check-cast v7, Ljava/io/FileInputStream;

    invoke-virtual {v7}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v7

    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 193
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    const-wide/16 v8, 0x0

    invoke-virtual {v7, v8, v9}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 194
    iget-wide v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    long-to-int v7, v8

    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 195
    .local v0, "bb":Ljava/nio/ByteBuffer;
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v7, v0}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    .line 196
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    iput-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    .line 197
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_cf} :catch_d2
    .catchall {:try_start_4 .. :try_end_cf} :catchall_e3

    .line 205
    const/4 v7, 0x1

    goto/16 :goto_3

    .line 198
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v1    # "buffer":[B
    .end local v3    # "i":I
    .end local v4    # "nextPosition":I
    .end local v5    # "paddingBytes":I
    .end local v6    # "type":I
    :catch_d2
    move-exception v2

    .line 199
    .local v2, "e":Ljava/lang/Exception;
    :try_start_d3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 200
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-direct {p0, v7}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->close(Ljava/io/Closeable;)V

    .line 201
    iget-object v7, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    invoke-direct {p0, v7}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->close(Ljava/io/Closeable;)V
    :try_end_e0
    .catchall {:try_start_d3 .. :try_end_e0} :catchall_e3

    .line 202
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 203
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_e3
    move-exception v7

    throw v7
.end method

.method private parseHeaderInfo(Ljava/io/InputStream;)Z
    .registers 16
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 222
    if-nez p1, :cond_4

    .line 223
    const/4 v9, 0x0

    .line 278
    :goto_3
    return v9

    .line 226
    :cond_4
    :try_start_4
    iput-object p1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 227
    const/16 v9, 0x1e

    new-array v1, v9, [B

    .line 228
    .local v1, "buffer":[B
    iget-object v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-virtual {v9, v1}, Ljava/io/InputStream;->read([B)I

    move-result v9

    if-gez v9, :cond_14

    .line 229
    const/4 v9, 0x0

    goto :goto_3

    .line 231
    :cond_14
    const/4 v9, 0x0

    aget-byte v9, v1, v9

    const/16 v10, 0x42

    if-ne v9, v10, :cond_22

    const/4 v9, 0x1

    aget-byte v9, v1, v9

    const/16 v10, 0x4d

    if-eq v9, v10, :cond_2b

    .line 232
    :cond_22
    const-string v9, "BMPRegionDecoder"

    const-string v10, "The file is not BMP format."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    const/4 v9, 0x0

    goto :goto_3

    .line 235
    :cond_2b
    const/4 v7, 0x0

    .line 236
    .local v7, "type":I
    const/4 v8, 0x0

    .line 237
    .local v8, "width":I
    const/4 v3, 0x0

    .line 239
    .local v3, "height":I
    const/16 v9, 0xa

    const/4 v10, 0x4

    invoke-static {v1, v9, v10}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v9

    int-to-long v10, v9

    iput-wide v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    .line 240
    const/16 v9, 0xe

    const/4 v10, 0x4

    invoke-static {v1, v9, v10}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v9

    iput v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    .line 241
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    add-int/lit8 v9, v9, 0xe

    int-to-long v10, v9

    iget-wide v12, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    cmp-long v9, v10, v12

    if-eqz v9, :cond_4e

    .line 242
    const/4 v9, 0x0

    goto :goto_3

    .line 244
    :cond_4e
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeaderSize:I

    invoke-static {v9}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->getBMPType(I)I

    move-result v7

    .line 246
    const/4 v9, 0x2

    if-ne v7, v9, :cond_5e

    .line 247
    const/4 v9, 0x2

    iput v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    .line 248
    const/16 v9, 0x18

    iput v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    .line 250
    :cond_5e
    const/16 v9, 0x12

    iget v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    invoke-static {v1, v9, v10}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v8

    .line 251
    const/16 v9, 0x16

    iget v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentSizeInfoLen:I

    invoke-static {v1, v9, v10}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v3

    .line 253
    iput v8, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 254
    iput v3, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 257
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mCurrentOffsetBytePerPixel:I

    const/4 v10, 0x2

    invoke-static {v1, v9, v10}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseValue([BII)I

    move-result v9

    div-int/lit8 v9, v9, 0x8

    iput v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    .line 260
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iget v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    mul-int/2addr v9, v10

    rem-int/lit8 v6, v9, 0x4

    .line 261
    .local v6, "paddingBytes":I
    if-nez v6, :cond_a3

    const/4 v6, 0x0

    .line 262
    :goto_87
    iget-wide v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    long-to-int v5, v10

    .line 263
    .local v5, "nextPosition":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_8b
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    if-ge v4, v9, :cond_a6

    .line 264
    iget-object v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    iget v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    iget v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBytePerPixel:I

    mul-int/2addr v9, v10

    add-int/2addr v9, v5

    add-int v5, v9, v6

    .line 263
    add-int/lit8 v4, v4, 0x1

    goto :goto_8b

    .line 261
    .end local v4    # "i":I
    .end local v5    # "nextPosition":I
    :cond_a3
    rsub-int/lit8 v6, v6, 0x4

    goto :goto_87

    .line 267
    .restart local v4    # "i":I
    .restart local v5    # "nextPosition":I
    :cond_a6
    iget-wide v10, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mStartPosition:J

    long-to-int v9, v10

    new-array v0, v9, [B

    .line 268
    .local v0, "bb":[B
    iget-object v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-virtual {v9, v0}, Ljava/io/InputStream;->read([B)I

    move-result v9

    if-gez v9, :cond_b6

    .line 269
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 271
    :cond_b6
    iput-object v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mBaseHeader:[B

    .line 272
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z
    :try_end_bb
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_bb} :catch_be
    .catchall {:try_start_4 .. :try_end_bb} :catchall_c5

    .line 278
    const/4 v9, 0x1

    goto/16 :goto_3

    .line 273
    .end local v0    # "bb":[B
    .end local v1    # "buffer":[B
    .end local v3    # "height":I
    .end local v4    # "i":I
    .end local v5    # "nextPosition":I
    .end local v6    # "paddingBytes":I
    .end local v7    # "type":I
    .end local v8    # "width":I
    :catch_be
    move-exception v2

    .line 274
    .local v2, "e":Ljava/lang/Exception;
    :try_start_bf
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_c2
    .catchall {:try_start_bf .. :try_end_c2} :catchall_c5

    .line 275
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 276
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_c5
    move-exception v9

    throw v9
.end method

.method private parseHeaderInfo(Ljava/lang/String;)Z
    .registers 6
    .param p1, "pathName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 125
    if-eqz p1, :cond_b

    const-string v3, ""

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 138
    :cond_b
    :goto_b
    return v2

    .line 128
    :cond_c
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 132
    const/4 v2, 0x0

    .line 134
    .local v2, "result":Z
    :try_start_18
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v3}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->parseHeaderInfo(Ljava/io/FileInputStream;)Z
    :try_end_20
    .catch Ljava/io/FileNotFoundException; {:try_start_18 .. :try_end_20} :catch_22

    move-result v2

    goto :goto_b

    .line 135
    :catch_22
    move-exception v0

    .line 136
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_b
.end method

.method private static parseValue([BII)I
    .registers 7
    .param p0, "buffer"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 96
    const/4 v1, 0x0

    .line 97
    .local v1, "ret":I
    const/4 v2, 0x0

    .line 98
    .local v2, "temp":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p2, :cond_15

    .line 99
    add-int v3, p1, v0

    aget-byte v3, p0, v3

    and-int/lit16 v2, v3, 0xff

    .line 100
    mul-int v3, p2, v0

    mul-int/lit8 v3, v3, 0x2

    shl-int v3, v2, v3

    or-int/2addr v1, v3

    .line 98
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 102
    :cond_15
    return v1
.end method

.method private prepareInstanceValues(Landroid/graphics/BitmapFactory$Options;II)V
    .registers 4
    .param p1, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 587
    return-void
.end method

.method private static setHeaderValue([BII[B)V
    .registers 8
    .param p0, "header"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "value"    # [B

    .prologue
    .line 106
    array-length v1, p3

    .line 107
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, p2, :cond_c

    .line 108
    add-int v2, p1, v0

    const/4 v3, 0x0

    aput-byte v3, p0, v2

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 110
    :cond_c
    const/4 v0, 0x0

    :goto_d
    if-ge v0, v1, :cond_1b

    .line 111
    add-int v2, p1, v0

    add-int/lit8 v3, v1, -0x1

    sub-int/2addr v3, v0

    aget-byte v3, p3, v3

    aput-byte v3, p0, v2

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 113
    :cond_1b
    return-void
.end method

.method private setSize(II)V
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 602
    iput p1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 603
    iput p2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 604
    return-void
.end method


# virtual methods
.method public decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 494
    invoke-direct {p0, p1, p2}, Lcom/lge/gallery/decoder/BmpRegionDecoder;->decodeRealRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 390
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    if-eqz v0, :cond_7

    .line 392
    iget v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mHeight:I

    .line 394
    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 399
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    if-eqz v0, :cond_7

    .line 401
    iget v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mWidth:I

    .line 403
    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public inBitmapSupported()Z
    .registers 2

    .prologue
    .line 620
    const/4 v0, 0x0

    return v0
.end method

.method public isRecycled()Z
    .registers 2

    .prologue
    .line 533
    iget-boolean v0, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    return v0
.end method

.method public recycle()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 539
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 540
    iput-object v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIndex:Ljava/util/ArrayList;

    .line 542
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    if-eqz v1, :cond_13

    .line 544
    :try_start_c
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_11} :catch_30

    .line 549
    :goto_11
    iput-object v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFChannel:Ljava/nio/channels/FileChannel;

    .line 552
    :cond_13
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    if-eqz v1, :cond_1e

    .line 554
    :try_start_17
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1c} :catch_35

    .line 559
    :goto_1c
    iput-object v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mFIS:Ljava/io/InputStream;

    .line 563
    :cond_1e
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_29

    .line 564
    iget-object v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 565
    iput-object v2, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mRegionDecoder:Landroid/graphics/Bitmap;

    .line 567
    :cond_29
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->isRecycled:Z

    .line 568
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lge/gallery/decoder/BmpRegionDecoder;->mIsLoaded:Z

    .line 569
    return-void

    .line 545
    :catch_30
    move-exception v0

    .line 547
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_11

    .line 555
    .end local v0    # "e":Ljava/io/IOException;
    :catch_35
    move-exception v0

    .line 557
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1c
.end method
