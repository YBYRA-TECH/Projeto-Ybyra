package com.projybyraservletmvc.model;

import java.sql.Date;

public class Relatorios {

    //ATRIBUTOS
    private int idRelatorios;
    private Date dataCriacao;
    private String pdfDocumento;
    private int idUsuario;


    //CONSTRUTOR

    public Relatorios(int idRelatorios, Date dataCriacao, String pdfDocumento, int idUsuario) {
        this.idRelatorios = idRelatorios;
        this.dataCriacao = dataCriacao;
        this.pdfDocumento = pdfDocumento;
        this.idUsuario = idUsuario;
    }

    // GETTERS E SETTERS
    public int getIdRelatorios() {
        return idRelatorios;
    }
    public void setIdRelatorios(int idRelatorios) {
        this.idRelatorios = idRelatorios;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }
    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public String getPdfDocumento() {
        return pdfDocumento;
    }
    public void setPdfDocumento(String pdfDocumento) {
        this.pdfDocumento = pdfDocumento;
    }

    public int getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    //TOSTRING
    @Override
    public String toString() {
        return "Relatorios{" +
                "idRelatorios=" + idRelatorios +
                ", dataCriacao=" + dataCriacao +
                ", pdfDocumento='" + pdfDocumento + '\'' +
                ", idUsuario=" + idUsuario +
                '}';
    }
}
