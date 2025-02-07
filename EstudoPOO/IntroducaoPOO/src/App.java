public class App {
    public static void main(String[] args) throws Exception {
        // Pessoas pessoa1 = new Pessoas();
        // "Maria",
        // "123.456.789-98",
        // "19-9876-54321");
        // System.out.println("Usuario Cadastrado");
        // System.out.println("Nome: "+pessoa1.getNome());
        // System.out.println("Contato: "+pessoa1.getContato());
        // pessoa1.setNome("Maria Silva");
        // System.out.println(pessoa1.getNome());
        Aluno aluno = new Aluno(
                "José",
                "123",
                "123",
                "DEV", 
                1);
        aluno.euSouAluno();
        Funcionario funcionario = new Funcionario(
            "Odair",
            "987",
            "098",
            "Professor",
            "SENAI01");

    }
}
