package com.projybyraservletmvc.dao.interfaces;

import java.sql.SQLException;

public interface ITelefoneDAO<T> {

    /**
     *
     * @param param Recebe um número como parâmetro para ser deletado
     * @return Retorna 1 caso a exclusão for bem sucedida, 0 caso não exclua e -1 caso ocorra uma exceção
     */
    int deletar(String param);

}
