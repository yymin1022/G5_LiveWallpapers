.class public Lcom/lge/gallery/util/StorageStateManager;
.super Ljava/lang/Object;
.source "StorageStateManager.java"


# static fields
.field private static final ALL_STORAGE:I = 0xc8

.field private static final DEFAULT_STORAGE:I = 0x64

.field private static final EXTERNAL_STORAGE:I = 0x1

.field private static final EXTERNAL_STORAGE_TYPE:I = 0x20001

.field private static final INTERNAL_STORAGE:I = 0x0

.field private static final INVALID_EMMC:I = -0x1

.field private static final INVALID_STORAGE:I = -0x1

.field private static final METHOD_NAME_GET_PATH:Ljava/lang/String; = "getPath"

.field private static final NOTSUPPORT_EMMC:I = 0x0

.field private static final PRIMARY_STORAGE_TYPE:I = 0x10001

.field private static final SUPPORT_EMMC:I = 0x1

.field private static final TAG:Ljava/lang/String; = "StorageStateManager"

.field private static final USB_STORAGE:I = 0x2

.field private static final VOLUMNINFO_MOUNT_STATE:I = 0x2

.field private static final VOLUMNINFO_TYPE_PUBLIC:I

.field private static sCheckeMMC:I

.field private static sExternalPath:Ljava/lang/String;

.field private static sInternalPath:Ljava/lang/String;

.field private static sMemFullDialog:Landroid/app/AlertDialog;

.field private static sMountUsbStorageType:I

.field private static sToast:Landroid/widget/Toast;

.field private static sUsbPaths:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 37
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    .line 38
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sToast:Landroid/widget/Toast;

    .line 50
    const/4 v0, -0x1

    sput v0, Lcom/lge/gallery/util/StorageStateManager;->sCheckeMMC:I

    .line 52
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    .line 53
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    .line 54
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .line 58
    const v0, 0x30001

    sput v0, Lcom/lge/gallery/util/StorageStateManager;->sMountUsbStorageType:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/widget/Toast;
    .registers 1

    .prologue
    .line 32
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sToast:Landroid/widget/Toast;

    return-object v0
.end method

.method static synthetic access$002(Landroid/widget/Toast;)Landroid/widget/Toast;
    .registers 1
    .param p0, "x0"    # Landroid/widget/Toast;

    .prologue
    .line 32
    sput-object p0, Lcom/lge/gallery/util/StorageStateManager;->sToast:Landroid/widget/Toast;

    return-object p0
.end method

.method public static checkMemFullState(Landroid/content/Context;Z)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "showToast"    # Z

    .prologue
    .line 880
    if-nez p0, :cond_a

    .line 881
    const-string v0, "StorageStateManager"

    const-string v1, "context is null."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    :goto_9
    return-void

    .line 884
    :cond_a
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 886
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->isSupporteMMC(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 887
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->eMMCNotSupportFullCheck(Landroid/content/Context;Z)V

    goto :goto_9

    .line 889
    :cond_17
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->internalFullCheck(Landroid/content/Context;Z)V

    goto :goto_9
.end method

.method public static closeMemFullDialog()V
    .registers 1

    .prologue
    .line 948
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_c

    .line 949
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 950
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    .line 952
    :cond_c
    return-void
.end method

.method private static eMMCNotSupportFullCheck(Landroid/content/Context;Z)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "showToast"    # Z

    .prologue
    const/4 v1, 0x1

    .line 921
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-ne v0, v1, :cond_19

    .line 922
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    const-wide/32 v2, 0x16e360

    invoke-static {v0, v2, v3}, Lcom/lge/gallery/util/StorageStateManager;->hasAvailableRootSpaceForSize(Ljava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_19

    .line 924
    if-eqz p1, :cond_1a

    .line 925
    invoke-static {p0, v1}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullToast(Landroid/content/Context;I)V

    .line 931
    :cond_19
    :goto_19
    return-void

    .line 927
    :cond_1a
    invoke-static {p0, v1}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullDialog(Landroid/content/Context;I)V

    goto :goto_19
.end method

.method public static getExternalSdPath(Landroid/content/Context;)Ljava/lang/String;
    .registers 24
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 241
    sget v21, Lcom/lge/gallery/sys/SdkConstant;->VERSION:I

    const/16 v22, 0x17

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_11

    .line 242
    const-string v21, "EXTERNAL_ADD_STORAGE"

    invoke-static/range {v21 .. v21}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 294
    :cond_10
    :goto_10
    return-object v15

    .line 244
    :cond_11
    if-nez p0, :cond_1b

    .line 245
    new-instance v21, Ljava/lang/IllegalArgumentException;

    const-string v22, "context is null."

    invoke-direct/range {v21 .. v22}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 248
    :cond_1b
    const/4 v15, 0x0

    .line 250
    .local v15, "sdCardPath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    const-string v22, "storage"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/os/storage/StorageManager;

    .line 254
    .local v17, "sm":Landroid/os/storage/StorageManager;
    :try_start_28
    const-string v21, "android.os.storage.StorageManager"

    invoke-static/range {v21 .. v21}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    .line 255
    .local v18, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v21, "android.os.storage.StorageVolume"

    invoke-static/range {v21 .. v21}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    .line 263
    .local v19, "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v21, "getVolumeList"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 264
    .local v7, "getVolumeListMethod":Ljava/lang/reflect/Method;
    const-string v21, "isPrimary"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 265
    .local v9, "isPrimary":Ljava/lang/reflect/Method;
    const-string v21, "isRemovable"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 266
    .local v10, "isRemovable":Ljava/lang/reflect/Method;
    const-string v21, "getPath"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 267
    .local v5, "getPath":Ljava/lang/reflect/Method;
    const-string v21, "getState"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 269
    .local v6, "getState":Ljava/lang/reflect/Method;
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v7, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Ljava/lang/Object;

    move-object/from16 v0, v21

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    .line 270
    .local v20, "storageVolumes":[Ljava/lang/Object;
    move-object/from16 v3, v20

    .local v3, "arr$":[Ljava/lang/Object;
    array-length v11, v3

    .local v11, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_b4
    if-ge v8, v11, :cond_10

    aget-object v12, v3, v8

    .line 271
    .local v12, "o":Ljava/lang/Object;
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v9, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    .line 272
    .local v13, "primary":Z
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v10, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    .line 276
    .local v14, "removable":Z
    if-nez v13, :cond_119

    const/16 v21, 0x1

    move/from16 v0, v21

    if-ne v14, v0, :cond_119

    .line 277
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v6, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 278
    .local v16, "sdState":Ljava/lang/String;
    const-string v21, "mounted"

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_119

    .line 279
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v5, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v0, v21

    check-cast v0, Ljava/lang/String;

    move-object v15, v0
    :try_end_117
    .catch Ljava/lang/NoSuchMethodException; {:try_start_28 .. :try_end_117} :catch_11c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_28 .. :try_end_117} :catch_122
    .catch Ljava/lang/ClassNotFoundException; {:try_start_28 .. :try_end_117} :catch_128
    .catch Ljava/lang/IllegalAccessException; {:try_start_28 .. :try_end_117} :catch_12e

    .line 280
    goto/16 :goto_10

    .line 270
    .end local v16    # "sdState":Ljava/lang/String;
    :cond_119
    add-int/lit8 v8, v8, 0x1

    goto :goto_b4

    .line 284
    .end local v3    # "arr$":[Ljava/lang/Object;
    .end local v5    # "getPath":Ljava/lang/reflect/Method;
    .end local v6    # "getState":Ljava/lang/reflect/Method;
    .end local v7    # "getVolumeListMethod":Ljava/lang/reflect/Method;
    .end local v8    # "i$":I
    .end local v9    # "isPrimary":Ljava/lang/reflect/Method;
    .end local v10    # "isRemovable":Ljava/lang/reflect/Method;
    .end local v11    # "len$":I
    .end local v12    # "o":Ljava/lang/Object;
    .end local v13    # "primary":Z
    .end local v14    # "removable":Z
    .end local v18    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v19    # "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "storageVolumes":[Ljava/lang/Object;
    :catch_11c
    move-exception v4

    .line 285
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v4}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto/16 :goto_10

    .line 286
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    :catch_122
    move-exception v4

    .line 287
    .local v4, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v4}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto/16 :goto_10

    .line 288
    .end local v4    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_128
    move-exception v4

    .line 289
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v4}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto/16 :goto_10

    .line 290
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    :catch_12e
    move-exception v4

    .line 291
    .local v4, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v4}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_10
