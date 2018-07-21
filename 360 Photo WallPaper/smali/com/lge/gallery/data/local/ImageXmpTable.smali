.class public Lcom/lge/gallery/data/local/ImageXmpTable;
.super Ljava/lang/Object;
.source "ImageXmpTable.java"


# static fields
.field public static final CROPPED_HEIGHT:Ljava/lang/String; = "cropped_area_image_height_pixels"

.field public static final CROPPED_LEFT:Ljava/lang/String; = "cropped_area_left_pixels"

.field public static final CROPPED_TOP:Ljava/lang/String; = "cropped_area_top_pixels"

.field public static final CROPPED_WIDTH:Ljava/lang/String; = "cropped_area_image_width_pixels"

.field public static final FULL_PANO_HEIGHT:Ljava/lang/String; = "full_pano_height_pixels"

.field public static final FULL_PANO_WIDTH:Ljava/lang/String; = "full_pano_width_pixels"

.field public static final FULL_PROJECTION:[Ljava/lang/String;

.field public static final ID:Ljava/lang/String; = "_id"

.field public static final IMAGE_ID:Ljava/lang/String; = "image_id"

.field public static final INIT_DOLLY:Ljava/lang/String; = "initial_camera_dolly"

.field public static final INIT_H_DEGREE:Ljava/lang/String; = "initial_view_heading_degrees"

.field public static final INIT_H_FOV:Ljava/lang/String; = "initial_horizontal_fov_degrees"

.field public static final INIT_P_DEGREE:Ljava/lang/String; = "initial_view_pitch_degrees"

.field public static final INIT_R_DEGREE:Ljava/lang/String; = "initial_view_roll_degrees"

.field public static final POSE_H_DEGREE:Ljava/lang/String; = "pose_heading_degrees"

.field public static final POSE_P_DEGREE:Ljava/lang/String; = "pose_pitch_degrees"

.field public static final POSE_R_DEGREE:Ljava/lang/String; = "pose_roll_degrees"

.field public static final PROJECTION_TYPE:Ljava/lang/String; = "projection_type"

.field public static final URI:Landroid/net/Uri;

.field public static final USE_PANORAMA:Ljava/lang/String; = "use_panorama_viewer"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 10
    const-string v0, "content://media/external/images/xmp"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/data/local/ImageXmpTable;->URI:Landroid/net/Uri;

    .line 30
    const/16 v0, 0x12

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "image_id"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "use_panorama_viewer"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "projection_type"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "pose_heading_degrees"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "pose_pitch_degrees"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "pose_roll_degrees"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "initial_view_heading_degrees"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "initial_view_pitch_degrees"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "initial_view_roll_degrees"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "initial_horizontal_fov_degrees"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "cropped_area_image_width_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "cropped_area_image_height_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "cropped_area_left_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "cropped_area_top_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "full_pano_width_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "full_pano_height_pixels"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "initial_camera_dolly"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/data/local/ImageXmpTable;->FULL_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
