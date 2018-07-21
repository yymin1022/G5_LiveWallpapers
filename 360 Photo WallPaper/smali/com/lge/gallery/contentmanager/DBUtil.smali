.class public Lcom/lge/gallery/contentmanager/DBUtil;
.super Ljava/lang/Object;
.source "DBUtil.java"


# static fields
.field private static final BASE_URI_FILE:Landroid/net/Uri;

.field static final BASE_URI_IMAGE:Landroid/net/Uri;

.field static final BASE_URI_VIDEO:Landroid/net/Uri;

.field private static final DEBUG:Z = false

.field private static final KEY_BUCKET_ID:Ljava/lang/String; = "bucket_id"

.field public static final KEY_BURST_ID:Ljava/lang/String; = "burst_id"

.field private static final KEY_DATA:Ljava/lang/String; = "_data"

.field private static final KEY_DATE_ADDED:Ljava/lang/String; = "date_added"

.field private static final KEY_DISPLAY_NAME:Ljava/lang/String; = "_display_name"

.field public static final KEY_FAVORITES:Ljava/lang/String; = "is_favorite"

.field private static final KEY_ID:Ljava/lang/String; = "_id"

.field private static final KEY_PICASA_ID:Ljava/lang/String; = "picasa_id"

.field private static final KEY_STORAGE_ID:Ljava/lang/String; = "storage_id"

.field private static final KEY_STORAGE_TYPE:Ljava/lang/String; = "storage_type"

.field private static final KEY_THUMB_MAGIC:Ljava/lang/String; = "mini_thumb_magic"

.field private static final KEY_TITLE:Ljava/lang/String; = "title"

.field private static final SEARCH_ITEM_WHERE:Ljava/lang/String;

.field private static final SEARCH_PRJ:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "DBUtil"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x1

    .line 57
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    sput-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_IMAGE:Landroid/net/Uri;

    .line 58
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    sput-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_VIDEO:Landroid/net/Uri;

    .line 430
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "((media_type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "media_type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_data"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " LIKE ?)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->SEARCH_ITEM_WHERE:Ljava/lang/String;

    .line 434
    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_FILE:Landroid/net/Uri;

    .line 435
    new-array v0, v2, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "count(*)"

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->SEARCH_PRJ:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final copyAndInsert(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;IZ)Z
    .registers 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .param p2, "contentUri"    # Landroid/net/Uri;
    .param p3, "toPath"    # Ljava/lang/String;
    .param p4, "projection"    # [Ljava/lang/String;
    .param p5, "type"    # I
    .param p6, "delete"    # Z

    .prologue
    .line 283
    if-eqz p0, :cond_6

    if-eqz p2, :cond_6

    if-nez p3, :cond_8

    .line 284
    :cond_6
    const/4 v10, 0x0

    .line 314
    :cond_7
    :goto_7
    return v10

    .line 290
    :cond_8
    const/4 v7, 0x0

    .line 291
    .local v7, "cursor":Landroid/database/Cursor;
    invoke-static {p0, p1}, Lcom/lge/gallery/contentmanager/DBUtil;->getPreffedContentResolver(Landroid/content/Context;Landroid/content/ContentResolver;)Landroid/content/ContentResolver;

    move-result-object v1

    .line 292
    .local v1, "cr":Landroid/content/ContentResolver;
    const/4 v10, 0x1

    .line 294
    .local v10, "result":Z
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p2

    move-object/from16 v3, p4

    :try_start_14
    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 295
    move/from16 v0, p6

    invoke-static {v7, v0}, Lcom/lge/gallery/contentmanager/DBUtil;->createContentValuesFromCursor(Landroid/database/Cursor;Z)Landroid/content/ContentValues;
    :try_end_1d
    .catch Ljava/lang/NullPointerException; {:try_start_14 .. :try_end_1d} :catch_3d
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_1d} :catch_45
    .catchall {:try_start_14 .. :try_end_1d} :catchall_4d

    move-result-object v11

    .line 296
    .local v11, "values":Landroid/content/ContentValues;
    if-nez v11, :cond_27

    .line 297
    const/4 v10, 0x0

    .line 309
    .end local v10    # "result":Z
    if-eqz v7, :cond_7

    .line 310
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_7

    .line 299
    .restart local v10    # "result":Z
    :cond_27
    :try_start_27
    invoke-static {v11, p3}, Lcom/lge/gallery/contentmanager/DBUtil;->setModifiedValuesByCopying(Landroid/content/ContentValues;Ljava/lang/String;)Z

    .line 300
    move/from16 v0, p5

    invoke-static {p0, v1, v11, v0}, Lcom/lge/gallery/contentmanager/DBUtil;->insertContentValuesToDB(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/content/ContentValues;I)Z

    move-result v2

    if-eqz v2, :cond_37

    if-eqz p6, :cond_37

    .line 302
    invoke-static {v1, p2}, Lcom/lge/gallery/contentmanager/DBUtil;->deleteGivenUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_37
    .catch Ljava/lang/NullPointerException; {:try_start_27 .. :try_end_37} :catch_3d
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_37} :catch_45
    .catchall {:try_start_27 .. :try_end_37} :catchall_4d

    .line 309
    :cond_37
    if-eqz v7, :cond_7

    .line 310
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_7

    .line 304
    .end local v11    # "values":Landroid/content/ContentValues;
    :catch_3d
    move-exception v9

    .line 305
    .local v9, "ne":Ljava/lang/NullPointerException;
    const/4 v10, 0x0

    .line 309
    if-eqz v7, :cond_7

    .line 310
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_7

    .line 306
    .end local v9    # "ne":Ljava/lang/NullPointerException;
    :catch_45
    move-exception v8

    .line 307
    .local v8, "e":Ljava/lang/Exception;
    const/4 v10, 0x0

    .line 309
    if-eqz v7, :cond_7

    .line 310
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_7

    .line 309
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_4d
    move-exception v2

    if-eqz v7, :cond_53

    .line 310
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_53
    throw v2
