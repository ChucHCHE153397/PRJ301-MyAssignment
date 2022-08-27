<%-- 
    Document   : report
    Created on : Aug 15, 2022, 4:22:10 PM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table{
                
                min-width: 100px;
                min-height: 100px;
                margin-right: auto;
                margin-left: 5px;
                box-sizing: border-box;
            }
            table td {
                padding: 4px;
            }
            
            
            body{
                background-image: url(https://anhdephd.vn/wp-content/uploads/2022/05/background-trang.jpg)
            }
        </style>
    </head>
    <body>
        <h2 style="text-align: center; text-transform: uppercase; border-bottom: grey 1px dotted;">BANG CHAM CONG </h2>
        <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
        <table border="1px">
            <tr>
                
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td style="background-color: greenyellow;"
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                        >
                        
                        <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>
                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                    </td>
                    </c:forEach>
                <td style="background-color: greenyellow;">Tong Cong</td>
                <td style="background-color: greenyellow;">Nghi Khong Luong</td>
                <td style="background-color: greenyellow;">Nghi Phep</td>
                <td style="background-color: greenyellow;">Nghi Le</td>
                
                
                
            </tr>
            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td>${e.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td 
                            <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: yellow;"
                            </c:if>
                            >

                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    V
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                    <td>${e.getNumberOfWorkingDays()}</td>
                    <td>4</td>
                    <td></td>
                    <td></td>
                    
                </tr>
            </c:forEach>

                
        </table>
        
        
                       
        
        </br>

        <table border="1">
            <thead>
                <tr>
                    <th style="background-color: greenyellow;" colspan="5">Ki Hieu</th>
                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Om:</td>
                    <td>O</td>
                    <td>Nghi nua ngay khong luong</td>
                    <td>1/2K</td>
                </tr>
                <tr>
                    <td>Con Om</td>
                    <td>CO</td>
                    <td>Nghi Khong Luong</td>
                    <td>K</td>
                </tr>
                
                <tr>
                    <td>Thai San</td>
                    <td>TS</td>
                    <td>Ngung Viec</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>Tai Nan</td>
                    <td>T</td>
                    <td>Nghi Phep</td>
                    <td>P</td>
                </tr>
                <tr>
                    <td>Nghi Le</td>
                    <td>NL</td>
                    <td>Nghi Nua Ngay Tinh Phep</td>
                    <td>1/2P</td>
                </tr>
                <tr>
                    <td>Nghi Bu</td>
                    <td>NB</td>
                    <td>Lam nua ngay cong</td>
                    <td>NN</td>
                </tr>
            </tbody>
        </table>


       
    </body>
</html>