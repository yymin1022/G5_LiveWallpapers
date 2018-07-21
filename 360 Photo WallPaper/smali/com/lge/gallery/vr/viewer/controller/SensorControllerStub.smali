.class public Lcom/lge/gallery/vr/viewer/controller/SensorControllerStub;
.super Ljava/lang/Object;
.source "SensorControllerStub.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/controller/SensorController;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .registers 2

    .prologue
    .line 23
    const/4 v0, 0x1

    return v0
.end method

.method public setEnable(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 28
    return-void
.end method

.method public startListening()V
    .registers 1

    .prologue
    .line 15
    return-void
.end method

.method public stopListening()V
    .registers 1

    .prologue
    .line 19
    return-void
.end method
