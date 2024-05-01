package com.sicappiello.keysyourself.models.validators;

import com.sicappiello.keysyourself.core.interfaces.Validator;
import com.sicappiello.keysyourself.models.beans.User;

import java.util.ArrayList;
import java.util.List;
import com.sicappiello.keysyourself.core.enums.Regex;

public class UserValidator implements Validator<User> {

    @Override
    public boolean validate(User entity, List<String> errors) {
        // Controlla E-Mail
        if (!Regex.matches(Regex.USER_EMAIL, entity.getEmail())) {
            errors.add("E-Mail non valida");
        }

        // Controlla Password
        if (!Regex.matches(Regex.USER_PASSWORD, entity.getPassword())) {
            errors.add("Password non valida");
        }

        // Controlla nome
        if (!Regex.matches(Regex.USER_FIRST_NAME, entity.getName())) {
            errors.add("Nome non valido");
        }

        // Controlla cognome
        if (!Regex.matches(Regex.USER_LAST_NAME, entity.getSurname())) {
            errors.add("Cognome non valido");
        }

        // Controlla indirizzo
        if (!Regex.matches(Regex.USER_ADDRESS, entity.getAddress())) {
            errors.add("Indirizzo non valido");
        }

        // Controlla numero di telefono
        if (!Regex.matches(Regex.USER_PHONE_NUMBER, entity.getPhoneNumber())) {
            errors.add("Numero di telefono non valido");
        }

        return errors.isEmpty();
    }
}
