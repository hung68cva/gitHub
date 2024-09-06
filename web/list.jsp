<%-- 
    Document   : list
    Created on : Aug 30, 2024, 3:04:17 PM
    Author     : Hung Bui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone List</title>
        <style>
            body {
                background-color: #f0f2f5;
                font-family: 'Arial', sans-serif;
                position: relative;
            }

            #wrapper {
                margin: 0 auto;
                padding: 20px;
                width: 80%;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }

            #cart-icon {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #007bff;
                color: white;
                padding: 10px;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
                cursor: pointer;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s, transform 0.2s;
            }

            #cart-icon:hover {
                background-color: #0056b3;
                transform: scale(1.1);
            }

            h3 {
                text-align: center;
                color: #007bff;
                font-weight: bold;
                margin-bottom: 30px;
            }

            form {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
                align-items: center;
                margin-bottom: 30px;
            }

            form select,
            form input[type="text"],
            form input[type="number"] {
                padding: 8px;
                margin: 5px;
                border-radius: 5px;
                border: 1px solid #ddd;
                width: 200px;
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            form input[type="submit"] {
                width: 200px;
                padding: 10px;
                background-color: #f90;
                color: white;
                font-weight: bold;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.2s;
            }

            form input[type="submit"]:hover {
                background-color: #e68a00;
                transform: translateY(-3px);
            }

            ul {
                padding: 0;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            li {
                width: 200px;
                margin: 15px;
                padding: 15px;
                text-align: center;
                border: 2px solid black;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
                background-color: #fff7e6;
                transition: background-color 0.3s, transform 0.2s;
            }

            li:hover {
                background-color: #ffe5b4;
                transform: translateY(-5px);
            }

            li img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                border-radius: 8px;
                transition: transform 0.2s;
                margin-bottom: 10px;
            }

            li img:hover {
                transform: scale(1.1);
            }

            li a {
                color: #333;
                text-decoration: none;
                display: block;
                font-weight: bold;
            }

            p {
                margin: 10px 0;
                font-size: 14px;
                color: #333;
            }

            .old {
                text-decoration: line-through;
                color: red;
            }

            #bg {
                background: url('images/store.jpg') repeat-x;
                background-size: cover;
            }

            #search {
                background-image: url('images/search_icon.jpg');
                background-size: 20px;
                background-repeat: no-repeat;
                background-position: center right 10px;
                padding-right: 30px;
            }
            #cart-icon {
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #e68a00;
                color: white;
                padding: 10px;
                border-radius: 50%;
                width: 50px;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
                font-weight: bold;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s, transform 0.2s;
/*                background-image: url('images/cart_icon.jpg');  Cập nhật đường dẫn cho đúng */
                background-size: 30px;
                background-repeat: no-repeat;
                background-position: center;
            }
            #cart-icon:hover {
                background-color: #0056b3;
                transform: scale(1.1);
            }
        </style>
        <script type="text/javascript">
            function change() {
                document.getElementById("f1").submit();
            }
        </script>
    </head>
    <body id="bg">
        <!-- Cart Icon at the Top Right Corner -->
        <a href="cart.jsp" id="cart-icon">
            <span style="color: white;">
                <h9>Cart:</h9>
                <c:if test="${not empty cart.items}">
                    ${cart.items.size()}
                </c:if>
                <c:if test="${empty cart.items}">
                    0
                </c:if>       
            </span>
        </a>

        <div id="wrapper">
            <form id="searchForm" action="ListServlet">
                Search Bar
                <select name="key">
                    <option value="0">All</option>
                    <c:forEach items="${requestScope.categorys}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select><br/>
                <input type="text" name="key2" placeholder="Nhap ten | Mieu ta"/>
                From: <input type="number" name="fromprice" placeholder="Price(VND)"/>
                To: <input type="number" name="toprice" placeholder="Price(VND)"/><br/>
                <input id="search" type="submit" value="SEARCH"/>
            </form>
            <h3>Cac dong dien thoai</h3>
            <ul>
                <c:forEach items="${requestScope.products}" var="p">
                    <li>
                        <form action="CartServlet" method="get">
                            <input type="hidden" name="productId" value="${p.id}"/>                            
                            <img src="${p.image}"/>
                            <p>${p.name}</p>
                            <p>Gia goc: <span class="old">${(p.price*1.2)}</span> VND</p>
                            <p>Gia sale: ${p.price} VND</p>  
                            <input type="number" name="quantity" min="1" placeholder="Nhập số lượng" required/>
                            <input type="submit" value="Add to Cart"/>
                        </form>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </body>
</html>
