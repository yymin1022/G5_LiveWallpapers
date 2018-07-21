.class public Lcom/lge/gallery/data/core/PathMatcher;
.super Ljava/lang/Object;
.source "PathMatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/PathMatcher$1;,
        Lcom/lge/gallery/data/core/PathMatcher$Node;
    }
.end annotation


# static fields
.field public static final NOT_FOUND:I = -0x1


# instance fields
.field private mRoot:Lcom/lge/gallery/data/core/PathMatcher$Node;

.field private mVariables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    .line 25
    new-instance v0, Lcom/lge/gallery/data/core/PathMatcher$Node;

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/core/PathMatcher$Node;-><init>(Lcom/lge/gallery/data/core/PathMatcher$1;)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mRoot:Lcom/lge/gallery/data/core/PathMatcher$Node;

    .line 28
    new-instance v0, Lcom/lge/gallery/data/core/PathMatcher$Node;

    invoke-direct {v0, v1}, Lcom/lge/gallery/data/core/PathMatcher$Node;-><init>(Lcom/lge/gallery/data/core/PathMatcher$1;)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mRoot:Lcom/lge/gallery/data/core/PathMatcher$Node;

    .line 29
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;I)V
    .registers 7
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "kind"    # I

    .prologue
    .line 32
    invoke-static {p1}, Lcom/lge/gallery/data/core/Path;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 33
    .local v2, "segments":[Ljava/lang/String;
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mRoot:Lcom/lge/gallery/data/core/PathMatcher$Node;

    .line 34
    .local v0, "current":Lcom/lge/gallery/data/core/PathMatcher$Node;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v3, v2

    if-ge v1, v3, :cond_13

    .line 35
    aget-object v3, v2, v1

    invoke-virtual {v0, v3}, Lcom/lge/gallery/data/core/PathMatcher$Node;->addChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/PathMatcher$Node;

    move-result-object v0

    .line 34
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 37
    :cond_13
    invoke-virtual {v0, p2}, Lcom/lge/gallery/data/core/PathMatcher$Node;->setKind(I)V

    .line 38
    return-void
.end method

.method public getIntVar(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getLongVar(I)J
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getVar(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 60
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public match(Lcom/lge/gallery/data/core/Path;)I
    .registers 8
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 41
    invoke-virtual {p1}, Lcom/lge/gallery/data/core/Path;->split()[Ljava/lang/String;

    move-result-object v3

    .line 42
    .local v3, "segments":[Ljava/lang/String;
    iget-object v4, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 43
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher;->mRoot:Lcom/lge/gallery/data/core/PathMatcher$Node;

    .line 44
    .local v0, "current":Lcom/lge/gallery/data/core/PathMatcher$Node;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v4, v3

    if-ge v1, v4, :cond_2c

    .line 45
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Lcom/lge/gallery/data/core/PathMatcher$Node;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/PathMatcher$Node;

    move-result-object v2

    .line 46
    .local v2, "next":Lcom/lge/gallery/data/core/PathMatcher$Node;
    if-nez v2, :cond_26

    .line 47
    const-string v4, "*"

    invoke-virtual {v0, v4}, Lcom/lge/gallery/data/core/PathMatcher$Node;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/PathMatcher$Node;

    move-result-object v2

    .line 48
    if-eqz v2, :cond_2a

    .line 49
    iget-object v4, p0, Lcom/lge/gallery/data/core/PathMatcher;->mVariables:Ljava/util/ArrayList;

    aget-object v5, v3, v1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :cond_26
    move-object v0, v2

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 51
    :cond_2a
    const/4 v4, -0x1

    .line 56
    .end local v2    # "next":Lcom/lge/gallery/data/core/PathMatcher$Node;
    :goto_2b
    return v4

    :cond_2c
    invoke-virtual {v0}, Lcom/lge/gallery/data/core/PathMatcher$Node;->getKind()I

    move-result v4

    goto :goto_2b
.end method
