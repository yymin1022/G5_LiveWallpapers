.class public Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;
.super Ljava/lang/Object;
.source "PhotoSphereMetadataExtractor.java"

# interfaces
.implements Lcom/lge/gallery/util/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/lge/gallery/util/ThreadPool$Job",
        "<",
        "Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_METADATA:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;


# instance fields
.field protected final mContentUri:Landroid/net/Uri;

.field protected final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    new-instance v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    invoke-direct {v0}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;-><init>()V

    sput-object v0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->DEFAULT_METADATA:Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->mContext:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->mContentUri:Landroid/net/Uri;

    .line 25
    return-void
.end method


# virtual methods
.method public run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;
    .registers 4
    .param p1, "jc"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->mContentUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;->getMetadata(Landroid/content/Context;Landroid/net/Uri;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/lge/gallery/util/ThreadPool$JobContext;

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/lge/gallery/data/core/vr/PhotoSphereMetadataExtractor;->run(Lcom/lge/gallery/util/ThreadPool$JobContext;)Lcom/lge/gallery/data/core/vr/PhotoSphereMetadata;

    move-result-object v0

    return-object v0
.end method
