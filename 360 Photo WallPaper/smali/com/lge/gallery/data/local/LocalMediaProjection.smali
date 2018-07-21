.class public Lcom/lge/gallery/data/local/LocalMediaProjection;
.super Ljava/lang/Object;
.source "LocalMediaProjection.java"


# static fields
.field static final BURST_ID:Ljava/lang/String; = "burst_id"

.field private static final COLUMN_TITLE_PROTECTION_TYPE:Ljava/lang/String; = "protected_type"

.field public static final DECREASE_FACTOR_AFTER_COMMON_INDEX:I = 0x1

.field public static final INDEX_BUCKET_ID:I = 0x9

.field public static final INDEX_BURST_COUNTER:I = 0x13

.field public static final INDEX_BURST_ID:I = 0x12

.field public static final INDEX_CAMERA_MODE:I = 0xe

.field public static final INDEX_CAPTION:I = 0x1

.field public static final INDEX_DATA:I = 0x8

.field public static final INDEX_DATE_ADDED:I = 0x6

.field public static final INDEX_DATE_MODIFIED:I = 0x7

.field public static final INDEX_DATE_TAKEN:I = 0x5

.field public static final INDEX_DURATION:I = 0x15

.field public static final INDEX_FAVORITE:I = 0xb

.field public static final INDEX_HEIGHT:I = 0x11

.field public static final INDEX_ID:I = 0x0

.field public static final INDEX_LATITUDE:I = 0x3

.field public static final INDEX_LONGITUDE:I = 0x4

.field public static final INDEX_MEDIA_TYPE:I = 0xd

.field public static final INDEX_MIME_TYPE:I = 0x2

.field public static final INDEX_ORIENTATION:I = 0xf

.field public static final INDEX_PROTECTION:I = 0xc

.field public static final INDEX_RESOLUTION:I = 0x14

.field public static final INDEX_SIZE_ID:I = 0xa

.field public static final INDEX_WIDTH:I = 0x10

.field public static final KEY_BUCKET_ID:Ljava/lang/String; = "bucket_id"

.field public static final KEY_BURST_COUNTER:Ljava/lang/String; = "count(burst_id)"

.field public static final KEY_BURST_ID:Ljava/lang/String; = "burst_id"

.field public static final KEY_CAMERA_MODE:Ljava/lang/String; = "camera_mode"

.field public static final KEY_CAPTION:Ljava/lang/String; = "title"

.field public static final KEY_DATA:Ljava/lang/String; = "_data"

.field public static final KEY_DATE_ADDED:Ljava/lang/String; = "date_added"

.field public static final KEY_DATE_MODIFIED:Ljava/lang/String; = "date_modified"

.field public static final KEY_DATE_TAKEN:Ljava/lang/String; = "datetaken"

.field public static final KEY_DURATION:Ljava/lang/String; = "duration"

.field public static final KEY_FAVORITE:Ljava/lang/String; = "0"

.field public static final KEY_HEIGHT:Ljava/lang/String; = "height"

.field public static final KEY_ID:Ljava/lang/String; = "_id"

.field public static final KEY_LATITUDE:Ljava/lang/String; = "latitude"

.field public static final KEY_LONGITUDE:Ljava/lang/String; = "longitude"

.field public static final KEY_MEDIA_TYPE:Ljava/lang/String; = "media_type"

.field public static final KEY_MIME_TYPE:Ljava/lang/String; = "mime_type"

.field public static final KEY_ORIENTATION:Ljava/lang/String; = "orientation"

.field public static final KEY_PROTECTION:Ljava/lang/String;

.field public static final KEY_RESOLUTION:Ljava/lang/String; = "resolution"

.field public static final KEY_SIZE_ID:Ljava/lang/String; = "_size"

.field public static final KEY_WIDTH:Ljava/lang/String; = "width"

.field public static final LAST_COMMON_INDEX:I = 0xe

.field public static final LAST_IMAGE_INDEX:I = 0x13

.field public static final LAST_VIDEO_INDEX:I = 0x15

