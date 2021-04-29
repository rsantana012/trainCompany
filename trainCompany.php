<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title>Company</title>
    <style>
        table,td,tr,th { border:3px solid black;
            background-color:#9ec2d3;
            padding:4px;
            }
        table.center {
            margin-left:auto; 
            margin-right:auto;
            }
        td { color:#002156;}
        body { background-color:#aaa;}
    </style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

</head>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
        <div class="container">
        <div class="row align-items-start">
        <div class="col">
          <a class="navbar-brand" href="#">Train</a>
        </div>
        </div>
        </div>
        <div class="container">
        <div class="row align-items-center">
        <div class="col">
            <a class="navbar-brand" href="#">Route</a>
        </div>
        </div>
        </div>
        <div class="container">
        <div class="row align-items-end">
        <div class="col">
            <a class="navbar-brand" href="#">Fare</a>
        </div>
        </div>
        </div>
         <div class="container">
        <div class="row align-items-end">
        <div class="col">
            <a class="navbar-brand" href="#https://github.com/rsantana012/trainCompany.git">Help</a>
        </div>
        </div>
        </div>
      </div>
    </nav>

<div class="row g-4">
  <div class="float-right">
    <input type="text" class="form-control" placeholder="Train Number" aria-label="Train Number">
  </div>
  <div class="float-right">
    <input type="text" class="form-control" placeholder="Schedule Number" aria-label="Schedule Number">
  </div>
  <div class="col-md">
    <input type="text" class="form-control" placeholder="Route" aria-label="Route">
  </div>
  <div class="col-md">
    <input type="text" class="form-control" placeholder="Add Route" aria-label="Add Route">
  </div>
</div>
</tb>
<br><br/>

        <table border="4" class="center">
         <tr>
            <th><button type="button" disabled><u>TRAIN NUMBER</u></button></th>
            <th><button type="button" disabled><u>SCHEDULE NUMBER</u></button></th>
            <th><button type="button" disabled><u>ROUTE NUMBER</u></button></th>
            <th><button type="button" disabled><u>STATION</u></button></th>
            <th><button type="button" disabled><u>FARE</u></button></th>
         </tr>
<?php

if(isset($_POST['search']))
{
    $valueToSearch = $_POST['valueToSearch'];
    // search in all table columns
    // using concat mysql function
$query  = "SELECT `Train`.`Train_id`, `Train`.`Schd_id`, `Route`.* FROM `Train` LEFT JOIN `Route` ON `Train`.`Route_id` = `Route`.`Route_id`";

    $search_result = filterTable($query);

print_r($search_result);
}
 else {
    $query  = "SELECT `Train`.`Train_id`, `Train`.`Schd_id`, `Route`.* FROM `Train` LEFT JOIN `Route` ON `Train`.`Route_id` = `Route`.`Route_id`";
    //$query = "SELECT * FROM `Train`";
    $search_result = filterTable($query);
    while($row = mysqli_fetch_assoc($search_result)){
echo "<tr>";echo "<td>";echo $row["Train_id"];echo "</td>";
echo "<td>";echo $row["Schd_id"];echo "</td>";
echo "<td>";echo $row['Route_id'];echo "</td>";
echo "<td>";echo $row['Stop_name'];echo "</td>";
echo "<td>";echo "$";echo $row["Fare"];echo "</td>";echo "</tr>";}
    //echo "Train";
    //echo "Schedule";
}

// function to connect and execute the query
function filterTable($query)
{
    $connect = mysqli_connect("localhost", "phpmyadmin", "password", "trainCompany");
    $filter_Result = mysqli_query($connect, $query);
    return $filter_Result;
}

?>
 </table>
</html>
