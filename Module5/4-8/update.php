<?php

    include('connect.php');

    $id = $_POST["id"];
    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $email = $_POST["email"];

    if($id==""&&$name==""&&$surname==""&&$email=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update students set name='$name',surname='$surname',email='$email' where id ='$id'";
        mysqli_query($con,$sql);
    }

?>