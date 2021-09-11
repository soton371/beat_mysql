<?php

    include 'db.php';

    $query = $conn->query("SELECT * FROM student");
    $result = array();

    while ($rowData = $query->fetch_assoc()) {
        $result[] = $rowData;
    }

    echo json_encode($result);