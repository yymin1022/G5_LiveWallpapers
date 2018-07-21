.class public Landroid/support/v7/widget/AppCompatPopupWindow;
.super Landroid/widget/PopupWindow;
.source "AppCompatPopupWindow.java"


# static fields
.field private static final COMPAT_OVERLAP_ANCHOR:Z

.field private static final TAG:Ljava/lang/String; = "AppCompatPopupWindow"


# instance fields
.field private mOverlapAnchor:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    return-void

    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->PopupWindow:[I

    invoke-static {p1, p2, v1, p3, v2}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object v0

    .line 48
    .local v0, "a":Landroid/support/v7/widget/TintTypedArray;
    sget v1, Landroid/support/v7/appcompat/R$styleable;->PopupWindow_overlapAnchor:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 49
    sget v1, Landroid/support/v7/appcompat/R$styleable;->PopupWindow_overlapAnchor:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/TintTypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatPopupWindow;->setSupportOverlapAnchor(Z)V

    .line 52
    :cond_1b
    sget v1, Landroid/support/v7/appcompat/R$styleable;->PopupWindow_android_popupBackground:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatPopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 53
    invoke-virtual {v0}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    .line 55
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-ge v1, v2, :cond_30

    .line 58
    invoke-static {p0}, Landroid/support/v7/widget/AppCompatPopupWindow;->wrapOnScrollChangedListener(Landroid/widget/PopupWindow;)V

    .line 60
    :cond_30
    return-void
.end method

.method private static wrapOnScrollChangedListener(Landroid/widget/PopupWindow;)V
    .registers 7
    .param p0, "popup"    # Landroid/widget/PopupWindow;

    .prologue
    .line 92
    :try_start_0
    const-class v4, Landroid/widget/PopupWindow;

    const-string v5, "mAnchor"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 93
    .local v1, "fieldAnchor":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 95
    const-class v4, Landroid/widget/PopupWindow;

    const-string v5, "mOnScrollChangedListener"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 97
    .local v2, "fieldListener":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 99
    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/ViewTreeObserver$OnScrollChangedListener;

    .line 104
    .local v3, "originalListener":Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    new-instance v4, Landroid/support/v7/widget/AppCompatPopupWindow$1;

    invoke-direct {v4, v1, p0, v3}, Landroid/support/v7/widget/AppCompatPopupWindow$1;-><init>(Ljava/lang/reflect/Field;Landroid/widget/PopupWindow;Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    .line 122
    .end local v1    # "fieldAnchor":Ljava/lang/reflect/Field;
    .end local v2    # "fieldListener":Ljava/lang/reflect/Field;
    .end local v3    # "originalListener":Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    :goto_26
    return-void

    .line 119
    :catch_27
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "AppCompatPopupWindow"

    const-string v5, "Exception while installing workaround OnScrollChangedListener"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26
.end method


# virtual methods
.method public getSupportOverlapAnchor()Z
    .registers 2

    .prologue
    .line 139
    sget-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    if-eqz v0, :cond_7

    .line 140
    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatPopupWindow;->mOverlapAnchor:Z

    .line 142
    :goto_6
    return v0

    :cond_7
    invoke-static {p0}, Landroid/support/v4/widget/PopupWindowCompat;->getOverlapAnchor(Landroid/widget/PopupWindow;)Z

    move-result v0

    goto :goto_6
.end method

.method public setSupportOverlapAnchor(Z)V
    .registers 3
    .param p1, "overlapAnchor"    # Z

    .prologue
    .line 128
    sget-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    if-eqz v0, :cond_7

    .line 129
    iput-boolean p1, p0, Landroid/support/v7/widget/AppCompatPopupWindow;->mOverlapAnchor:Z

    .line 133
    :goto_6
    return-void

    .line 131
    :cond_7
    invoke-static {p0, p1}, Landroid/support/v4/widget/PopupWindowCompat;->setOverlapAnchor(Landroid/widget/PopupWindow;Z)V

    goto :goto_6
.end method

.method public showAsDropDown(Landroid/view/View;II)V
    .registers 5
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I

    .prologue
    .line 64
    sget-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatPopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_d

    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 68
    :cond_d
    invoke-super {p0, p1, p2, p3}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 69
    return-void
.end method

.method public showAsDropDown(Landroid/view/View;III)V
    .registers 6
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I
    .param p4, "gravity"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 74
    sget-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatPopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_d

    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 78
    :cond_d
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 79
    return-void
.end method

.method public update(Landroid/view/View;IIII)V
    .registers 7
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 83
    sget-boolean v0, Landroid/support/v7/widget/AppCompatPopupWindow;->COMPAT_OVERLAP_ANCHOR:Z

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Landroid/support/v7/widget/AppCompatPopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_d

    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 87
    :cond_d
    invoke-super/range {p0 .. p5}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 88
    return-void
.end method
