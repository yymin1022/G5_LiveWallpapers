.class public Lcom/lge/gallery/sys/SdkConstant;
.super Ljava/lang/Object;
.source "SdkConstant.java"


# static fields
.field public static final ICS:I = 0xe

.field public static final JB:I = 0x10

.field public static final JB_MR1:I = 0x11

.field public static final JB_MR2:I = 0x12

.field public static final KK:I = 0x13

.field public static final LP:I = 0x15

.field public static final LP_MR1:I = 0x16

.field public static final MOS:I = 0x17

.field public static final VERSION:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    sput v0, Lcom/lge/gallery/sys/SdkConstant;->VERSION:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
