<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 6/1/2022
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher</title>
    <link rel="stylesheet" type="text/css" href="slide navbar style.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    body{
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        font-family: 'Jost', sans-serif;
        background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
    }
    .main{
        width: 350px;
        height: 500px;
        background: red;
        overflow: hidden;
        background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
        border-radius: 30px;
        box-shadow: 5px 20px 50px #000;
    }
    #chk{
        display: none;
    }
    .login{
        position: relative;
        width:100%;
        height: 100%;
    }
    label{
        color: #fff;
        font-size: 2.3em;
        justify-content: center;
        display: flex;
        margin: 50px;
        font-weight: bold;
        cursor: pointer;
        transition: .5s ease-in-out;
    }

    label2{
        color: mediumpurple;
        font-size: 1.6em;
        justify-content: center;
        display: flex;
        margin: 50px;
        font-weight: bold;
        cursor: pointer;
        transition: .5s ease-in-out;
    }

    input{
        width: 60%;
        height: 30px;
        background: #e0dede;
        justify-content: center;
        display: flex;
        margin: 20px auto;
        padding: 10px;
        border: none;
        outline: none;
        border-radius: 5px;
    }
    button{
        width: 60%;
        height: 40px;
        margin: 10px auto;
        justify-content: center;
        display: block;
        color: #fff;
        background: #573b8a;
        font-size: 1em;
        font-weight: bold;
        margin-top: 20px;
        outline: none;
        border: none;
        border-radius: 5px;
        transition: .2s ease-in;
        cursor: pointer;
    }
    button:hover{
        background: #6d44b8;
    }
    .signup{
        height: 460px;
        background: #eee;
        border-radius: 60% / 10%;
        transform: translateY(-180px);
        transition: .8s ease-in-out;
    }
    .signup label{
        color: #573b8a;
        transform: scale(.6);
    }

    #chk:checked ~ .signup{
        transform: translateY(-500px);
    }
    #chk:checked ~ .signup label{
        transform: scale(1);
    }
    #chk:checked ~ .login label{
        transform: scale(.6);
    }

    .btn {
        background-color: rebeccapurple;
        border: none;
        color: mediumpurple;
        padding: 12px 16px;
        font-size: 16px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: purple;
    }

</style>
<body>
<div class="btn">
    <i class="fa fa-home" action="Role.jsp"></i>
</div>

<div class="main">
    <input type="checkbox" id="chk" aria-hidden="true">

    <div class="login">
        <form action="TeacherLogin.jsp" method="post">
            <label for="chk" aria-hidden="true">Login</label>
            <label2>Hello Teacher!!</label2>
            <input type="email" name="teacherEmail" placeholder="Email" required="">
            <input type="password" name="teacherPass" placeholder="Password" required="">
            <button>Login</button>
        </form>
    </div>

    <div class="signup">
        <form action="TeacherRegistrationServlet" method="post">
            <label for="chk" aria-hidden="true">Sign up</label>
            <input type="text" name="teacherName" placeholder="Name" required="">
            <input type="text" name="teacherPhone" placeholder="Phone number" required="">
            <input type="email" name="teacherEmail" placeholder="Email" required="">
            <input type="password" name="teacherPass" placeholder="Password" required="">
            <button type="submit" value="register" formaction="/TeacherRegistrationServlet">Submit</button>
        </form>
    </div>
</div>
</body>
</html>