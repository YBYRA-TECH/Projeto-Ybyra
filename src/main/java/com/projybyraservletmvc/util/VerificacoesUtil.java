package com.projybyraservletmvc.util;

import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class VerificacoesUtil {

    public VerificacoesUtil(){}

    public static boolean validarNome(String nome) {
        if (nome == null) return false;
        String regex = "^[A-Za-zÀ-ÿ]+(?:\\s[A-Za-zÀ-ÿ]+)+$";
        return Pattern.matches(regex, nome.trim());
    }

    public static boolean validarCpf(String cpf){
        if (cpf == null) return false;
        String regex = "^(\\d{3}\\.?\\d{3}\\.?\\d{3}-?\\d{2})$";
        if(!Pattern.matches(regex, cpf)) return false;

        String numeros = cpf.replaceAll("\\D", "");
        if (numeros.length() != 11 || numeros.matches("(\\d)\\1{10}")) return false;

        return true;
    }

    public static boolean validarCnpj(String cnpj){
        if (cnpj == null) return false;

        String regex = "^(\\\\d{2}\\\\.?\\\\d{3}\\\\.?\\\\d{3}/?\\\\d{4}-?\\\\d{2})$";
        if(!Pattern.matches(regex, cnpj)) return false;
        String numeros = cnpj.replaceAll("\\D", "");

        if (numeros.length() != 14 || numeros.matches("(\\d)\\1{13}")) return false;
        return true;
    }

    public static boolean validarData(String data){
        if (data == null) return false;

        String regex = "^(\\d{4})-(\\d{2})-(\\d{2})$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(data);

        if (!matcher.matches()) return false;

        int ano = Integer.parseInt(matcher.group(1));
        int mes = Integer.parseInt(matcher.group(2));
        int dia = Integer.parseInt(matcher.group(3));


        if (ano < 1900 || ano > 2100) return false;
        if (mes < 1 || mes > 12) return false;
        if (dia < 1 || dia > 31) return false;

        try {
            LocalDate dataNascimento = LocalDate.of(ano, mes, dia);
            LocalDate hoje = LocalDate.now();

            if (dataNascimento.isAfter(hoje)) {
                return false;
            }

            if (dataNascimento.isAfter(hoje.minusYears(18))) {
                return false;
            }

            if (dataNascimento.isBefore(hoje.minusYears(110))) {
                return false;
            }

        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public static boolean validarTelefone(String telefone){
        if(telefone == null) return false;

        String numeros = telefone.replaceAll("\\D", "");

        if (numeros.length() == 10 || numeros.length() == 11) return true;
        if (numeros.length() == 12 && numeros.startsWith("55")) return true;
        if (numeros.length() == 13 && numeros.startsWith("55")) return true;

        return false;
    }

    public static boolean validarSenha(String senha){
        if (senha == null) return false;
        String regex = "^(?=.*\\d).{8,}$";
        return Pattern.matches(regex, senha);
    }

    public static boolean validarEmail(String email){
        if (email == null) return false;
        String regex = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
        return Pattern.matches(regex, email);
    }






}