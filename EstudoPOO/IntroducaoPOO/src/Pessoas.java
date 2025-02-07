public abstract class Pessoas {
    //atributos
    String nome;
    String cpf;
    String contato;
    //construtor
    public Pessoas(String nome, String cpf, String contato) {
        this.nome = nome;
        this.cpf = cpf;
        this.contato = contato;
    }
    //métodos
    //getter - leitura da informação
    public String getNome() {
        return nome;
    }
    public String getCpf() {
        return cpf;
    }
    public String getContato() {
        return contato;
    }
    //setters - alteram informações
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setContato(String contato) {
        this.contato = contato;
    }
    
    
    

}
