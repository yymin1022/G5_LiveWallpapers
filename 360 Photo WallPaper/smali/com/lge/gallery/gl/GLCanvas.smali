.class public interface abstract Lcom/lge/gallery/gl/GLCanvas;
.super Ljava/lang/Object;
.source "GLCanvas.java"


# static fields
.field public static final CENTER_CROP_RATIO:F = 0.5f

.field public static final DEFAULT_CROP_RATIO:F = 0.0f

.field public static final DEFAULT_CROP_SCALE:F = 1.0f

.field public static final SAVE_FLAG_ALL:I = -0x1

.field public static final SAVE_FLAG_ALPHA:I = 0x2

.field public static final SAVE_FLAG_CLIP:I = 0x1

.field public static final SAVE_FLAG_MATRIX:I = 0x4


# virtual methods
.method public abstract clearBuffer()V
.end method

.method public abstract clipRect(IIII)Z
.end method

.method public abstract copyTexture(IIII)Lcom/lge/gallery/gl/BasicTexture;
.end method

.method public abstract currentAnimationTimeMillis()J
.end method

.method public abstract deleteBuffer(I)V
.end method

.method public abstract deleteRecycledResources()V
.end method

.method public abstract drawBackgroundColor(I)V
.end method

.method public abstract drawBlendedTexture(Lcom/lge/gallery/gl/BasicTexture;Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
.end method

.method public abstract drawLine(FFFFLcom/lge/gallery/gl/GLPaint;)V
.end method

.method public abstract drawMesh(IIIIIII)V
.end method

.method public abstract drawMesh(Lcom/lge/gallery/gl/BasicTexture;IIII)V
.end method

.method public abstract drawMesh(Lcom/lge/gallery/gl/BasicTexture;IIIIII)V
.end method

.method public abstract drawMixed(Lcom/lge/gallery/gl/BasicTexture;IFIIII)V
.end method

.method public abstract drawMixed(Lcom/lge/gallery/gl/BasicTexture;Lcom/lge/gallery/gl/BasicTexture;FIIII)V
.end method

.method public abstract drawMixedMesh(Lcom/lge/gallery/gl/BasicTexture;IFIIIIII)V
.end method

.method public abstract drawRect(FFFFLcom/lge/gallery/gl/GLPaint;)V
.end method

.method public abstract drawTexture(Lcom/lge/gallery/gl/BasicTexture;IIII)V
.end method

.method public abstract drawTexture(Lcom/lge/gallery/gl/BasicTexture;IIIIF)V
.end method

.method public abstract drawTexture(Lcom/lge/gallery/gl/BasicTexture;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
.end method

.method public abstract drawTexture(Lcom/lge/gallery/gl/BasicTexture;[FIIIII)V
.end method

.method public abstract drawTranslucentMesh(Lcom/lge/gallery/gl/BasicTexture;IIIIF)V
.end method

.method public abstract drawTranslucentTexture(Lcom/lge/gallery/gl/BasicTexture;IIIIF)V
.end method

.method public abstract fillRect(FFFFI)V
.end method

.method public abstract getAlpha()F
.end method

.method public abstract getGLInstance()Ljavax/microedition/khronos/opengles/GL11;
.end method

.method public abstract multiplyAlpha(F)V
.end method

.method public abstract multiplyMatrix([FI)V
.end method

.method public abstract resetMatrix()V
.end method

.method public abstract restore()V
.end method

.method public abstract rotate(FFFF)V
.end method

.method public abstract save()I
.end method

.method public abstract save(I)I
.end method

.method public abstract scale(FFF)V
.end method

.method public abstract setAlpha(F)V
.end method

.method public abstract setBlendEnabled(Z)V
.end method

.method public abstract setCurrentAnimationTimeMillis(J)V
.end method

.method public abstract setSize(II)V
.end method

.method public abstract translate(FF)V
.end method

.method public abstract translate(FFF)V
.end method

.method public abstract unloadTexture(Lcom/lge/gallery/gl/BasicTexture;)Z
.end method
