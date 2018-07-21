.class public Lcom/lge/gallery/common/BlobCache;
.super Ljava/lang/Object;
.source "BlobCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/common/BlobCache$LookupRequest;,
        Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;
    }
.end annotation


# static fields
.field private static final BH_CHECKSUM:I = 0x8

.field private static final BH_KEY:I = 0x0

.field private static final BH_LENGTH:I = 0x10

.field private static final BH_OFFSET:I = 0xc

.field private static final BLOB_HEADER_SIZE:I = 0x14

.field private static final DATA_HEADER_SIZE:I = 0x4

.field private static final IH_ACTIVE_BYTES:I = 0x14

.field private static final IH_ACTIVE_ENTRIES:I = 0x10

.field private static final IH_ACTIVE_REGION:I = 0xc

.field private static final IH_CHECKSUM:I = 0x1c

.field private static final IH_MAGIC:I = 0x0

.field private static final IH_MAX_BYTES:I = 0x8

.field private static final IH_MAX_ENTRIES:I = 0x4

.field private static final IH_VERSION:I = 0x18

.field private static final INDEX_HEADER_SIZE:I = 0x20

.field private static final MAGIC_DATA_FILE:I = -0x42db7af0

.field private static final MAGIC_INDEX_FILE:I = -0x4cd8cfd0

.field private static final TAG:Ljava/lang/String; = "BlobCache"


# instance fields
.field private mActiveBytes:I

.field private mActiveDataFile:Ljava/io/RandomAccessFile;

.field private mActiveEntries:I

.field private mActiveHashStart:I

.field private mActiveRegion:I

.field private mAdler32:Ljava/util/zip/Adler32;

