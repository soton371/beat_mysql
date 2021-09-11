<?php
    include 'db.php';
    $id = $_POST['id'];
    $name = $_POST['name'];
    $conn->query("UPDATE student SET name = '".$name."' WHERE id = '".$id."'");
    