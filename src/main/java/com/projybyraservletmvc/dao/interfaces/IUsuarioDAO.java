package com.projybyraservletmvc.dao.interfaces;
import java.sql.SQLException;


public interface IUsuarioDAO<T> {
    /**
     * Deleta um usuário no banco conforme o ID
     *
     * @param id Recebe o id de um usuário para ser apagado
     * @return Retorna 1 caso a exclusão for bem-sucedida, 0 caso não exclua e -1 caso ocorra uma exceção
     * @throws SQLException Lança esta exceção caso ocorra um erro
     */
    int deletar(int id);

}