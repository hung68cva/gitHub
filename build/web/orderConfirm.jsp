<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <style>
            body {
                background-color: #f9f9f9;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                text-align: center;
            }

            #wrapper {
                max-width: 600px;
                margin: 40px auto;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #28a745;
                margin-bottom: 20px;
            }

            p {
                font-size: 16px;
                color: #333;
                margin-bottom: 30px;
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
            #bg{
                background: url('images/store.jpg') repeat-x;
                background-size: cover;
            }
        </style>
    </head>
    <body id="bg">
        <div id="wrapper">
            <h1>Order Confirmed</h1>
            <p>Thank you for your purchase! Your order has been successfully placed.</p>
            <a href="ListServlet">Back to Product List</a>
        </div>
    </body>
</html>
