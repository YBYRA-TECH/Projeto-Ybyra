package com.projybyraservletmvc.model;

public class Lote {
    private int id_lote;
    private String descricao;
    private String responsavel;
    private int producao;
    private int planejado;
    private int problemas;
    private int id_industria;
    private int id_relatorio;
    private double eficiencia;
    private String turno;
    private String area;


    //Getters e Setters


    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getPlanejado() {
        return planejado;
    }

    public void setPlanejado(int planejado) {
        this.planejado = planejado;
    }

    public double getEficiencia() {
        return eficiencia;
    }

    public void setEficiencia(double eficiencia) {
        this.eficiencia = eficiencia;
    }

    public int getId_industria() {
        return id_industria;
    }

    public void setId_industria(int id_industria) {
        this.id_industria = id_industria;
    }

    public int getId_relatorio() {
        return id_relatorio;
    }

    public void setId_relatorio(int id_relatorio) {
        this.id_relatorio = id_relatorio;
    }

    public int getProblemas() {
        return problemas;
    }
    public void setProblemas(int problemas) {
        this.problemas = problemas;
    }

    public void setProducao(int producao) {
        this.producao = producao;
    }

    public int getProducao() {
        return producao;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }


    //Construtor

    public Lote(String descricao, String responsavel, int producao, int planejado, int problemas,
               int id_industria, int id_relatorio){

        this.descricao = descricao;
        this.responsavel = responsavel;
        this.id_industria = id_industria;
        this.id_relatorio = id_relatorio;
        this.planejado = planejado;
        this.producao = producao;
        this.problemas = problemas;

    }

    public Lote(int id_lote,String descricao,String turno, String area,String responsavel, double eficiencia){
        this.id_lote = id_lote;
        this.descricao = descricao;
        this.eficiencia = eficiencia;
        this.turno = turno;
        this.area = area;
        this.responsavel = responsavel;


    }

    public Lote(String descricao,String responsavel, int producao,int planejado, int problemas, int id_industria,int id_relatorio){
        this.id_relatorio = id_relatorio;
        this.descricao = descricao;
        this.producao = producao;
        this.planejado = planejado;
        this.responsavel = responsavel;
        this.problemas = problemas;
        this.id_industria = id_industria;

    }

    public Lote(){}
}
