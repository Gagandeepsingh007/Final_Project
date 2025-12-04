<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - RKG Computers</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="top: 0; position: sticky; width: 100%; z-index: 1000;">
        <div class="container">
            <a class="navbar-brand" href="../index.php">RKG Computers</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="navbar-nav me-auto">
                    <a class="nav-link" href="../index.php">Home</a>
                    <a class="nav-link" href="dashboard.php">Dashboard</a>
                    <a class="nav-link" href="products.php">Manage Products</a>
                    <a class="nav-link" href="orders.php">Manage Orders</a>
                    <a class="nav-link" href="users.php">Manage Users</a>
                </div>
                <div class="navbar-nav">
                    <span class="nav-link">Hello, <?php echo $_SESSION['user_name']; ?></span>
                    <a class="nav-link" href="../logout.php">Logout</a>
                </div>
            </div>
        </div>
    </nav>
