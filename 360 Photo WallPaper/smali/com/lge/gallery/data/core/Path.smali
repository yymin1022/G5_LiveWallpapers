.class public Lcom/lge/gallery/data/core/Path;
.super Ljava/lang/Object;
.source "Path.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Path"

.field private static sRoot:Lcom/lge/gallery/data/core/Path;


# instance fields
.field private mChildren:Lcom/lge/gallery/util/IdentityCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lge/gallery/util/IdentityCache",
            "<",
            "Ljava/lang/String;",
            "Lcom/lge/gallery/data/core/Path;",
            ">;"
        }
    .end annotation
.end field

.field private mObject:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lge/gallery/data/core/MediaObject;",
            ">;"
        }
    .end annotation
.end field

.field private final mParent:Lcom/lge/gallery/data/core/Path;

.field private final mSegment:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 29
    new-instance v0, Lcom/lge/gallery/data/core/Path;

    const/4 v1, 0x0

    const-string v2, "ROOT"

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/data/core/Path;-><init>(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;)V

    sput-object v0, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    return-void
.end method

.method private constructor <init>(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;)V
    .registers 3
    .param p1, "parent"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "segment"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    .line 38
    iput-object p2, p0, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    .line 39
    return-void
.end method

.method static clearAll()V
    .registers 4

    .prologue
    .line 235
    const-class v1, Lcom/lge/gallery/data/core/Path;

    monitor-enter v1

    .line 236
    :try_start_3
    new-instance v0, Lcom/lge/gallery/data/core/Path;

    const/4 v2, 0x0

    const-string v3, ""

    invoke-direct {v0, v2, v3}, Lcom/lge/gallery/data/core/Path;-><init>(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;)V

    sput-object v0, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    .line 237
    monitor-exit v1

    .line 238
    return-void

    .line 237
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method static dumpAll()V
    .registers 3

    .prologue
    .line 241
    sget-object v0, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    const-string v1, ""

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/lge/gallery/data/core/Path;->dumpAll(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    return-void
.end method

.method static dumpAll(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p0, "p"    # Lcom/lge/gallery/data/core/Path;
    .param p1, "prefix1"    # Ljava/lang/String;
    .param p2, "prefix2"    # Ljava/lang/String;

    .prologue
    .line 245
    const-class v8, Lcom/lge/gallery/data/core/Path;

    monitor-enter v8

    .line 246
    :try_start_3
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->getObject()Lcom/lge/gallery/data/core/MediaObject;

    move-result-object v6

    .line 247
    .local v6, "obj":Lcom/lge/gallery/data/core/MediaObject;
    const-string v9, "Path"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v10, p0, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, ":"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-nez v6, :cond_59

    const-string v7, "null"

    :goto_22
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    iget-object v7, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    if-eqz v7, :cond_d6

    .line 250
    iget-object v7, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    invoke-virtual {v7}, Lcom/lge/gallery/util/IdentityCache;->keys()Ljava/util/ArrayList;

    move-result-object v1

    .line 251
    .local v1, "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 252
    .local v2, "i":I
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 253
    .local v5, "n":I
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_40
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_d6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 254
    .local v4, "key":Ljava/lang/String;
    iget-object v7, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    invoke-virtual {v7, v4}, Lcom/lge/gallery/util/IdentityCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/Path;

    .line 255
    .local v0, "child":Lcom/lge/gallery/data/core/Path;
    if-nez v0, :cond_62

    .line 256
    add-int/lit8 v2, v2, 0x1

    .line 257
    goto :goto_40

    .line 247
    .end local v0    # "child":Lcom/lge/gallery/data/core/Path;
    .end local v1    # "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "i":I
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "n":I
    :cond_59
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    goto :goto_22

    .line 259
    .restart local v0    # "child":Lcom/lge/gallery/data/core/Path;
    .restart local v1    # "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "i":I
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v5    # "n":I
    :cond_62
    const-string v7, "Path"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "|"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v5, :cond_ab

    .line 261
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "+-- "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "|   "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v7, v9}, Lcom/lge/gallery/data/core/Path;->dumpAll(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_40

    .line 267
    .end local v0    # "child":Lcom/lge/gallery/data/core/Path;
    .end local v1    # "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "i":I
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "n":I
    .end local v6    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    :catchall_a8
    move-exception v7

    monitor-exit v8
    :try_end_aa
    .catchall {:try_start_3 .. :try_end_aa} :catchall_a8

    throw v7

    .line 263
    .restart local v0    # "child":Lcom/lge/gallery/data/core/Path;
    .restart local v1    # "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "i":I
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v5    # "n":I
    .restart local v6    # "obj":Lcom/lge/gallery/data/core/MediaObject;
    :cond_ab
    :try_start_ab
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "+-- "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "    "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v7, v9}, Lcom/lge/gallery/data/core/Path;->dumpAll(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_40

    .line 267
    .end local v0    # "child":Lcom/lge/gallery/data/core/Path;
    .end local v1    # "childrenKeys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "i":I
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "n":I
    :cond_d6
    monitor-exit v8
    :try_end_d7
    .catchall {:try_start_ab .. :try_end_d7} :catchall_a8

    .line 268
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;
    .registers 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 111
    const-class v4, Lcom/lge/gallery/data/core/Path;

    monitor-enter v4

    .line 112
    :try_start_3
    invoke-static {p0}, Lcom/lge/gallery/data/core/Path;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 113
    .local v2, "segments":[Ljava/lang/String;
    sget-object v0, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    .line 114
    .local v0, "current":Lcom/lge/gallery/data/core/Path;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v3, v2

    if-ge v1, v3, :cond_16

    .line 115
    aget-object v3, v2, v1

    invoke-virtual {v0, v3}, Lcom/lge/gallery/data/core/Path;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 117
    :cond_16
    monitor-exit v4

    return-object v0

    .line 118
    .end local v0    # "current":Lcom/lge/gallery/data/core/Path;
    .end local v1    # "i":I
    .end local v2    # "segments":[Ljava/lang/String;
    :catchall_18
    move-exception v3

    monitor-exit v4
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v3
.end method

.method public static split(Ljava/lang/String;)[Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x2f

    const/4 v7, 0x0

    .line 137
    if-nez p0, :cond_8

    .line 138
    new-array v5, v7, [Ljava/lang/String;

    .line 170
    :goto_7
    return-object v5

    .line 140
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 141
    .local v4, "n":I
    if-nez v4, :cond_11

    .line 142
    new-array v5, v7, [Ljava/lang/String;

    goto :goto_7

    .line 144
    :cond_11
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v8, :cond_30

    .line 145
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "malformed path:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 147
    :cond_30
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v6, "segments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 149
    .local v2, "i":I
    :goto_36
    if-ge v2, v4, :cond_79

    .line 150
    const/4 v0, 0x0

    .line 152
    .local v0, "brace":I
    move v3, v2

    .local v3, "j":I
    :goto_3a
    if-ge v3, v4, :cond_54

    .line 153
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 154
    .local v1, "c":C
    const/16 v7, 0x7b

    if-ne v1, v7, :cond_49

    .line 155
    add-int/lit8 v0, v0, 0x1

    .line 152
    :cond_46
    :goto_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_3a

    .line 156
    :cond_49
    const/16 v7, 0x7d

    if-ne v1, v7, :cond_50

    .line 157
    add-int/lit8 v0, v0, -0x1

    goto :goto_46

    .line 158
    :cond_50
    if-nez v0, :cond_46

    if-ne v1, v8, :cond_46

    .line 162
    .end local v1    # "c":C
    :cond_54
    if-eqz v0, :cond_6f

    .line 163
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unbalanced brace in path:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 165
    :cond_6f
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    add-int/lit8 v2, v3, 0x1

    .line 167
    goto :goto_36

    .line 168
    .end local v0    # "brace":I
    .end local v3    # "j":I
    :cond_79
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v5, v7, [Ljava/lang/String;

    .line 169
    .local v5, "result":[Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_7
.end method

.method public static splitSequence(Ljava/lang/String;)[Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x7d

    const/16 v8, 0x7b

    .line 176
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 177
    .local v4, "n":I
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_17

    add-int/lit8 v7, v4, -0x1

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v9, :cond_30

    .line 178
    :cond_17
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bad sequence: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 180
    :cond_30
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .local v6, "segments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 182
    .local v2, "i":I
    :goto_36
    add-int/lit8 v7, v4, -0x1

    if-ge v2, v7, :cond_7b

    .line 183
    const/4 v0, 0x0

    .line 185
    .local v0, "brace":I
    move v3, v2

    .local v3, "j":I
    :goto_3c
    add-int/lit8 v7, v4, -0x1

    if-ge v3, v7, :cond_56

    .line 186
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 187
    .local v1, "c":C
    if-ne v1, v8, :cond_4b

    .line 188
    add-int/lit8 v0, v0, 0x1

    .line 185
    :cond_48
    :goto_48
    add-int/lit8 v3, v3, 0x1

    goto :goto_3c

    .line 189
    :cond_4b
    if-ne v1, v9, :cond_50

    .line 190
    add-int/lit8 v0, v0, -0x1

    goto :goto_48

    .line 191
    :cond_50
    if-nez v0, :cond_48

    const/16 v7, 0x2c

    if-ne v1, v7, :cond_48

    .line 195
    .end local v1    # "c":C
    :cond_56
    if-eqz v0, :cond_71

    .line 196
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unbalanced brace in path:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 198
    :cond_71
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    add-int/lit8 v2, v3, 0x1

    .line 200
    goto :goto_36

    .line 201
    .end local v0    # "brace":I
    .end local v3    # "j":I
    :cond_7b
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v5, v7, [Ljava/lang/String;

    .line 202
    .local v5, "result":[Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 203
    return-object v5
.end method


# virtual methods
.method public forceRemoveObject()V
    .registers 5

    .prologue
    .line 74
    const-class v1, Lcom/lge/gallery/data/core/Path;

    monitor-enter v1

    .line 75
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_9

    .line 76
    monitor-exit v1

    .line 82
    :goto_8
    return-void

    .line 78
    :cond_9
    const-string v2, "Path"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "forceRemoveObject : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaObject;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", path : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    .line 81
    monitor-exit v1

    goto :goto_8

    :catchall_44
    move-exception v0

    monitor-exit v1
    :try_end_46
    .catchall {:try_start_3 .. :try_end_46} :catchall_44

    throw v0
.end method

.method public getChild(I)Lcom/lge/gallery/data/core/Path;
    .registers 3
    .param p1, "segment"    # I

    .prologue
    .line 65
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/Path;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    return-object v0
.end method

.method public getChild(J)Lcom/lge/gallery/data/core/Path;
    .registers 4
    .param p1, "segment"    # J

    .prologue
    .line 69
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lge/gallery/data/core/Path;->getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;

    move-result-object v0

    return-object v0
.end method

.method public getChild(Ljava/lang/String;)Lcom/lge/gallery/data/core/Path;
    .registers 6
    .param p1, "segment"    # Ljava/lang/String;

    .prologue
    .line 42
    const-class v3, Lcom/lge/gallery/data/core/Path;

    monitor-enter v3

    .line 43
    :try_start_3
    iget-object v2, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    if-nez v2, :cond_1b

    .line 44
    new-instance v2, Lcom/lge/gallery/util/IdentityCache;

    invoke-direct {v2}, Lcom/lge/gallery/util/IdentityCache;-><init>()V

    iput-object v2, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    .line 52
    :cond_e
    new-instance v0, Lcom/lge/gallery/data/core/Path;

    invoke-direct {v0, p0, p1}, Lcom/lge/gallery/data/core/Path;-><init>(Lcom/lge/gallery/data/core/Path;Ljava/lang/String;)V

    .line 53
    .local v0, "p":Lcom/lge/gallery/data/core/Path;
    iget-object v2, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    invoke-virtual {v2, p1, v0}, Lcom/lge/gallery/util/IdentityCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    monitor-exit v3

    move-object v1, v0

    .end local v0    # "p":Lcom/lge/gallery/data/core/Path;
    .local v1, "p":Ljava/lang/Object;
    :goto_1a
    return-object v1

    .line 46
    .end local v1    # "p":Ljava/lang/Object;
    :cond_1b
    iget-object v2, p0, Lcom/lge/gallery/data/core/Path;->mChildren:Lcom/lge/gallery/util/IdentityCache;

    invoke-virtual {v2, p1}, Lcom/lge/gallery/util/IdentityCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/Path;

    .line 47
    .restart local v0    # "p":Lcom/lge/gallery/data/core/Path;
    if-eqz v0, :cond_e

    .line 48
    monitor-exit v3

    move-object v1, v0

    .restart local v1    # "p":Ljava/lang/Object;
    goto :goto_1a

    .line 55
    .end local v0    # "p":Lcom/lge/gallery/data/core/Path;
    .end local v1    # "p":Ljava/lang/Object;
    :catchall_28
    move-exception v2

    monitor-exit v3
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v2
.end method

.method public getObject()Lcom/lge/gallery/data/core/MediaObject;
    .registers 3

    .prologue
    .line 92
    const-class v1, Lcom/lge/gallery/data/core/Path;

    monitor-enter v1

    .line 93
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    :goto_8
    monitor-exit v1

    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/MediaObject;

    goto :goto_8

    .line 94
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method public getParent()Lcom/lge/gallery/data/core/Path;
    .registers 3

    .prologue
    .line 59
    const-class v1, Lcom/lge/gallery/data/core/Path;

    monitor-enter v1

    .line 60
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    monitor-exit v1

    return-object v0

    .line 61
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 5

    .prologue
    .line 207
    const-class v2, Lcom/lge/gallery/data/core/Path;

    monitor-enter v2

    .line 208
    move-object v0, p0

    .line 209
    .local v0, "current":Lcom/lge/gallery/data/core/Path;
    :try_start_4
    sget-object v1, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    if-ne v0, v1, :cond_c

    .line 210
    const-string v1, ""

    monitor-exit v2

    .line 215
    :goto_b
    return-object v1

    .line 212
    :cond_c
    :goto_c
    iget-object v1, v0, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    sget-object v3, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    if-eq v1, v3, :cond_15

    .line 213
    iget-object v0, v0, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    goto :goto_c

    .line 215
    :cond_15
    iget-object v1, v0, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    monitor-exit v2

    goto :goto_b

    .line 216
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_4 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public getSuffix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    return-object v0
.end method

.method public getSuffix(I)Ljava/lang/String;
    .registers 5
    .param p1, "level"    # I

    .prologue
    .line 226
    move-object v1, p0

    .local v1, "p":Lcom/lge/gallery/data/core/Path;
    move v0, p1

    .line 227
    .end local p1    # "level":I
    .local v0, "level":I
    :goto_2
    add-int/lit8 p1, v0, -0x1

    .end local v0    # "level":I
    .restart local p1    # "level":I
    if-eqz v0, :cond_a

    .line 228
    iget-object v1, v1, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    move v0, p1

    .end local p1    # "level":I
    .restart local v0    # "level":I
    goto :goto_2

    .line 230
    .end local v0    # "level":I
    .restart local p1    # "level":I
    :cond_a
    iget-object v2, v1, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    return-object v2
.end method

.method public setObject(Lcom/lge/gallery/data/core/MediaObject;)V
    .registers 4
    .param p1, "object"    # Lcom/lge/gallery/data/core/MediaObject;

    .prologue
    .line 85
    const-class v1, Lcom/lge/gallery/data/core/Path;

    monitor-enter v1

    .line 86
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1c

    :cond_f
    const/4 v0, 0x1

    :goto_10
    invoke-static {v0}, Lcom/lge/gallery/common/Utils;->assertTrue(Z)V

    .line 87
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lge/gallery/data/core/Path;->mObject:Ljava/lang/ref/WeakReference;

    .line 88
    monitor-exit v1

    .line 89
    return-void

    .line 86
    :cond_1c
    const/4 v0, 0x0

    goto :goto_10

    .line 88
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method public split()[Ljava/lang/String;
    .registers 8

    .prologue
    .line 122
    const-class v6, Lcom/lge/gallery/data/core/Path;

    monitor-enter v6

    .line 123
    const/4 v2, 0x0

    .line 124
    .local v2, "n":I
    move-object v3, p0

    .local v3, "p":Lcom/lge/gallery/data/core/Path;
    :goto_5
    :try_start_5
    sget-object v5, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    if-eq v3, v5, :cond_e

    .line 125
    add-int/lit8 v2, v2, 0x1

    .line 124
    iget-object v3, v3, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    goto :goto_5

    .line 127
    :cond_e
    new-array v4, v2, [Ljava/lang/String;

    .line 128
    .local v4, "segments":[Ljava/lang/String;
    add-int/lit8 v0, v2, -0x1

    .line 129
    .local v0, "i":I
    move-object v3, p0

    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_14
    sget-object v5, Lcom/lge/gallery/data/core/Path;->sRoot:Lcom/lge/gallery/data/core/Path;

    if-eq v3, v5, :cond_22

    .line 130
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    iget-object v5, v3, Lcom/lge/gallery/data/core/Path;->mSegment:Ljava/lang/String;

    aput-object v5, v4, v1

    .line 129
    iget-object v3, v3, Lcom/lge/gallery/data/core/Path;->mParent:Lcom/lge/gallery/data/core/Path;

    move v1, v0

    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_14

    .line 132
    :cond_22
    monitor-exit v6

    return-object v4

    .line 133
    .end local v1    # "i":I
    .end local v4    # "segments":[Ljava/lang/String;
    :catchall_24
    move-exception v5

    monitor-exit v6
    :try_end_26
    .catchall {:try_start_5 .. :try_end_26} :catchall_24

    throw v5
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 99
    const-class v4, Lcom/lge/gallery/data/core/Path;

    monitor-enter v4

    .line 100
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/Path;->split()[Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "segments":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v3, v2

    if-ge v0, v3, :cond_1d

    .line 103
    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    aget-object v3, v2, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 106
    :cond_1d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    monitor-exit v4

    return-object v3

    .line 107
    .end local v0    # "i":I
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .end local v2    # "segments":[Ljava/lang/String;
    :catchall_23
    move-exception v3

    monitor-exit v4
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_23

    throw v3
.end method
