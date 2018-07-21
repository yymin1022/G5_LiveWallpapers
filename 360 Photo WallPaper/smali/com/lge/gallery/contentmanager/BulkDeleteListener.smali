.class public interface abstract Lcom/lge/gallery/contentmanager/BulkDeleteListener;
.super Ljava/lang/Object;
.source "BulkDeleteListener.java"


# virtual methods
.method public abstract getFilesShouldBeDeleted()Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayDeque",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getOperations()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation
.end method

.method public abstract onDelete(Landroid/net/Uri;Ljava/lang/String;)Z
.end method
