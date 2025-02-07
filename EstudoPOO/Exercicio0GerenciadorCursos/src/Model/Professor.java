package Model;

public class Professor extends Pessoa{
    //atributos - privado
    private double salario;
    //métodos - públicos
    //construtor
    public Professor(String nome, String cpf, double salario) {
        super(nome, cpf);
        this.salario = salario;
    }
    //getter and setter
    public double getSalario(){
        return salario;
    }
    public void setSalario(double salario){
        this.salario=salario;
    }
    //polimorfismo - override - exibirInformações
    @Override
    public void exibirInformacoes() {
        super.exibirInformacoes();
        System.out.println("Salário: "+getSalario());
    }
}
