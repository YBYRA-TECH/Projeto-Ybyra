package com.projybyraservletmvc.model;

public class Industria {
        //ATRIBUTOS
        private int idIndustria;
        private String nome;
        private String endereco;
        private String cnpj;
        private int numeroUsuarios;

        //CONSTRUTOR

        public Industria(int idIndustria, String nome, String endereco, String cnpj, int numeroUsuarios) {
            this.idIndustria = idIndustria;
            this.nome = nome;
            this.endereco = endereco;
            this.cnpj = cnpj;
            this.numeroUsuarios = numeroUsuarios;
        }

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

        public String getEndereco() {
            return endereco;
        }
        public void setEndereco(String endereco) {
            this.endereco = endereco;
        }

        public String getCnpj() {
            return cnpj;
        }
        public void setCnpj(String cnpj) {
            this.cnpj = cnpj;
        }

        public int getNumeroUsuarios() {
            return numeroUsuarios;
        }
        public void setNumeroUsuarios(int numeroUsuarios) {
            this.numeroUsuarios = numeroUsuarios;
        }

        //TOSTRING
        @Override
        public String toString() {
            return "Industria{" +
                    "idIndustria=" + idIndustria +
                    ", nome='" + nome + '\'' +
                    ", endereco='" + endereco + '\'' +
                    ", cnpj='" + cnpj + '\'' +
                    ", numeroUsuarios=" + numeroUsuarios +
                    '}';
        }
}
