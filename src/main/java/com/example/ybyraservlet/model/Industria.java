package com.example.ybyraservlet.model;

public class Industria {
    //ATRIBUTOS
    private int idIndustria;
    private String nome;
    private String email;
    private String cnpj;
    private String senha;

    //CONSTRUTOR
    public Industria(String nome, String cnpj, String email, String senha) {
        this.nome = nome;
        this.cnpj = cnpj;
        this.email = email;
        this.senha = senha;
    }

    public Industria(int idIndustria, String nome, String cnpj, String email, String senha) {
        this.nome = nome;
        this.cnpj = cnpj;
        this.email = email;
        this.senha = senha;
        this.idIndustria = idIndustria;
    }
    public Industria() {

    }
    public Industria(String nome) {
        this.nome = nome;}


    // GETTERS E SETTERS
    public int getIdIndustria() {
        return idIndustria;
    }
    public void setIdIndustria(int idIndustria) {
        this.idIndustria = idIndustria;
    }

    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getCnpj() {
        return cnpj;
    }
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }

    //TOSTRING
    @Override
    public String toString() {
        return "Industria{" +
                "\t idIndustria=" + idIndustria +
                ",\t nome='" + nome + '\'' +
                ",\t email='" + email + '\'' +
                ",\t cnpj='" + cnpj + '\'' +
                ",\t senha='" + senha + '\'' +
                "}\n";
    }

    // METODOS DE VALIDAÇÃO

    public boolean validarSenha(){
        String senha = getSenha();
        // Senha deve ter no mínimo 8 caracteres e pelo menos 1 número
        return senha.matches("^(?=.*\\d).{8,}$");
    }

    public boolean validarEmail(){
        String email = getEmail();
        // Formato básico de email
        return email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
    }

    public boolean validarCnpj(){
        String cnpj = getCnpj();
        String cnpjLimpo = cnpj.replaceAll("\\D", "");
        // CNPJ deve ter exatamente 14 dígitos
        return cnpjLimpo.matches("^\\d{14}$");
    }
}