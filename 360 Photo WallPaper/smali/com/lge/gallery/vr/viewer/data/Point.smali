.class public Lcom/lge/gallery/vr/viewer/data/Point;
.super Ljava/lang/Object;
.source "Point.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Vertex"


# instance fields
.field public final x:F

.field public final y:F

.field public final z:F


# direct methods
.method public constructor <init>(FFF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "z"    # F

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/lge/gallery/vr/viewer/data/Point;->x:F

    .line 24
    iput p2, p0, Lcom/lge/gallery/vr/viewer/data/Point;->y:F

    .line 25
    iput p3, p0, Lcom/lge/gallery/vr/viewer/data/Point;->z:F

    .line 26
    return-void
.end method


# virtual methods
.method public fill(Ljava/nio/FloatBuffer;I)V
    .registers 5
    .param p1, "floatbuffer"    # Ljava/nio/FloatBuffer;
    .param p2, "startOffset"    # I

    .prologue
    .line 29
    iget v0, p0, Lcom/lge/gallery/vr/viewer/data/Point;->x:F

    invoke-virtual {p1, p2, v0}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 30
    add-int/lit8 v0, p2, 0x1

    iget v1, p0, Lcom/lge/gallery/vr/viewer/data/Point;->y:F

    invoke-virtual {p1, v0, v1}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 31
    add-int/lit8 v0, p2, 0x2

    iget v1, p0, Lcom/lge/gallery/vr/viewer/data/Point;->z:F

    invoke-virtual {p1, v0, v1}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 32
    return-void
.end method

.method public print()V
    .registers 4

    .prologue
    .line 35
    const-string v0, "Vertex"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "x = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/vr/viewer/data/Point;->x:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", y = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/vr/viewer/data/Point;->y:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", z = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/lge/gallery/vr/viewer/data/Point;->z:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-void
.end method
