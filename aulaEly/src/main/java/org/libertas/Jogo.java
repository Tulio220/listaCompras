package org.libertas;

public class Jogo {
    private int id;
    private String nome;
    private String plataforma;
    private String genero;
    private int anoLancamento;

    // Construtor padrão
    public Jogo() {}

    // Construtor com parâmetros
    public Jogo(String nome, String plataforma, String genero, int anoLancamento) {
        this.nome = nome;
        this.plataforma = plataforma;
        this.genero = genero;
        this.anoLancamento = anoLancamento;
    }

    public Jogo(int id, String nome, String plataforma, String genero, int anoLancamento) {
        this.id = id;
        this.nome = nome;
        this.plataforma = plataforma;
        this.genero = genero;
        this.anoLancamento = anoLancamento;
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getPlataforma() {
        return plataforma;
    }

    public void setPlataforma(String plataforma) {
        this.plataforma = plataforma;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getAnoLancamento() {
        return anoLancamento;
    }

    public void setAnoLancamento(int anoLancamento) {
        this.anoLancamento = anoLancamento;
    }
}
