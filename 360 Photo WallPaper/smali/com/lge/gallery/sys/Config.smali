.class public Lcom/lge/gallery/sys/Config;
.super Ljava/lang/Object;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/sys/Config$Feature;
    }
.end annotation


# static fields
.field public static final DEFAULT_ORDER:I = 0x1

.field public static final TIME_ASCEND:I = 0x0

.field public static final TIME_DESCEND:I = 0x1

.field private static sUseBurstshot:Z

.field private static sUseCameraAlbumReOrder:Z

.field private static sUseProtectionType:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 27
    sput-boolean v0, Lcom/lge/gallery/sys/Config;->sUseBurstshot:Z

    .line 28
    sput-boolean v0, Lcom/lge/gallery/sys/Config;->sUseCameraAlbumReOrder:Z

    .line 29
    sput-boolean v0, Lcom/lge/gallery/sys/Config;->sUseProtectionType:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method static synthetic access$000()Z
    .registers 1

    .prologue
    .line 11
    sget-boolean v0, Lcom/lge/gallery/sys/Config;->sUseBurstshot:Z

    return v0
.end method

.method static synthetic access$100()Z
    .registers 1

    .prologue
    .line 11
    sget-boolean v0, Lcom/lge/gallery/sys/Config;->sUseProtectionType:Z

    return v0
.end method

.method static synthetic access$200()Z
    .registers 1

    .prologue
    .line 11
    sget-boolean v0, Lcom/lge/gallery/sys/Config;->sUseCameraAlbumReOrder:Z

    return v0
.end method

.method public static setFeatureUseBurstshot(Z)V
    .registers 1
    .param p0, "enable"    # Z

    .prologue
    .line 32
    sput-boolean p0, Lcom/lge/gallery/sys/Config;->sUseBurstshot:Z

    .line 33
    return-void
.end method

.method public static setFeatureUseCameraAlbum(Z)V
    .registers 1
    .param p0, "enable"    # Z

    .prologue
    .line 36
    sput-boolean p0, Lcom/lge/gallery/sys/Config;->sUseCameraAlbumReOrder:Z

    .line 37
    return-void
.end method

.method public static setFeatureUseProtectionType(Z)V
    .registers 1
    .param p0, "enable"    # Z

    .prologue
    .line 40
    sput-boolean p0, Lcom/lge/gallery/sys/Config;->sUseProtectionType:Z

    .line 41
    return-void
.end method
