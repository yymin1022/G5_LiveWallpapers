.class public Lcom/lge/gallery/vr/viewer/shader/TileProgram;
.super Lcom/lge/gallery/vr/viewer/shader/Program;
.source "TileProgram.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/lge/gallery/vr/viewer/shader/Program;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreateFragmentShader()Lcom/lge/gallery/vr/viewer/shader/FragmentShader;
    .registers 2

    .prologue
    .line 20
    new-instance v0, Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;

    invoke-direct {v0}, Lcom/lge/gallery/vr/viewer/shader/DefaultFragmentShader;-><init>()V

    return-object v0
.end method

.method protected onCreateVertexShader()Lcom/lge/gallery/vr/viewer/shader/VertexShader;
    .registers 3

    .prologue
    .line 15
    new-instance v0, Lcom/lge/gallery/vr/viewer/shader/DefaultVertexShader;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lge/gallery/vr/viewer/shader/DefaultVertexShader;-><init>(Z)V

    return-object v0
.end method
