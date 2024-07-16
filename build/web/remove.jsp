<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover</title>
    </head>
    <body>
        <%
            int id_checagem;
            id_checagem = Integer.parseInt(request.getParameter("id_checagem"));

            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://85.10.205.173:3306/reservatorio", "grupopi", "gjjlm123");

                st = conecta.prepareStatement("DELETE FROM relatorio WHERE id_checagem = ?");
                st.setInt(1, id_checagem);
                int resultado = st.executeUpdate();

                if (resultado != 1) {
                    out.print("<a href='http://localhost:8080/PI2-Aguinha/'><h1>AGUINHA</h1></a>");
                    out.print("<p style='color:red;font-size:30'>Este ID não está cadastrado!</p>");
                } else {
                    out.print("<a href='http://localhost:8080/PI2-Aguinha/'><h1>AGUINHA</h1></a>");
                    out.print("<p style='color:darkgreen;font-size:30'>O registro de ID " + id_checagem + " foi excluído com sucesso!</p>");
                }

            } catch (Exception x) {
                out.print("Erro: " + x);
            }
        %>
    </body>
</html>
