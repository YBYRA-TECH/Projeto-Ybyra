package com.projybyraservletmvc.dao.interfaces;

import java.sql.SQLException;

public interface IRelatoriosDAO<T> {

    /**
     *
     * @param parametro Recebe o ID do relatório a ser deletado
     * @return Retorna 1 caso a exclusão for bem-sucedida, 0 caso não exclua e -1 caso ocorra uma exceção
     * @exception SQLException Exceção tratada caso ocorra um erro
     */
    int deletar(int parametro);


}
