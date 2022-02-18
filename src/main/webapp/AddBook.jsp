<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/1/2022
  Time: 9:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book Details</title>
</head>

<style>


    body {
        background-image: url("images/image.png");
    }


    .get-in-touch {
        max-width: 800px;
        margin: 50px auto;
        position: relative;


    }
    .get-in-touch .title {
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 3px;
        font-size: 3.2em;
        line-height: 55px;
        padding-bottom: -10px;
        color: #5543ca;
        background: #5543ca;
        background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
        background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
        background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important;
        -webkit-background-clip: text !important;
        -webkit-text-fill-color: transparent !important;
    }

    .get-in-touch .title2 {
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 3px;
        font-size: 1.0em;
        line-height:10px;
        padding-bottom: 25px;
        color: #5543ca;
        background: #5543ca;
        background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
        background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
        background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important;
        -webkit-background-clip: text !important;
        -webkit-text-fill-color: transparent !important;
    }

    .contact-form .form-field {
        position: relative;
        margin: 32px 0;
    }
    .contact-form .input-text {
        display: block;
        width: 100%;
        height: 36px;
        border-width: 0 0 2px 0;
        border-color: #5543ca;
        font-size: 18px;
        line-height: 26px;
        font-weight: 400;
    }
    .contact-form .input-text:focus {
        outline: none;
    }


    .contact-form .label {
        position: absolute;
        left: 20px;
        bottom: 10px;
        font-size: 18px;
        line-height: 80px;
        font-weight: 400;
        color: black;
        cursor: text;

    }
    .contact-form .submit-btn {
        display: inline-block;
        background-color: #000;
        background-image: linear-gradient(125deg,#a72879,#064497);
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 16px;
        padding: 8px 16px;
        border: none;
        width:200px;
        cursor: pointer;
    }


</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<body>

<section class="get-in-touch">
    <h1 class="title">SKBT Library Book Directories</h1>
    <h3 class="title2">ADD NEW BOOK DETAILS FORM</h3>
    <form method="post" action="AddbookServlet" class="contact-form row">

        <div class="form-field col-lg-6">
            <input id="bookTitle" name="bookTitle" class="input-text js-input" type="text" required>
            <label class="label" for="bookTitle">Book Title</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="PubYear" name="bookPubYear" class="input-text js-input" type="text" required>
            <label class="label" for="PubYear">Book Publisher Year</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="author" name="bookAuthor" class="input-text js-input" type="text" required>
            <label class="label" for="author">Book Author</label>
        </div>
        <div class="form-field col-lg-6 ">
            <input id="amount" name="bookAmount" class="input-text js-input" type="text" required>
            <label class="label" for="amount">Book Amount</label>
        </div>
        <div class="form-field col-lg-12">
            <input id="pub" name="bookPublisher" class="input-text js-input" type="text" required>
            <label class="label" for="pub">Book Publisher</label>
        </div>
        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Submit">
        </div>

    </form>

</section>

</body>
</html>



