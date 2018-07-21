.class public Lcom/lge/gallery/contentmanager/ContentsOperationOptions;
.super Ljava/lang/Object;
.source "ContentsOperationOptions.java"


# instance fields
.field public mCancel:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public requestCancel()V
    .registers 2

    .prologue
    .line 16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/contentmanager/ContentsOperationOptions;->mCancel:Z

    .line 17
    return-void
.end method