.end method

.method public static getFreeSpace(Landroid/content/Context;)J
    .registers 11
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v6, 0x0

    .line 646
    if-nez p0, :cond_c

    .line 647
    const-string v8, "StorageStateManager"

    const-string v9, "context is null."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    :goto_b
    return-wide v6

    .line 651
    :cond_c
    :try_start_c
    new-instance v5, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 652
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v0, v8

    .line 653
    .local v0, "available_blocks":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_21} :catch_26

    move-result v6

    int-to-long v2, v6

    .line 654
    .local v2, "block_size":J
    mul-long v6, v0, v2

    goto :goto_b

    .line 655
    .end local v0    # "available_blocks":J
    .end local v2    # "block_size":J
    .end local v5    # "stat":Landroid/os/StatFs;
    :catch_26
    move-exception v4

    .line 656
    .local v4, "e":Ljava/lang/Exception;
    const-string v8, "StorageStateManager"

    const-string v9, "Fail to access storage"

    invoke-static {v8, v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method

.method public static getInvisibleOTGStoragePath(Landroid/content/Context;)[Ljava/lang/String;
    .registers 24
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 298
    if-nez p0, :cond_a

    .line 299
    new-instance v21, Ljava/lang/IllegalArgumentException;

    const-string v22, "context is null."

    invoke-direct/range {v21 .. v22}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 302
    :cond_a
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .local v12, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    const-string v22, "storage"

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/os/storage/StorageManager;

    .line 306
    .local v15, "sm":Landroid/os/storage/StorageManager;
    :try_start_1b
    const-string v21, "android.os.storage.StorageManager"

    invoke-static/range {v21 .. v21}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v16

    .line 307
    .local v16, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v21, "android.os.storage.VolumeInfo"

    invoke-static/range {v21 .. v21}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    .line 308
    .local v19, "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .line 309
    .local v9, "isPrimary":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .line 310
    .local v6, "getType":Ljava/lang/reflect/Method;
    const/4 v11, 0x0

    .line 311
    .local v11, "isVisible":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    .line 312
    .local v5, "getInternalPath":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .line 314
    .local v7, "getVolumes":Ljava/lang/reflect/Method;
    const-string v21, "getVolumes"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 315
    const-string v21, "isPrimary"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 316
    const-string v21, "getType"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 317
    const-string v21, "isVisible"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 318
    const-string v21, "getInternalPath"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 320
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v7, v15, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/List;

    .line 321
    .local v20, "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_a4
    :goto_a4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_12b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 322
    .local v13, "o":Ljava/lang/Object;
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v9, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    .line 323
    .local v14, "primary":Z
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v6, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 324
    .local v17, "type":I
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v11, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Boolean;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v18

    .line 325
    .local v18, "visible":Z
    if-nez v17, :cond_13c

    if-nez v18, :cond_13c

    const/4 v10, 0x1

    .line 327
    .local v10, "isUSB":Z
    :goto_ef
    if-nez v14, :cond_a4

    const/16 v21, 0x1

    move/from16 v0, v21

    if-ne v10, v0, :cond_a4

    .line 328
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v5, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 329
    .local v4, "file":Ljava/io/File;
    if-eqz v4, :cond_a4

    .line 330
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "/"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_125
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1b .. :try_end_125} :catch_127
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1b .. :try_end_125} :catch_13e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1b .. :try_end_125} :catch_143
    .catch Ljava/lang/IllegalAccessException; {:try_start_1b .. :try_end_125} :catch_148

    goto/16 :goto_a4

    .line 334
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .end local v6    # "getType":Ljava/lang/reflect/Method;
    .end local v7    # "getVolumes":Ljava/lang/reflect/Method;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "isPrimary":Ljava/lang/reflect/Method;
    .end local v10    # "isUSB":Z
    .end local v11    # "isVisible":Ljava/lang/reflect/Method;
    .end local v13    # "o":Ljava/lang/Object;
    .end local v14    # "primary":Z
    .end local v16    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "type":I
    .end local v18    # "visible":Z
    .end local v19    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :catch_127
    move-exception v3

    .line 335
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v3}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 343
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :cond_12b
    :goto_12b
    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v21

    check-cast v21, [Ljava/lang/String;

    return-object v21

    .line 325
    .restart local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .restart local v6    # "getType":Ljava/lang/reflect/Method;
    .restart local v7    # "getVolumes":Ljava/lang/reflect/Method;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v9    # "isPrimary":Ljava/lang/reflect/Method;
    .restart local v11    # "isVisible":Ljava/lang/reflect/Method;
    .restart local v13    # "o":Ljava/lang/Object;
    .restart local v14    # "primary":Z
    .restart local v16    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v17    # "type":I
    .restart local v18    # "visible":Z
    .restart local v19    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v20    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :cond_13c
    const/4 v10, 0x0

    goto :goto_ef

    .line 336
    .end local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .end local v6    # "getType":Ljava/lang/reflect/Method;
    .end local v7    # "getVolumes":Ljava/lang/reflect/Method;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "isPrimary":Ljava/lang/reflect/Method;
    .end local v11    # "isVisible":Ljava/lang/reflect/Method;
    .end local v13    # "o":Ljava/lang/Object;
    .end local v14    # "primary":Z
    .end local v16    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v17    # "type":I
    .end local v18    # "visible":Z
    .end local v19    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v20    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :catch_13e
    move-exception v3

    .line 337
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_12b

    .line 338
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_143
    move-exception v3

    .line 339
    .local v3, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v3}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_12b

    .line 340
    .end local v3    # "e":Ljava/lang/ClassNotFoundException;
    :catch_148
    move-exception v3

    .line 341
    .local v3, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_12b
.end method

