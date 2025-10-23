package com.projybyraservletmvc.dao.interfaces;

import com.projybyraservletmvc.model.Industria;

import java.sql.SQLException;

public interface IIndustriaDAO<T>{

    /**
     *
     * @param parametro Recebe o id da indústria a ser deletada
     * @return Retorna 1 caso a exclusão for bem sucedida, 0 caso não exclua e -1 caso ocorra uma exceção
     * @exception SQLException Exceção tratada caso ocorra um erro
     */
    int deletar(int parametro);

    /**
     *
     * @param parametro1 Recebe o email da indústria
     * @param parametro2 Recebe a senha da indústria
     * @return Retorna o login da indústria
     * @exception SQLException Exceção tratada caso ocorra um erro
     */
    Industria login(String parametro1, String parametro2);

}
