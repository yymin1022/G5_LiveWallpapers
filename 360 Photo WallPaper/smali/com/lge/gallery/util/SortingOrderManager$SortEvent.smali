.class public final enum Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
.super Ljava/lang/Enum;
.source "SortingOrderManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/util/SortingOrderManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SortEvent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lge/gallery/util/SortingOrderManager$SortEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

.field public static final enum GLOBAL:Lcom/lge/gallery/util/SortingOrderManager$SortEvent;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 57
    new-instance v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    const-string v1, "GLOBAL"

    invoke-direct {v0, v1, v2}, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->GLOBAL:Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    .line 56
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    sget-object v1, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->GLOBAL:Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    aput-object v1, v0, v2

    sput-object v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->$VALUES:[Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 56
    const-class v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    return-object v0
.end method

.method public static values()[Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->$VALUES:[Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    invoke-virtual {v0}, [Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    return-object v0
.end method