.field public static final MERGED_PROJECTION:[Ljava/lang/String;

.field public static final PROJECTION_INDEX_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 66
    sget-boolean v3, Lcom/lge/gallery/sys/Config$Feature;->PROTECTION_TYPE_IN_MEDIADB:Z

    if-eqz v3, :cond_b7

    const-string v3, "protected_type"

    :goto_6
    sput-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    .line 103
    const/16 v3, 0x16

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "title"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "mime_type"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const-string v5, "latitude"

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "longitude"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const-string v5, "datetaken"

    aput-object v5, v3, v4

    const/4 v4, 0x6

    const-string v5, "date_added"

    aput-object v5, v3, v4

    const/4 v4, 0x7

    const-string v5, "date_modified"

    aput-object v5, v3, v4

    const/16 v4, 0x8

    const-string v5, "_data"

    aput-object v5, v3, v4

    const/16 v4, 0x9

    const-string v5, "bucket_id"

    aput-object v5, v3, v4

    const/16 v4, 0xa

    const-string v5, "_size"

    aput-object v5, v3, v4

    const/16 v4, 0xb

    const-string v5, "0"

    aput-object v5, v3, v4

    const/16 v4, 0xc

    sget-object v5, Lcom/lge/gallery/data/local/LocalMediaProjection;->KEY_PROTECTION:Ljava/lang/String;

    aput-object v5, v3, v4

    const/16 v4, 0xd

    const-string v5, "media_type"

    aput-object v5, v3, v4

    const/16 v4, 0xe

    const-string v5, "camera_mode"

    aput-object v5, v3, v4

    const/16 v4, 0xf

    const-string v5, "orientation"

    aput-object v5, v3, v4

    const/16 v4, 0x10

    const-string v5, "width"

    aput-object v5, v3, v4

    const/16 v4, 0x11

    const-string v5, "height"

    aput-object v5, v3, v4

    const/16 v4, 0x12

    const-string v5, "burst_id"

    aput-object v5, v3, v4

    const/16 v4, 0x13

    const-string v5, "count(burst_id)"

    aput-object v5, v3, v4

    const/16 v4, 0x14

    const-string v5, "resolution"

    aput-object v5, v3, v4

    const/16 v4, 0x15

    const-string v5, "duration"

    aput-object v5, v3, v4

    sput-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    .line 131
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->PROJECTION_INDEX_MAP:Ljava/util/HashMap;

    .line 133
    invoke-static {}, Lcom/lge/gallery/data/local/LocalMediaProjection;->updateCameraModeProjection()V

    .line 134
    invoke-static {}, Lcom/lge/gallery/data/local/LocalMediaProjection;->updateProtectionProjection()V

    .line 135
    const/4 v1, 0x0

    .line 136
    .local v1, "jk":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_99
    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_bb

    .line 137
    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_b4

    .line 138
    sget-object v3, Lcom/lge/gallery/data/local/LocalMediaProjection;->PROJECTION_INDEX_MAP:Ljava/util/HashMap;

    sget-object v4, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    aget-object v4, v4, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "jk":I
    .local v2, "jk":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v2

    .line 136
    .end local v2    # "jk":I
    .restart local v1    # "jk":I
    :cond_b4
    add-int/lit8 v0, v0, 0x1

    goto :goto_99

    .line 66
    .end local v0    # "i":I
    .end local v1    # "jk":I
    :cond_b7
    const-string v3, "0"

    goto/16 :goto_6

    .line 141
    .restart local v0    # "i":I
    .restart local v1    # "jk":I
    :cond_bb
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static updateCameraModeProjection()V
    .registers 3

    .prologue
    .line 144
    sget-boolean v0, Lcom/lge/gallery/data/local/LocalAlbumUtils;->IS_CAMERA_MODE_FIELD_EXIST:Z

    if-nez v0, :cond_b

    .line 145
    sget-object v0, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    const/16 v1, 0xe

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 147
    :cond_b
    return-void
.end method

.method private static updateProtectionProjection()V
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 151
    sget-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    if-nez v0, :cond_11

    .line 152
    sget-object v0, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x12

    aput-object v2, v0, v1

    .line 153
    sget-object v0, Lcom/lge/gallery/data/local/LocalMediaProjection;->MERGED_PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x13

    aput-object v2, v0, v1

    .line 155
    :cond_11
    return-void
.end method
