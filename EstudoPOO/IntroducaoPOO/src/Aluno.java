public class Aluno extends Pessoas{
    //atributos
    String curso;
    int rm;
    //contrutor
    public Aluno(String nome, String cpf, String contato, String curso, int rm) {
        super(nome, cpf, contato);
        this.curso = curso;
        this.rm = rm;
    }  
    //métodos
    public String euSouAluno(){
        return "Aluno "+ rm;
    }
}
