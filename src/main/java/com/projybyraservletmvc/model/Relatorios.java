package com.projybyraservletmvc.model;

import java.sql.Date;

public class Relatorios {

    //ATRIBUTOS
    private int idRelatorios;
    private Date dataCriacao;
    private String pdfDocumento;
    private String area;
    private String descricao;
    private int idUsuario;
    private String nome;


    //CONSTRUTOR
    public Relatorios(){};

    public Relatorios(int idRelatorios, Date dataCriacao, String pdfDocumento, String area) {
        this.idRelatorios = idRelatorios;
        this.dataCriacao = dataCriacao;
        this.pdfDocumento = pdfDocumento;
        this.area = area;
    }
    public Relatorios(int idRelatorios, Date dataCriacao, String pdfDocumento, int idUsuario, String descricao) {
        this.idRelatorios = idRelatorios;
        this.dataCriacao = dataCriacao;
        this.pdfDocumento = pdfDocumento;
        this.idUsuario = idUsuario;
        this.descricao = descricao;
    }
    public Relatorios(String nome,String area, int idUsuario,String pdfDocumento, String descricao) {
        this.pdfDocumento = pdfDocumento;
        this.idUsuario = idUsuario;
        this.descricao = descricao;
        this.nome = nome;
        this.area = area;
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    //TOSTRING
    @Override
    public String toString() {
        return "Relatorios{" +
                "\tidRelatorios=" + idRelatorios +
                ",\t, dataCriacao=" + dataCriacao +
                ",\t, pdfDocumento='" + pdfDocumento + '\'' +
                ",\t idUsuario=" + idUsuario +
                "}\n";
    }
}
