.class public Lcom/lge/gallery/vr/wallpaper/UriCover;
.super Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;
.source "UriCover.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "UriCover"


# instance fields
.field private final mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/lge/gallery/vr/wallpaper/AbstractWallpaperCover;-><init>(Landroid/content/Context;)V

    .line 30
    iput-object p2, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mUri:Landroid/net/Uri;

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/lge/gallery/vr/wallpaper/UriCover;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 26
    return-void
.end method


# virtual methods
.method public getUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAsset()Z
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public isObservable()Z
    .registers 2

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method

.method public isValid()Z
    .registers 12

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 45
    const/4 v6, 0x0

    .line 47
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_3
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mUri:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "count(*)"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 49
    if-eqz v6, :cond_22

    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_38

    .line 50
    :cond_22
    const-string v0, "UriCover"

    const-string v1, "No such item."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_29} :catch_52
    .catchall {:try_start_3 .. :try_end_29} :catchall_62

    .line 57
    if-eqz v6, :cond_2e

    .line 59
    :try_start_2b
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2e} :catch_2f

    .line 62
    :cond_2e
    :goto_2e
    return v10

    .line 60
    :catch_2f
    move-exception v8

    .line 61
    .local v8, "t":Ljava/lang/Throwable;
    const-string v0, "UriCover"

    const-string v1, "close fail"

    invoke-static {v0, v1, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e

    .line 53
    .end local v8    # "t":Ljava/lang/Throwable;
    :cond_38
    const/4 v0, 0x0

    :try_start_39
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_3c} :catch_52
    .catchall {:try_start_39 .. :try_end_3c} :catchall_62

    move-result v0

    if-lez v0, :cond_47

    move v0, v9

    .line 57
    :goto_40
    if-eqz v6, :cond_45

    .line 59
    :try_start_42
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_45} :catch_49

    :cond_45
    :goto_45
    move v10, v0

    .line 62
    goto :goto_2e

    :cond_47
    move v0, v10

    .line 53
    goto :goto_40

    .line 60
    :catch_49
    move-exception v8

    .line 61
    .restart local v8    # "t":Ljava/lang/Throwable;
    const-string v1, "UriCover"

    const-string v2, "close fail"

    invoke-static {v1, v2, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_45

    .line 54
    .end local v8    # "t":Ljava/lang/Throwable;
    :catch_52
    move-exception v7

    .line 57
    .local v7, "e":Ljava/lang/Exception;
    if-eqz v6, :cond_2e

    .line 59
    :try_start_55
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_58} :catch_59

    goto :goto_2e

    .line 60
    :catch_59
    move-exception v8

    .line 61
    .restart local v8    # "t":Ljava/lang/Throwable;
    const-string v0, "UriCover"

    const-string v1, "close fail"

    invoke-static {v0, v1, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e

    .line 57
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "t":Ljava/lang/Throwable;
    :catchall_62
    move-exception v0

    if-eqz v6, :cond_68

    .line 59
    :try_start_65
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_68
    .catch Ljava/lang/Throwable; {:try_start_65 .. :try_end_68} :catch_69

    .line 62
    :cond_68
    :goto_68
    throw v0

    .line 60
    :catch_69
    move-exception v8

    .line 61
    .restart local v8    # "t":Ljava/lang/Throwable;
    const-string v1, "UriCover"

    const-string v2, "close fail"

    invoke-static {v1, v2, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_68
.end method

.method protected openInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/lge/gallery/vr/wallpaper/UriCover;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
