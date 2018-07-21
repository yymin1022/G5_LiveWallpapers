.class public Lcom/lge/gallery/contentmanager/AlbumAlreadyExistException;
.super Ljava/lang/Exception;
.source "AlbumAlreadyExistException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method
