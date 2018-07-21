.class public Lcom/lge/gallery/data/ExifInfo;
.super Ljava/lang/Object;
.source "ExifInfo.java"


# static fields
.field public static final EXIF_TAGS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 42
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "DateTime"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Make"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Model"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Flash"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "GPSLatitude"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "GPSLongitude"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "GPSLatitudeRef"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "GPSLongitudeRef"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "GPSAltitude"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "GPSAltitudeRef"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "GPSTimeStamp"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "GPSDateStamp"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "WhiteBalance"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "FocalLength"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "GPSProcessingMethod"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/data/ExifInfo;->EXIF_TAGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
