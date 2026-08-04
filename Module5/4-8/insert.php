<?php

    include('connect.php');

    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $email = $_POST["email"];

    if($name==""&&$surname==""&&$email=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into students (name,surname,email) values ('$name','$surname','$email')";
        mysqli_query($con,$sql);
    }

?>