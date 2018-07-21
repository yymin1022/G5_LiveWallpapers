.class public final Lcom/lge/gallery/contentmanager/FiletypeChecker;
.super Ljava/lang/Object;
.source "FiletypeChecker.java"


# static fields
.field public static final TYPE_IMAGE:I = 0x0

.field public static final TYPE_OTHER:I = 0x2

.field public static final TYPE_VIDEO:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getFileType(Landroid/net/Uri;)I
    .registers 2
    .param p0, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 47
    if-eqz p0, :cond_b

    .line 48
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lge/gallery/contentmanager/FiletypeChecker;->getFileType(Ljava/lang/String;)I

    move-result v0

    .line 50
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x2

    goto :goto_a
.end method

.method public static final getFileType(Ljava/lang/String;)I
    .registers 2
    .param p0, "contentUri"    # Ljava/lang/String;

    .prologue
    .line 54
    sget-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_IMAGE:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 55
    const/4 v0, 0x0

    .line 59
    :goto_d
    return v0

    .line 56
    :cond_e
    sget-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_VIDEO:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 57
    const/4 v0, 0x1

    goto :goto_d

    .line 59
    :cond_1c
    const/4 v0, 0x2

    goto :goto_d
.end method

.method public static final getFileTypeByNmae(Ljava/lang/String;)I
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 64
    const/4 v0, 0x2

    return v0
.end method
