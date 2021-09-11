<?php
    include 'db.php';
    $name = $_POST['name'];
    $conn->query("INSERT INTO student(name) VALUES('".$name."')");
    
    