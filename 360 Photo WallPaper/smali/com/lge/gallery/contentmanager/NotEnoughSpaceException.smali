.class public Lcom/lge/gallery/contentmanager/NotEnoughSpaceException;
.super Ljava/lang/RuntimeException;
.source "NotEnoughSpaceException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 41
    return-void
.end method
