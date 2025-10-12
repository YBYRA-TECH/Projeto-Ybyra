package com.example.ybyraservlet.model;


public class Telefone {

    //ATRIBUTOS
    private int idTelefone;
    private final String numero;
    private String tipo;
    private int idUsuario;

    //CONSTRUTOR

    public Telefone(int idTel, String numero, String tipo, int idUser){
        this.idTelefone = idTel;
        this.numero = numero;
        this.tipo = tipo;
        this.idUsuario = idUser;
    }

    public Telefone(String numero, String tipo, int idUser){
        this.numero = numero;
        this.tipo = tipo;
        this.idUsuario = idUser;
    }

    //GETTERS E SETTERS
    public int getIdTelefone(){return idTelefone;}
    public void setIdTelefone(int telefone){this.idTelefone = telefone;}

    public String getNumero(){
        return numero;
    }
    public void setNumero(String numero){
        this.tipo = numero;
    }

    public String getTipo(){
        return tipo;
    }
    public void setTipo(String tipo){
        this.tipo = tipo;
    }

    public int getIdUsuario(){
        return idUsuario;
    }
    public void setIdUsuario(int id){
        this.idUsuario = id;
    }

    //TO STRING

    @Override
    public String toString() {
        return "Usuario{" +
                "id=" + idTelefone +
                ", Número='" + numero + '\'' +
                ", Tipo='" + tipo + '\'' +
                ", ID Usuário=" + idUsuario + '\'' +
                '}';
    }


}
