.class public Lcom/lge/gallery/contentmanager/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# static fields
.field private static final ADDITIONAL_INVALID_CHAR_LIST:[Ljava/lang/String;

.field public static final ERROR_NO:I = -0x1

.field public static final FILE_SEPERATER:Ljava/lang/String; = "."

.field public static final INT_ONE:I = 0x1

.field private static final INVALID_CHAR_LIST:[Ljava/lang/String;

.field public static final PATH_SEPERATER:Ljava/lang/String;

.field public static final REGULAR_EXP_RENAME:Ljava/lang/String; = "\\.+"

.field public static final REGULAR_EXP_RENAME_REPLACED:Ljava/lang/String; = ""

.field public static final RENAME_DENIED_FIRST_LETTER:Ljava/lang/String; = "."


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 41
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    sput-object v0, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    .line 43
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "\\"

    aput-object v1, v0, v3

    const-string v1, ":"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string v2, "*"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "?"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "<"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, ">"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "/"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "|"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "\""

    aput-object v2, v0, v1

    sput-object v0, Lcom/lge/gallery/contentmanager/StringUtil;->INVALID_CHAR_LIST:[Ljava/lang/String;

    .line 45
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "\'"

    aput-object v1, v0, v3

    sput-object v0, Lcom/lge/gallery/contentmanager/StringUtil;->ADDITIONAL_INVALID_CHAR_LIST:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final addSequenceNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 20
    .param p0, "filePath"    # Ljava/lang/String;
    .param p1, "addedExt"    # Ljava/lang/String;

    .prologue
    .line 200
    const-string v10, ".*\\(\\d+\\)(\\.\\w+){1}$"

    .line 201
    .local v10, "regex":Ljava/lang/String;
    const/4 v9, 0x1

    .line 203
    .local v9, "offsetOne":I
    if-nez p0, :cond_8

    .line 204
    const/16 p0, 0x0

    .line 233
    .end local p0    # "filePath":Ljava/lang/String;
    .end local p1    # "addedExt":Ljava/lang/String;
    :cond_7
    :goto_7
    return-object p0

    .line 207
    .restart local p0    # "filePath":Ljava/lang/String;
    .restart local p1    # "addedExt":Ljava/lang/String;
    :cond_8
    const/4 v3, 0x0

    .line 208
    .local v3, "endsWithDrmExt":Z
    if-eqz p1, :cond_1d

    invoke-virtual/range {p0 .. p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1d

    .line 209
    const/4 v3, 0x1

    .line 210
    const/4 v14, 0x0

    invoke-virtual/range {p0 .. p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 213
    :cond_1d
    const-string v14, ".*\\(\\d+\\)(\\.\\w+){1}$"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_af

    .line 215
    :try_start_27
    const-string v14, "("

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    .line 216
    .local v6, "left":I
    const-string v14, ")"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    .line 217
    .local v11, "right":I
    add-int/lit8 v14, v6, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 218
    .local v12, "sequence":J
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "("

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-wide/16 v16, 0x1

    add-long v12, v12, v16

    invoke-virtual {v14, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ")"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 219
    .local v8, "newFilePath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v15, v11, 0x1

    if-le v14, v15, :cond_92

    .line 220
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    add-int/lit8 v15, v11, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 222
    :cond_92
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    if-eqz v3, :cond_a9

    .end local p1    # "addedExt":Ljava/lang/String;
    :goto_9d
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_7

    .restart local p1    # "addedExt":Ljava/lang/String;
    :cond_a9
    const-string p1, ""
    :try_end_ab
    .catch Ljava/lang/NumberFormatException; {:try_start_27 .. :try_end_ab} :catch_ac

    goto :goto_9d

    .line 223
    .end local v6    # "left":I
    .end local v8    # "newFilePath":Ljava/lang/String;
    .end local v11    # "right":I
    .end local v12    # "sequence":J
    .end local p1    # "addedExt":Ljava/lang/String;
    :catch_ac
    move-exception v2

    .line 224
    .local v2, "e":Ljava/lang/NumberFormatException;
    goto/16 :goto_7

    .line 227
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    .restart local p1    # "addedExt":Ljava/lang/String;
    :cond_af
    const-string v14, "."

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    .line 228
    .local v5, "index":I
    if-lez v5, :cond_7

    add-int/lit8 v14, v5, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v15

    if-ge v14, v15, :cond_7

    .line 231
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 232
    .local v7, "name":Ljava/lang/String;
    add-int/lit8 v14, v5, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 233
    .local v4, "exts":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "(1)."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    if-eqz v3, :cond_f5

    .end local p1    # "addedExt":Ljava/lang/String;
    :goto_e9
    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_7

    .restart local p1    # "addedExt":Ljava/lang/String;
    :cond_f5
    const-string p1, ""

    goto :goto_e9
.end method

.method private static final getInvalidCharList(Z)[Ljava/lang/String;
    .registers 4
    .param p0, "checkMoreInvalid"    # Z

    .prologue
    .line 116
    if-eqz p0, :cond_29

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    sget-object v1, Lcom/lge/gallery/contentmanager/StringUtil;->INVALID_CHAR_LIST:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 119
    sget-object v1, Lcom/lge/gallery/contentmanager/StringUtil;->ADDITIONAL_INVALID_CHAR_LIST:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 120
    sget-object v1, Lcom/lge/gallery/contentmanager/StringUtil;->INVALID_CHAR_LIST:[Ljava/lang/String;

    array-length v1, v1

    sget-object v2, Lcom/lge/gallery/contentmanager/StringUtil;->ADDITIONAL_INVALID_CHAR_LIST:[Ljava/lang/String;

    array-length v2, v2

    add-int/2addr v1, v2

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 123
    .end local v0    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_28
    return-object v1

    :cond_29
    sget-object v1, Lcom/lge/gallery/contentmanager/StringUtil;->INVALID_CHAR_LIST:[Ljava/lang/String;

    goto :goto_28
.end method

.method public static final getInvalidStringIndex(Ljava/lang/String;Z)I
    .registers 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "checkMoreInvalid"    # Z

    .prologue
    const/4 v3, -0x1

    .line 129
    if-nez p0, :cond_5

    move v0, v3

    .line 144
    :cond_4
    :goto_4
    return v0

    .line 132
    :cond_5
    invoke-static {p1}, Lcom/lge/gallery/contentmanager/StringUtil;->getInvalidCharList(Z)[Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "list":[Ljava/lang/String;
    array-length v1, v2

    .line 136
    .local v1, "length":I
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_c
    if-ltz v0, :cond_19

    .line 140
    aget-object v4, v2, v0

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v3, :cond_4

    .line 136
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    :cond_19
    move v0, v3

    .line 144
    goto :goto_4
.end method

.method public static isSurrogatePair(Ljava/lang/CharSequence;I)Z
    .registers 6
    .param p0, "text"    # Ljava/lang/CharSequence;
    .param p1, "index"    # I

    .prologue
    .line 188
    if-ltz p1, :cond_1c

    add-int/lit8 v2, p1, 0x1

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v2, v3, :cond_1c

    .line 189
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 190
    .local v0, "high":C
    add-int/lit8 v2, p1, 0x1

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    .line 192
    .local v1, "low":C
    invoke-static {v0, v1}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 193
    const/4 v2, 0x1

    .line 196
    .end local v0    # "high":C
    .end local v1    # "low":C
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public static final mergeStringArray([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 6
    .param p0, "firstArray"    # [Ljava/lang/String;
    .param p1, "secondArray"    # [Ljava/lang/String;

    .prologue
    .line 168
    if-nez p0, :cond_3

    .line 184
    .end local p1    # "secondArray":[Ljava/lang/String;
    :cond_2
    :goto_2
    return-object p1

    .line 171
    .restart local p1    # "secondArray":[Ljava/lang/String;
    :cond_3
    if-nez p1, :cond_7

    move-object p1, p0

    .line 172
    goto :goto_2

    .line 174
    :cond_7
    array-length v0, p0

    .line 175
    .local v0, "firstArrayLen":I
    if-eqz v0, :cond_2

    .line 178
    array-length v2, p1

    .line 179
    .local v2, "secondeArrayLen":I
    if-nez v2, :cond_f

    move-object p1, p0

    .line 180
    goto :goto_2

    .line 182
    :cond_f
    add-int v3, v0, v2

    invoke-static {p0, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 183
    .local v1, "ret":[Ljava/lang/String;
    const/4 v3, 0x0

    invoke-static {p1, v3, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v1

    .line 184
    goto :goto_2
.end method

.method public static final pickEXTName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 76
    if-nez p0, :cond_4

    .line 83
    :cond_3
    :goto_3
    return-object v1

    .line 79
    :cond_4
    const-string v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 80
    .local v0, "post":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 83
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static final pickFileName(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 53
    if-nez p0, :cond_5

    .line 61
    :cond_4
    :goto_4
    return-object v2

    .line 56
    :cond_5
    sget-object v3, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 57
    .local v1, "pre":I
    const-string v3, "."

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 58
    .local v0, "post":I
    if-eq v1, v4, :cond_4

    if-eq v0, v4, :cond_4

    add-int/lit8 v3, v1, 0x1

    if-gt v3, v0, :cond_4

    .line 61
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_4
.end method

.method public static final pickFileNameIncludeEXT(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 65
    if-nez p0, :cond_4

    .line 72
    :cond_3
    :goto_3
    return-object v1

    .line 68
    :cond_4
    sget-object v2, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 69
    .local v0, "pre":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 72
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method public static final pickFolderName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 101
    if-nez p0, :cond_4

    .line 105
    :cond_3
    :goto_3
    return-object v1

    .line 104
    :cond_4
    sget-object v2, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "strs":[Ljava/lang/String;
    if-eqz v0, :cond_3

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    goto :goto_3
.end method

.method public static final pickParentPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 87
    if-nez p0, :cond_5

    .line 97
    :cond_4
    :goto_4
    return-object v1

    .line 90
    :cond_5
    sget-object v2, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 91
    .local v0, "post":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v0, v2, :cond_1f

    .line 92
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 94
    :cond_1f
    const/4 v2, -0x1

    if-eq v0, v2, :cond_4

    .line 97
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_4
.end method

.method public static final replaceInvalidCharTo(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 9
    .param p0, "original"    # Ljava/lang/String;
    .param p1, "replacement"    # Ljava/lang/String;
    .param p2, "checkMoreInvalid"    # Z

    .prologue
    .line 149
    if-nez p0, :cond_4

    .line 150
    const/4 p0, 0x0

    .line 163
    .end local p0    # "original":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 152
    .restart local p0    # "original":Ljava/lang/String;
    :cond_4
    if-eqz p1, :cond_3

    .line 155
    invoke-static {p2}, Lcom/lge/gallery/contentmanager/StringUtil;->getInvalidCharList(Z)[Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, "list":[Ljava/lang/String;
    move-object v3, p0

    .line 157
    .local v3, "temp":Ljava/lang/String;
    array-length v1, v2

    .line 158
    .local v1, "length":I
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_e
    if-ltz v0, :cond_22

    .line 159
    aget-object v4, v2, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1f

    .line 160
    aget-object v4, v2, v0

    invoke-virtual {v3, v4, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 158
    :cond_1f
    add-int/lit8 v0, v0, -0x1

    goto :goto_e

    :cond_22
    move-object p0, v3

    .line 163
    goto :goto_3
.end method

.method public static final trimLastSlash(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 109
    if-eqz p0, :cond_a

    sget-object v0, Lcom/lge/gallery/contentmanager/StringUtil;->PATH_SEPERATER:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 112
    .end local p0    # "s":Ljava/lang/String;
    :cond_a
    :goto_a
    return-object p0

    .restart local p0    # "s":Ljava/lang/String;
    :cond_b
    invoke-static {p0}, Lcom/lge/gallery/contentmanager/StringUtil;->pickParentPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_a
.end method
