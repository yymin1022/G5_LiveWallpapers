.class public Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;
.super Ljava/lang/Object;
.source "FacadeRenderData.java"

# interfaces
.implements Lcom/lge/gallery/vr/viewer/controller/SphericalRenderInfo;


# instance fields
.field private mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

.field private mGyroController:Lcom/lge/gallery/vr/viewer/controller/SensorController;

.field private final mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

.field private mSensorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lge/gallery/vr/viewer/controller/SensorController;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;)V
    .registers 3
    .param p1, "posProvider"    # Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mSensorList:Ljava/util/List;

    .line 28
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .line 29
    return-void
.end method


# virtual methods
.method public createGestureController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V
    .registers 4
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    .line 32
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-direct {v0, p1, v1}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    .line 33
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mSensorList:Ljava/util/List;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    return-void
.end method

.method public createGestureController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V
    .registers 5
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "listener"    # Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;

    .prologue
    .line 37
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-direct {v0, p1, v1, p2}, Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;Lcom/lge/gallery/vr/viewer/view/HoldHandleableGestureListener;)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    .line 38
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mSensorList:Ljava/util/List;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    return-void
.end method

.method public createSensorController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;)V
    .registers 3
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->createSensorController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;I)V

    .line 48
    return-void
.end method

.method public createSensorController(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;I)V
    .registers 5
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "sensorDelay"    # I

    .prologue
    .line 42
    new-instance v0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-direct {v0, p1, v1, p2}, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;-><init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;I)V

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGyroController:Lcom/lge/gallery/vr/viewer/controller/SensorController;

    .line 43
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mSensorList:Ljava/util/List;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGyroController:Lcom/lge/gallery/vr/viewer/controller/SensorController;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public getGestureController()Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGestureController:Lcom/lge/gallery/vr/viewer/controller/GesturePositionController;

    return-object v0
.end method

.method public getGyroController()Lcom/lge/gallery/vr/viewer/controller/SensorController;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mGyroController:Lcom/lge/gallery/vr/viewer/controller/SensorController;

    return-object v0
.end method

.method public getPositionProvider()Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    return-object v0
.end method

.method public getSensorControllers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/lge/gallery/vr/viewer/controller/SensorController;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/FacadeRenderData;->mSensorList:Ljava/util/List;

    return-object v0
.end method
