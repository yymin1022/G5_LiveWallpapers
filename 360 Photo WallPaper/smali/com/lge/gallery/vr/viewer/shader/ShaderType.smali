.class public final enum Lcom/lge/gallery/vr/viewer/shader/ShaderType;
.super Ljava/lang/Enum;
.source "ShaderType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lge/gallery/vr/viewer/shader/ShaderType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lge/gallery/vr/viewer/shader/ShaderType;

.field public static final enum FRAGMENT:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

.field public static final enum VERTEX:Lcom/lge/gallery/vr/viewer/shader/ShaderType;


# instance fields
.field private final mType:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 15
    new-instance v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    const-string v1, "VERTEX"

    const v2, 0x8b31

    invoke-direct {v0, v1, v3, v2}, Lcom/lge/gallery/vr/viewer/shader/ShaderType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->VERTEX:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    .line 16
    new-instance v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    const-string v1, "FRAGMENT"

    const v2, 0x8b30

    invoke-direct {v0, v1, v4, v2}, Lcom/lge/gallery/vr/viewer/shader/ShaderType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->FRAGMENT:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    .line 14
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    sget-object v1, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->VERTEX:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->FRAGMENT:Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->$VALUES:[Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "type"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 20
    iput p3, p0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->mType:I

    .line 21
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    return-object v0
.end method

.method public static values()[Lcom/lge/gallery/vr/viewer/shader/ShaderType;
    .registers 1

    .prologue
    .line 14
    sget-object v0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->$VALUES:[Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    invoke-virtual {v0}, [Lcom/lge/gallery/vr/viewer/shader/ShaderType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lge/gallery/vr/viewer/shader/ShaderType;

    return-object v0
.end method


# virtual methods
.method public getTypeIndex()I
    .registers 2

    .prologue
    .line 24
    iget v0, p0, Lcom/lge/gallery/vr/viewer/shader/ShaderType;->mType:I

    return v0
.end method
