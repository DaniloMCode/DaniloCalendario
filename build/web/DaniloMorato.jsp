<%-- 
    Document   : DaniloMorato
    Created on : 25 de mar. de 2025, 16:31:48
    Author     : morat
--%>

<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Calendário</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h2>Calendário</h2>
    <form method="get">
        Ano: <input type="number" name="ano" required>
        Mês: <input type="number" name="mes" required min="1" max="12">
        <input type="submit" value="Gerar">
    </form>
    <% 
        String anoParam = request.getParameter("ano");
        String mesParam = request.getParameter("mes");
        if (anoParam != null && mesParam != null) {
            int ano = Integer.parseInt(anoParam);
            int mes = Integer.parseInt(mesParam) - 1;

            Calendar cal = Calendar.getInstance();
            cal.set(ano, mes, 1);
            int primeiroDiaSemana = cal.get(Calendar.DAY_OF_WEEK);
            int ultimoDia = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    %>

    <h3>Calendário de <%= mes + 1 %>/<%= ano %></h3>
    <table>
        <tr>
            <th>Dom</th><th>Seg</th><th>Ter</th><th>Qua</th><th>Qui</th><th>Sex</th><th>Sáb</th>
        </tr>
        <tr>
            <% for (int i = 1; i < primeiroDiaSemana; i++) { %>
                <td></td>
            <% } %>
            <% for (int dia = 1; dia <= ultimoDia; dia++) { %>
                <td><%= dia %></td>
                <% if ((dia + primeiroDiaSemana - 1) % 7 == 0) { %>
                    </tr><tr>
                <% } %>
            <% } %>
        </tr>
    </table>

    <% } %>
</body>
</html>