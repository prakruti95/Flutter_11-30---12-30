<?php
    
    include('connect.php');

    $sql = "select * from students";
    $request = mysqli_query($con,$sql);
    $response = array();

    while($row = mysqli_fetch_array($request))
    {
        $data["id"]= $row["id"];
        $data["name"]= $row["name"];
        $data["surname"]= $row["surname"];
        $data["email"]= $row["email"];

        array_push($response,$data);
    }

    echo json_encode($response);
    mysqli_close($con);

?>