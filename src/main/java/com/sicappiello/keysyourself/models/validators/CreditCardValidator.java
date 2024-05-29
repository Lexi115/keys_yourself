package com.sicappiello.keysyourself.models.validators;

import com.sicappiello.keysyourself.core.enums.Regex;
import com.sicappiello.keysyourself.core.interfaces.Validator;
import com.sicappiello.keysyourself.models.beans.CreditCard;

import java.util.List;

public class CreditCardValidator implements Validator<CreditCard> {

    @Override
    public boolean validate(CreditCard entity, List<String> errors) {
        errors.clear();

        if (!Regex.matches(Regex.CREDIT_CARD_NUMBER, entity.getCardNumber())) {
            errors.add("Numero carta di credito non valido");
        }

        if (entity.isExpired()) {
            errors.add("Carta di credito scaduta");
        }

        if (!Regex.matches(Regex.CREDIT_CARD_CVV, entity.getCvv())) {
            errors.add("CVV carta di credito non valido");
        }

        return errors.isEmpty();
    }

}
