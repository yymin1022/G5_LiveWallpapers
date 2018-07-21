.class public Lcom/lge/gallery/sys/NavigationBarHelper;
.super Ljava/lang/Object;
.source "NavigationBarHelper.java"


# static fields
.field private static final IS_NAVIGATION_BAR_EXIST:Z

.field private static final RES_NAME_NAV_HEIGHT:Ljava/lang/String; = "navigation_bar_height"

.field private static final RES_NAME_NAV_WIDTH:Ljava/lang/String; = "navigation_bar_width"


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 17
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "config_showNavigationBar"

    const-string v3, "bool"

    const-string v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    sput-boolean v0, Lcom/lge/gallery/sys/NavigationBarHelper;->IS_NAVIGATION_BAR_EXIST:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const-string v0, "navigation_bar_height"

    invoke-static {p0, v0}, Lcom/lge/gallery/sys/NavigationBarHelper;->getNavigationBarSize(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static getNavigationBarSize(Landroid/content/Context;Ljava/lang/String;)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "resKind"    # Ljava/lang/String;

    .prologue
    .line 32
    if-nez p0, :cond_4

    .line 33
    const/4 v2, 0x0

    .line 38
    :goto_3
    return v2

    .line 35
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 36
    .local v1, "resource":Landroid/content/res/Resources;
    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v1, p1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 38
    .local v0, "id":I
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_3
.end method

.method public static getNavigationBarWidth(Landroid/content/Context;)I
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    const-string v0, "navigation_bar_width"

    invoke-static {p0, v0}, Lcom/lge/gallery/sys/NavigationBarHelper;->getNavigationBarSize(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static hasNavigationBar()Z
    .registers 1

    .prologue
    .line 42
    sget-boolean v0, Lcom/lge/gallery/sys/NavigationBarHelper;->IS_NAVIGATION_BAR_EXIST:Z

    return v0
.end method
