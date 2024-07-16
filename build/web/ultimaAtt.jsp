<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Última Atualização</title>
    </head>
    <body>
        <a href="http://localhost:8080/PI2-Aguinha/">
            <h1>AGUINHA</h1>
        </a>
        <%
        try {
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://85.10.205.173:3306/reservatorio", "grupopi", "gjjlm123");

            st = conecta.prepareStatement("SELECT id_checagem, DATE_FORMAT(data_hora, '%d/%m/%Y') AS Data, TIME_FORMAT(data_hora, '%H:%i:%s') AS Hora, situacao AS Situação FROM relatorio ORDER BY id_checagem DESC LIMIT 1; ");
            ResultSet rs = st.executeQuery();
    %>
    <table>
        <tr>
        <strong> <th>ID</th> <th>Data</th> <th>Hora</th> <th>Situação</th> </strong>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
                <td><%= rs.getString("id_checagem")%></td>
                <td><%= rs.getString("Data")%></td>
                <td><%= rs.getString("Hora")%></td>
                <td><%= rs.getString("Situação")%></td>
            </tr>
            <%
                }
            %>
            </table>  
        <%
            } catch (Exception x) {
                out.print("Erro:" + x.getMessage());
            }
        %>
    </body>
</html>
