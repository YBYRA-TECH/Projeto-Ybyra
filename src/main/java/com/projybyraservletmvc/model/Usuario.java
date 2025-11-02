package com.projybyraservletmvc.model;

import java.sql.Date;
import java.time.LocalDate;

public class Usuario {

    //ATRIBUTOS
    private int idUsuario;
    private String email;
    private String cpf;
    private String nome;
    private String senha;
    private LocalDate dataCadastro;
    private LocalDate dataNascimento;
    private int idIndustria;

    //CONSTRUTOR

    public Usuario(int idUsuario, String email, String cpf, String nome, LocalDate dataCadastro,
                   LocalDate dataNascimento, int idIndustria) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.cpf = cpf;
        this.nome = nome;
        this.dataCadastro = dataCadastro;
        this.dataNascimento = dataNascimento;
        this.idIndustria = idIndustria;
    }

    public Usuario(String email, String cpf, String nome,
                   LocalDate dataNascimento, String senha, int idIndustria) {
        this.email = email;
        this.cpf = cpf;
        this.nome = nome;
        this.senha = senha;
        this.dataNascimento = dataNascimento;
        this.idIndustria = idIndustria;
    }

    public Usuario(String email, String nome, String senha) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }


    public Usuario(int idUsuario, String nome) {
        this.nome = nome;
        this.idUsuario = idUsuario;
    }

    public Usuario() {}

    // GETTERS E SETTERS
    public int getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getDataCadastro() {
        return dataCadastro;
    }
    public void setDataCadastro(LocalDate dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }
    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public int getIdIndustria() {
        return idIndustria;
    }
    public void setIdIndustria(int idIndustria) {
        this.idIndustria = idIndustria;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    public String getSenha() {
        return senha;
    }

    //TOSTRING
    @Override
    public String toString() {
        return "Usuario{" +
                "\tidUsuario=" + idUsuario +
                ",\temail='" + email + '\'' +
                ",\tcpf='" + cpf + '\'' +
                ",\tnome='" + nome + '\'' +
                ",\tdataCadastro=" + dataCadastro +
                ",\tdataNascimento=" + dataNascimento +
                ",\tidIndustria=" + idIndustria +
                "}\n";
    }

}
