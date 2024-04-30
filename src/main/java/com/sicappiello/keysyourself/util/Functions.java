package com.sicappiello.keysyourself.util;

import com.sicappiello.keysyourself.core.database.Database;
import jakarta.servlet.http.HttpServlet;

public class Functions {
    public static Database getContextDatabase(HttpServlet servlet) {
        Object obj = servlet.getServletContext().getAttribute("db");
        return obj == null ? null : (Database) obj;
    }
}
