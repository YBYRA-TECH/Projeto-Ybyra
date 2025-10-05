package com.projybyraservletmvc.model;

public class Industria {
        //ATRIBUTOS
        private int idIndustria;
        private String nome;
        private String endereco;
        private String cnpj;
        private String senha;

        //CONSTRUTOR

        public Industria(){}

        public Industria(int idIndustria, String nome, String endereco, String cnpj, String senha) {
            this.idIndustria = idIndustria;
            this.nome = nome;
            this.endereco = endereco;
            this.cnpj = cnpj;
            this.senha = senha;

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

        public String getSenha() {return senha;}
            public void setSenha(String senha) {this.senha = senha;}

        //TOSTRING
        @Override
        public String toString() {
            return "Industria{" +
                    "\t idIndustria=" + idIndustria +
                    ",\t nome='" + nome + '\'' +
                    ",\t endereco='" + endereco + '\'' +
                    ",\t cnpj='" + cnpj + '\'' +
                    ",\t senha='" + senha + '\'' +
                    "}\n";
        }


}
