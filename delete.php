<?php
    include 'db.php';
    $id = $_POST['id'];
    $conn->query("DELETE FROM student WHERE id = '".$id."'");
    