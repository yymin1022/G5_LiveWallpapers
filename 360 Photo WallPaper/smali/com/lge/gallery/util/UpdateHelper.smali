.class public Lcom/lge/gallery/util/UpdateHelper;
.super Ljava/lang/Object;
.source "UpdateHelper.java"


# instance fields
.field private mUpdated:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    return-void
.end method


# virtual methods
.method public isUpdated()Z
    .registers 2

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    return v0
.end method

.method public update(DD)D
    .registers 6
    .param p1, "original"    # D
    .param p3, "update"    # D

    .prologue
    .line 41
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    if-eqz v0, :cond_a

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    .line 43
    move-wide p1, p3

    .line 45
    :cond_a
    return-wide p1
.end method

.method public update(FF)D
    .registers 5
    .param p1, "original"    # F
    .param p2, "update"    # F

    .prologue
    .line 49
    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_a

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    .line 51
    move p1, p2

    .line 53
    :cond_a
    float-to-double v0, p1

    return-wide v0
.end method

.method public update(II)I
    .registers 4
    .param p1, "original"    # I
    .param p2, "update"    # I

    .prologue
    .line 25
    if-eq p1, p2, :cond_6

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    .line 27
    move p1, p2

    .line 29
    :cond_6
    return p1
.end method

.method public update(JJ)J
    .registers 6
    .param p1, "original"    # J
    .param p3, "update"    # J

    .prologue
    .line 33
    cmp-long v0, p1, p3

    if-eqz v0, :cond_8

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    .line 35
    move-wide p1, p3

    .line 37
    :cond_8
    return-wide p1
.end method

.method public update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "original":Ljava/lang/Object;, "TT;"
    .local p2, "update":Ljava/lang/Object;, "TT;"
    invoke-static {p1, p2}, Lcom/lge/gallery/common/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lge/gallery/util/UpdateHelper;->mUpdated:Z

    .line 59
    move-object p1, p2

    .line 61
    :cond_a
    return-object p1
.end method
