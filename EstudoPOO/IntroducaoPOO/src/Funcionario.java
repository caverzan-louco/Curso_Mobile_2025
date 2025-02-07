public class Funcionario extends Pessoas {
    //atributos
    String cargo;
    String nif;
    //construtor
    public Funcionario(String nome, String cpf, 
        String contato, String cargo, String nif) {
        super(nome, cpf, contato);
        this.cargo = cargo;
        this.nif = nif;
    }
    //métodos
    public String euSouFuncionario(){
        return "Funcionario "+nif;
    }
    
}
