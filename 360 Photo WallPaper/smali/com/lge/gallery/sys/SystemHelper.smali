.class public Lcom/lge/gallery/sys/SystemHelper;
.super Ljava/lang/Object;
.source "SystemHelper.java"


# static fields
.field private static final CAMERA_RAW_SUPPORT:Ljava/lang/String; = "camera_raw_support"

.field private static sIsRawFormatSupported:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/gallery/sys/SystemHelper;->sIsRawFormatSupported:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isRawFormatSupported(Landroid/content/Context;)Z
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 18
    sget-object v1, Lcom/lge/gallery/sys/SystemHelper;->sIsRawFormatSupported:Ljava/lang/Boolean;

    .line 19
    .local v1, "supported":Ljava/lang/Boolean;
    if-nez v1, :cond_18

    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "camera_raw_support"

    invoke-static {v4, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 22
    .local v0, "state":I
    if-ne v0, v2, :cond_1d

    :goto_12
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 23
    sput-object v1, Lcom/lge/gallery/sys/SystemHelper;->sIsRawFormatSupported:Ljava/lang/Boolean;

    .line 25
    .end local v0    # "state":I
    :cond_18
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    return v2

    .restart local v0    # "state":I
    :cond_1d
    move v2, v3

    .line 22
    goto :goto_12
.end method
