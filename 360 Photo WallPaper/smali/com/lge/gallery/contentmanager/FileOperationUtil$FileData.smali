.class Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
.super Ljava/lang/Object;
.source "FileOperationUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/contentmanager/FileOperationUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileData"
.end annotation


# instance fields
.field private mPrevPath:Ljava/lang/String;

.field private mTargetPath:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/contentmanager/FileOperationUtil$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$1;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->mPrevPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->mPrevPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->mTargetPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/lge/gallery/contentmanager/FileOperationUtil$FileData;->mTargetPath:Ljava/lang/String;

    return-object p1
.end method
