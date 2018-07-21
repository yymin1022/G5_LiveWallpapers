.class public Lcom/lge/gallery/data/core/FilterDeleteSet;
.super Lcom/lge/gallery/data/core/MediaSet;
.source "FilterDeleteSet.java"

# interfaces
.implements Lcom/lge/gallery/data/core/ContentListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;,
        Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    }
.end annotation


# static fields
.field private static final REQUEST_ADD:I = 0x1

.field private static final REQUEST_CLEAR:I = 0x3

.field private static final REQUEST_REMOVE:I = 0x2


# instance fields
.field private final mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

.field private mCurrent:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;",
            ">;"
        }
    .end annotation
.end field

.field private mMediaItemCount:I

.field private mRequests:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/FilterDeleteSet$Request;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lge/gallery/data/core/Path;Lcom/lge/gallery/data/core/MediaSet;)V
    .registers 5
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "baseSet"    # Lcom/lge/gallery/data/core/MediaSet;

    .prologue
    .line 68
    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/lge/gallery/data/core/MediaSet;-><init>(Lcom/lge/gallery/data/core/Path;J)V

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    .line 69
    iput-object p2, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    .line 70
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0, p0}, Lcom/lge/gallery/data/core/MediaSet;->addContentListener(Lcom/lge/gallery/data/core/ContentListener;)V

    .line 71
    return-void
.end method

.method private sendRequest(ILcom/lge/gallery/data/core/Path;I)V
    .registers 7
    .param p1, "type"    # I
    .param p2, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p3, "indexHint"    # I

    .prologue
    .line 249
    new-instance v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;

    invoke-direct {v0, p1, p2, p3}, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;-><init>(ILcom/lge/gallery/data/core/Path;I)V

    .line 250
    .local v0, "r":Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    iget-object v2, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    monitor-enter v2

    .line 251
    :try_start_8
    iget-object v1, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    monitor-exit v2
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_12

    .line 253
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/FilterDeleteSet;->notifyContentChanged()V

    .line 254
    return-void

    .line 252
    :catchall_12
    move-exception v1

    :try_start_13
    monitor-exit v2
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v1
.end method


# virtual methods
.method public addDeletion(Lcom/lge/gallery/data/core/Path;I)V
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;
    .param p2, "indexHint"    # I

    .prologue
    .line 262
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/lge/gallery/data/core/FilterDeleteSet;->sendRequest(ILcom/lge/gallery/data/core/Path;I)V

    .line 263
    return-void
.end method

.method public clearDeletion()V
    .registers 4

    .prologue
    .line 270
    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/lge/gallery/data/core/FilterDeleteSet;->sendRequest(ILcom/lge/gallery/data/core/Path;I)V

    .line 271
    return-void
.end method

.method public containsInDeletions(Lcom/lge/gallery/data/core/Path;)Z
    .registers 6
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    const/4 v2, 0x0

    .line 280
    if-nez p1, :cond_4

    .line 288
    :cond_3
    :goto_3
    return v2

    .line 283
    :cond_4
    iget-object v3, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 284
    .local v0, "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget-object v3, v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->path:Lcom/lge/gallery/data/core/Path;

    if-ne v3, p1, :cond_a

    .line 285
    const/4 v2, 0x1

    goto :goto_3
.end method

.method public getBaseSet()Lcom/lge/gallery/data/core/MediaSet;
    .registers 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    return-object v0
.end method

