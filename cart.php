<?php
require_once 'includes/config.php';
require_once 'includes/functions.php';
require_once 'includes/header.php';

requireLogin();

$message = '';
if (isset($_GET['added'])) {
    $message = '<div class="alert alert-success">Product added to cart successfully!</div>';
} elseif (isset($_GET['error'])) {
    if ($_GET['error'] == 'stock') {
        $message = '<div class="alert alert-danger">Insufficient stock for this product.</div>';
    } elseif ($_GET['error'] == 'invalid') {
        $message = '<div class="alert alert-danger">Invalid product or quantity.</div>';
    } else {
        $message = '<div class="alert alert-danger">Error adding product to cart.</div>';
    }
} elseif (isset($_GET['updated'])) {
    $message = '<div class="alert alert-success">Cart updated successfully!</div>';
} elseif (isset($_GET['removed'])) {
    $message = '<div class="alert alert-success">Product removed from cart!</div>';
}

$stmt = $pdo->prepare("
    SELECT c.*, p.name, p.price, p.image_url, p.stock
    FROM cart c
    JOIN products p ON c.product_id = p.id
    WHERE c.user_id = ?
    ORDER BY c.added_at DESC
");
$stmt->execute([$_SESSION['user_id']]);
$cart_items = $stmt->fetchAll();

$total = 0;
foreach ($cart_items as $item) {
    $total += $item['price'] * $item['quantity'];
}
?>

<div class="container mt-4">
    <h2>Shopping Cart</h2>

    <?php echo $message; ?>

    <?php if (empty($cart_items)): ?>
        <div class="alert alert-info">
            Your cart is empty. <a href="products.php">Continue shopping</a>
        </div>
    <?php else: ?>
        <div class="row">
            <div class="col-md-8">
                <?php foreach ($cart_items as $item): ?>
                    <div class="card mb-3">
                        <div class="row g-0">
                            <div class="col-md-3">
                                <img src="<?php echo $item['image_url']; ?>" class="img-fluid rounded-start"
                                    alt="<?php echo $item['name']; ?>" style="height: 150px; object-fit: cover;">
                            </div>
                            <div class="col-md-9">
                                <div class="card-body">
                                    <h5 class="card-title"><?php echo $item['name']; ?></h5>
                                    <p class="card-text">Price: <?php echo formatPrice($item['price']); ?></p>
                                    <p class="card-text">
                                        <small class="text-muted">Stock: <?php echo $item['stock']; ?></small>
                                    </p>

                                    <div class="row align-items-center">
                                        <div class="col-md-4">
                                            <form method="POST" action="update_cart.php" class="d-flex">
                                                <input type="hidden" name="product_id" value="<?php echo $item['product_id']; ?>">
                                                <input type="number" name="quantity" class="form-control form-control-sm me-2"
                                                    value="<?php echo $item['quantity']; ?>" min="1" max="<?php echo $item['stock']; ?>" style="width: 80px;">
                                                <button type="submit" class="btn btn-sm btn-outline-primary">Update</button>
                                            </form>
                                        </div>
                                        <div class="col-md-4">
                                            <strong>Subtotal: <?php echo formatPrice($item['price'] * $item['quantity']); ?></strong>
                                        </div>
                                        <div class="col-md-4">
                                            <form method="POST" action="remove_from_cart.php" class="d-inline">
                                                <input type="hidden" name="product_id" value="<?php echo $item['product_id']; ?>">
                                                <button type="submit" class="btn btn-sm btn-danger"
                                                    onclick="return confirm('Remove this item from cart?')">Remove</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5>Order Summary</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <span>Subtotal:</span>
                            <span><?php echo formatPrice($total); ?></span>
                        </div>
                        <div class="d-flex justify-content-between">
                            <span>Shipping:</span>
                            <span>Free</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <strong>Total:</strong>
                            <strong><?php echo formatPrice($total); ?></strong>
                        </div>
                        <a href="checkout.php" class="btn btn-primary w-100 mt-3">Proceed to Checkout</a>
                    </div>
                </div>

                <div class="mt-3">
                    <a href="products.php" class="btn btn-outline-secondary w-100">Continue Shopping</a>
                </div>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php require_once 'includes/footer.php'; ?>