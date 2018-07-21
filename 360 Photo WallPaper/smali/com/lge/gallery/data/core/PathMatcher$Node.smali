.class Lcom/lge/gallery/data/core/PathMatcher$Node;
.super Ljava/lang/Object;
.source "PathMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/data/core/PathMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Node"
.end annotation


# instance fields
.field private mKind:I

.field private mMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lge/gallery/data/core/PathMatcher$Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, -0x1

    iput v0, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mKind:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/data/core/PathMatcher$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/data/core/PathMatcher$1;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/lge/gallery/data/core/PathMatcher$Node;-><init>()V

    return-void
.end method


# virtual methods
.method addChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/PathMatcher$Node;
    .registers 5
    .param p1, "segment"    # Ljava/lang/String;

    .prologue
    .line 76
    iget-object v2, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    if-nez v2, :cond_17

    .line 77
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    .line 85
    :cond_b
    new-instance v0, Lcom/lge/gallery/data/core/PathMatcher$Node;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/PathMatcher$Node;-><init>()V

    .line 86
    .local v0, "n":Lcom/lge/gallery/data/core/PathMatcher$Node;
    iget-object v2, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 87
    .end local v0    # "n":Lcom/lge/gallery/data/core/PathMatcher$Node;
    :goto_16
    return-object v1

    .line 79
    :cond_17
    iget-object v2, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/PathMatcher$Node;

    .line 80
    .local v1, "node":Lcom/lge/gallery/data/core/PathMatcher$Node;
    if-eqz v1, :cond_b

    goto :goto_16
.end method

.method getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/PathMatcher$Node;
    .registers 3
    .param p1, "segment"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    if-nez v0, :cond_6

    .line 92
    const/4 v0, 0x0

    .line 94
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/PathMatcher$Node;

    goto :goto_5
.end method

.method getKind()I
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mKind:I

    return v0
.end method

.method setKind(I)V
    .registers 2
    .param p1, "kind"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/lge/gallery/data/core/PathMatcher$Node;->mKind:I

    .line 99
    return-void
.end method
