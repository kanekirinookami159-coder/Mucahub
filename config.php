<?php

$conn = mysqli_connect(
    "ballast.proxy.rlwy.net",
    "root",
    "YAvrNoPpnQWBCrEeoVAZYTvfseuNeuKp",
    "railway",
    21696
);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>