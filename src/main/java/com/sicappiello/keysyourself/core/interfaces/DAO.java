package com.sicappiello.keysyourself.core.interfaces;

import com.sicappiello.keysyourself.core.database.Database;

import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;

public interface DAO<T> {

    T getById(long id);

    List<T> getAll();

    int save(T entity);

    int update(T entity);

    int saveOrUpdate(T entity);

    int delete(T entity);

    int delete(long id);

    List<T> fetch(ResultSet rs) throws SQLException;
}
