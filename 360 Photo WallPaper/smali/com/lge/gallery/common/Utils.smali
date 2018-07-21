.class public Lcom/lge/gallery/common/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final INITIALCRC:J = -0x1L

.field private static final IS_DEBUG_BUILD:Z

.field private static final MASK_STRING:Ljava/lang/String; = "********************************"

.field private static final POLY64REV:J = -0x6a536cd653b4364bL

.field private static final TAG:Ljava/lang/String; = "Utils"

.field private static sCrcTable:[J


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .prologue
    const/16 v10, 0x100

    const/4 v7, 0x1

    .line 19
    sget-object v6, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v8, "eng"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_17

    sget-object v6, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v8, "userdebug"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_38

    :cond_17
    move v6, v7

    :goto_18
    sput-boolean v6, Lcom/lge/gallery/common/Utils;->IS_DEBUG_BUILD:Z

    .line 24
    new-array v6, v10, [J

    sput-object v6, Lcom/lge/gallery/common/Utils;->sCrcTable:[J

    .line 65
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1f
    if-ge v0, v10, :cond_44

    .line 66
    int-to-long v2, v0

    .line 67
    .local v2, "part":J
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_23
    const/16 v6, 0x8

    if-ge v1, v6, :cond_3d

    .line 68
    long-to-int v6, v2

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_3a

    const-wide v4, -0x6a536cd653b4364bL    # -2.848111467964452E-204

    .line 69
    .local v4, "x":J
    :goto_31
    shr-long v8, v2, v7

    xor-long v2, v8, v4

    .line 67
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 19
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "part":J
    .end local v4    # "x":J
    :cond_38
    const/4 v6, 0x0

    goto :goto_18

    .line 68
    .restart local v0    # "i":I
    .restart local v1    # "j":I
    .restart local v2    # "part":J
    :cond_3a
    const-wide/16 v4, 0x0

    goto :goto_31

    .line 71
    :cond_3d
    sget-object v6, Lcom/lge/gallery/common/Utils;->sCrcTable:[J

    aput-wide v2, v6, v0

    .line 65
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 73
    .end local v1    # "j":I
    .end local v2    # "part":J
    :cond_44
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assertTrue(Z)V
    .registers 2
    .param p0, "cond"    # Z

    .prologue
    .line 27
    if-nez p0, :cond_8

    .line 28
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_8
    return-void
.end method

.method public static varargs assertTrue(ZLjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p0, "cond"    # Z
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 34
    if-nez p0, :cond_10

    .line 35
    new-instance v0, Ljava/lang/AssertionError;

    array-length v1, p2

    if-nez v1, :cond_b

    .end local p1    # "message":Ljava/lang/String;
    :goto_7
    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .restart local p1    # "message":Ljava/lang/String;
    :cond_b
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_7

    .line 38
    :cond_10
    return-void
.end method

.method public static ceilLog2(F)I
    .registers 3
    .param p0, "value"    # F

    .prologue
    .line 206
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x1f

    if-ge v0, v1, :cond_c

    .line 207
    const/4 v1, 0x1

    shl-int/2addr v1, v0

    int-to-float v1, v1

    cmpl-float v1, v1, p0

    if-ltz v1, :cond_d

    .line 211
    :cond_c
    return v0

    .line 206
    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 188
    .local p0, "object":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 189
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 191
    :cond_8
    return-object p0
.end method

.method public static clamp(FFF)F
    .registers 4
    .param p0, "x"    # F
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 152
    cmpl-float v0, p0, p2

    if-lez v0, :cond_5

    .line 158
    .end local p2    # "max":F
    :goto_4
    return p2

    .line 155
    .restart local p2    # "max":F
    :cond_5
    cmpg-float v0, p0, p1

    if-gez v0, :cond_b

    move p2, p1

    .line 156
    goto :goto_4

    :cond_b
    move p2, p0

    .line 158
    goto :goto_4
.end method

.method public static clamp(III)I
    .registers 3
    .param p0, "x"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 141
    if-le p0, p2, :cond_3

    .line 147
    .end local p2    # "max":I
    :goto_2
    return p2

    .line 144
    .restart local p2    # "max":I
    :cond_3
    if-ge p0, p1, :cond_7

    move p2, p1

    .line 145
    goto :goto_2

    :cond_7
    move p2, p0

    .line 147
    goto :goto_2
.end method

.method public static clamp(JJJ)J
    .registers 8
    .param p0, "x"    # J
    .param p2, "min"    # J
    .param p4, "max"    # J

    .prologue
    .line 163
    cmp-long v0, p0, p4

    if-lez v0, :cond_5

    .line 169
    .end local p4    # "max":J
    :goto_4
    return-wide p4

    .line 166
    .restart local p4    # "max":J
    :cond_5
    cmp-long v0, p0, p2

    if-gez v0, :cond_b

    move-wide p4, p2

    .line 167
    goto :goto_4

    :cond_b
    move-wide p4, p0

    .line 169
    goto :goto_4
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 102
    if-nez p0, :cond_3

    .line 110
    :goto_2
    return-void

    .line 106
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 107
    :catch_7
    move-exception v0

    .line 108
    .local v0, "t":Ljava/lang/Throwable;
    const-string v1, "Utils"

    const-string v2, "close fail"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method public static compare(JJ)I
    .registers 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    .line 94
    cmp-long v0, p0, p2

    if-gez v0, :cond_6

    const/4 v0, -0x1

    :goto_5
    return v0

    :cond_6
    cmp-long v0, p0, p2

    if-nez v0, :cond_c

    const/4 v0, 0x0

    goto :goto_5

    :cond_c
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public static final crc64Long(Ljava/lang/String;)J
    .registers 3
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 56
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_b

    .line 57
    :cond_8
    const-wide/16 v0, 0x0

    .line 59
    :goto_a
    return-wide v0

    :cond_b
    invoke-static {p0}, Lcom/lge/gallery/common/Utils;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->crc64Long([B)J

    move-result-wide v0

    goto :goto_a
.end method

.method public static final crc64Long([B)J
    .registers 9
    .param p0, "buffer"    # [B

    .prologue
    .line 76
    const-wide/16 v0, -0x1

    .line 77
    .local v0, "crc":J
    const/4 v2, 0x0

    .local v2, "k":I
    array-length v3, p0

    .local v3, "n":I
    :goto_4
    if-ge v2, v3, :cond_19

    .line 78
    sget-object v4, Lcom/lge/gallery/common/Utils;->sCrcTable:[J

    long-to-int v5, v0

    aget-byte v6, p0, v2

    xor-int/2addr v5, v6

    and-int/lit16 v5, v5, 0xff

    aget-wide v4, v4, v5

    const/16 v6, 0x8

    shr-long v6, v0, v6

    xor-long v0, v4, v6

    .line 77
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 80
    :cond_19
    return-wide v0
.end method

.method public static ensureNotNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 98
    if-nez p0, :cond_4

    const-string p0, ""

    .end local p0    # "value":Ljava/lang/String;
    :cond_4
    return-object p0
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 175
    if-eq p0, p1, :cond_c

    if-nez p0, :cond_6

    :cond_4
    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_c
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public static floorLog2(F)I
    .registers 3
    .param p0, "value"    # F

    .prologue
    .line 196
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v1, 0x1f

    if-ge v0, v1, :cond_c

    .line 197
    const/4 v1, 0x1

    shl-int/2addr v1, v0

    int-to-float v1, v1

    cmpl-float v1, v1, p0

    if-lez v1, :cond_f

    .line 201
    :cond_c
    add-int/lit8 v1, v0, -0x1

    return v1

    .line 196
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static getBytes(Ljava/lang/String;)[B
    .registers 9
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    mul-int/lit8 v7, v7, 0x2

    new-array v6, v7, [B

    .line 85
    .local v6, "result":[B
    const/4 v4, 0x0

    .line 86
    .local v4, "output":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, "arr$":[C
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v5, v4

    .end local v4    # "output":I
    .local v5, "output":I
    :goto_10
    if-ge v2, v3, :cond_25

    aget-char v1, v0, v2

    .line 87
    .local v1, "ch":C
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "output":I
    .restart local v4    # "output":I
    and-int/lit16 v7, v1, 0xff

    int-to-byte v7, v7

    aput-byte v7, v6, v5

    .line 88
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "output":I
    .restart local v5    # "output":I
    shr-int/lit8 v7, v1, 0x8

    int-to-byte v7, v7

    aput-byte v7, v6, v4

    .line 86
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 90
    .end local v1    # "ch":C
    :cond_25
    return-object v6
.end method

.method public static isOpaque(I)Z
    .registers 3
    .param p0, "color"    # I

    .prologue
    .line 215
    ushr-int/lit8 v0, p0, 0x18

    const/16 v1, 0xff

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static maskDebugInfo(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p0, "info"    # Ljava/lang/Object;

    .prologue
    .line 41
    if-nez p0, :cond_4

    .line 42
    const/4 v1, 0x0

    .line 46
    :cond_3
    :goto_3
    return-object v1

    .line 44
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 45
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const-string v3, "********************************"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 46
    .local v0, "length":I
    sget-boolean v2, Lcom/lge/gallery/common/Utils;->IS_DEBUG_BUILD:Z

    if-nez v2, :cond_3

    const-string v2, "********************************"

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static nextPowerOf2(I)I
    .registers 2
    .param p0, "n"    # I

    .prologue
    .line 117
    if-lez p0, :cond_6

    const/high16 v0, 0x40000000    # 2.0f

    if-le p0, v0, :cond_c

    .line 118
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 120
    :cond_c
    add-int/lit8 p0, p0, -0x1

    .line 121
    shr-int/lit8 v0, p0, 0x10

    or-int/2addr p0, v0

    .line 122
    shr-int/lit8 v0, p0, 0x8

    or-int/2addr p0, v0

    .line 123
    shr-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    .line 124
    shr-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    .line 125
    shr-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    .line 126
    add-int/lit8 v0, p0, 0x1

    return v0
.end method

.method public static prevPowerOf2(I)I
    .registers 2
    .param p0, "n"    # I

    .prologue
    .line 133
    if-gtz p0, :cond_8

    .line 134
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 136
    :cond_8
    invoke-static {p0}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v0

    return v0
.end method

.method public static waitWithoutInterrupt(Ljava/lang/Object;)V
    .registers 5
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 180
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_4

    .line 184
    :goto_3
    return-void

    .line 181
    :catch_4
    move-exception v0

    .line 182
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "Utils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unexpected interrupt: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3
.end method
