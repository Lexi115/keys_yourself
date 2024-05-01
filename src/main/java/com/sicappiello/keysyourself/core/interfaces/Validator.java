package com.sicappiello.keysyourself.core.interfaces;
import java.util.List;

public interface Validator<T> {

    boolean validate(T entity, List<String> errors);

}
