package com.projybyraservletmvc.dao.interfaces;

import com.projybyraservletmvc.model.Lote;

import java.util.List;

public interface ILoteDAO <T>{

    /**
     *
     * @param parametro ID do lote a ser buscado
     * @return Retorna o lote e seus valores
     */
    Lote buscarPorId(int parametro);


    /**
     *
     * @param parametro ID da indústria a ser buscada
     * @return Retorna uma lista com os valores encontrados
     */
    List<T> buscarPorIndustria(int parametro);


    /**
     *
     * @param parametro ID do relatório a ser buscado
     * @return Retorna uma lista com os valores encontrados
     */
    List<T> buscarPorRelatorio(int parametro);




}
