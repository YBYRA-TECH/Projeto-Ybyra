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
    private Date dataValidade;
    private int idIndustria;
    private int tempoTrabalho;

    //CONSTRUTOR

    public Usuario(int idUsuario, String email, String cpf, String nome, LocalDate dataCadastro,
                   LocalDate dataNascimento, Date dataValidade, int idIndustria, int tempoTrabalho) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.cpf = cpf;
        this.nome = nome;
        this.dataCadastro = dataCadastro;
        this.dataNascimento = dataNascimento;
        this.dataValidade = dataValidade;
        this.idIndustria = idIndustria;
        this.tempoTrabalho = tempoTrabalho;
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


    public Usuario(int idUsuario, String nome) {
        this.nome = nome;
        this.idUsuario = idUsuario;
    }

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

    public Date getDataValidade() {
        return dataValidade;
    }
    public void setDataValidade(Date dataValidade) {
        this.dataValidade = dataValidade;
    }

    public int getIdIndustria() {
        return idIndustria;
    }
    public void setIdIndustria(int idIndustria) {
        this.idIndustria = idIndustria;
    }

    public int getTempoTrabalho() {
        return tempoTrabalho;
    }
    public void setTempoTrabalho(int tempoTrabalho) {
        this.tempoTrabalho = tempoTrabalho;
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
                ",\tdataValidade=" + dataValidade +
                ",\tidIndustria=" + idIndustria +
                ",\ttempoTrabalho=" + tempoTrabalho +
                "}\n";
    }

}
