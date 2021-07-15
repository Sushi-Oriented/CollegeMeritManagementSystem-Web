<?php
$name = json_decode($_POST["name"]);
$progid = json_decode($_POST["id"]);
$role = json_decode($_POST["role"]);
$matricNum = json_decode($_POST["matricNum"]);
$icNum = json_decode($_POST["icNum"]);
$merit = json_decode($_POST["merit"]);

$con=mysqli_connect("localhost","root","","cmmsdb");
/* Check connection */
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
for ($i = 0; $i < count($name); $i++) {

    if(($name[$i] != "")){   /* not allowing empty values and the row which has been removed. */
    $sql="INSERT INTO merit (name,progid,role,icNum,merit,matricNum)
VALUES
('$name[$i]','$progid','$role[$i]','$icNum[$i]','$merit[$i]','$matricNum[$i]')";
    if (!mysqli_query($con,$sql))
    {
        die('Error: ' . mysqli_error($con));
    }
    }
}
Print  "Data added Successfully !";
mysqli_close($con);
?>