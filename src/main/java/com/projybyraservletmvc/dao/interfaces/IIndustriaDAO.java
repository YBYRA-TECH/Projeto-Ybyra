package com.projybyraservletmvc.dao.interfaces;

import com.projybyraservletmvc.model.Industria;

import java.sql.SQLException;

public interface IIndustriaDAO<T>{

    /**
     *
     * @param parametro Recebe o id da indústria a ser deletada
     * @return Retorna 1 caso a exclusão for bem sucedida, 0 caso não exclua e -1 caso ocorra uma exceção
     */
    int deletar(int parametro);

    /**
     *
     * @param parametro1 Recebe o email da indústria
     * @param parametro2 Recebe a senha da indústria
     * @return Retorna o login da indústria
     */
    Industria login(String parametro1, String parametro2);


    /**
     * @param parametro Recebe o nome da industria
     * @return Retorna o id da respectiva industria
     */
    int buscarID(String parametro);


    /**
     * @param parametro Recebe o id da industria a ser buscada
     * @return Objeto da industria encontrada
     *
     */
    Industria buscarPorID(int parametro);




}
