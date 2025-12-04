<?php
require_once '../includes/config.php';
require_once '../includes/functions.php';
require_once 'adminheader.php';

requireAdmin();

$message = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['toggle_admin'])) {
        $user_id = (int)$_POST['user_id'];
        $is_admin = (int)$_POST['is_admin'];
        $new_admin_status = $is_admin ? 0 : 1;
        
        $stmt = $pdo->prepare("UPDATE users SET is_admin = ? WHERE id = ?");
        if ($stmt->execute([$new_admin_status, $user_id])) {
            $message = '<div class="alert alert-success">User admin status updated successfully!</div>';
        } else {
            $message = '<div class="alert alert-danger">Error updating user status.</div>';
        }
    } elseif (isset($_POST['delete_user'])) {
        $user_id = (int)$_POST['user_id'];
        
        if ($user_id != $_SESSION['user_id']) {
            $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
            if ($stmt->execute([$user_id])) {
                $message = '<div class="alert alert-success">User deleted successfully!</div>';
            } else {
                $message = '<div class="alert alert-danger">Error deleting user.</div>';
            }
        } else {
            $message = '<div class="alert alert-danger">You cannot delete your own account.</div>';
        }
    }
}

$users = $pdo->query("SELECT * FROM users ORDER BY created_at DESC")->fetchAll();
?>

    <div class="container mt-4">
        <h2>Manage Users</h2>

        <?php echo $message; ?>

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Joined</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($users as $user): ?>
                        <tr>
                            <td><?php echo $user['id']; ?></td>
                            <td><?php echo $user['name']; ?></td>
                            <td><?php echo $user['email']; ?></td>
                            <td><?php echo date('M d, Y', strtotime($user['created_at'])); ?></td>
                            <td>
                                <span class="badge bg-<?php echo $user['is_admin'] ? 'danger' : 'primary'; ?>">
                                    <?php echo $user['is_admin'] ? 'Admin' : 'User'; ?>
                                </span>
                            </td>
                            <td>
                                <?php if ($user['id'] != $_SESSION['user_id']): ?>
                                    <form method="POST" class="d-inline me-2">
                                        <input type="hidden" name="toggle_admin" value="1">
                                        <input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
                                        <input type="hidden" name="is_admin" value="<?php echo $user['is_admin']; ?>">
                                        <button type="submit" class="btn btn-sm btn-<?php echo $user['is_admin'] ? 'warning' : 'info'; ?>"
                                                onclick="return confirm('Are you sure you want to change this user\'s admin status?')">
                                            <?php echo $user['is_admin'] ? 'Remove Admin' : 'Make Admin'; ?>
                                        </button>
                                    </form>
                                    
                                    <form method="POST" class="d-inline">
                                        <input type="hidden" name="delete_user" value="1">
                                        <input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
                                        <button type="submit" class="btn btn-sm btn-danger"
                                                onclick="return confirm('Are you sure you want to delete this user? This action cannot be undone.')">
                                            Delete
                                        </button>
                                    </form>
                                <?php else: ?>
                                    <span class="text-muted">Current User</span>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

<?php require_once 'adminfooter.php'; ?>