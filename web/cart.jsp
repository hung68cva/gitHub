<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <style>
            body {
                background-color: #f0f2f5;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                text-align: center;
            }

            #wrapper {
                max-width: 800px;
                margin: 40px auto;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #007bff;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #007bff;
                color: white;
            }

            p {
                font-size: 16px;
                color: #333;
                margin: 10px 0;
            }

            form {
                margin-top: 20px;
            }

            input[type="submit"] {
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #28a745;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }

            #clear {
                background-color: #dc3545;
            }

            #clear:hover {
                background-color: #c82333;
            }

            #total {
                color: red;
            }

            #bg {
                background: url('images/store.jpg') repeat-x;
                background-size: cover;
            }

            a {
                display: inline-block;
                padding: 12px 24px;
                margin: 10px;
                text-align: center;
                border: 2px solid #007bff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                background-color: #007bff;
                color: #ffffff;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s, transform 0.2s, border-color 0.3s;
            }

            a:hover {
                background-color: orange;
                border-color: black;
                transform: scale(1.05);
            }
            #cato1{

                margin-right:  10%;
            }
        </style>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Ban chac chan muon xoa id: " + id)) {
                    window.location = "DeleteServlet?id=" + id;
                }
            }
        </script>
    </head>
    <body id="bg">
        <div id="wrapper">
            <h1>Your Cart</h1>          
            <c:if test="${not empty cart.items}">
                <a href="ListServlet">Continue Shopping</a>
                <center>
                    <table>
                        <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price per Item (VND)</th>
                                <th>Total(VND)</th>
                            </tr>
                        </thead>
                        <tbody id="cato1">
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td>${item.key.name}</td>
                                    <td>${item.value}</td>
                                    <td>${item.key.price}</td>
                                    <td>${item.value * item.key.price}</td>
                                    <td> 
                                        <a href="#" onclick="doDelete('${item.key.name}')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br/><h3 id="total">Total Price: ${cart.total} VND</h3>
                    <form action="OrderServlet" method="get">
                        <input type="hidden" name="action" value="checkout"/>
                        <input type="submit" value="Confirm"/>
                    </form>
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="action" value="clear"/>
                        <input id="clear" type="submit" value="Clear Cart"/>
                    </form>
                </center>
            </c:if>
            <c:if test="${empty cart.items}">
                <p>Your cart is empty.</p>
                <a href="ListServlet">Back to Product List</a>
            </c:if>
        </div>
    </body>
</html>