.end method

.method public static final copyAndInsert(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;I)Z
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "toPath"    # Ljava/lang/String;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "type"    # I

    .prologue
    .line 104
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-static/range {v0 .. v6}, Lcom/lge/gallery/contentmanager/DBUtil;->copyAndInsert(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;IZ)Z

    move-result v0

    return v0
.end method

.method private static final createContentValuesFromCursor(Landroid/database/Cursor;Z)Landroid/content/ContentValues;
    .registers 15
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "isMove"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 155
    if-eqz p0, :cond_8

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v10

    if-nez v10, :cond_a

    .line 156
    :cond_8
    const/4 v7, 0x0

    .line 204
    :cond_9
    return-object v7

    .line 158
    :cond_a
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 159
    .local v7, "values":Landroid/content/ContentValues;
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v6

    .line 160
    .local v6, "names":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_16
    if-ge v2, v4, :cond_9

    aget-object v5, v0, v2

    .line 161
    .local v5, "name":Ljava/lang/String;
    if-eqz v5, :cond_6e

    const-string v10, "_id"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "date_added"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "mini_thumb_magic"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "picasa_id"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "bucket_id"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "storage_type"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "storage_id"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "burst_id"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    const-string v10, "_display_name"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    if-nez p1, :cond_71

    const-string v10, "is_favorite"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_71

    .line 160
    :cond_6e
    :goto_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 174
    :cond_71
    invoke-interface {p0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 175
    .local v3, "index":I
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getType(I)I

    move-result v1

    .line 176
    .local v1, "curType":I
    packed-switch v1, :pswitch_data_f2

    .line 200
    const-string v10, "DBUtil"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error is occured : projection="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", type="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    new-instance v10, Ljava/lang/Exception;

    const-string v11, "Error while copying records."

    invoke-direct {v10, v11}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v10

    .line 178
    :pswitch_a6
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 179
    .local v8, "val":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v7, v5, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 180
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v10, v11}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6e

    .line 184
    .end local v8    # "val":J
    :pswitch_bd
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v8

    .line 185
    .local v8, "val":F
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v7, v5, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 186
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v10, v11}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6e

    .line 190
    .end local v8    # "val":F
    :pswitch_d4
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 191
    .local v8, "val":Ljava/lang/String;
    invoke-virtual {v7, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v10, v11}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6e

    .line 197
    .end local v8    # "val":Ljava/lang/String;
    :pswitch_e7
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    const-string v11, ""

    invoke-static {v5, v10, v11}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6e

    .line 176
    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_e7
        :pswitch_a6
        :pswitch_bd
        :pswitch_d4
        :pswitch_e7
    .end packed-switch
