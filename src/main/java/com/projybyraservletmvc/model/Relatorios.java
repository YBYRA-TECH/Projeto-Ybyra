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
    private int id_industria;
    private String nome;
    private String turno;
    private String responsavel;



    //CONSTRUTORES
    public Relatorios(){};

    public Relatorios(int idRelatorios, Date dataCriacao, String pdfDocumento, int idUsuario) {
        this.idRelatorios = idRelatorios;
        this.dataCriacao = dataCriacao;
        this.pdfDocumento = pdfDocumento;
        this.idUsuario = idUsuario;
    }

    public Relatorios(String nome,String area, int idUsuario,String pdfDocumento, String descricao, String turno, String responsavel, int id_indsutria) {
        this.pdfDocumento = pdfDocumento;
        this.idUsuario = idUsuario;
        this.descricao = descricao;
        this.nome = nome;
        this.area = area;
        this.turno = turno;
        this.responsavel = responsavel;
        this.id_industria = id_indsutria;
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

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public String getTurno() {
        return turno;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public int getId_industria() {
        return id_industria;
    }

    public void setId_industria(int id_industria) {
        this.id_industria = id_industria;
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
