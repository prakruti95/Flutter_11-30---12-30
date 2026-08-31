<?php

include('connection.php');

// Upload folder
$upload_path = 'product_images/';

// Upload URL
$upload_url = 'https://' . $_SERVER['SERVER_NAME'] . '/MiniProject/' . $upload_path;

// Get POST data
$product_id = $_POST['product_id'];
$product_name = $_POST['product_name'];
$product_price = $_POST['product_price'];
$final_discounted_price = $_POST['final_discounted_price'];
$features = $_POST['features'];
$ratings = $_POST['ratings'];
$quantity = $_POST['quantity'];

// Check required fields
if (
    $product_id == "" ||
    $product_name == "" ||
    $product_price == "" ||
    $final_discounted_price == "" ||
    $features == "" ||
    $ratings == "" ||
    $quantity == ""
) {
    echo "0";
    exit();
}


// Check if image is uploaded
if (isset($_FILES["product_image"]) && $_FILES["product_image"]["error"] == 0) {

    // Get file information
    $fileinfo1 = pathinfo($_FILES["product_image"]["name"]);

    // Get extension
    $extension1 = $fileinfo1["extension"];

    // Create random image name
    $random1 = 'product_' . rand(1000, 9999) . '_' . time();

    // Image URL
    $product_photo_url = $upload_url . $random1 . '.' . $extension1;

    // Image path
    $product_photo_path = $upload_path . $random1 . '.' . $extension1;

    // Upload image
    move_uploaded_file(
        $_FILES["product_image"]["tmp_name"],
        $product_photo_path
    );

    // Update with new image
    $sql = "UPDATE mini_products SET 
        product_name = '$product_name',
        product_price = '$product_price',
        final_discounted_price = '$final_discounted_price',
        ratings = '$ratings',
        features = '$features',
        quantity = '$quantity',
        product_image = '$product_photo_url'
        WHERE product_id = '$product_id'";

} else {

    // Update without changing the old image
    $sql = "UPDATE mini_products SET 
        product_name = '$product_name',
        product_price = '$product_price',
        final_discounted_price = '$final_discounted_price',
        ratings = '$ratings',
        features = '$features',
        quantity = '$quantity'
        WHERE product_id = '$product_id'";
}


// Execute query
if (mysqli_query($con, $sql)) {
    echo "1";
} else {
    echo "0";
}

?>