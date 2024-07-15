package com.sicappiello.keysyourself.core.enums;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class Regex {
    // Regex per utente
    public static final String USER_EMAIL = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    public static final String USER_PASSWORD = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%_*#?&])[A-Za-z\\d@$!%_*#?&]{8,100}$";
    public static final String USER_FIRST_NAME = "^.{1,200}$";
    public static final String USER_LAST_NAME = "^.{1,50}$";
    public static final String USER_ADDRESS = "^.{1,100}$";
    public static final String USER_PHONE_NUMBER = "^\\+\\d{2,6}\\s?[\\d\\s]{10,16}$";

    //Regex per giochi
    public static final String GAME_NAME = "^[A-Za-z0-9\\s\\-':,!?.()]{1,150}$";
    public static final String GAME_PRICE = "^\\d{1,10}.\\d{2}$";
    public static final String GAME_DESCRIPTION = "^.{1,2000}$";
    public static final String GAME_PRODUCER = "^.{1,50}$";

    //Regex per generi
    public static final String GAME_ID = "^\\d{1,5}$";

    //Regex per order
    public static final String ORDER_FIRST_NAME = "^.{1,150}$";
    public static final String ORDER_LAST_NAME = "^.{1,50}$";
    public static final String ORDER_EMAIL = "^[a-zA-Z0-9._%+-]{1,160}@[a-zA-Z0-9.-]{1,149}\\.[a-zA-Z]{2,7}$";
    public static final String ORDER_PHONE_NUMBER = "^\\+\\d{2,6}\\s?[\\d\\s]{10,16}$";
    public static final String ORDER_ADDRESS = "^.{1,100}$";
    public static final String ORDER_CITY = "^.{1,100}$";
    public static final String ORDER_STATE = "^.{1,100}$";
    public static final String ORDER_COUNTRY = "^.{1,50}$";
    public static final String ORDER_ZIP = "^\\d{5}$";

    //credit card regex
    public static final String CREDIT_CARD_NUMBER = "^\\d{16}$";
    public static final String CREDIT_CARD_EXPIRATION_DATE = "^(0[1-9]|1[0-2])\\/([0-9]{4})$";
    public static final String CREDIT_CARD_CVV = "^\\d{3}$";


    public static boolean matches(String regex, String input) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }
}