.end method

.method private static final createContentValuesFromCursor([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;
    .registers 12
    .param p0, "projection"    # [Ljava/lang/String;
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 111
    if-eqz p1, :cond_a

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_a

    if-nez p0, :cond_c

    .line 112
    :cond_a
    const/4 v6, 0x0

    .line 150
    :cond_b
    return-object v6

    .line 114
    :cond_c
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 115
    .local v6, "values":Landroid/content/ContentValues;
    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v0

    .line 116
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    if-ge v2, v0, :cond_b

    .line 117
    aget-object v7, p0, v2

    const-string v8, "_id"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 116
    :goto_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 120
    :cond_25
    aget-object v7, p0, v2

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 121
    .local v3, "index":I
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getType(I)I

    move-result v1

    .line 122
    .local v1, "curType":I
    packed-switch v1, :pswitch_data_ba

    .line 146
    const-string v7, "DBUtil"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error is occured : projection="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, p0, v2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", type="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    new-instance v7, Ljava/lang/Exception;

    const-string v8, "Error while copying records."

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7

    .line 124
    :pswitch_5e
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 125
    .local v4, "val":J
    aget-object v7, p0, v2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 126
    aget-object v7, p0, v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_22

    .line 130
    .end local v4    # "val":J
    :pswitch_79
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    .line 131
    .local v4, "val":F
    aget-object v7, p0, v2

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    .line 132
    aget-object v7, p0, v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v4}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_22

    .line 136
    .end local v4    # "val":F
    :pswitch_94
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 137
    .local v4, "val":Ljava/lang/String;
    aget-object v7, p0, v2

    invoke-virtual {v6, v7, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    aget-object v7, p0, v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_22

    .line 143
    .end local v4    # "val":Ljava/lang/String;
    :pswitch_ac
    aget-object v7, p0, v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-static {v7, v8, v9}, Lcom/lge/gallery/contentmanager/DBUtil;->printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_22

    .line 122
    nop

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_ac
        :pswitch_5e
        :pswitch_79
        :pswitch_94
        :pswitch_ac
    .end packed-switch
.end method

.method private static final deleteGivenUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    .registers 4
    .param p0, "cr"    # Landroid/content/ContentResolver;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 249
    invoke-virtual {p0, p1, v0, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_16

    .line 250
    const-string v0, "DBUtil"

    const-string v1, "delete operation is failed."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Error while deleting records."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 253
    :cond_16
    return-void
.end method

.method public static getDateTaken(Landroid/content/Context;Landroid/net/Uri;)J
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 392
    if-eqz p0, :cond_4

    if-nez p1, :cond_7

    .line 393
    :cond_4
    const-wide/16 v8, -0x1

    .line 414
    :cond_6
    :goto_6
    return-wide v8

    .line 395
    :cond_7
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "datetaken"

    aput-object v1, v2, v0

    .line 396
    .local v2, "proj":[Ljava/lang/String;
    const-wide/16 v8, -0x1

    .line 397
    .local v8, "dateTaken":J
    const/4 v7, 0x0

    .line 399
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_12
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 400
    if-eqz v7, :cond_30

    .line 401
    const-string v0, "datetaken"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 402
    .local v6, "columnIndex":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 403
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getLong(I)J
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_2f} :catch_36
    .catchall {:try_start_12 .. :try_end_2f} :catchall_65

    move-result-wide v8

    .line 410
    .end local v6    # "columnIndex":I
    :cond_30
    if-eqz v7, :cond_6

    .line 411
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_6

    .line 406
    :catch_36
    move-exception v10

    .line 407
    .local v10, "e":Ljava/lang/Exception;
    :try_start_37
    const-string v0, "DBUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fail to query, uri:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", error:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5d
    .catchall {:try_start_37 .. :try_end_5d} :catchall_65

    .line 408
    const-wide/16 v8, -0x1

    .line 410
    if-eqz v7, :cond_6

    .line 411
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_6

    .line 410
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_65
    move-exception v0

    if-eqz v7, :cond_6b

    .line 411
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_6b
    throw v0
.end method

.method public static getFilenameFromContentUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 338
    const-string v0, "_data"

    invoke-static {p0, p1, v0}, Lcom/lge/gallery/contentmanager/DBUtil;->getValueFromContentUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getItemCursorById(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;I)Landroid/database/Cursor;
    .registers 12
    .param p0, "resolver"    # Landroid/content/ContentResolver;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "id"    # I

    .prologue
    const/4 v7, 0x0

    .line 383
    :try_start_1
    const-string v3, "_id=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_16

    move-result-object v0

    .line 387
    :goto_15
    return-object v0

    .line 385
    :catch_16
    move-exception v6

    .line 386
    .local v6, "e":Ljava/lang/Exception;
    const-string v0, "DBUtil"

    const-string v1, "Database query failed for any exception."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v7

    .line 387
    goto :goto_15
.end method

.method public static getMimetypeFromContentUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 342
    const-string v0, "mime_type"

    invoke-static {p0, p1, v0}, Lcom/lge/gallery/contentmanager/DBUtil;->getValueFromContentUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getPreffedContentResolver(Landroid/content/Context;Landroid/content/ContentResolver;)Landroid/content/ContentResolver;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resolver"    # Landroid/content/ContentResolver;

    .prologue
    .line 273
    if-nez p1, :cond_6

    .line 274
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 276
    .end local p1    # "resolver":Landroid/content/ContentResolver;
    :cond_6
    return-object p1
.end method

.method private static getValueFromContentUri(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "field"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 346
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p2, v2, v0

    .line 347
    .local v2, "proj":[Ljava/lang/String;
    if-eqz p0, :cond_b

    if-nez p1, :cond_d

    :cond_b
    move-object v9, v10

    .line 373
    :cond_c
    :goto_c
    return-object v9

    .line 350
    :cond_d
    const/4 v7, 0x0

    .line 352
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_19} :catch_1f

    move-result-object v7

    .line 357
    const/4 v9, 0x0

    .line 358
    .local v9, "filename":Ljava/lang/String;
    if-nez v7, :cond_22

    move-object v9, v10

    .line 359
    goto :goto_c

    .line 353
    .end local v9    # "filename":Ljava/lang/String;
    :catch_1f
    move-exception v8

    .local v8, "e":Ljava/lang/Exception;
    move-object v9, v10

    .line 354
    goto :goto_c

    .line 362
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v9    # "filename":Ljava/lang/String;
    :cond_22
    :try_start_22
    invoke-interface {v7, p2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 363
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 364
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2f} :catch_36
    .catchall {:try_start_22 .. :try_end_2f} :catchall_3e

    move-result-object v9

    .line 369
    :cond_30
    if-eqz v7, :cond_c

    .line 370
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_c

    .line 366
    .end local v6    # "column_index":I
    :catch_36
    move-exception v8

    .line 367
    .restart local v8    # "e":Ljava/lang/Exception;
    const/4 v9, 0x0

    .line 369
    if-eqz v7, :cond_c

    .line 370
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_c

    .line 369
    .end local v8    # "e":Ljava/lang/Exception;
    :catchall_3e
    move-exception v0

    if-eqz v7, :cond_44

    .line 370
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_44
    throw v0
.end method

.method public static hasGalleryItem(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "toPath"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 440
    if-eqz p0, :cond_a

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    move v0, v9

    .line 463
    :goto_b
    return v0

    .line 443
    :cond_c
    const/4 v6, 0x0

    .line 444
    .local v6, "cursor":Landroid/database/Cursor;
    sget-object v0, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_FILE:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v2, "limit"

    const-string v3, "1"

    invoke-virtual {v0, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 445
    .local v1, "baseUri":Landroid/net/Uri;
    sget-object v0, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 447
    :goto_27
    new-array v4, v9, [Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "%"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v8

    .line 449
    .local v4, "whereArgs":[Ljava/lang/String;
    :try_start_3e
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Lcom/lge/gallery/contentmanager/DBUtil;->SEARCH_PRJ:[Ljava/lang/String;

    sget-object v3, Lcom/lge/gallery/contentmanager/DBUtil;->SEARCH_ITEM_WHERE:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 451
    if-eqz v6, :cond_5a

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_5a

    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_57} :catch_95
    .catchall {:try_start_3e .. :try_end_57} :catchall_a1

    move-result v0

    if-lez v0, :cond_75

    .line 458
    :cond_5a
    if-eqz v6, :cond_5f

    .line 459
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_5f
    move v0, v9

    goto :goto_b

    .line 445
    .end local v4    # "whereArgs":[Ljava/lang/String;
    :cond_61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_27

    .line 458
    .restart local v4    # "whereArgs":[Ljava/lang/String;
    :cond_75
    if-eqz v6, :cond_7a

    .line 459
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 462
    :cond_7a
    const-string v0, "DBUtil"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No item in : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v8

    .line 463
    goto/16 :goto_b

    .line 454
    :catch_95
    move-exception v7

    .line 455
    .local v7, "e":Ljava/lang/Exception;
    :try_start_96
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_99
    .catchall {:try_start_96 .. :try_end_99} :catchall_a1

    .line 458
    if-eqz v6, :cond_9e

    .line 459
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_9e
    move v0, v9

    goto/16 :goto_b

    .line 458
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_a1
    move-exception v0

    if-eqz v6, :cond_a7

    .line 459
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_a7
    throw v0
.end method

.method private static insertContentValuesToDB(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/content/ContentValues;I)Z
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cr"    # Landroid/content/ContentResolver;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 215
    const/4 v0, 0x0

    .line 216
    .local v0, "result":Z
    const/4 v1, 0x0

    .line 217
    .local v1, "uri":Landroid/net/Uri;
    packed-switch p3, :pswitch_data_38

    .line 245
    :goto_5
    return v0

    .line 219
    :pswitch_6
    sget-object v2, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_IMAGE:Landroid/net/Uri;

    invoke-virtual {p1, v2, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 220
    if-eqz v1, :cond_10

    .line 224
    const/4 v0, 0x1

    goto :goto_5

    .line 226
    :cond_10
    const-string v2, "DBUtil"

    const-string v3, "Insert operation is failed."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    new-instance v2, Ljava/lang/Exception;

    const-string v3, "Error while inserting records."

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 231
    :pswitch_1f
    sget-object v2, Lcom/lge/gallery/contentmanager/DBUtil;->BASE_URI_VIDEO:Landroid/net/Uri;

    invoke-virtual {p1, v2, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 232
    if-eqz v1, :cond_29

    .line 236
    const/4 v0, 0x1

    goto :goto_5

    .line 238
    :cond_29
    const-string v2, "DBUtil"

    const-string v3, "Insert operation is failed."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    new-instance v2, Ljava/lang/Exception;

    const-string v3, "Error while inserting records."

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 217
    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_6
        :pswitch_1f
    .end packed-switch
.end method

.method public static moveAndInsert(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;I)Z
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "toPath"    # Ljava/lang/String;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "type"    # I

    .prologue
    const/4 v6, 0x1

    .line 319
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .local v1, "cr":Landroid/content/ContentResolver;
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    .line 320
    invoke-static/range {v0 .. v6}, Lcom/lge/gallery/contentmanager/DBUtil;->copyAndInsert(Landroid/content/Context;Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 323
    :goto_10
    return v6

    :cond_11
    const/4 v6, 0x0

    goto :goto_10
.end method

.method private static printDebug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 211
    return-void
.end method

.method private static putUpdatedContentValues(Landroid/content/ContentValues;Ljava/lang/String;)V
    .registers 4
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 327
    const-string v0, "_data"

    invoke-virtual {p0, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    const-string v0, "title"

    invoke-static {p1}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    const-string v0, "_display_name"

    invoke-static {p1}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFileNameIncludeEXT(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    return-void
.end method

.method private static final setModifiedValuesByCopying(Landroid/content/ContentValues;Ljava/lang/String;)Z
    .registers 8
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "toPath"    # Ljava/lang/String;

    .prologue
    .line 256
    if-eqz p0, :cond_4

    if-nez p1, :cond_6

    .line 257
    :cond_4
    const/4 v2, 0x0

    .line 268
    :goto_5
    return v2

    .line 259
    :cond_6
    const-string v2, "_data"

    invoke-virtual {p0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-string v2, "title"

    invoke-static {p1}, Lcom/lge/gallery/contentmanager/StringUtil;->pickFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 262
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 263
    const-string v2, "date_modified"

    invoke-virtual {p0, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    .line 264
    .local v1, "modified":Ljava/lang/Long;
    if-eqz v1, :cond_31

    .line 265
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    .line 268
    .end local v1    # "modified":Ljava/lang/Long;
    :cond_31
    const/4 v2, 0x1

    goto :goto_5
.end method

.method public static updateDateTaken(Landroid/content/Context;Landroid/net/Uri;J)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "dateTaken"    # J

    .prologue
    .line 418
    if-eqz p0, :cond_a

    if-eqz p1, :cond_a

    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-gez v2, :cond_b

    .line 428
    :cond_a
    :goto_a
    return-void

    .line 421
    :cond_b
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 422
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "datetaken"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 424
    :try_start_19
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v1, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_22} :catch_23

    goto :goto_a

    .line 425
    :catch_23
    move-exception v0

    .line 426
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "DBUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fail to update, uri:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method

.method public static final updateFileName(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Z
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "contentUri"    # Landroid/net/Uri;
    .param p2, "toPath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 76
    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    if-nez p2, :cond_8

    .line 99
    :cond_7
    :goto_7
    return v4

    .line 83
    :cond_8
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 84
    .local v3, "values":Landroid/content/ContentValues;
    invoke-static {v3, p2}, Lcom/lge/gallery/contentmanager/DBUtil;->putUpdatedContentValues(Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 85
    const/4 v2, 0x0

    .line 87
    .local v2, "result":I
    :try_start_11
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, p1, v3, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1a
    .catch Ljava/lang/NullPointerException; {:try_start_11 .. :try_end_1a} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_1a} :catch_21

    move-result v2

    .line 96
    if-eqz v2, :cond_7

    .line 99
    const/4 v4, 0x1

    goto :goto_7

    .line 91
    :catch_1f
    move-exception v1

    .line 92
    .local v1, "ne":Ljava/lang/NullPointerException;
    goto :goto_7

    .line 93
    .end local v1    # "ne":Ljava/lang/NullPointerException;
    :catch_21
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_7
.end method