.method public static getMountedOtgStoragePath(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 984
    if-nez p0, :cond_b

    .line 985
    const-string v3, "StorageStateManager"

    const-string v4, "context is null."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1001
    :cond_a
    :goto_a
    return-object v2

    .line 989
    :cond_b
    sget-object v3, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    if-nez v3, :cond_12

    .line 990
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 993
    :cond_12
    sget-object v1, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .line 994
    .local v1, "paths":[Ljava/lang/String;
    if-eqz v1, :cond_a

    .line 995
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v3, v1

    if-ge v0, v3, :cond_a

    .line 996
    aget-object v3, v1, v0

    invoke-static {p0, v3}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 997
    aget-object v2, v1, v0

    goto :goto_a

    .line 995
    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_17
.end method

.method public static getPrimaryPath()Ljava/lang/String;
    .registers 3

    .prologue
    .line 63
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_19

    .line 64
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 65
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_14

    .line 66
    :cond_12
    const/4 v1, 0x0

    .line 70
    .end local v0    # "file":Ljava/io/File;
    :goto_13
    return-object v1

    .line 68
    .restart local v0    # "file":Ljava/io/File;
    :cond_14
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 70
    .end local v0    # "file":Ljava/io/File;
    :cond_19
    const-string v1, "EXTERNAL_STORAGE"

    invoke-static {v1}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_13
.end method

.method public static getStorageLocation(Landroid/content/Context;Ljava/lang/String;)I
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v4, -0x1

    .line 131
    if-nez p0, :cond_b

    .line 132
    const-string v5, "StorageStateManager"

    const-string v6, "context is null."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_a
    :goto_a
    return v4

    .line 135
    :cond_b
    if-nez p1, :cond_15

    .line 136
    const-string v5, "StorageStateManager"

    const-string v6, "path is null."

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 140
    :cond_15
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 142
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-eqz v5, :cond_32

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_30

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-static {v5}, Lcom/lge/gallery/util/StorageStateManager;->removeLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 145
    :cond_30
    const/4 v4, 0x1

    goto :goto_a

    .line 146
    :cond_32
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v5, :cond_4c

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4a

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-static {v5}, Lcom/lge/gallery/util/StorageStateManager;->removeLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 149
    :cond_4a
    const/4 v4, 0x0

    goto :goto_a

    .line 151
    :cond_4c
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    if-eqz v5, :cond_a

    .line 154
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_54
    if-ge v1, v2, :cond_a

    aget-object v3, v0, v1

    .line 155
    .local v3, "p":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_60

    .line 156
    const/4 v4, 0x2

    goto :goto_a

    .line 154
    :cond_60
    add-int/lit8 v1, v1, 0x1

    goto :goto_54
.end method

.method public static getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;
    .registers 17
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkExternal"    # Z

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 74
    if-nez p0, :cond_d

    .line 75
    const-string v12, "StorageStateManager"

    const-string v14, "context is null."

    invoke-static {v12, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v4, v13

    .line 127
    :cond_c
    :goto_c
    return-object v4

    .line 79
    :cond_d
    move/from16 v0, p1

    if-ne v0, v12, :cond_18

    sget-object v12, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-eqz v12, :cond_18

    .line 80
    sget-object v4, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    goto :goto_c

    .line 81
    :cond_18
    if-nez p1, :cond_21

    sget-object v12, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v12, :cond_21

    .line 82
    sget-object v4, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    goto :goto_c

    .line 84
    :cond_21
    const/4 v4, 0x0

    .line 85
    .local v4, "path":Ljava/lang/String;
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->getPrimaryPath()Ljava/lang/String;

    move-result-object v5

    .line 86
    .local v5, "priPath":Ljava/lang/String;
    if-eqz v5, :cond_d3

    .line 87
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    const-string v14, "storage"

    invoke-virtual {v12, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/os/storage/StorageManager;

    .line 90
    .local v9, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_34
    const-string v12, "android.os.storage.StorageManager"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 91
    .local v8, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v12, "android.os.storage.StorageVolume"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 92
    .local v10, "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 93
    .local v6, "removable":Z
    const/4 v12, 0x1

    invoke-static {v10, v12}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/lang/Object;

    move-object v0, v12

    check-cast v0, [Ljava/lang/Object;

    move-object v11, v0

    .line 95
    .local v11, "storageVolumes":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 96
    .local v2, "getVolumeList":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 97
    .local v3, "isRemovable":Ljava/lang/reflect/Method;
    const-string v12, "getVolumeList"

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Class;

    invoke-virtual {v8, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 98
    const-string v12, "isRemovable"

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Class;

    invoke-virtual {v10, v12, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 100
    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v2, v9, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/lang/Object;

    move-object v0, v12

    check-cast v0, [Ljava/lang/Object;

    move-object v11, v0

    .line 101
    const/4 v12, 0x0

    aget-object v12, v11, v12

    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-virtual {v3, v12, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    .line 103
    if-eqz p1, :cond_b1

    .line 104
    if-eqz v6, :cond_96

    .line 105
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, "/"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_c

    .line 107
    :cond_96
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getExternalSdPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 108
    .local v7, "secPath":Ljava/lang/String;
    if-eqz v7, :cond_c

    .line 109
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, "/"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_c

    .line 114
    .end local v7    # "secPath":Ljava/lang/String;
    :cond_b1
    if-nez v6, :cond_c

    .line 115
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, "/"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_c5} :catch_c8

    move-result-object v4

    goto/16 :goto_c

    .line 119
    .end local v2    # "getVolumeList":Ljava/lang/reflect/Method;
    .end local v3    # "isRemovable":Ljava/lang/reflect/Method;
    .end local v6    # "removable":Z
    .end local v8    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "storageVolumes":[Ljava/lang/Object;
    :catch_c8
    move-exception v1

    .line 120
    .local v1, "e":Ljava/lang/Exception;
    const-string v12, "StorageStateManager"

    const-string v14, "Could not invoke! [getStoragePath] w/ flag"

    invoke-static {v12, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v9    # "storageManagerService":Landroid/os/storage/StorageManager;
    :goto_d0
    move-object v4, v13

    .line 127
    goto/16 :goto_c

    .line 123
    :cond_d3
    const-string v12, "StorageStateManager"

    const-string v14, "Fail to get storage path from system!"

    invoke-static {v12, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d0
.end method

.method private static getStoragePath(Landroid/content/Context;)V
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 164
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-nez v0, :cond_b

    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 165
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->updateStoragePath(Landroid/content/Context;)V

    .line 167
    :cond_b
    return-void
.end method

.method private static getStorageState(Landroid/content/Context;Z)Ljava/lang/String;
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkExternal"    # Z

    .prologue
    const/4 v7, 0x0

    .line 586
    const/4 v6, 0x0

    .line 588
    .local v6, "storagePath":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v6

    .line 590
    if-nez v6, :cond_22

    .line 591
    const-string v8, "StorageStateManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "storagePath is null. checkExternal : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v7

    .line 614
    :goto_21
    return-object v3

    .line 595
    :cond_22
    const/4 v3, 0x0

    .line 596
    .local v3, "state":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "storage"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/storage/StorageManager;

    .line 599
    .local v5, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_2f
    const-string v8, "android.os.storage.StorageManager"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 600
    .local v4, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/lang/String;

    .line 601
    .local v2, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 602
    .local v1, "getVolumeState":Ljava/lang/reflect/Method;
    const-string v8, "getVolumeState"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-virtual {v4, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 607
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v6, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v1, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "state":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_5b} :catch_5c

    .restart local v3    # "state":Ljava/lang/String;
    goto :goto_21

    .line 609
    .end local v1    # "getVolumeState":Ljava/lang/reflect/Method;
    .end local v2    # "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "state":Ljava/lang/String;
    .end local v4    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_5c
    move-exception v0

    .line 610
    .local v0, "e":Ljava/lang/Exception;
    const-string v8, "StorageStateManager"

    const-string v9, "Could not invoke! [getStorageState] w/ flag"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v7

    .line 611
    goto :goto_21
.end method

.method public static getStorageTypeBaseFilter()Ljava/lang/String;
    .registers 1

    .prologue
    .line 976
    const-string v0, "storage_type IN(65537,131073)"

    return-object v0
.end method

.method public static getStorageTypeOtgFilter()Ljava/lang/String;
    .registers 2

    .prologue
    .line 980
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(storage_type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/lge/gallery/util/StorageStateManager;->sMountUsbStorageType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getUsbStorageIndex(Landroid/content/Context;Ljava/lang/String;)I
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 399
    if-nez p1, :cond_5

    move v0, v1

    .line 411
    :cond_4
    :goto_4
    return v0

    .line 402
    :cond_5
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 403
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    if-nez v2, :cond_e

    move v0, v1

    .line 404
    goto :goto_4

    .line 406
    :cond_e
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_21

    .line 407
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 406
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_21
    move v0, v1

    .line 411
    goto :goto_4
.end method

.method private static hasAvailableRootSpaceForSize(Ljava/lang/String;J)Z
    .registers 16
    .param p0, "rootPath"    # Ljava/lang/String;
    .param p1, "size"    # J

    .prologue
    const/4 v6, 0x0

    .line 687
    if-nez p0, :cond_b

    .line 688
    const-string v7, "StorageStateManager"

    const-string v8, "rootPath parameter is null"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    :cond_a
    :goto_a
    return v6

    .line 693
    :cond_b
    :try_start_b
    new-instance v5, Landroid/os/StatFs;

    invoke-direct {v5, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 694
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 695
    .local v0, "available_blocks":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 697
    .local v2, "block_size":J
    const-string v7, "StorageStateManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "rootPath="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " available_size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    mul-long v10, v0, v2

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " request_size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_48} :catch_50

    .line 699
    mul-long v8, v0, v2

    cmp-long v7, v8, p1

    if-lez v7, :cond_a

    const/4 v6, 0x1

    goto :goto_a

    .line 700
    .end local v0    # "available_blocks":J
    .end local v2    # "block_size":J
    .end local v5    # "stat":Landroid/os/StatFs;
    :catch_50
    move-exception v4

    .line 701
    .local v4, "e":Ljava/lang/Exception;
    const-string v7, "StorageStateManager"

    const-string v8, "Fail to access storage"

    invoke-static {v7, v8, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a
.end method

.method public static hasAvailableSpaceForSize(Landroid/content/Context;Ljava/lang/String;J)Z
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "size"    # J

    .prologue
    const/4 v6, 0x0

    .line 662
    if-nez p0, :cond_b

    .line 663
    const-string v7, "StorageStateManager"

    const-string v8, "context is null."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    :cond_a
    :goto_a
    return v6

    .line 666
    :cond_b
    if-nez p1, :cond_15

    .line 667
    const-string v7, "StorageStateManager"

    const-string v8, "Path parameter is null"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 672
    :cond_15
    :try_start_15
    new-instance v5, Landroid/os/StatFs;

    invoke-direct {v5, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 673
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 674
    .local v0, "available_blocks":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 676
    .local v2, "block_size":J
    const-string v7, "StorageStateManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "path="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " available_size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    mul-long v10, v0, v2

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " request_size="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_52} :catch_5a

    .line 678
    mul-long v8, v0, v2

    cmp-long v7, v8, p2

    if-lez v7, :cond_a

    const/4 v6, 0x1

    goto :goto_a

    .line 679
    .end local v0    # "available_blocks":J
    .end local v2    # "block_size":J
    .end local v5    # "stat":Landroid/os/StatFs;
    :catch_5a
    move-exception v4

    .line 680
    .local v4, "e":Ljava/lang/Exception;
    const-string v7, "StorageStateManager"

    const-string v8, "Fail to access storage"

    invoke-static {v7, v8, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a
.end method

.method public static hasAvailableSpaceForSize(Landroid/content/Context;ZJ)Z
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkExternal"    # Z
    .param p2, "size"    # J

    .prologue
    const/4 v7, 0x0

    .line 618
    if-nez p0, :cond_b

    .line 619
    const-string v8, "StorageStateManager"

    const-string v9, "context is null."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    :cond_a
    :goto_a
    return v7

    .line 622
    :cond_b
    const/4 v6, 0x0

    .line 624
    .local v6, "storagePath":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v6

    .line 626
    if-nez v6, :cond_2b

    .line 627
    const-string v8, "StorageStateManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "storagePath is null. checkExternal : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a

    .line 632
    :cond_2b
    :try_start_2b
    new-instance v5, Landroid/os/StatFs;

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 633
    .local v5, "stat":Landroid/os/StatFs;
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v8

    int-to-long v0, v8

    .line 634
    .local v0, "available_blocks":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v8

    int-to-long v2, v8

    .line 636
    .local v2, "block_size":J
    const-string v8, "StorageStateManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "storagePath="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " available_size="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    mul-long v10, v0, v2

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " request_size="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " checkExternal="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_72} :catch_7a

    .line 638
    mul-long v8, v0, v2

    cmp-long v8, v8, p2

    if-lez v8, :cond_a

    const/4 v7, 0x1

    goto :goto_a

    .line 639
    .end local v0    # "available_blocks":J
    .end local v2    # "block_size":J
    .end local v5    # "stat":Landroid/os/StatFs;
    :catch_7a
    move-exception v4

    .line 640
    .local v4, "e":Ljava/lang/Exception;
    const-string v8, "StorageStateManager"

    const-string v9, "Fail to access storage"

    invoke-static {v8, v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a
.end method

.method public static hasSameStorageLocation(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path1"    # Ljava/lang/String;
    .param p2, "path2"    # Ljava/lang/String;

    .prologue
    const/4 v9, -0x1

    const/4 v6, 0x0

    .line 415
    if-nez p0, :cond_c

    .line 416
    const-string v7, "StorageStateManager"

    const-string v8, "context is null."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    :cond_b
    :goto_b
    return v6

    .line 419
    :cond_c
    if-nez p1, :cond_16

    .line 420
    const-string v7, "StorageStateManager"

    const-string v8, "path1 is null."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    .line 423
    :cond_16
    if-nez p2, :cond_20

    .line 424
    const-string v7, "StorageStateManager"

    const-string v8, "path2 is null."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    .line 428
    :cond_20
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 430
    const/4 v2, -0x1

    .line 431
    .local v2, "locationPath1":I
    const/4 v3, -0x1

    .line 433
    .local v3, "locationPath2":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 434
    .local v0, "checkPath1":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 436
    .local v1, "checkPath2":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getUsbStorageIndex(Landroid/content/Context;Ljava/lang/String;)I

    move-result v4

    .line 437
    .local v4, "usbIndex1":I
    invoke-static {p0, p2}, Lcom/lge/gallery/util/StorageStateManager;->getUsbStorageIndex(Landroid/content/Context;Ljava/lang/String;)I

    move-result v5

    .line 440
    .local v5, "usbIndex2":I
    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-eqz v7, :cond_95

    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_95

    .line 442
    const/4 v2, 0x1

    .line 451
    :cond_60
    :goto_60
    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-eqz v7, :cond_a7

    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a7

    .line 453
    const/4 v3, 0x1

    .line 462
    :cond_6d
    :goto_6d
    if-eq v2, v9, :cond_71

    if-ne v3, v9, :cond_b9

    .line 463
    :cond_71
    const-string v7, "StorageStateManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "locationPath1 : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " locationPath2 : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_b

    .line 443
    :cond_95
    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v7, :cond_a3

    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a3

    .line 445
    const/4 v2, 0x0

    goto :goto_60

    .line 446
    :cond_a3
    if-ltz v4, :cond_60

    .line 447
    const/4 v2, 0x2

    goto :goto_60

    .line 454
    :cond_a7
    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v7, :cond_b5

    sget-object v7, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b5

    .line 456
    const/4 v3, 0x0

    goto :goto_6d

    .line 457
    :cond_b5
    if-ltz v5, :cond_6d

    .line 458
    const/4 v3, 0x2

    goto :goto_6d

    .line 467
    :cond_b9
    if-ne v2, v3, :cond_b

    .line 468
    if-ne v4, v5, :cond_b

    const/4 v6, 0x1

    goto/16 :goto_b
.end method

.method private static initStoragePath(Landroid/content/Context;Ljava/lang/String;Z)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "primaryPath"    # Ljava/lang/String;
    .param p2, "removable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 217
    if-eqz p2, :cond_1e

    .line 218
    if-eqz p1, :cond_1b

    .line 219
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    .line 238
    :goto_1a
    return-void

    .line 221
    :cond_1b
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    goto :goto_1a

    .line 224
    :cond_1e
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getExternalSdPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 225
    .local v0, "secPath":Ljava/lang/String;
    if-eqz p1, :cond_51

    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    .line 231
    :goto_39
    if-eqz v0, :cond_54

    .line 232
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    goto :goto_1a

    .line 228
    :cond_51
    sput-object v1, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    goto :goto_39

    .line 235
    :cond_54
    const-string v1, "StorageStateManager"

    const-string v2, "This is internal storage only!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a
.end method

.method private static internalFullCheck(Landroid/content/Context;Z)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "showToast"    # Z

    .prologue
    const/4 v4, 0x0

    .line 935
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1a

    .line 936
    sget-object v0, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    const-wide/32 v2, 0x16e360

    invoke-static {v0, v2, v3}, Lcom/lge/gallery/util/StorageStateManager;->hasAvailableRootSpaceForSize(Ljava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 938
    if-eqz p1, :cond_1b

    .line 939
    invoke-static {p0, v4}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullToast(Landroid/content/Context;I)V

    .line 945
    :cond_1a
    :goto_1a
    return-void

    .line 941
    :cond_1b
    invoke-static {p0, v4}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullDialog(Landroid/content/Context;I)V

    goto :goto_1a
.end method

.method public static isExternalPrimary(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 1038
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->getPrimaryPath()Ljava/lang/String;

    move-result-object v0

    .line 1039
    .local v0, "primary":Ljava/lang/String;
    if-eqz v0, :cond_16

    invoke-static {p0, v1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lge/gallery/util/StorageStateManager;->removeLastSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public static isInOTGStorage(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 1034
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStorageLocation(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static isInternalStorageOnly(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 571
    if-nez p0, :cond_b

    .line 572
    const-string v1, "StorageStateManager"

    const-string v2, "context is null."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    :cond_a
    :goto_a
    return v0

    .line 575
    :cond_b
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->isSupporteMMC(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 576
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 577
    sget-object v1, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-nez v1, :cond_a

    sget-object v1, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v1, :cond_a

    .line 578
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public static isInvisibleOTGStorageMounted(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 26
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "rootPath"    # Ljava/lang/String;

    .prologue
    .line 347
    if-nez p0, :cond_a

    .line 348
    new-instance v22, Ljava/lang/IllegalArgumentException;

    const-string v23, "context is null."

    invoke-direct/range {v22 .. v23}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 351
    :cond_a
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    const-string v23, "storage"

    invoke-virtual/range {v22 .. v23}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/os/storage/StorageManager;

    .line 354
    .local v15, "sm":Landroid/os/storage/StorageManager;
    :try_start_16
    const-string v22, "android.os.storage.StorageManager"

    invoke-static/range {v22 .. v22}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v17

    .line 355
    .local v17, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v22, "android.os.storage.VolumeInfo"

    invoke-static/range {v22 .. v22}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v20

    .line 357
    .local v20, "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v10, 0x0

    .line 358
    .local v10, "isPrimary":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .line 359
    .local v7, "getType":Ljava/lang/reflect/Method;
    const/4 v12, 0x0

    .line 360
    .local v12, "isVisible":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    .line 361
    .local v5, "getInternalPath":Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .line 362
    .local v6, "getState":Ljava/lang/reflect/Method;
    const/4 v8, 0x0

    .line 364
    .local v8, "getVolumes":Ljava/lang/reflect/Method;
    const-string v22, "getVolumes"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 365
    const-string v22, "isPrimary"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 366
    const-string v22, "getType"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 367
    const-string v22, "isVisible"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 368
    const-string v22, "getInternalPath"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 369
    const-string v22, "getState"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v23, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 371
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v8, v15, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/List;

    .line 372
    .local v21, "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_b4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_162

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .line 373
    .local v13, "o":Ljava/lang/Object;
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v10, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Boolean;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    .line 374
    .local v14, "primary":Z
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v7, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I

    move-result v18

    .line 375
    .local v18, "type":I
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v12, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Boolean;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v19

    .line 376
    .local v19, "visible":Z
    if-nez v18, :cond_159

    if-nez v19, :cond_159

    const/4 v11, 0x1

    .line 378
    .local v11, "isUSB":Z
    :goto_ff
    if-nez v14, :cond_b4

    const/16 v22, 0x1

    move/from16 v0, v22

    if-ne v11, v0, :cond_b4

    .line 379
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v5, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 380
    .local v4, "file":Ljava/io/File;
    if-eqz v4, :cond_b4

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "/"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_b4

    .line 381
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v6, v13, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Integer;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Integer;->intValue()I
    :try_end_14d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_16 .. :try_end_14d} :catch_15e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_16 .. :try_end_14d} :catch_165
    .catch Ljava/lang/ClassNotFoundException; {:try_start_16 .. :try_end_14d} :catch_16a
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_14d} :catch_16f

    move-result v16

    .line 382
    .local v16, "state":I
    const/16 v22, 0x2

    move/from16 v0, v16

    move/from16 v1, v22

    if-ne v0, v1, :cond_15b

    const/16 v22, 0x1

    .line 395
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .end local v6    # "getState":Ljava/lang/reflect/Method;
    .end local v7    # "getType":Ljava/lang/reflect/Method;
    .end local v8    # "getVolumes":Ljava/lang/reflect/Method;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "isPrimary":Ljava/lang/reflect/Method;
    .end local v11    # "isUSB":Z
    .end local v12    # "isVisible":Ljava/lang/reflect/Method;
    .end local v13    # "o":Ljava/lang/Object;
    .end local v14    # "primary":Z
    .end local v16    # "state":I
    .end local v17    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "type":I
    .end local v19    # "visible":Z
    .end local v20    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :goto_158
    return v22

    .line 376
    .restart local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .restart local v6    # "getState":Ljava/lang/reflect/Method;
    .restart local v7    # "getType":Ljava/lang/reflect/Method;
    .restart local v8    # "getVolumes":Ljava/lang/reflect/Method;
    .restart local v9    # "i$":Ljava/util/Iterator;
    .restart local v10    # "isPrimary":Ljava/lang/reflect/Method;
    .restart local v12    # "isVisible":Ljava/lang/reflect/Method;
    .restart local v13    # "o":Ljava/lang/Object;
    .restart local v14    # "primary":Z
    .restart local v17    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v18    # "type":I
    .restart local v19    # "visible":Z
    .restart local v20    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v21    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :cond_159
    const/4 v11, 0x0

    goto :goto_ff

    .line 382
    .restart local v4    # "file":Ljava/io/File;
    .restart local v11    # "isUSB":Z
    .restart local v16    # "state":I
    :cond_15b
    const/16 v22, 0x0

    goto :goto_158

    .line 386
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "getInternalPath":Ljava/lang/reflect/Method;
    .end local v6    # "getState":Ljava/lang/reflect/Method;
    .end local v7    # "getType":Ljava/lang/reflect/Method;
    .end local v8    # "getVolumes":Ljava/lang/reflect/Method;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "isPrimary":Ljava/lang/reflect/Method;
    .end local v11    # "isUSB":Z
    .end local v12    # "isVisible":Ljava/lang/reflect/Method;
    .end local v13    # "o":Ljava/lang/Object;
    .end local v14    # "primary":Z
    .end local v16    # "state":I
    .end local v17    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v18    # "type":I
    .end local v19    # "visible":Z
    .end local v20    # "volumeInfo":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "volumes":Ljava/util/List;, "Ljava/util/List<*>;"
    :catch_15e
    move-exception v3

    .line 387
    .local v3, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v3}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 395
    .end local v3    # "e":Ljava/lang/NoSuchMethodException;
    :cond_162
    :goto_162
    const/16 v22, 0x0

    goto :goto_158

    .line 388
    :catch_165
    move-exception v3

    .line 389
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_162

    .line 390
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_16a
    move-exception v3

    .line 391
    .local v3, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v3}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_162

    .line 392
    .end local v3    # "e":Ljava/lang/ClassNotFoundException;
    :catch_16f
    move-exception v3

    .line 393
    .local v3, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_162
.end method

.method public static isMassStorage(Landroid/content/Context;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 547
    if-nez p0, :cond_c

    .line 548
    const-string v2, "StorageStateManager"

    const-string v3, "context is null."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    :cond_b
    :goto_b
    return v1

    .line 551
    :cond_c
    const/4 v0, 0x0

    .line 552
    .local v0, "state":Ljava/lang/String;
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->isSupporteMMC(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 553
    invoke-static {p0, v1}, Lcom/lge/gallery/util/StorageStateManager;->getStorageState(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 554
    if-eqz v0, :cond_23

    .line 555
    const-string v3, "shared"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    move v1, v2

    .line 556
    goto :goto_b

    .line 560
    :cond_23
    invoke-static {p0, v2}, Lcom/lge/gallery/util/StorageStateManager;->getStorageState(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    .line 561
    if-eqz v0, :cond_b

    .line 562
    const-string v3, "shared"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    move v1, v2

    .line 563
    goto :goto_b
.end method

.method public static isMemoryFull(Landroid/content/Context;)Z
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const-wide/32 v4, 0x16e360

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 894
    if-nez p0, :cond_f

    .line 895
    const-string v1, "StorageStateManager"

    const-string v2, "context is null."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 916
    :cond_e
    :goto_e
    return v0

    .line 898
    :cond_f
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 900
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->isSupporteMMC(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_2a

    .line 901
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-static {p0, v2}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-ne v2, v1, :cond_e

    .line 902
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-static {v2, v4, v5}, Lcom/lge/gallery/util/StorageStateManager;->hasAvailableRootSpaceForSize(Ljava/lang/String;J)Z

    move-result v2

    if-nez v2, :cond_e

    move v0, v1

    .line 904
    goto :goto_e

    .line 908
    :cond_2a
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-static {p0, v2}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-ne v2, v1, :cond_e

    .line 909
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-static {v2, v4, v5}, Lcom/lge/gallery/util/StorageStateManager;->hasAvailableRootSpaceForSize(Ljava/lang/String;J)Z

    move-result v2

    if-nez v2, :cond_e

    move v0, v1

    .line 911
    goto :goto_e
.end method

.method public static isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "rootPath"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 515
    if-nez p1, :cond_c

    .line 516
    const-string v7, "StorageStateManager"

    const-string v8, "rootPath parameter is null"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    :cond_b
    :goto_b
    return v6

    .line 520
    :cond_c
    const/4 v3, 0x0

    .line 521
    .local v3, "state":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "storage"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/storage/StorageManager;

    .line 524
    .local v5, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_19
    const-string v8, "android.os.storage.StorageManager"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 525
    .local v4, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/lang/String;

    .line 526
    .local v2, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 527
    .local v1, "getVolumeState":Ljava/lang/reflect/Method;
    const-string v8, "getVolumeState"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    invoke-virtual {v4, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 532
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {p1, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v1, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "state":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_45} :catch_4f

    .line 539
    .restart local v3    # "state":Ljava/lang/String;
    const-string v8, "mounted"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    move v6, v7

    .line 540
    goto :goto_b

    .line 534
    .end local v1    # "getVolumeState":Ljava/lang/reflect/Method;
    .end local v2    # "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "state":Ljava/lang/String;
    .end local v4    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_4f
    move-exception v0

    .line 535
    .local v0, "e":Ljava/lang/Exception;
    const-string v7, "StorageStateManager"

    const-string v8, "Could not invoke! [isMountStorage] w/ path"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method public static isMountStorage(Landroid/content/Context;Z)Z
    .registers 15
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkExternal"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 475
    if-nez p0, :cond_c

    .line 476
    const-string v8, "StorageStateManager"

    const-string v9, "context is null."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    :cond_b
    :goto_b
    return v7

    .line 479
    :cond_c
    const/4 v6, 0x0

    .line 481
    .local v6, "storagePath":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v6

    .line 483
    if-nez v6, :cond_2c

    .line 484
    const-string v8, "StorageStateManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "storagePath is null. checkExternal : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    .line 488
    :cond_2c
    const/4 v3, 0x0

    .line 489
    .local v3, "state":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "storage"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/os/storage/StorageManager;

    .line 492
    .local v5, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_39
    const-string v9, "android.os.storage.StorageManager"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 493
    .local v4, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Ljava/lang/String;

    .line 494
    .local v2, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 495
    .local v1, "getVolumeState":Ljava/lang/reflect/Method;
    const-string v9, "getVolumeState"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v2, v10, v11

    invoke-virtual {v4, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 500
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v6, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v1, v5, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "state":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_65} :catch_6f

    .line 507
    .restart local v3    # "state":Ljava/lang/String;
    const-string v9, "mounted"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    move v7, v8

    .line 508
    goto :goto_b

    .line 502
    .end local v1    # "getVolumeState":Ljava/lang/reflect/Method;
    .end local v2    # "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "state":Ljava/lang/String;
    .end local v4    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_6f
    move-exception v0

    .line 503
    .local v0, "e":Ljava/lang/Exception;
    const-string v8, "StorageStateManager"

    const-string v9, "Could not invoke! [isMountStorage] w/ flag"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method public static isOtgMounted(Landroid/content/Context;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 1005
    if-nez p0, :cond_b

    .line 1006
    const-string v3, "StorageStateManager"

    const-string v4, "context is null."

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1023
    :cond_a
    :goto_a
    return v2

    .line 1010
    :cond_b
    sget-object v3, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    if-nez v3, :cond_12

    .line 1011
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 1014
    :cond_12
    sget-object v1, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .line 1015
    .local v1, "paths":[Ljava/lang/String;
    if-eqz v1, :cond_a

    .line 1016
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v3, v1

    if-ge v0, v3, :cond_a

    .line 1017
    aget-object v3, v1, v0

    invoke-static {p0, v3}, Lcom/lge/gallery/util/StorageStateManager;->isMountStorage(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 1018
    const-string v2, "StorageStateManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mounted USB path : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    const/4 v2, 0x1

    goto :goto_a

    .line 1016
    :cond_3e
    add-int/lit8 v0, v0, 0x1

    goto :goto_17
.end method

.method public static isSupporteMMC(Landroid/content/Context;)Z
    .registers 15
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 707
    if-nez p0, :cond_d

    .line 708
    const-string v10, "StorageStateManager"

    const-string v12, "context is null."

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move v10, v11

    .line 750
    :goto_c
    return v10

    .line 712
    :cond_d
    sget v10, Lcom/lge/gallery/util/StorageStateManager;->sCheckeMMC:I

    const/4 v13, -0x1

    if-eq v10, v13, :cond_1a

    .line 713
    sget v10, Lcom/lge/gallery/util/StorageStateManager;->sCheckeMMC:I

    if-nez v10, :cond_18

    move v10, v12

    .line 714
    goto :goto_c

    :cond_18
    move v10, v11

    .line 716
    goto :goto_c

    .line 719
    :cond_1a
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->getPrimaryPath()Ljava/lang/String;

    move-result-object v4

    .line 720
    .local v4, "priPath":Ljava/lang/String;
    if-eqz v4, :cond_89

    .line 721
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-string v13, "storage"

    invoke-virtual {v10, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageManager;

    .line 724
    .local v7, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_2c
    const-string v10, "android.os.storage.StorageManager"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 725
    .local v6, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v10, "android.os.storage.StorageVolume"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 726
    .local v8, "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 727
    .local v5, "removable":Z
    const/4 v10, 0x1

    invoke-static {v8, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/Object;

    move-object v0, v10

    check-cast v0, [Ljava/lang/Object;

    move-object v9, v0

    .line 729
    .local v9, "storageVolumes":[Ljava/lang/Object;
    const-string v10, "getVolumeList"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Class;

    invoke-virtual {v6, v10, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 730
    .local v2, "getVolumeList":Ljava/lang/reflect/Method;
    const-string v10, "isRemovable"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Class;

    invoke-virtual {v8, v10, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 732
    .local v3, "isRemovable":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/Object;

    move-object v0, v10

    check-cast v0, [Ljava/lang/Object;

    move-object v9, v0

    .line 733
    const/4 v10, 0x0

    aget-object v10, v9, v10

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-virtual {v3, v10, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    .line 736
    if-eqz v5, :cond_7a

    .line 737
    const/4 v10, 0x0

    sput v10, Lcom/lge/gallery/util/StorageStateManager;->sCheckeMMC:I

    move v10, v12

    .line 738
    goto :goto_c

    .line 740
    :cond_7a
    const/4 v10, 0x1

    sput v10, Lcom/lge/gallery/util/StorageStateManager;->sCheckeMMC:I
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_7d} :catch_7f

    move v10, v11

    .line 741
    goto :goto_c

    .line 743
    .end local v2    # "getVolumeList":Ljava/lang/reflect/Method;
    .end local v3    # "isRemovable":Ljava/lang/reflect/Method;
    .end local v5    # "removable":Z
    .end local v6    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "storageVolumes":[Ljava/lang/Object;
    :catch_7f
    move-exception v1

    .line 744
    .local v1, "e":Ljava/lang/Exception;
    const-string v10, "StorageStateManager"

    const-string v12, "Could not invoke! [isSupporteMMC]"

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v7    # "storageManagerService":Landroid/os/storage/StorageManager;
    :goto_87
    move v10, v11

    .line 750
    goto :goto_c

    .line 747
    :cond_89
    const-string v10, "StorageStateManager"

    const-string v12, "Fail to get storage path from system!"

    invoke-static {v10, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_87
.end method

.method public static removeLastSlash(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 1027
    if-eqz p0, :cond_15

    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1028
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 1030
    :cond_15
    return-object p0
.end method

.method private static showMemFullDialog(Landroid/content/Context;I)V
    .registers 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "storage"    # I

    .prologue
    .line 871
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullDialogWithoutFM(Landroid/content/Context;I)V

    .line 872
    return-void
.end method

.method public static showMemFullDialog(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 824
    if-nez p0, :cond_a

    .line 825
    const-string v1, "StorageStateManager"

    const-string v2, "context is null."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    :goto_9
    return-void

    .line 828
    :cond_a
    if-nez p1, :cond_14

    .line 829
    const-string v1, "StorageStateManager"

    const-string v2, "Path parameter is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 834
    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 835
    .local v0, "checkPath":Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullDialogWithoutFM(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_9
.end method

.method private static showMemFullDialogWithoutFM(Landroid/content/Context;I)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "storage"    # I

    .prologue
    .line 796
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 798
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    sget v4, Lcom/lge/gallery/common/R$string;->sp_storage_full_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 800
    .local v3, "title":Ljava/lang/String;
    const/4 v1, 0x0

    .line 801
    .local v1, "body":Ljava/lang/String;
    const/16 v4, 0xc8

    if-ne p1, v4, :cond_3b

    .line 802
    sget v4, Lcom/lge/gallery/common/R$string;->sp_all_mem_full_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 812
    :goto_16
    sget v4, Lcom/lge/gallery/common/R$string;->sp_ok_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 814
    .local v2, "sPositive":Ljava/lang/String;
    const v4, 0x1010355

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    .line 815
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 816
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 817
    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 818
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->closeMemFullDialog()V

    .line 819
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    sput-object v4, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    .line 820
    sget-object v4, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 821
    return-void

    .line 803
    .end local v2    # "sPositive":Ljava/lang/String;
    :cond_3b
    const/4 v4, 0x1

    if-ne p1, v4, :cond_45

    .line 804
    sget v4, Lcom/lge/gallery/common/R$string;->sp_sd_mem_full_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_16

    .line 805
    :cond_45
    if-nez p1, :cond_4e

    .line 806
    sget v4, Lcom/lge/gallery/common/R$string;->sp_internal_mem_full_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_16

    .line 809
    :cond_4e
    sget v4, Lcom/lge/gallery/common/R$string;->sp_mem_full_NORMAL:I

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_16
.end method

.method private static showMemFullDialogWithoutFM(Landroid/content/Context;Ljava/lang/String;)V
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 756
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 758
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    sget v5, Lcom/lge/gallery/common/R$string;->sp_storage_full_NORMAL:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 760
    .local v4, "title":Ljava/lang/String;
    const/16 v3, 0x64

    .line 761
    .local v3, "storage":I
    invoke-static {p0}, Lcom/lge/gallery/util/StorageStateManager;->getStoragePath(Landroid/content/Context;)V

    .line 763
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    if-eqz v5, :cond_4c

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 765
    const/4 v3, 0x1

    .line 773
    :goto_1d
    const/4 v1, 0x0

    .line 774
    .local v1, "body":Ljava/lang/String;
    const/4 v5, 0x1

    if-ne v3, v5, :cond_73

    .line 775
    sget v5, Lcom/lge/gallery/common/R$string;->sp_sd_mem_full_NORMAL:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 783
    :goto_27
    sget v5, Lcom/lge/gallery/common/R$string;->sp_ok_NORMAL:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 785
    .local v2, "sPositive":Ljava/lang/String;
    const v5, 0x1010355

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    .line 786
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 787
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 788
    const/4 v5, 0x0

    invoke-virtual {v0, v2, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 789
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->closeMemFullDialog()V

    .line 790
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    sput-object v5, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    .line 791
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sMemFullDialog:Landroid/app/AlertDialog;

    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 792
    return-void

    .line 766
    .end local v1    # "body":Ljava/lang/String;
    .end local v2    # "sPositive":Ljava/lang/String;
    :cond_4c
    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    if-eqz v5, :cond_5a

    sget-object v5, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5a

    .line 768
    const/4 v3, 0x0

    goto :goto_1d

    .line 770
    :cond_5a
    const-string v5, "StorageStateManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid path : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 776
    .restart local v1    # "body":Ljava/lang/String;
    :cond_73
    if-nez v3, :cond_7c

    .line 777
    sget v5, Lcom/lge/gallery/common/R$string;->sp_internal_mem_full_NORMAL:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_27

    .line 780
    :cond_7c
    sget v5, Lcom/lge/gallery/common/R$string;->sp_mem_full_NORMAL:I

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_27
.end method

.method private static showMemFullToast(Landroid/content/Context;I)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "storage"    # I

    .prologue
    const/4 v2, 0x1

    .line 851
    if-nez p0, :cond_b

    .line 852
    const-string v1, "StorageStateManager"

    const-string v2, "context is null."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 868
    :goto_a
    return-void

    .line 855
    :cond_b
    const/4 v0, 0x0

    .line 856
    .local v0, "body":Ljava/lang/String;
    if-ne p1, v2, :cond_18

    .line 857
    sget v1, Lcom/lge/gallery/common/R$string;->sp_sd_mem_full_NORMAL:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 867
    :goto_14
    invoke-static {p0, v0, v2}, Lcom/lge/gallery/util/StorageStateManager;->showToast(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_a

    .line 858
    :cond_18
    if-nez p1, :cond_21

    .line 859
    sget v1, Lcom/lge/gallery/common/R$string;->sp_internal_mem_full_NORMAL:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    .line 861
    :cond_21
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2b

    .line 862
    sget v1, Lcom/lge/gallery/common/R$string;->sp_usb_mem_full_NORMAL:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    .line 864
    :cond_2b
    sget v1, Lcom/lge/gallery/common/R$string;->sp_mem_full_NORMAL:I

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method public static showMemFullToast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 839
    if-nez p0, :cond_a

    .line 840
    const-string v0, "StorageStateManager"

    const-string v1, "context is null."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 848
    :goto_9
    return-void

    .line 843
    :cond_a
    if-nez p1, :cond_14

    .line 844
    const-string v0, "StorageStateManager"

    const-string v1, "Path parameter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 847
    :cond_14
    invoke-static {p0, p1}, Lcom/lge/gallery/util/StorageStateManager;->getStorageLocation(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    invoke-static {p0, v0}, Lcom/lge/gallery/util/StorageStateManager;->showMemFullToast(Landroid/content/Context;I)V

    goto :goto_9
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "duration"    # I

    .prologue
    .line 955
    if-nez p0, :cond_a

    .line 956
    const-string v0, "StorageStateManager"

    const-string v1, "context is null."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 973
    :cond_9
    :goto_9
    return-void

    .line 960
    :cond_a
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_9

    move-object v0, p0

    .line 961
    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/lge/gallery/util/StorageStateManager$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/lge/gallery/util/StorageStateManager$1;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_9
.end method

.method public static updateStoragePath(Landroid/content/Context;)V
    .registers 23
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 170
    invoke-static {}, Lcom/lge/gallery/util/StorageStateManager;->getPrimaryPath()Ljava/lang/String;

    move-result-object v11

    .line 171
    .local v11, "priPath":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    const-string v20, "storage"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/os/storage/StorageManager;

    .line 174
    .local v14, "storageManagerService":Landroid/os/storage/StorageManager;
    :try_start_10
    const-string v19, "android.os.storage.StorageManager"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    .line 175
    .local v13, "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v19, "android.os.storage.StorageVolume"

    invoke-static/range {v19 .. v19}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    .line 176
    .local v15, "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v12, 0x0

    .line 177
    .local v12, "removable":Z
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-static {v15, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [Ljava/lang/Object;

    move-object/from16 v0, v19

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    .line 179
    .local v16, "storageVolumes":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 180
    .local v5, "getVolumeList":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .line 181
    .local v7, "isRemovable":Ljava/lang/reflect/Method;
    const-string v19, "getVolumeList"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 182
    const-string v19, "isRemovable"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 184
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v5, v14, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [Ljava/lang/Object;

    move-object/from16 v0, v19

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    .line 185
    const/16 v19, 0x0

    aget-object v19, v16, v19

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v7, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Boolean;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    .line 187
    move-object/from16 v0, p0

    invoke-static {v0, v11, v12}, Lcom/lge/gallery/util/StorageStateManager;->initStoragePath(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 189
    const-string v19, "getPath"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 190
    .local v4, "getPath":Ljava/lang/reflect/Method;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v9, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v2, v16

    .local v2, "arr$":[Ljava/lang/Object;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_a3
    if-ge v6, v8, :cond_101

    aget-object v18, v2, v6

    .line 192
    .local v18, "volume":Ljava/lang/Object;
    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v4, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 193
    .local v10, "path":Ljava/lang/String;
    if-eqz v10, :cond_c1

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v19

    if-gtz v19, :cond_cb

    .line 194
    :cond_c1
    const-string v19, "StorageStateManager"

    const-string v20, "fail to add usb storages : invalid path"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    :cond_c8
    :goto_c8
    add-int/lit8 v6, v6, 0x1

    goto :goto_a3

    .line 197
    :cond_cb
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "/"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 198
    sget-object v19, Lcom/lge/gallery/util/StorageStateManager;->sInternalPath:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c8

    sget-object v19, Lcom/lge/gallery/util/StorageStateManager;->sExternalPath:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c8

    .line 201
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_f7
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_f7} :catch_f8

    goto :goto_c8

    .line 210
    .end local v2    # "arr$":[Ljava/lang/Object;
    .end local v4    # "getPath":Ljava/lang/reflect/Method;
    .end local v5    # "getVolumeList":Ljava/lang/reflect/Method;
    .end local v6    # "i$":I
    .end local v7    # "isRemovable":Ljava/lang/reflect/Method;
    .end local v8    # "len$":I
    .end local v9    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v10    # "path":Ljava/lang/String;
    .end local v12    # "removable":Z
    .end local v13    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v15    # "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "storageVolumes":[Ljava/lang/Object;
    .end local v18    # "volume":Ljava/lang/Object;
    :catch_f8
    move-exception v3

    .line 211
    .local v3, "e":Ljava/lang/Exception;
    const-string v19, "StorageStateManager"

    const-string v20, "Could not invoke! [getStoragePath]"

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_100
    :goto_100
    return-void

    .line 203
    .restart local v2    # "arr$":[Ljava/lang/Object;
    .restart local v4    # "getPath":Ljava/lang/reflect/Method;
    .restart local v5    # "getVolumeList":Ljava/lang/reflect/Method;
    .restart local v6    # "i$":I
    .restart local v7    # "isRemovable":Ljava/lang/reflect/Method;
    .restart local v8    # "len$":I
    .restart local v9    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v12    # "removable":Z
    .restart local v13    # "storageManager":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v15    # "storageVolume":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v16    # "storageVolumes":[Ljava/lang/Object;
    :cond_101
    const/16 v19, 0x0

    :try_start_103
    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [Ljava/lang/String;

    sput-object v19, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .line 204
    sget-object v2, Lcom/lge/gallery/util/StorageStateManager;->sUsbPaths:[Ljava/lang/String;

    .local v2, "arr$":[Ljava/lang/String;
    array-length v8, v2

    const/4 v6, 0x0

    :goto_117
    if-ge v6, v8, :cond_13a

    aget-object v17, v2, v6

    .line 205
    .local v17, "usb":Ljava/lang/String;
    const-string v19, "StorageStateManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "usb = "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    add-int/lit8 v6, v6, 0x1

    goto :goto_117

    .line 207
    .end local v17    # "usb":Ljava/lang/String;
    :cond_13a
    sget v19, Lcom/lge/gallery/sys/SdkConstant;->VERSION:I

    const/16 v20, 0x17

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_100

    .line 208
    invoke-static/range {p0 .. p0}, Lcom/lge/gallery/util/LocalBucketData;->getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/LocalBucketData;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/lge/gallery/util/LocalBucketData;->updateBucketIds(Landroid/content/Context;)V
    :try_end_14f
    .catch Ljava/lang/Exception; {:try_start_103 .. :try_end_14f} :catch_f8

    goto :goto_100
.end method
