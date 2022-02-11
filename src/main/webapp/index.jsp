<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>SKBT Library Management System</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<header>
    <a href="#" class="logo">SKBT</a>
    <ul>
        <li><a href="#">Login</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</header>

<section>
    <img src="stars.png" id="stars">
    <img src="moon.png" id="moon">
    <img src="mountains_behind.png" id="mountains_behind">
    <h2 id="text">SKBT Library</h2>
    <a href="#sec" id="#btn">Explore</a>
    <img src="mountains_front.png" id="mountains_front">
</section>

<div class="sec" id="sec">
    <h2>SKBT Library Management System</h2>
    <p>This library specifically made for the library operations of Sekolah Kebangsaan (Felda) Bukit Tajau, Maran, Pahang.
        This system designed to manage all the functions of the library. It helps librarian to maintain the database of new books and the books that are borrowed by members along with their due dates. This system completely automates all your library’s activities. It tracks the records of the number of books in the library, how many books are issued, or how many books have been returned or renewed or late fine charges, etc.<br>
        You can find books in an instant, issue/reissue books quickly, and manage all the data efficiently and orderly using this system. The purpose of a library management system is to provide instant and accurate data regarding any type of book, thereby saving a lot of time and effort.
        <a href="Role.jsp" id="btn">Register Now</a><br><br><br></p>
</div>

<script>
    let stars = document.getElementById('stars');
    let moon = document.getElementById('moon');
    let mountains_behind = document.getElementById('mountains_behind');
    let text = document.getElementById('text');
    let btn = document.getElementById('btn');
    let mountains_front = document.getElementById('mountains_front');

    window.addEventListener('scroll', function()
    {
        let value = window.scrollY;
        stars.style.left = value *0.25 + 'px';
        moon.style.top = value *1.05 + 'px';
        mountains_behind.style.top = value *0.5 + 'px';
        mountains_front.style.top = value *0 + 'px';
        text.style.marginRight = value *4 + 'px';
        text.style.marginTop = value *1.5 + 'px';
        btn.style.marginTop = value *1.5 + 'px';
    })

</script>

</body>
</html>