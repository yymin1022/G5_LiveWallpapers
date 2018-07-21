.class public Lcom/lge/gallery/gl/GLPaint;
.super Ljava/lang/Object;
.source "GLPaint.java"


# static fields
.field public static final FLAG_ANTI_ALIAS:I = 0x1


# instance fields
.field private mColor:I

.field private mFlags:I

.field private mLineWidth:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput v1, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/lge/gallery/gl/GLPaint;->mLineWidth:F

    .line 26
    iput v1, p0, Lcom/lge/gallery/gl/GLPaint;->mColor:I

    return-void
.end method


# virtual methods
.method public getAntiAlias()Z
    .registers 2

    .prologue
    .line 62
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mColor:I

    return v0
.end method

.method public getFlags()I
    .registers 2

    .prologue
    .line 29
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    return v0
.end method

.method public getLineWidth()F
    .registers 2

    .prologue
    .line 50
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mLineWidth:F

    return v0
.end method

.method public setAntiAlias(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 54
    if-eqz p1, :cond_9

    .line 55
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    .line 59
    :goto_8
    return-void

    .line 57
    :cond_9
    iget v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    goto :goto_8
.end method

.method public setColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/lge/gallery/gl/GLPaint;->mColor:I

    .line 38
    return-void
.end method

.method public setFlags(I)V
    .registers 2
    .param p1, "flags"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/lge/gallery/gl/GLPaint;->mFlags:I

    .line 34
    return-void
.end method

.method public setLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 45
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    :goto_6
    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 46
    iput p1, p0, Lcom/lge/gallery/gl/GLPaint;->mLineWidth:F

    .line 47
    return-void

    .line 45
    :cond_c
    const/4 v0, 0x0

    goto :goto_6
.end method
