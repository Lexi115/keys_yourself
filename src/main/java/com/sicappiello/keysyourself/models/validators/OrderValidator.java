package com.sicappiello.keysyourself.models.validators;

import com.sicappiello.keysyourself.core.enums.Regex;
import com.sicappiello.keysyourself.core.interfaces.Validator;
import com.sicappiello.keysyourself.models.beans.Order;

import java.util.List;

public class OrderValidator implements Validator<Order> {

    @Override
    public boolean validate(Order entity, List<String> errors) {
        errors.clear();

        if (!Regex.matches(Regex.ORDER_FIRST_NAME, entity.getFirstName())) {
            errors.add("Nome non valido");
        }

        if (!Regex.matches(Regex.ORDER_LAST_NAME, entity.getLastName())) {
            errors.add("Cognome non valido");
        }

        if (!Regex.matches(Regex.ORDER_EMAIL, entity.getEmail())) {
            errors.add("E-mail non valida");
        }

        if (!Regex.matches(Regex.ORDER_PHONE_NUMBER, entity.getPhoneNumber())) {
            errors.add("Numero di telefono non valido");
        }

        if (!Regex.matches(Regex.ORDER_ADDRESS, entity.getAddress())) {
            errors.add("Indirizzo non valido");
        }

        if (!Regex.matches(Regex.ORDER_CITY, entity.getCity())) {
            errors.add("Città non valida");
        }

        if (!Regex.matches(Regex.ORDER_STATE, entity.getState())) {
            errors.add("Regione non valida");
        }

        if (!Regex.matches(Regex.ORDER_COUNTRY, entity.getCountry())) {
            errors.add("Paese non valido");
        }

        if (!Regex.matches(Regex.ORDER_ZIP, entity.getZip())){
            errors.add("Codice postale non valido");
        }

        return errors.isEmpty();
    }

}
