package com.projybyraservletmvc.model;


//Usamos esta classe apenas para dataload, pseudonimizacao e anonimizacao
public class Endereco {

    // ATRIBUTOS
    private int idEndereco;     //PK
    private int idIndustria;    //FK
    private String estado;
    private String cidade;
    private String cep;
    private String bairro;
    private String rua;

    // CONSTRUTORES
    public Endereco() {}

    public Endereco(int idEndereco, int idIndustria, String estado, String cidade, String cep, String bairro, String rua) {
        this.idEndereco = idEndereco;
        this.idIndustria = idIndustria;
        this.estado = estado;
        this.cidade = cidade;
        this.cep = cep;
        this.bairro = bairro;
        this.rua = rua;
    }


    //GETTERS E SETTERS

    public int getIdEndereco() {return idEndereco;}
    public void setIdEndereco(int idEndereco) {this.idEndereco = idEndereco;}

    public int getIdIndustria() {return idIndustria;}
    public void setIdIndustria(int idIndustria) {this.idIndustria = idIndustria;}

    public String getEstado() {return estado;}
    public void setEstado(String estado) {this.estado = estado;}

    public String getCidade() {return cidade;}
    public void setCidade(String cidade) {this.cidade = cidade;}

    public String getCep() {return cep;}
    public void setCep(String cep) {this.cep = cep;}

    public String getBairro() {return bairro;}
    public void setBairro(String bairro) {this.bairro = bairro;}

    public String getRua() {return rua;}

    public void setRua(String rua) {this.rua = rua;}

    @Override
    public String toString() {
        return "Endereco{" +
                "\tidEndereco=" + idEndereco +
                ",\t idIndustria=" + idIndustria +
                ",\t estado='" + estado + '\'' +
                ",\t cidade='" + cidade + '\'' +
                ",\t cep='" + cep + '\'' +
                ",\t bairro='" + bairro + '\'' +
                ",\t rua='" + rua + '\'' +
                "}\n";
    }
}