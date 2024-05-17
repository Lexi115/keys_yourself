package com.sicappiello.keysyourself.models.validators;

import com.sicappiello.keysyourself.core.enums.Regex;
import com.sicappiello.keysyourself.core.interfaces.Validator;
import com.sicappiello.keysyourself.models.beans.Game;
import com.sicappiello.keysyourself.util.Functions;

import java.util.ArrayList;
import java.util.List;

public abstract class GameValidator implements Validator<Game> {

    @Override
    public boolean validate(Game entity,List<String> errors) {

        if (!Regex.matches(Regex.GAME_NAME, entity.getName())) {
            errors.add("Nome non valido");
        }

        if (!Regex.matches(Regex.GAME_PRICE, Double.toString(entity.getPrice()))) {
            errors.add("Prezzo non valido");
        }


        if (!Regex.matches(Regex.GAME_DESCRIPTION, entity.getDescription())) {
            errors.add("Descrizione non valida");
        }

        if (!Regex.matches(Regex.GAME_PRODUCER, entity.getProducer())) {
            errors.add("Produttore non valido");
        }

        return errors.isEmpty();
    }
}
