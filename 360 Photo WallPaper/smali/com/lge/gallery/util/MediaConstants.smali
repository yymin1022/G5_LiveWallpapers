.class public Lcom/lge/gallery/util/MediaConstants;
.super Ljava/lang/Object;
.source "MediaConstants.java"


# static fields
.field public static final ALLFILES_ALBUM_PATH:Ljava/lang/String; = "/local/allfiles"

.field public static final BUCKET_ID_IS_NOT_USED:I = -0x1

.field public static final BUCKET_PROJECTION_IMAGES:[Ljava/lang/String;

.field public static final BUCKET_PROJECTION_VIDEOS:[Ljava/lang/String;

.field public static final FAVORITE_ALBUM_PATH:Ljava/lang/String; = "/local/favorite"

.field public static final OTG_ALBUM_PATH:Ljava/lang/String; = "otg"

.field public static final PATH_PREFIX_QTHEATER:Ljava/lang/String; = "qtheater"

.field public static final QTHEATER_ALL_BUCKET_PATH:Ljava/lang/String; = "/qtheater/all/1"

.field public static final SECURE_ALBUM_PATH:Ljava/lang/String; = "/local/secure"

.field public static final TIMESTAMP_DAY_ALBUM_PATH:Ljava/lang/String; = "/local/time/day/all"

.field public static final TIMESTAMP_MONTH_ALBUM_PATH:Ljava/lang/String; = "/local/time/month/all"

.field public static final TIMESTAMP_YEAR_ALBUM_PATH:Ljava/lang/String; = "/local/time/year/all"


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "bucket_id"

    aput-object v1, v0, v2

    const-string v1, "bucket_display_name"

    aput-object v1, v0, v3

    sput-object v0, Lcom/lge/gallery/util/MediaConstants;->BUCKET_PROJECTION_IMAGES:[Ljava/lang/String;

    .line 30
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "bucket_id"

    aput-object v1, v0, v2

    const-string v1, "bucket_display_name"

    aput-object v1, v0, v3

    sput-object v0, Lcom/lge/gallery/util/MediaConstants;->BUCKET_PROJECTION_VIDEOS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
