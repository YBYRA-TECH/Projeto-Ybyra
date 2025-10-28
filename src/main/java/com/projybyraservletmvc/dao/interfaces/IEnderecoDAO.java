package com.projybyraservletmvc.dao.interfaces;

import java.sql.SQLException;

public interface IEnderecoDAO<T>{

    /**
     *
     * @param parametro Recebe o ID do endereço a ser deletado
     * @return Retorna 1 caso a exclusão for bem sucedida, 0 caso não exclua e -1 caso ocorra um erro
     * @exception SQLException Exceção tratada caso ocorra um erro
     */

    int deletar(int parametro);

}