.field private mBlobHeader:[B

.field private mDataFile0:Ljava/io/RandomAccessFile;

.field private mDataFile1:Ljava/io/RandomAccessFile;

.field private mFileOffset:I

.field private mInactiveDataFile:Ljava/io/RandomAccessFile;

.field private mInactiveHashStart:I

.field private mIndexBuffer:Ljava/nio/MappedByteBuffer;

.field private mIndexChannel:Ljava/nio/channels/FileChannel;

.field private mIndexFile:Ljava/io/RandomAccessFile;

.field private mIndexHeader:[B

.field private mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

.field private mMaxBytes:I

.field private mMaxEntries:I

.field private mSlotOffset:I

.field private mSteteListener:Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

.field private mVersion:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIZ)V
    .registers 11
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "maxEntries"    # I
    .param p3, "maxBytes"    # I
    .param p4, "reset"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/lge/gallery/common/BlobCache;-><init>(Ljava/lang/String;IIZI)V

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIZI)V
    .registers 9
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "maxEntries"    # I
    .param p3, "maxBytes"    # I
    .param p4, "reset"    # Z
    .param p5, "version"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    .line 123
    const/16 v0, 0x14

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mBlobHeader:[B

    .line 124
    new-instance v0, Ljava/util/zip/Adler32;

    invoke-direct {v0}, Ljava/util/zip/Adler32;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    .line 436
    new-instance v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;

    invoke-direct {v0}, Lcom/lge/gallery/common/BlobCache$LookupRequest;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

    .line 146
    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".idx"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    .line 147
    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    .line 148
    new-instance v0, Ljava/io/RandomAccessFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "rw"

    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    .line 149
    iput p5, p0, Lcom/lge/gallery/common/BlobCache;->mVersion:I

    .line 151
    if-nez p4, :cond_7c

    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->loadIndex()Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 161
    :cond_7b
    return-void

    .line 155
    :cond_7c
    invoke-direct {p0, p2, p3}, Lcom/lge/gallery/common/BlobCache;->resetCache(II)V

    .line 157
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->loadIndex()Z

    move-result v0

    if-nez v0, :cond_7b

    .line 158
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->closeAll()V

    .line 159
    new-instance v0, Ljava/io/IOException;

    const-string v1, "unable to load index"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private clearHash(I)V
    .registers 8
    .param p1, "hashStart"    # I

    .prologue
    const/16 v5, 0x400

    .line 377
    new-array v2, v5, [B

    .line 378
    .local v2, "zero":[B
    iget-object v3, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v3, p1}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 379
    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    mul-int/lit8 v0, v3, 0xc

    .local v0, "count":I
    :goto_d
    if-lez v0, :cond_1b

    .line 380
    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 381
    .local v1, "todo":I
    iget-object v3, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4, v1}, Ljava/nio/MappedByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 382
    sub-int/2addr v0, v1

    .line 383
    goto :goto_d

    .line 384
    .end local v1    # "todo":I
    :cond_1b
    return-void
.end method

.method private closeAll()V
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    .line 197
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    .line 198
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    .line 199
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->closeSilently(Ljava/io/Closeable;)V

    .line 200
    return-void
.end method

.method static closeSilently(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 648
    if-nez p0, :cond_3

    .line 656
    :goto_2
    return-void

    .line 652
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 653
    :catch_7
    move-exception v0

    .line 654
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "BlobCache"

    const-string v2, "Failed to close"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private static deleteFileSilently(Ljava/lang/String;)V
    .registers 4
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 173
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_8} :catch_9

    .line 177
    :goto_8
    return-void

    .line 174
    :catch_9
    move-exception v0

    .line 175
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "BlobCache"

    const-string v2, "Failed to delete"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8
.end method

.method public static deleteFiles(Ljava/lang/String;)V
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".idx"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/BlobCache;->deleteFileSilently(Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method private flipRegion()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    rsub-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    .line 349
    const/4 v1, 0x0

    iput v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    .line 350
    const/4 v1, 0x4

    iput v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    .line 352
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v2, 0xc

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    invoke-static {v1, v2, v3}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 353
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v2, 0x10

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    invoke-static {v1, v2, v3}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 354
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v2, 0x14

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    invoke-static {v1, v2, v3}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 355
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->updateIndexHeader()V

    .line 357
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->setActiveVariables()V

    .line 358
    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, v1}, Lcom/lge/gallery/common/BlobCache;->clearHash(I)V

    .line 359
    invoke-virtual {p0}, Lcom/lge/gallery/common/BlobCache;->syncIndex()V

    .line 361
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mSteteListener:Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .line 362
    .local v0, "listener":Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;
    if-eqz v0, :cond_3c

    .line 363
    invoke-interface {v0}, Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;->onFlipRegion()V

    .line 365
    :cond_3c
    return-void
.end method

.method private getBlob(Ljava/io/RandomAccessFile;ILcom/lge/gallery/common/BlobCache$LookupRequest;)Z
    .registers 19
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .param p2, "offset"    # I
    .param p3, "req"    # Lcom/lge/gallery/common/BlobCache$LookupRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 505
    iget-object v6, p0, Lcom/lge/gallery/common/BlobCache;->mBlobHeader:[B

    .line 506
    .local v6, "header":[B
    invoke-virtual/range {p1 .. p1}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v8

    .line 508
    .local v8, "oldPosition":J
    move/from16 v0, p2

    int-to-long v12, v0

    :try_start_9
    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 509
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v12

    const/16 v13, 0x14

    if-eq v12, v13, :cond_26

    .line 510
    const-string v12, "BlobCache"

    const-string v13, "cannot read blob header"

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_1f} :catch_113
    .catchall {:try_start_9 .. :try_end_1f} :catchall_123

    .line 511
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    :goto_25
    return v12

    .line 513
    :cond_26
    const/4 v12, 0x0

    :try_start_27
    invoke-static {v6, v12}, Lcom/lge/gallery/common/BlobCache;->readLong([BI)J

    move-result-wide v4

    .line 514
    .local v4, "blobKey":J
    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    cmp-long v12, v4, v12

    if-eqz v12, :cond_52

    .line 515
    const-string v12, "BlobCache"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "blob key does not match: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_4b} :catch_113
    .catchall {:try_start_27 .. :try_end_4b} :catchall_123

    .line 516
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto :goto_25

    .line 518
    :cond_52
    const/16 v12, 0x8

    :try_start_54
    invoke-static {v6, v12}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v10

    .line 519
    .local v10, "sum":I
    const/16 v12, 0xc

    invoke-static {v6, v12}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v3

    .line 520
    .local v3, "blobOffset":I
    move/from16 v0, p2

    if-eq v3, v0, :cond_81

    .line 521
    const-string v12, "BlobCache"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "blob offset does not match: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7a
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_7a} :catch_113
    .catchall {:try_start_54 .. :try_end_7a} :catchall_123

    .line 522
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto :goto_25

    .line 524
    :cond_81
    const/16 v12, 0x10

    :try_start_83
    invoke-static {v6, v12}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v7

    .line 525
    .local v7, "length":I
    if-ltz v7, :cond_91

    iget v12, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    sub-int v12, v12, p2

    add-int/lit8 v12, v12, -0x14

    if-le v7, v12, :cond_b1

    .line 526
    :cond_91
    const-string v12, "BlobCache"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "invalid blob length: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a9
    .catch Ljava/lang/Throwable; {:try_start_83 .. :try_end_a9} :catch_113
    .catchall {:try_start_83 .. :try_end_a9} :catchall_123

    .line 527
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto/16 :goto_25

    .line 529
    :cond_b1
    :try_start_b1
    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    if-eqz v12, :cond_be

    move-object/from16 v0, p3

    iget-object v12, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    array-length v12, v12

    if-ge v12, v7, :cond_c4

    .line 530
    :cond_be
    new-array v12, v7, [B

    move-object/from16 v0, p3

    iput-object v12, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    .line 533
    :cond_c4
    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    .line 534
    .local v2, "blob":[B
    move-object/from16 v0, p3

    iput v7, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->length:I

    .line 536
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v12, v7}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v12

    if-eq v12, v7, :cond_e4

    .line 537
    const-string v12, "BlobCache"

    const-string v13, "cannot read blob data"

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_dc
    .catch Ljava/lang/Throwable; {:try_start_b1 .. :try_end_dc} :catch_113
    .catchall {:try_start_b1 .. :try_end_dc} :catchall_123

    .line 538
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto/16 :goto_25

    .line 540
    :cond_e4
    const/4 v12, 0x0

    :try_start_e5
    invoke-virtual {p0, v2, v12, v7}, Lcom/lge/gallery/common/BlobCache;->checkSum([BII)I

    move-result v12

    if-eq v12, v10, :cond_10b

    .line 541
    const-string v12, "BlobCache"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "blob checksum does not match: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_103
    .catch Ljava/lang/Throwable; {:try_start_e5 .. :try_end_103} :catch_113
    .catchall {:try_start_e5 .. :try_end_103} :catchall_123

    .line 542
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto/16 :goto_25

    .line 544
    :cond_10b
    const/4 v12, 0x1

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto/16 :goto_25

    .line 545
    .end local v2    # "blob":[B
    .end local v3    # "blobOffset":I
    .end local v4    # "blobKey":J
    .end local v7    # "length":I
    .end local v10    # "sum":I
    :catch_113
    move-exception v11

    .line 546
    .local v11, "t":Ljava/lang/Throwable;
    :try_start_114
    const-string v12, "BlobCache"

    const-string v13, "getBlob failed."

    invoke-static {v12, v13, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_11b
    .catchall {:try_start_114 .. :try_end_11b} :catchall_123

    .line 547
    const/4 v12, 0x0

    .line 549
    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    goto/16 :goto_25

    .end local v11    # "t":Ljava/lang/Throwable;
    :catchall_123
    move-exception v12

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    throw v12
.end method

.method private insertInternal(J[BI)V
    .registers 10
    .param p1, "key"    # J
    .param p3, "data"    # [B
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 413
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mBlobHeader:[B

    .line 414
    .local v0, "header":[B
    invoke-virtual {p0, p3}, Lcom/lge/gallery/common/BlobCache;->checkSum([B)I

    move-result v1

    .line 415
    .local v1, "sum":I
    invoke-static {v0, v4, p1, p2}, Lcom/lge/gallery/common/BlobCache;->writeLong([BIJ)V

    .line 416
    const/16 v2, 0x8

    invoke-static {v0, v2, v1}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 417
    const/16 v2, 0xc

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    invoke-static {v0, v2, v3}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 418
    const/16 v2, 0x10

    invoke-static {v0, v2, p4}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 419
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->write([B)V

    .line 420
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, p3, v4, p4}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 422
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    invoke-virtual {v2, v3, p1, p2}, Ljava/nio/MappedByteBuffer;->putLong(IJ)Ljava/nio/ByteBuffer;

    .line 423
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    add-int/lit8 v3, v3, 0x8

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    invoke-virtual {v2, v3, v4}, Ljava/nio/MappedByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 424
    iget v2, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    add-int/lit8 v3, p4, 0x14

    add-int/2addr v2, v3

    iput v2, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    .line 425
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v3, 0x14

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    invoke-static {v2, v3, v4}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 426
    return-void
.end method

.method private loadIndex()Z
    .registers 13

    .prologue
    const/4 v11, 0x1

    const v5, -0x42db7af0

    const/4 v4, 0x4

    const/4 v10, 0x0

    .line 210
    :try_start_6
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 211
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 212
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 214
    iget-object v6, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    .line 215
    .local v6, "buf":[B
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v6}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_30

    .line 216
    const-string v0, "BlobCache"

    const-string v1, "cannot read header"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 297
    .end local v6    # "buf":[B
    :goto_2f
    return v0

    .line 220
    .restart local v6    # "buf":[B
    :cond_30
    const/4 v0, 0x0

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    const v1, -0x4cd8cfd0

    if-eq v0, v1, :cond_43

    .line 221
    const-string v0, "BlobCache"

    const-string v1, "cannot read header magic"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 222
    goto :goto_2f

    .line 225
    :cond_43
    const/16 v0, 0x18

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mVersion:I

    if-eq v0, v1, :cond_56

    .line 226
    const-string v0, "BlobCache"

    const-string v1, "version mismatch"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 227
    goto :goto_2f

    .line 230
    :cond_56
    const/4 v0, 0x4

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    .line 231
    const/16 v0, 0x8

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    .line 232
    const/16 v0, 0xc

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    .line 233
    const/16 v0, 0x10

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    .line 234
    const/16 v0, 0x14

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    .line 236
    const/16 v0, 0x1c

    invoke-static {v6, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v9

    .line 237
    .local v9, "sum":I
    const/4 v0, 0x0

    const/16 v1, 0x1c

    invoke-virtual {p0, v6, v0, v1}, Lcom/lge/gallery/common/BlobCache;->checkSum([BII)I

    move-result v0

    if-eq v0, v9, :cond_95

    .line 238
    const-string v0, "BlobCache"

    const-string v1, "header checksum does not match"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 239
    goto :goto_2f

    .line 243
    :cond_95
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-gtz v0, :cond_a2

    .line 244
    const-string v0, "BlobCache"

    const-string v1, "invalid max entries"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 245
    goto :goto_2f

    .line 247
    :cond_a2
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    if-gtz v0, :cond_af

    .line 248
    const-string v0, "BlobCache"

    const-string v1, "invalid max bytes"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 249
    goto :goto_2f

    .line 251
    :cond_af
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    if-eqz v0, :cond_c1

    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    if-eq v0, v11, :cond_c1

    .line 252
    const-string v0, "BlobCache"

    const-string v1, "invalid active region"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 253
    goto/16 :goto_2f

    .line 255
    :cond_c1
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    if-ltz v0, :cond_cb

    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-le v0, v1, :cond_d5

    .line 256
    :cond_cb
    const-string v0, "BlobCache"

    const-string v1, "invalid active entries"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 257
    goto/16 :goto_2f

    .line 259
    :cond_d5
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    if-lt v0, v4, :cond_df

    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    if-le v0, v1, :cond_e9

    .line 260
    :cond_df
    const-string v0, "BlobCache"

    const-string v1, "invalid active bytes"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 261
    goto/16 :goto_2f

    .line 263
    :cond_e9
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iget v2, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    mul-int/lit8 v2, v2, 0xc

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x20

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_106

    .line 264
    const-string v0, "BlobCache"

    const-string v1, "invalid index file length"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 265
    goto/16 :goto_2f

    .line 269
    :cond_106
    const/4 v0, 0x4

    new-array v8, v0, [B

    .line 270
    .local v8, "magic":[B
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v8}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v0

    if-eq v0, v4, :cond_11b

    .line 271
    const-string v0, "BlobCache"

    const-string v1, "cannot read data file magic"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 272
    goto/16 :goto_2f

    .line 274
    :cond_11b
    const/4 v0, 0x0

    invoke-static {v8, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    if-eq v0, v5, :cond_12c

    .line 275
    const-string v0, "BlobCache"

    const-string v1, "invalid data file magic"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 276
    goto/16 :goto_2f

    .line 278
    :cond_12c
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v8}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v0

    if-eq v0, v4, :cond_13e

    .line 279
    const-string v0, "BlobCache"

    const-string v1, "cannot read data file magic"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 280
    goto/16 :goto_2f

    .line 282
    :cond_13e
    const/4 v0, 0x0

    invoke-static {v8, v0}, Lcom/lge/gallery/common/BlobCache;->readInt([BI)I

    move-result v0

    if-eq v0, v5, :cond_14f

    .line 283
    const-string v0, "BlobCache"

    const-string v1, "invalid data file magic"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v10

    .line 284
    goto/16 :goto_2f

    .line 288
    :cond_14f
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    .line 289
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexChannel:Ljava/nio/channels/FileChannel;

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_WRITE:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v2, 0x0

    iget-object v4, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    .line 291
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/MappedByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 293
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->setActiveVariables()V
    :try_end_173
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_173} :catch_176

    move v0, v11

    .line 294
    goto/16 :goto_2f

    .line 295
    .end local v6    # "buf":[B
    .end local v8    # "magic":[B
    .end local v9    # "sum":I
    :catch_176
    move-exception v7

    .line 296
    .local v7, "ex":Ljava/io/IOException;
    const-string v0, "BlobCache"

    const-string v1, "loadIndex failed."

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move v0, v10

    .line 297
    goto/16 :goto_2f
.end method

.method private lookupInternal(JI)Z
    .registers 15
    .param p1, "key"    # J
    .param p3, "hashStart"    # I

    .prologue
    const/4 v6, 0x0

    .line 564
    iget v7, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    int-to-long v8, v7

    rem-long v8, p1, v8

    long-to-int v4, v8

    .line 565
    .local v4, "slot":I
    if-gez v4, :cond_c

    .line 566
    iget v7, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    add-int/2addr v4, v7

    .line 568
    :cond_c
    move v5, v4

    .line 570
    .local v5, "slotBegin":I
    :cond_d
    :goto_d
    mul-int/lit8 v7, v4, 0xc

    add-int v3, p3, v7

    .line 571
    .local v3, "offset":I
    iget-object v7, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v7, v3}, Ljava/nio/MappedByteBuffer;->getLong(I)J

    move-result-wide v0

    .line 572
    .local v0, "candidateKey":J
    iget-object v7, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    add-int/lit8 v8, v3, 0x8

    invoke-virtual {v7, v8}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v2

    .line 573
    .local v2, "candidateOffset":I
    if-nez v2, :cond_24

    .line 574
    iput v3, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    .line 579
    :goto_23
    return v6

    .line 576
    :cond_24
    cmp-long v7, v0, p1

    if-nez v7, :cond_2e

    .line 577
    iput v3, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    .line 578
    iput v2, p0, Lcom/lge/gallery/common/BlobCache;->mFileOffset:I

    .line 579
    const/4 v6, 0x1

    goto :goto_23

    .line 581
    :cond_2e
    add-int/lit8 v4, v4, 0x1

    iget v7, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-lt v4, v7, :cond_35

    .line 582
    const/4 v4, 0x0

    .line 584
    :cond_35
    if-ne v4, v5, :cond_d

    .line 585
    const-string v7, "BlobCache"

    const-string v8, "corrupted index: clear the slot."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    iget-object v7, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    mul-int/lit8 v8, v4, 0xc

    add-int/2addr v8, p3

    add-int/lit8 v8, v8, 0x8

    invoke-virtual {v7, v8, v6}, Ljava/nio/MappedByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    goto :goto_d
.end method

.method static readInt([BI)I
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 659
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method static readLong([BI)J
    .registers 10
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 666
    add-int/lit8 v1, p1, 0x7

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v2, v1

    .line 667
    .local v2, "result":J
    const/4 v0, 0x6

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_1a

    .line 668
    const/16 v1, 0x8

    shl-long v4, v2, v1

    add-int v1, p1, v0

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v6, v1

    or-long v2, v4, v6

    .line 667
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 670
    :cond_1a
    return-wide v2
.end method

.method private resetCache(II)V
    .registers 14
    .param p1, "maxEntries"    # I
    .param p2, "maxBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x1c

    const/4 v7, 0x4

    const-wide/16 v8, 0x0

    const/4 v6, 0x0

    .line 318
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 319
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    mul-int/lit8 v3, p1, 0xc

    mul-int/lit8 v3, v3, 0x2

    add-int/lit8 v3, v3, 0x20

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 320
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 321
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    .line 322
    .local v0, "buf":[B
    const v2, -0x4cd8cfd0

    invoke-static {v0, v6, v2}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 323
    invoke-static {v0, v7, p1}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 324
    const/16 v2, 0x8

    invoke-static {v0, v2, p2}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 325
    const/16 v2, 0xc

    invoke-static {v0, v2, v6}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 326
    const/16 v2, 0x10

    invoke-static {v0, v2, v6}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 327
    const/16 v2, 0x14

    invoke-static {v0, v2, v7}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 328
    const/16 v2, 0x18

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mVersion:I

    invoke-static {v0, v2, v3}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 329
    invoke-virtual {p0, v0, v6, v10}, Lcom/lge/gallery/common/BlobCache;->checkSum([BII)I

    move-result v2

    invoke-static {v0, v10, v2}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 330
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mIndexFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->write([B)V

    .line 332
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 333
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 334
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 335
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 336
    const v2, -0x42db7af0

    invoke-static {v0, v6, v2}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 337
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 338
    iget-object v2, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0, v6, v7}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 340
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mSteteListener:Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .line 341
    .local v1, "listener":Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;
    if-eqz v1, :cond_79

    .line 342
    invoke-interface {v1}, Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;->onReset()V

    .line 344
    :cond_79
    return-void
.end method

.method private setActiveVariables()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 302
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    if-nez v0, :cond_35

    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    :goto_8
    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    .line 303
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_38

    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    :goto_11
    iput-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveDataFile:Ljava/io/RandomAccessFile;

    .line 304
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 305
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 307
    iput v4, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    .line 308
    iput v4, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveHashStart:I

    .line 310
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveRegion:I

    if-nez v0, :cond_3b

    .line 311
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveHashStart:I

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveHashStart:I

    .line 315
    :goto_34
    return-void

    .line 302
    :cond_35
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    goto :goto_8

    .line 303
    :cond_38
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    goto :goto_11

    .line 313
    :cond_3b
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    goto :goto_34
.end method

.method private updateIndexHeader()V
    .registers 5

    .prologue
    const/16 v3, 0x1c

    const/4 v2, 0x0

    .line 369
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    invoke-virtual {p0, v1, v2, v3}, Lcom/lge/gallery/common/BlobCache;->checkSum([BII)I

    move-result v1

    invoke-static {v0, v3, v1}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 371
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 372
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    invoke-virtual {v0, v1}, Ljava/nio/MappedByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 373
    return-void
.end method

.method static writeInt([BII)V
    .registers 6
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 674
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_10

    .line 675
    add-int v1, p1, v0

    and-int/lit16 v2, p2, 0xff

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 676
    shr-int/lit8 p2, p2, 0x8

    .line 674
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 678
    :cond_10
    return-void
.end method

.method static writeLong([BIJ)V
    .registers 10
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .param p2, "value"    # J

    .prologue
    const/16 v4, 0x8

    .line 681
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, v4, :cond_12

    .line 682
    add-int v1, p1, v0

    const-wide/16 v2, 0xff

    and-long/2addr v2, p2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 683
    shr-long/2addr p2, v4

    .line 681
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 685
    :cond_12
    return-void
.end method


# virtual methods
.method checkSum([B)I
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 636
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    .line 637
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0, p1}, Ljava/util/zip/Adler32;->update([B)V

    .line 638
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method checkSum([BII)I
    .registers 6
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "nbytes"    # I

    .prologue
    .line 642
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->reset()V

    .line 643
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Adler32;->update([BII)V

    .line 644
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mAdler32:Ljava/util/zip/Adler32;

    invoke-virtual {v0}, Ljava/util/zip/Adler32;->getValue()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public close()V
    .registers 1

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/lge/gallery/common/BlobCache;->syncAll()V

    .line 192
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->closeAll()V

    .line 193
    return-void
.end method

.method getActiveCount()I
    .registers 8

    .prologue
    .line 619
    const/4 v1, 0x0

    .line 620
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-ge v2, v4, :cond_1b

    .line 621
    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    mul-int/lit8 v5, v2, 0xc

    add-int v3, v4, v5

    .line 622
    .local v3, "offset":I
    iget-object v4, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    add-int/lit8 v5, v3, 0x8

    invoke-virtual {v4, v5}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v0

    .line 623
    .local v0, "candidateOffset":I
    if-eqz v0, :cond_18

    .line 624
    add-int/lit8 v1, v1, 0x1

    .line 620
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 627
    .end local v0    # "candidateOffset":I
    .end local v3    # "offset":I
    :cond_1b
    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    if-ne v1, v4, :cond_20

    .line 631
    .end local v1    # "count":I
    :goto_1f
    return v1

    .line 630
    .restart local v1    # "count":I
    :cond_20
    const-string v4, "BlobCache"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "wrong active count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " vs "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    const/4 v1, -0x1

    goto :goto_1f
.end method

.method public insert(J[B)V
    .registers 7
    .param p1, "key"    # J
    .param p3, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 388
    array-length v0, p3

    add-int/lit8 v0, v0, 0x18

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    if-le v0, v1, :cond_f

    .line 389
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "blob is too large!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 392
    :cond_f
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    add-int/lit8 v0, v0, 0x14

    array-length v1, p3

    add-int/2addr v0, v1

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    if-gt v0, v1, :cond_21

    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-lt v0, v1, :cond_24

    .line 394
    :cond_21
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->flipRegion()V

    .line 397
    :cond_24
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, p1, p2, v0}, Lcom/lge/gallery/common/BlobCache;->lookupInternal(JI)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 400
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    .line 401
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v1, 0x10

    iget v2, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 404
    :cond_3b
    array-length v0, p3

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/lge/gallery/common/BlobCache;->insertInternal(J[BI)V

    .line 405
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->updateIndexHeader()V

    .line 406
    return-void
.end method

.method public lookup(Lcom/lge/gallery/common/BlobCache$LookupRequest;)Z
    .registers 9
    .param p1, "req"    # Lcom/lge/gallery/common/BlobCache$LookupRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 460
    iget-wide v4, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveHashStart:I

    invoke-direct {p0, v4, v5, v3}, Lcom/lge/gallery/common/BlobCache;->lookupInternal(JI)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 461
    iget-object v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveDataFile:Ljava/io/RandomAccessFile;

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mFileOffset:I

    invoke-direct {p0, v3, v4, p1}, Lcom/lge/gallery/common/BlobCache;->getBlob(Ljava/io/RandomAccessFile;ILcom/lge/gallery/common/BlobCache$LookupRequest;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 494
    :cond_15
    :goto_15
    return v2

    .line 469
    :cond_16
    iget v0, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    .line 472
    .local v0, "insertOffset":I
    iget-wide v4, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveHashStart:I

    invoke-direct {p0, v4, v5, v3}, Lcom/lge/gallery/common/BlobCache;->lookupInternal(JI)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 473
    iget-object v3, p0, Lcom/lge/gallery/common/BlobCache;->mInactiveDataFile:Ljava/io/RandomAccessFile;

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mFileOffset:I

    invoke-direct {p0, v3, v4, p1}, Lcom/lge/gallery/common/BlobCache;->getBlob(Ljava/io/RandomAccessFile;ILcom/lge/gallery/common/BlobCache$LookupRequest;)Z

    move-result v3

    if-eqz v3, :cond_66

    .line 476
    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveBytes:I

    add-int/lit8 v3, v3, 0x14

    iget v4, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->length:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mMaxBytes:I

    if-gt v3, v4, :cond_15

    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    mul-int/lit8 v3, v3, 0x2

    iget v4, p0, Lcom/lge/gallery/common/BlobCache;->mMaxEntries:I

    if-ge v3, v4, :cond_15

    .line 481
    iput v0, p0, Lcom/lge/gallery/common/BlobCache;->mSlotOffset:I

    .line 483
    :try_start_41
    iget-wide v4, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    iget-object v3, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    iget v6, p1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->length:I

    invoke-direct {p0, v4, v5, v3, v6}, Lcom/lge/gallery/common/BlobCache;->insertInternal(J[BI)V

    .line 484
    iget v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    .line 485
    iget-object v3, p0, Lcom/lge/gallery/common/BlobCache;->mIndexHeader:[B

    const/16 v4, 0x10

    iget v5, p0, Lcom/lge/gallery/common/BlobCache;->mActiveEntries:I

    invoke-static {v3, v4, v5}, Lcom/lge/gallery/common/BlobCache;->writeInt([BII)V

    .line 486
    invoke-direct {p0}, Lcom/lge/gallery/common/BlobCache;->updateIndexHeader()V
    :try_end_5c
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_5c} :catch_5d

    goto :goto_15

    .line 487
    :catch_5d
    move-exception v1

    .line 488
    .local v1, "t":Ljava/lang/Throwable;
    const-string v3, "BlobCache"

    const-string v4, "cannot copy over"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15

    .line 494
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_66
    const/4 v2, 0x0

    goto :goto_15
.end method

.method public lookup(J)[B
    .registers 6
    .param p1, "key"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 439
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

    iput-wide p1, v1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->key:J

    .line 440
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

    iput-object v0, v1, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    .line 441
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

    invoke-virtual {p0, v1}, Lcom/lge/gallery/common/BlobCache;->lookup(Lcom/lge/gallery/common/BlobCache$LookupRequest;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 442
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mLookupRequest:Lcom/lge/gallery/common/BlobCache$LookupRequest;

    iget-object v0, v0, Lcom/lge/gallery/common/BlobCache$LookupRequest;->buffer:[B

    .line 444
    :cond_15
    return-object v0
.end method

.method public notifyCacheDeleted()V
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/lge/gallery/common/BlobCache;->mSteteListener:Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .line 182
    .local v0, "listener":Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;
    if-eqz v0, :cond_7

    .line 183
    invoke-interface {v0}, Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;->onCacheDeleted()V

    .line 185
    :cond_7
    return-void
.end method

.method public setStateChangedListener(Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/lge/gallery/common/BlobCache;->mSteteListener:Lcom/lge/gallery/common/BlobCache$BlobCacheStateChangedListener;

    .line 204
    return-void
.end method

.method public syncAll()V
    .registers 4

    .prologue
    .line 601
    invoke-virtual {p0}, Lcom/lge/gallery/common/BlobCache;->syncIndex()V

    .line 603
    :try_start_3
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile0:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_c} :catch_16

    .line 608
    :goto_c
    :try_start_c
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mDataFile1:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_15} :catch_1f

    .line 612
    :goto_15
    return-void

    .line 604
    :catch_16
    move-exception v0

    .line 605
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "BlobCache"

    const-string v2, "sync data file 0 failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c

    .line 609
    .end local v0    # "t":Ljava/lang/Throwable;
    :catch_1f
    move-exception v0

    .line 610
    .restart local v0    # "t":Ljava/lang/Throwable;
    const-string v1, "BlobCache"

    const-string v2, "sync data file 1 failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15
.end method

.method public syncIndex()V
    .registers 4

    .prologue
    .line 594
    :try_start_0
    iget-object v1, p0, Lcom/lge/gallery/common/BlobCache;->mIndexBuffer:Ljava/nio/MappedByteBuffer;

    invoke-virtual {v1}, Ljava/nio/MappedByteBuffer;->force()Ljava/nio/MappedByteBuffer;
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_6

    .line 598
    :goto_5
    return-void

    .line 595
    :catch_6
    move-exception v0

    .line 596
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "BlobCache"

    const-string v2, "sync index failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method
