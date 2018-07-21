.class public Lcom/lge/gallery/sys/Config$Feature;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/sys/Config;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Feature"
.end annotation


# static fields
.field public static final DEFINE_VR_IMAGE_WITH_RATIO:Z = true

.field public static final DEFINE_VR_VIDEO_WITH_RATIO:Z

.field public static final DNG_FORMAT:Z

.field public static final FEATURE_FAVORITES:Z

.field public static final FEATURE_LOCAL_SHOW_HIDE:Z

.field public static final FOCUS_LATEST_IMAGE:Z

.field public static final PROTECTION_TYPE_IN_MEDIADB:Z

.field public static final REORDER_CAMERA:Z

.field public static final USE_BURSTSHOT:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    invoke-static {}, Lcom/lge/gallery/sys/Config;->access$000()Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->USE_BURSTSHOT:Z

    .line 21
    invoke-static {}, Lcom/lge/gallery/sys/Config;->access$100()Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->PROTECTION_TYPE_IN_MEDIADB:Z

    .line 22
    invoke-static {}, Lcom/lge/gallery/sys/Config;->access$200()Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/sys/Config$Feature;->REORDER_CAMERA:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
