.class public Lcom/lge/gallery/data/core/Face;
.super Ljava/lang/Object;
.source "Face.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lge/gallery/data/core/Face;",
        ">;"
    }
.end annotation


# instance fields
.field private mName:Ljava/lang/String;

.field private mPersonId:Ljava/lang/String;

.field private mPosition:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "personId"    # Ljava/lang/String;
    .param p3, "rect"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/lge/gallery/data/core/Face;->mName:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    .line 33
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mName:Ljava/lang/String;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    if-eqz v1, :cond_58

    if-eqz p3, :cond_58

    const/4 v1, 0x1

    :goto_12
    invoke-static {v1}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 34
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, p3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 35
    .local v0, "tokenizer":Ljava/util/StringTokenizer;
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    .line 36
    :goto_21
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 37
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 38
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 39
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 40
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    goto :goto_21

    .line 33
    .end local v0    # "tokenizer":Ljava/util/StringTokenizer;
    :cond_58
    const/4 v1, 0x0

    goto :goto_12

    .line 42
    .restart local v0    # "tokenizer":Ljava/util/StringTokenizer;
    :cond_5a
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/lge/gallery/data/core/Face;)I
    .registers 4
    .param p1, "another"    # Lcom/lge/gallery/data/core/Face;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mName:Ljava/lang/String;

    iget-object v1, p1, Lcom/lge/gallery/data/core/Face;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 25
    check-cast p1, Lcom/lge/gallery/data/core/Face;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/Face;->compareTo(Lcom/lge/gallery/data/core/Face;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 66
    instance-of v1, p1, Lcom/lge/gallery/data/core/Face;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 67
    check-cast v0, Lcom/lge/gallery/data/core/Face;

    .line 68
    .local v0, "face":Lcom/lge/gallery/data/core/Face;
    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    iget-object v2, v0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 70
    .end local v0    # "face":Lcom/lge/gallery/data/core/Face;
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public getHeight()I
    .registers 3

    .prologue
    .line 53
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPersonId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getWidth()I
    .registers 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Lcom/lge/gallery/data/core/Face;->mPosition:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/data/core/Face;->mPersonId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
