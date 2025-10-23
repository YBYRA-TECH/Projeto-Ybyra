package com.projybyraservletmvc.dao.interfaces;

import java.sql.SQLException;
import java.util.List;

public interface GenericDAO<T> {

    /**
     * Insere um novo registro da respectiva tabela
     *
     * @param object Recebe um objeto para ser inserido no banco de dados
     * @return true se a inserção for bem-sucedida, falso caso contrário
     * @throws  SQLException Lança esta exceção caso ocorra um erro
     *
     */
    boolean inserir(T object);


    /**
     * Busca todos os registro da respectiva tabela no banco
     *
     * @return Retorna uma lista de objetos da respectiva tabela
     * @throws SQLException lança esta exceção caso ocorra um erro
     *
     */
    List<T> buscar();


    /**
     *
     * @param object Recebe um objeto para ser atualizado no banco de dados
     * @return true se a atualização for bem-sucedida, false caso contrário
     * @throws SQLException lança esta exceção caso ocorra um erro
     */
    boolean atualizar(T object);

}
