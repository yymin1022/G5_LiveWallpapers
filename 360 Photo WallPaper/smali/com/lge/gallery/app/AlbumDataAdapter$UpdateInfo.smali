.class Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;
.super Ljava/lang/Object;
.source "AlbumDataAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lge/gallery/app/AlbumDataAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdateInfo"
.end annotation


# instance fields
.field public items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/lge/gallery/data/core/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field public reloadCount:I

.field public reloadStart:I

.field public size:I

.field public version:J


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lge/gallery/app/AlbumDataAdapter$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/lge/gallery/app/AlbumDataAdapter$1;

    .prologue
    .line 293
    invoke-direct {p0}, Lcom/lge/gallery/app/AlbumDataAdapter$UpdateInfo;-><init>()V

    return-void
.end method
