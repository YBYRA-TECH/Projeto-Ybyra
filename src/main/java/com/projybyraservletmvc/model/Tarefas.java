package com.projybyraservletmvc.model;

import java.time.LocalDate;

public class Tarefas {

    private int id_tarefa;
    private String prioridade;
    private String nome;
    private String responsavel;
    private String descricao;
    private LocalDate prazo;
    private int id_usuario;

    // Construtores

    public Tarefas() {}

    public Tarefas(String descricao, String nome, LocalDate prazo, String prioridade, String responsavel, int id_usuario) {
        this.descricao = descricao;
        this.nome = nome;
        this.prazo = prazo;
        this.prioridade = prioridade;
        this.responsavel = responsavel;
        this.id_usuario = id_usuario;
    }

    public Tarefas(String prioridade, String nome, String responsavel, String descricao, LocalDate prazo, int id_tarefa, int id_usuario) {
        this.descricao = descricao;
        this.nome = nome;
        this.prazo = prazo;
        this.prioridade = prioridade;
        this.responsavel = responsavel;
        this.id_tarefa = id_tarefa;
        this.id_usuario = id_usuario;
    }

    // Getters e Setters

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getPrazo() {
        return prazo;
    }

    public void setPrazo(LocalDate prazo) {
        this.prazo = prazo;
    }

    public String getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(String prioridade) {
        this.prioridade = prioridade;
    }

    public String getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(String responsavel) {
        this.responsavel = responsavel;
    }

    public int getId_tarefa() {
        return id_tarefa;
    }

    public void setId_tarefa(int id_tarefa) {
        this.id_tarefa = id_tarefa;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    // ToString

    @Override
    public String toString() {
        return "Tarefas{" +
                "id_tarefa=" + id_tarefa +
                ", id_usuario=" + id_usuario +
                ", prioridade='" + prioridade + '\'' +
                ", nome='" + nome + '\'' +
                ", responsavel='" + responsavel + '\'' +
                ", descricao='" + descricao + '\'' +
                ", prazo=" + prazo +
                '}';
    }
}