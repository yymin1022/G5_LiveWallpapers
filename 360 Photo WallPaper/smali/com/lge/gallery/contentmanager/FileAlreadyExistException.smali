.class public Lcom/lge/gallery/contentmanager/FileAlreadyExistException;
.super Ljava/lang/Exception;
.source "FileAlreadyExistException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 42
    return-void
.end method
