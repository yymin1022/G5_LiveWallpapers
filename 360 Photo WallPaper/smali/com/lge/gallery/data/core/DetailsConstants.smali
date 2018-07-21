.class public Lcom/lge/gallery/data/core/DetailsConstants;
.super Ljava/lang/Object;
.source "DetailsConstants.java"


# static fields
.field public static final INDEX_APERTURE:I = 0x69

.field public static final INDEX_BURST_COUNT:I = 0x9

.field public static final INDEX_CONTINUOUS_COUNT:I = 0xa

.field public static final INDEX_DATETIME:I = 0x3

.field public static final INDEX_DESCRIPTION:I = 0x2

.field public static final INDEX_DURATION:I = 0x8

.field public static final INDEX_EXPOSURE_TIME:I = 0x6b

.field public static final INDEX_FLASH:I = 0x66

.field public static final INDEX_FOCAL_LENGTH:I = 0x67

.field public static final INDEX_FOLDER_PATH:I = 0x10

.field public static final INDEX_FOLDER_SIZE:I = 0xf

.field public static final INDEX_HEIGHT:I = 0x7

.field public static final INDEX_ISO:I = 0x6c

.field public static final INDEX_ITEM_COUNT:I = 0xe

.field public static final INDEX_LOCATION:I = 0x5

.field public static final INDEX_MAKE:I = 0x64

.field public static final INDEX_MIMETYPE:I = 0x4

.field public static final INDEX_MODEL:I = 0x65

.field public static final INDEX_NO_INFORMATION:I = 0x7fffffff

.field public static final INDEX_ORIENTATION:I = 0xc

.field public static final INDEX_PATH:I = 0xc8

.field public static final INDEX_RESOLUTION:I = 0xb

.field public static final INDEX_SHUTTER_SPEED:I = 0x6a

.field public static final INDEX_SIZE:I = 0xd

.field public static final INDEX_TITLE:I = 0x1

.field public static final INDEX_WHITE_BALANCE:I = 0x68

.field public static final INDEX_WIDTH:I = 0x6


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDetailsName(Landroid/content/Context;I)Ljava/lang/String;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # I

    .prologue
    .line 51
    sparse-switch p1, :sswitch_data_be

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown key"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_16
    return-object v0

    .line 53
    :sswitch_17
    sget v0, Lcom/lge/gallery/common/R$string;->no_data:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 55
    :sswitch_1e
    sget v0, Lcom/lge/gallery/common/R$string;->title:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 57
    :sswitch_25
    sget v0, Lcom/lge/gallery/common/R$string;->description:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 59
    :sswitch_2c
    sget v0, Lcom/lge/gallery/common/R$string;->sp_time_detail_title_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 61
    :sswitch_33
    sget v0, Lcom/lge/gallery/common/R$string;->location:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 63
    :sswitch_3a
    sget v0, Lcom/lge/gallery/common/R$string;->sp_path_detail_title_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 65
    :sswitch_41
    sget v0, Lcom/lge/gallery/common/R$string;->width:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 67
    :sswitch_48
    sget v0, Lcom/lge/gallery/common/R$string;->height:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 69
    :sswitch_4f
    sget v0, Lcom/lge/gallery/common/R$string;->sp_resolution_NORMAL:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 71
    :sswitch_56
    sget v0, Lcom/lge/gallery/common/R$string;->orientation:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 73
    :sswitch_5d
    sget v0, Lcom/lge/gallery/common/R$string;->duration:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 75
    :sswitch_64
    sget v0, Lcom/lge/gallery/common/R$string;->sp_type_detail_title_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 77
    :sswitch_6b
    sget v0, Lcom/lge/gallery/common/R$string;->sp_size_detail_title_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 79
    :sswitch_72
    sget v0, Lcom/lge/gallery/common/R$string;->maker:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 81
    :sswitch_79
    sget v0, Lcom/lge/gallery/common/R$string;->sp_model_detail_title_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 83
    :sswitch_80
    sget v0, Lcom/lge/gallery/common/R$string;->flash:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 85
    :sswitch_87
    sget v0, Lcom/lge/gallery/common/R$string;->aperture:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 87
    :sswitch_8e
    sget v0, Lcom/lge/gallery/common/R$string;->focal_length:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 89
    :sswitch_95
    sget v0, Lcom/lge/gallery/common/R$string;->white_balance:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_16

    .line 91
    :sswitch_9d
    sget v0, Lcom/lge/gallery/common/R$string;->exposure_time:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_16

    .line 93
    :sswitch_a5
    sget v0, Lcom/lge/gallery/common/R$string;->iso:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_16

    .line 95
    :sswitch_ad
    sget v0, Lcom/lge/gallery/common/R$string;->path:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_16

    .line 97
    :sswitch_b5
    sget v0, Lcom/lge/gallery/common/R$string;->sp_size_SHORT:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_16

    .line 51
    nop

    :sswitch_data_be
    .sparse-switch
        0x1 -> :sswitch_1e
        0x2 -> :sswitch_25
        0x3 -> :sswitch_2c
        0x4 -> :sswitch_64
        0x5 -> :sswitch_33
        0x6 -> :sswitch_41
        0x7 -> :sswitch_48
        0x8 -> :sswitch_5d
        0xb -> :sswitch_4f
        0xc -> :sswitch_56
        0xd -> :sswitch_6b
        0xf -> :sswitch_b5
        0x10 -> :sswitch_ad
        0x64 -> :sswitch_72
        0x65 -> :sswitch_79
        0x66 -> :sswitch_80
        0x67 -> :sswitch_8e
        0x68 -> :sswitch_95
        0x69 -> :sswitch_87
        0x6b -> :sswitch_9d
        0x6c -> :sswitch_a5
        0xc8 -> :sswitch_3a
        0x7fffffff -> :sswitch_17
    .end sparse-switch
.end method