.method public getMediaItem(II)Ljava/util/ArrayList;
    .registers 4
    .param p1, "start"    # I
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Lcom/lge/gallery/data/core/MediaSet$Options;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/MediaSet$Options;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcom/lge/gallery/data/core/FilterDeleteSet;->getMediaItem(IILcom/lge/gallery/data/core/MediaSet$Options;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getMediaItem(IILcom/lge/gallery/data/core/MediaSet$Options;)Ljava/util/ArrayList;
    .registers 15
    .param p1, "start"    # I
    .param p2, "count"    # I
    .param p3, "options"    # Lcom/lge/gallery/data/core/MediaSet$Options;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/lge/gallery/data/core/MediaSet$Options;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    if-gtz p2, :cond_8

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 156
    :cond_7
    return-object v0

    .line 124
    :cond_8
    add-int v8, p1, p2

    add-int/lit8 v2, v8, -0x1

    .line 125
    .local v2, "end":I
    iget-object v8, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 128
    .local v7, "n":I
    const/4 v3, 0x0

    .line 129
    .local v3, "i":I
    const/4 v3, 0x0

    :goto_14
    if-ge v3, v7, :cond_23

    .line 130
    iget-object v8, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 131
    .local v1, "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget v8, v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    sub-int/2addr v8, v3

    if-le v8, p1, :cond_59

    .line 136
    .end local v1    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    :cond_23
    move v4, v3

    .line 137
    .local v4, "j":I
    :goto_24
    if-ge v4, v7, :cond_33

    .line 138
    iget-object v8, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 139
    .restart local v1    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget v8, v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    sub-int/2addr v8, v4

    if-le v8, v2, :cond_5c

    .line 145
    .end local v1    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    :cond_33
    iget-object v8, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    add-int v9, p1, v3

    sub-int v10, v4, v3

    add-int/2addr v10, p2

    invoke-virtual {v8, v9, v10, p3}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(IILcom/lge/gallery/data/core/MediaSet$Options;)Ljava/util/ArrayList;

    move-result-object v0

    .line 148
    .local v0, "base":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    add-int/lit8 v6, v4, -0x1

    .local v6, "m":I
    :goto_40
    if-lt v6, v3, :cond_7

    .line 149
    iget-object v8, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 150
    .restart local v1    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget v8, v1, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    add-int v9, p1, v3

    sub-int v5, v8, v9

    .line 151
    .local v5, "k":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v5, v8, :cond_5f

    .line 148
    :goto_56
    add-int/lit8 v6, v6, -0x1

    goto :goto_40

    .line 129
    .end local v0    # "base":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    .end local v4    # "j":I
    .end local v5    # "k":I
    .end local v6    # "m":I
    :cond_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 137
    .restart local v4    # "j":I
    :cond_5c
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 154
    .restart local v0    # "base":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    .restart local v5    # "k":I
    .restart local v6    # "m":I
    :cond_5f
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_56
.end method

.method public getMediaItemBatchFetchCount()I
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemBatchFetchCount()I

    move-result v0

    return v0
.end method

.method public getMediaItemCount()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mMediaItemCount:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfDeletions()I
    .registers 2

    .prologue
    .line 276
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getSourceType()I
    .registers 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getSourceType()I

    move-result v0

    return v0
.end method

.method public getSupportedOperations()I
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    invoke-virtual {v0}, Lcom/lge/gallery/data/core/MediaSet;->getSupportedOperations()I

    move-result v0

    return v0
.end method

.method public onContentDirty()V
    .registers 1

    .prologue
    .line 258
    invoke-virtual {p0}, Lcom/lge/gallery/data/core/FilterDeleteSet;->notifyContentChanged()V

    .line 259
    return-void
.end method

.method public reload()J
    .registers 24

    .prologue
    .line 162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/lge/gallery/data/core/MediaSet;->reload()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mDataVersion:J

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-lez v18, :cond_32

    const/4 v13, 0x1

    .line 163
    .local v13, "newData":Z
    :goto_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    monitor-enter v20

    .line 164
    if-nez v13, :cond_34

    :try_start_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_34

    .line 165
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mDataVersion:J

    move-wide/from16 v18, v0

    monitor-exit v20

    .line 245
    :goto_31
    return-wide v18

    .line 162
    .end local v13    # "newData":Z
    :cond_32
    const/4 v13, 0x0

    goto :goto_15

    .line 167
    .restart local v13    # "newData":Z
    :cond_34
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_35
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v6, v0, :cond_f1

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;

    .line 169
    .local v15, "r":Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    iget v0, v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->type:I

    move/from16 v18, v0

    packed-switch v18, :pswitch_data_208

    .line 167
    :cond_58
    :goto_58
    add-int/lit8 v6, v6, 0x1

    goto :goto_35

    .line 172
    :pswitch_5b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 174
    .local v12, "n":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_66
    if-ge v9, v12, :cond_86

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v18, v0

    iget-object v0, v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_a8

    .line 179
    :cond_86
    if-ne v9, v12, :cond_58

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    new-instance v19, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    iget-object v0, v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v21, v0

    iget v0, v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->indexHint:I

    move/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;-><init>(Lcom/lge/gallery/data/core/Path;I)V

    invoke-virtual/range {v18 .. v19}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_58

    .line 204
    .end local v6    # "i":I
    .end local v9    # "j":I
    .end local v12    # "n":I
    .end local v15    # "r":Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    :catchall_a5
    move-exception v18

    monitor-exit v20
    :try_end_a7
    .catchall {:try_start_1e .. :try_end_a7} :catchall_a5

    throw v18

    .line 174
    .restart local v6    # "i":I
    .restart local v9    # "j":I
    .restart local v12    # "n":I
    .restart local v15    # "r":Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    :cond_a8
    add-int/lit8 v9, v9, 0x1

    goto :goto_66

    .line 186
    .end local v9    # "j":I
    .end local v12    # "n":I
    :pswitch_ab
    :try_start_ab
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 187
    .restart local v12    # "n":I
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_b6
    if-ge v9, v12, :cond_58

    .line 188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v18, v0

    iget-object v0, v15, Lcom/lge/gallery/data/core/FilterDeleteSet$Request;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_e3

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_58

    .line 187
    :cond_e3
    add-int/lit8 v9, v9, 0x1

    goto :goto_b6

    .line 196
    .end local v9    # "j":I
    .end local v12    # "n":I
    :pswitch_e6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_58

    .line 203
    .end local v15    # "r":Lcom/lge/gallery/data/core/FilterDeleteSet$Request;
    :cond_f1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mRequests:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->clear()V

    .line 204
    monitor-exit v20
    :try_end_fb
    .catchall {:try_start_ab .. :try_end_fb} :catchall_a5

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1da

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    move-object/from16 v0, v18

    iget v11, v0, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    .line 211
    .local v11, "minIndex":I
    move v10, v11

    .line 212
    .local v10, "maxIndex":I
    const/4 v6, 0x1

    :goto_11b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v6, v0, :cond_14e

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 214
    .local v4, "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget v0, v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v0, v11}, Ljava/lang/Math;->min(II)I

    move-result v11

    .line 215
    iget v0, v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v0, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 212
    add-int/lit8 v6, v6, 0x1

    goto :goto_11b

    .line 218
    .end local v4    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    :cond_14e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v12

    .line 219
    .restart local v12    # "n":I
    add-int/lit8 v18, v11, -0x5

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 220
    .local v5, "from":I
    add-int/lit8 v18, v10, 0x5

    move/from16 v0, v18

    invoke-static {v0, v12}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 221
    .local v17, "to":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    move-object/from16 v18, v0

    sub-int v19, v17, v5

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItem(II)Ljava/util/ArrayList;

    move-result-object v8

    .line 222
    .local v8, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v16, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;>;"
    const/4 v6, 0x0

    :goto_17e
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v6, v0, :cond_1d4

    .line 224
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/lge/gallery/data/core/MediaItem;

    .line 225
    .local v7, "item":Lcom/lge/gallery/data/core/MediaItem;
    if-nez v7, :cond_191

    .line 223
    :cond_18e
    :goto_18e
    add-int/lit8 v6, v6, 0x1

    goto :goto_17e

    .line 228
    :cond_191
    invoke-virtual {v7}, Lcom/lge/gallery/data/core/MediaItem;->getPath()Lcom/lge/gallery/data/core/Path;

    move-result-object v14

    .line 230
    .local v14, "p":Lcom/lge/gallery/data/core/Path;
    const/4 v9, 0x0

    .restart local v9    # "j":I
    :goto_196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v9, v0, :cond_18e

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;

    .line 232
    .restart local v4    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    iget-object v0, v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->path:Lcom/lge/gallery/data/core/Path;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    if-ne v0, v14, :cond_1d1

    .line 233
    add-int v18, v5, v6

    move/from16 v0, v18

    iput v0, v4, Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;->index:I

    .line 234
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_18e

    .line 230
    :cond_1d1
    add-int/lit8 v9, v9, 0x1

    goto :goto_196

    .line 240
    .end local v4    # "d":Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;
    .end local v7    # "item":Lcom/lge/gallery/data/core/MediaItem;
    .end local v9    # "j":I
    .end local v14    # "p":Lcom/lge/gallery/data/core/Path;
    :cond_1d4
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    .line 243
    .end local v5    # "from":I
    .end local v8    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/MediaItem;>;"
    .end local v10    # "maxIndex":I
    .end local v11    # "minIndex":I
    .end local v12    # "n":I
    .end local v16    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/lge/gallery/data/core/FilterDeleteSet$Deletion;>;"
    .end local v17    # "to":I
    :cond_1da
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mBaseSet:Lcom/lge/gallery/data/core/MediaSet;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/lge/gallery/data/core/MediaSet;->getMediaItemCount()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mCurrent:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    sub-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lge/gallery/data/core/FilterDeleteSet;->mMediaItemCount:I

    .line 244
    invoke-static {}, Lcom/lge/gallery/data/core/FilterDeleteSet;->nextVersionNumber()J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/lge/gallery/data/core/FilterDeleteSet;->mDataVersion:J

    .line 245
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/lge/gallery/data/core/FilterDeleteSet;->mDataVersion:J

    move-wide/from16 v18, v0

    goto/16 :goto_31

    .line 169
    :pswitch_data_208
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_ab
        :pswitch_e6
    .end packed-switch
.end method

.method public removeDeletion(Lcom/lge/gallery/data/core/Path;)V
    .registers 4
    .param p1, "path"    # Lcom/lge/gallery/data/core/Path;

    .prologue
    .line 266
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/lge/gallery/data/core/FilterDeleteSet;->sendRequest(ILcom/lge/gallery/data/core/Path;I)V

    .line 267
    return-void
.end method
