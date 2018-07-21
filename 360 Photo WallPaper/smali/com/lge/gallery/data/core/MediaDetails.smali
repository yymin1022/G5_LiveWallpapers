.class public Lcom/lge/gallery/data/core/MediaDetails;
.super Ljava/lang/Object;
.source "MediaDetails.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/MediaDetails$FlashState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaDetails"


# instance fields
.field private mDetails:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mUnits:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mDetails:Ljava/util/TreeMap;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mUnits:Ljava/util/HashMap;

    .line 36
    return-void
.end method

.method public static extractExifInfo(Lcom/lge/gallery/data/core/MediaDetails;Ljava/lang/String;)V
    .registers 10
    .param p0, "details"    # Lcom/lge/gallery/data/core/MediaDetails;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 127
    if-nez p1, :cond_a

    .line 128
    const-string v4, "MediaDetails"

    const-string v5, "fail to extract EXIF : filePath is null"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :cond_9
    :goto_9
    return-void

    .line 132
    :cond_a
    :try_start_a
    new-instance v3, Landroid/media/ExifInterface;

    invoke-direct {v3, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 133
    .local v3, "exif":Landroid/media/ExifInterface;
    const-string v4, "Flash"

    const/16 v5, 0x66

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 134
    const-string v4, "ImageWidth"

    const/4 v5, 0x6

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 135
    const-string v4, "ImageLength"

    const/4 v5, 0x7

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 137
    const-string v4, "Make"

    const/16 v5, 0x64

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 138
    const-string v4, "Model"

    const/16 v5, 0x65

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 139
    const-string v4, "FNumber"

    const/16 v5, 0x69

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 140
    const-string v4, "ISOSpeedRatings"

    const/16 v5, 0x6c

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 141
    const-string v4, "WhiteBalance"

    const/16 v5, 0x68

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 143
    const-string v4, "ExposureTime"

    const/16 v5, 0x6b

    invoke-static {p0, v3, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V

    .line 146
    const-string v4, "FocalLength"

    const-wide/16 v6, 0x0

    invoke-virtual {v3, v4, v6, v7}, Landroid/media/ExifInterface;->getAttributeDouble(Ljava/lang/String;D)D

    move-result-wide v0

    .line 147
    .local v0, "data":D
    const-wide/16 v4, 0x0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Double;->compare(DD)I

    move-result v4

    if-eqz v4, :cond_9

    .line 148
    const/16 v4, 0x67

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    .line 149
    const/16 v4, 0x67

    sget v5, Lcom/lge/gallery/common/R$string;->unit_mm:I

    invoke-virtual {p0, v4, v5}, Lcom/lge/gallery/data/core/MediaDetails;->setUnit(II)V
    :try_end_6c
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_6c} :catch_6d

    goto :goto_9

    .line 151
    .end local v0    # "data":D
    .end local v3    # "exif":Landroid/media/ExifInterface;
    :catch_6d
    move-exception v2

    .line 153
    .local v2, "ex":Ljava/io/IOException;
    const-string v4, "MediaDetails"

    const-string v5, ""

    invoke-static {v4, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method public static getOrientation(I)Ljava/lang/String;
    .registers 3
    .param p0, "rotate"    # I

    .prologue
    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u202a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u00b0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getResolution(II)Ljava/lang/String;
    .registers 6
    .param p0, "width"    # I
    .param p1, "height"    # I

    .prologue
    .line 158
    const-string v0, "%dx%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getResolution(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "width"    # Ljava/lang/String;
    .param p1, "height"    # Ljava/lang/String;

    .prologue
    .line 163
    :try_start_0
    const-string v1, "%dx%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_1e} :catch_20

    move-result-object v1

    .line 166
    :goto_1f
    return-object v1

    .line 164
    :catch_20
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v1, "MediaDetails"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "NumberFormatException in getResolution "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    const/4 v1, 0x0

    goto :goto_1f
.end method

.method private static setExifData(Lcom/lge/gallery/data/core/MediaDetails;Landroid/media/ExifInterface;Ljava/lang/String;I)V
    .registers 9
    .param p0, "details"    # Lcom/lge/gallery/data/core/MediaDetails;
    .param p1, "exif"    # Landroid/media/ExifInterface;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "key"    # I

    .prologue
    .line 99
    const/4 v3, 0x6

    if-ne p3, v3, :cond_4

    .line 124
    :cond_3
    :goto_3
    return-void

    .line 103
    :cond_4
    invoke-virtual {p1, p2}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 105
    const/16 v3, 0x66

    if-ne p3, v3, :cond_1f

    .line 106
    new-instance v0, Lcom/lge/gallery/data/core/MediaDetails$FlashState;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v0, v3}, Lcom/lge/gallery/data/core/MediaDetails$FlashState;-><init>(I)V

    .line 108
    .local v0, "state":Lcom/lge/gallery/data/core/MediaDetails$FlashState;
    invoke-virtual {p0, p3, v0}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    goto :goto_3

    .line 110
    .end local v0    # "state":Lcom/lge/gallery/data/core/MediaDetails$FlashState;
    :cond_1f
    const/4 v3, 0x7

    if-ne p3, v3, :cond_44

    .line 111
    const-string v3, "ImageWidth"

    invoke-virtual {p1, v3}, Landroid/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "width":Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 115
    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "0"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 118
    const/16 v3, 0xb

    invoke-static {v2, v1}, Lcom/lge/gallery/data/core/MediaDetails;->getResolution(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    goto :goto_3

    .line 121
    .end local v2    # "width":Ljava/lang/String;
    :cond_44
    invoke-virtual {p0, p3, v1}, Lcom/lge/gallery/data/core/MediaDetails;->addDetail(ILjava/lang/Object;)V

    goto :goto_3
.end method


# virtual methods
.method public addDetail(ILjava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mDetails:Ljava/util/TreeMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    return-void
.end method

.method public getDetail(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mDetails:Ljava/util/TreeMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getUnit(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 94
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mUnits:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public hasUnit(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mUnits:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 82
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mDetails:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public setUnit(II)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "unit"    # I

    .prologue
    .line 86
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mUnits:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/lge/gallery/data/core/MediaDetails;->mDetails:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    return v0
.end method
