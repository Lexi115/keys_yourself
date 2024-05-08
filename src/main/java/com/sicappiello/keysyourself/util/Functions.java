package com.sicappiello.keysyourself.util;

import com.google.common.hash.Hashing;
import com.sicappiello.keysyourself.core.database.Database;
import com.sicappiello.keysyourself.models.dao.UserDAO;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import com.sicappiello.keysyourself.models.beans.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Functions {
    public static Database getContextDatabase(HttpServlet servlet) {
        Object obj = servlet.getServletContext().getAttribute("db");
        return obj == null ? null : (Database) obj;
    }

    public static String hash(String input) {
        return Hashing.sha256()
                .hashString(input, StandardCharsets.UTF_8)
                .toString();
    }

    public static boolean passwordVerify(String password, User user) {
        String hashedPassword = hash(password);
        return hashedPassword.equals(user.getPassword());
    }

    public static String sendAuthenticationToken(HttpServletResponse response, User user) {
        String token = hash(user.getEmail() + user.getPassword());
        Cookie cookie = new Cookie("auth_token", token);
        cookie.setSecure(true); // solo HTTPS
        cookie.setMaxAge(604800); // 7 giorni
        cookie.setPath("/");
        response.addCookie(cookie);
        return Functions.hash(token);
    }

    public static Cookie getCookie(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie;
                }
            }
        }

        return null;
    }

    public static String getFullURL(HttpServletRequest request) {
        // Ottieni URL (senza parametri GET)
        StringBuilder fullURL = new StringBuilder(request.getRequestURL().toString());

        // Ottieni parametri GET
        String queryString = request.getQueryString();

        if (queryString != null && !queryString.isEmpty()) {
            queryString = URLEncoder.encode(queryString, StandardCharsets.UTF_8);

            // Combinali nell'URL completo
            fullURL.append('?').append(queryString);
        }

        return fullURL.toString();
    }
}
