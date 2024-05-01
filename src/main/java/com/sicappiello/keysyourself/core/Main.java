package com.sicappiello.keysyourself.core;

import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.beans.User;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import com.sicappiello.keysyourself.util.Functions;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.*;

import java.io.IOException;

public class Main extends HttpServlet {

    @Override
    public void init(ServletConfig config) {
        System.out.println("Main Servlet inizializzata");
    }

    @Override
    public void destroy() {
        System.out.println("Main Servlet distrutta");
    }
}
