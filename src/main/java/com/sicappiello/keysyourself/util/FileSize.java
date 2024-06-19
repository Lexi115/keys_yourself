package com.sicappiello.keysyourself.util;

public abstract class FileSize {
    public static final int MIN = 0;
    public static final int MAX = 1024 * 1024 * 1; // 10 MB
    public static final int MAX_REAL = 1024 * 1024 * 20; // 20 MB
    public static final int REQUEST_MAX = 1024 * 1024 * 20; // 20 MB
    public static final int MAX_MB = MAX / 1024 / 1024;
}
