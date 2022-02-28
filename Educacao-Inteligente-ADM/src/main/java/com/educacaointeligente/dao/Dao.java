package com.educacaointeligente.dao;

import java.util.List;

public interface Dao<T> {
	
      T get(int id);
      
      List<T>getAll();
      
      List<T>getAllWhere(int id);
      
      List<T> getNome(String objeto);
      
      void save(T objeto);
      
      void update(T objeto);
      
      void delete (T objeto);
}