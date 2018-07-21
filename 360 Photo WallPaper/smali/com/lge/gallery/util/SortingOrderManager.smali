.class public Lcom/lge/gallery/util/SortingOrderManager;
.super Ljava/lang/Object;
.source "SortingOrderManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lge/gallery/util/SortingOrderManager$SortEvent;,
        Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;
    }
.end annotation


# static fields
.field private static final GALLERY_PREF:Ljava/lang/String; = "com.lge.gallery.rd.sort_pref"

.field private static final KEY_SORT_OPTION:Ljava/lang/String; = "sort"

.field private static final TAG:Ljava/lang/String; = "SortingOrderManger"

.field private static sManager:Lcom/lge/gallery/util/SortingOrderManager;


# instance fields
.field private currentSortingOrder:I

.field private mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private mObserverList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPreference:Landroid/content/SharedPreferences;

.field private prevSortingOrder:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/lge/gallery/util/SortingOrderManager;->sManager:Lcom/lge/gallery/util/SortingOrderManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    const/4 v1, -0x1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    .line 44
    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mObserverList:Ljava/util/ArrayList;

    .line 49
    iput v1, p0, Lcom/lge/gallery/util/SortingOrderManager;->currentSortingOrder:I

    .line 50
    iput v1, p0, Lcom/lge/gallery/util/SortingOrderManager;->prevSortingOrder:I

    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 62
    const-string v0, "com.lge.gallery.rd.sort_pref"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    .line 63
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "sort"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->currentSortingOrder:I

    .line 64
    invoke-virtual {p0}, Lcom/lge/gallery/util/SortingOrderManager;->register()V

    .line 65
    return-void
.end method

.method static synthetic access$000(Lcom/lge/gallery/util/SortingOrderManager;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(Lcom/lge/gallery/util/SortingOrderManager;)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/lge/gallery/util/SortingOrderManager;->getOrderValue()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/lge/gallery/util/SortingOrderManager;)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;

    .prologue
    .line 37
    iget v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->currentSortingOrder:I

    return v0
.end method

.method static synthetic access$202(Lcom/lge/gallery/util/SortingOrderManager;I)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;
    .param p1, "x1"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/lge/gallery/util/SortingOrderManager;->currentSortingOrder:I

    return p1
.end method

.method static synthetic access$300(Lcom/lge/gallery/util/SortingOrderManager;)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;

    .prologue
    .line 37
    iget v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->prevSortingOrder:I

    return v0
.end method

.method static synthetic access$302(Lcom/lge/gallery/util/SortingOrderManager;I)I
    .registers 2
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;
    .param p1, "x1"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/lge/gallery/util/SortingOrderManager;->prevSortingOrder:I

    return p1
.end method

.method static synthetic access$400(Lcom/lge/gallery/util/SortingOrderManager;Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V
    .registers 4
    .param p0, "x0"    # Lcom/lge/gallery/util/SortingOrderManager;
    .param p1, "x1"    # Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/lge/gallery/util/SortingOrderManager;->notifyChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/lge/gallery/util/SortingOrderManager;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    sget-object v0, Lcom/lge/gallery/util/SortingOrderManager;->sManager:Lcom/lge/gallery/util/SortingOrderManager;

    if-nez v0, :cond_b

    .line 69
    new-instance v0, Lcom/lge/gallery/util/SortingOrderManager;

    invoke-direct {v0, p0}, Lcom/lge/gallery/util/SortingOrderManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/lge/gallery/util/SortingOrderManager;->sManager:Lcom/lge/gallery/util/SortingOrderManager;

    .line 71
    :cond_b
    sget-object v0, Lcom/lge/gallery/util/SortingOrderManager;->sManager:Lcom/lge/gallery/util/SortingOrderManager;

    return-object v0
.end method

.method public static getInstanceIfPossible()Lcom/lge/gallery/util/SortingOrderManager;
    .registers 1

    .prologue
    .line 75
    sget-object v0, Lcom/lge/gallery/util/SortingOrderManager;->sManager:Lcom/lge/gallery/util/SortingOrderManager;

    return-object v0
.end method

.method private getOrderValue()I
    .registers 4

    .prologue
    .line 114
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_e

    .line 115
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    const-string v1, "sort"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 117
    :goto_d
    return v0

    :cond_e
    const/4 v0, -0x1

    goto :goto_d
.end method

.method private notifyChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V
    .registers 9
    .param p1, "event"    # Lcom/lge/gallery/util/SortingOrderManager$SortEvent;
    .param p2, "prev"    # I
    .param p3, "current"    # I

    .prologue
    .line 139
    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager;->mObserverList:Ljava/util/ArrayList;

    .line 140
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 141
    .local v2, "o":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    .line 142
    .local v3, "observer":Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;
    if-eqz v3, :cond_6

    .line 143
    invoke-interface {v3, p1, p2, p3}, Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;->sortChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V

    goto :goto_6

    .line 146
    .end local v2    # "o":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;>;"
    .end local v3    # "observer":Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;
    :cond_1e
    return-void
.end method


# virtual methods
.method public clearObservers()V
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mObserverList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 130
    return-void
.end method

.method public fakeChanged()V
    .registers 4

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/lge/gallery/util/SortingOrderManager;->getSortingOrder()I

    move-result v0

    .line 134
    .local v0, "current":I
    if-nez v0, :cond_d

    const/4 v1, 0x1

    .line 135
    .local v1, "prev":I
    :goto_7
    sget-object v2, Lcom/lge/gallery/util/SortingOrderManager$SortEvent;->GLOBAL:Lcom/lge/gallery/util/SortingOrderManager$SortEvent;

    invoke-direct {p0, v2, v1, v0}, Lcom/lge/gallery/util/SortingOrderManager;->notifyChanged(Lcom/lge/gallery/util/SortingOrderManager$SortEvent;II)V

    .line 136
    return-void

    .line 134
    .end local v1    # "prev":I
    :cond_d
    const/4 v1, 0x0

    goto :goto_7
.end method

.method public getSortingOrder()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->currentSortingOrder:I

    return v0
.end method

.method public register()V
    .registers 3

    .prologue
    .line 79
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-nez v0, :cond_16

    .line 80
    new-instance v0, Lcom/lge/gallery/util/SortingOrderManager$1;

    invoke-direct {v0, p0}, Lcom/lge/gallery/util/SortingOrderManager$1;-><init>(Lcom/lge/gallery/util/SortingOrderManager;)V

    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 98
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 100
    :cond_16
    return-void
.end method

.method public registerObserver(Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;)V
    .registers 4
    .param p1, "observer"    # Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mObserverList:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    return-void
.end method

.method public unregister()V
    .registers 3

    .prologue
    .line 103
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    if-eqz v0, :cond_12

    .line 104
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mPreference:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 107
    :cond_12
    return-void
.end method

.method public unregisterObserver(Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;)V
    .registers 3
    .param p1, "observer"    # Lcom/lge/gallery/util/SortingOrderManager$SortingOrderObserver;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/lge/gallery/util/SortingOrderManager;->mObserverList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method
