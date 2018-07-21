.class public Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;
.super Ljava/lang/Object;
.source "GyroSensorController.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;
.implements Lcom/lge/gallery/vr/viewer/controller/SensorController;


# static fields
.field private static final NS2S:F = 1.0E-9f

.field private static final TAG:Ljava/lang/String; = "GyroSensorController"


# instance fields
.field private mDisplay:Landroid/view/Display;

.field private mGyroSensor:Landroid/hardware/Sensor;

.field private mIsEnabled:Z

.field private final mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

.field private final mSensorDelay:I

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mTimestamp:F

.field private final mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;


# direct methods
.method public constructor <init>(Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;I)V
    .registers 6
    .param p1, "view"    # Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;
    .param p2, "provider"    # Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;
    .param p3, "sensorDelay"    # I

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z

    .line 38
    iput-object p1, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    .line 39
    iput-object p2, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    .line 40
    invoke-interface {p1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorManager:Landroid/hardware/SensorManager;

    .line 41
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mGyroSensor:Landroid/hardware/Sensor;

    .line 42
    invoke-interface {p1}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mDisplay:Landroid/view/Display;

    .line 43
    iput p3, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorDelay:I

    .line 44
    return-void
.end method


# virtual methods
.method public isEnabled()Z
    .registers 2

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 124
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 10
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 82
    iget-object v6, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v6}, Landroid/hardware/Sensor;->getType()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_52

    .line 83
    iget v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mTimestamp:F

    const/4 v7, 0x0

    cmpl-float v6, v6, v7

    if-eqz v6, :cond_4d

    .line 84
    iget-wide v6, p1, Landroid/hardware/SensorEvent;->timestamp:J

    long-to-float v6, v6

    iget v7, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mTimestamp:F

    sub-float/2addr v6, v7

    const v7, 0x3089705f    # 1.0E-9f

    mul-float v0, v6, v7

    .line 86
    .local v0, "dT":F
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x0

    aget v6, v6, v7

    mul-float/2addr v6, v0

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-float v1, v6

    .line 87
    .local v1, "degreeX":F
    iget-object v6, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v7, 0x1

    aget v6, v6, v7

    mul-float/2addr v6, v0

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-float v2, v6

    .line 88
    .local v2, "degreeY":F
    const/4 v3, 0x0

    .line 89
    .local v3, "pitch":F
    const/4 v5, 0x0

    .line 92
    .local v5, "yaw":F
    iget-object v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mDisplay:Landroid/view/Display;

    invoke-virtual {v6}, Landroid/view/Display;->getRotation()I

    move-result v4

    .line 93
    .local v4, "screenRotation":I
    packed-switch v4, :pswitch_data_60

    .line 113
    :goto_3e
    iget-object v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v6, v3}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->addPitch(F)V

    .line 114
    iget-object v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mPositionProvider:Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;

    invoke-virtual {v6, v5}, Lcom/lge/gallery/vr/viewer/controller/SphericalPositionProvider;->addYaw(F)V

    .line 115
    iget-object v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mView:Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;

    invoke-interface {v6}, Lcom/lge/gallery/vr/viewer/view/GestureHandlerView;->requestRender()V

    .line 117
    .end local v0    # "dT":F
    .end local v1    # "degreeX":F
    .end local v2    # "degreeY":F
    .end local v3    # "pitch":F
    .end local v4    # "screenRotation":I
    .end local v5    # "yaw":F
    :cond_4d
    iget-wide v6, p1, Landroid/hardware/SensorEvent;->timestamp:J

    long-to-float v6, v6

    iput v6, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mTimestamp:F

    .line 119
    :cond_52
    return-void

    .line 95
    .restart local v0    # "dT":F
    .restart local v1    # "degreeX":F
    .restart local v2    # "degreeY":F
    .restart local v3    # "pitch":F
    .restart local v4    # "screenRotation":I
    .restart local v5    # "yaw":F
    :pswitch_53
    neg-float v3, v1

    .line 96
    neg-float v5, v2

    .line 97
    goto :goto_3e

    .line 99
    :pswitch_56
    move v3, v2

    .line 100
    neg-float v5, v1

    .line 101
    goto :goto_3e

    .line 103
    :pswitch_59
    move v3, v1

    .line 104
    neg-float v5, v2

    .line 105
    goto :goto_3e

    .line 107
    :pswitch_5c
    neg-float v3, v2

    .line 108
    neg-float v5, v1

    .line 109
    goto :goto_3e

    .line 93
    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_53
        :pswitch_56
        :pswitch_59
        :pswitch_5c
    .end packed-switch
.end method

.method public declared-synchronized setEnable(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 72
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z

    if-eq p1, v0, :cond_c

    .line 73
    if-nez p1, :cond_a

    .line 74
    invoke-virtual {p0}, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->stopListening()V

    .line 76
    :cond_a
    iput-boolean p1, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 78
    :cond_c
    monitor-exit p0

    return-void

    .line 72
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startListening()V
    .registers 4

    .prologue
    .line 48
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_18

    if-nez v0, :cond_7

    .line 53
    :goto_5
    monitor-exit p0

    return-void

    .line 51
    :cond_7
    :try_start_7
    const-string v0, "GyroSensorController"

    const-string v1, "Start sensor mode."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mGyroSensor:Landroid/hardware/Sensor;

    iget v2, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorDelay:I

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_17
    .catchall {:try_start_7 .. :try_end_17} :catchall_18

    goto :goto_5

    .line 48
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopListening()V
    .registers 3

    .prologue
    .line 57
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mIsEnabled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_17

    if-nez v0, :cond_7

    .line 63
    :goto_5
    monitor-exit p0

    return-void

    .line 60
    :cond_7
    :try_start_7
    const-string v0, "GyroSensorController"

    const-string v1, "Stop sensor mode."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/lge/gallery/vr/viewer/controller/GyroSensorController;->mTimestamp:F
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_17

    goto :goto_5

    .line 57
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method
