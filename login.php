<?php
require_once 'includes/config.php';
require_once 'includes/functions.php';
require_once 'includes/header.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = sanitizeInput($_POST['email']);
    $password = $_POST['password'];

    if (!empty($email) && !empty($password)) {
        if (!validateEmail($email)) {
            $error = 'Please enter a valid email address.';
        } elseif (!checkLoginAttempts($email)) {
            $error = 'Too many login attempts. Please try again in 15 minutes.';
            logSecurityEvent('LOGIN_RATE_LIMIT', "Email: $email");
        } else {
            $stmt = $pdo->prepare("SELECT id, name, password, is_admin FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch();

            if ($user && password_verify($password, $user['password'])) {
                recordLoginAttempt($email, true);
                regenerateSessionId();

                $_SESSION['user_id'] = $user['id'];
                $_SESSION['user_name'] = $user['name'];
                $_SESSION['is_admin'] = $user['is_admin'];

                logSecurityEvent('LOGIN_SUCCESS', "User ID: {$user['id']}, Email: $email");

                if ($user['is_admin']) {
                    header('Location: admin/dashboard.php');
                } else {
                    header('Location: index.php');
                }
                exit();
            } else {
                recordLoginAttempt($email, false);
                logSecurityEvent('LOGIN_FAILED', "Email: $email");
                $error = 'Invalid email or password.';
            }
        }
    } else {
        $error = 'Please fill in all fields.';
    }
}
?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Login</h3>
                </div>
                <div class="card-body">
                    <?php if ($error): ?>
                        <div class="alert alert-danger"><?php echo $error; ?></div>
                    <?php endif; ?>

                    <form method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>

                    <p class="text-center mt-3">
                        Don't have an account? <a href="register.php">Register here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once 'includes/footer.php'; ?>