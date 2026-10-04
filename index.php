<?php
session_start();
require_once 'includes/auth.php';

$auth = new Auth();
if ($auth->isLoggedIn()) {
    header("Location: dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Smart-Route AI</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="login-page">
    <div class="login-box">
        <div class="logo-mark">🚚</div>
        <h1>Smart-Route AI</h1>
        <p class="subtitle">2GO Express · Dagupan City Admin Panel</p>

        <?php if (isset($_GET['error'])): ?>
            <div class="alert error">❌ Invalid username or password.</div>
        <?php endif; ?>

        <form method="POST" action="login.php">
            <label>Username or Email</label>
            <input type="text" name="username" required autofocus>
            <label>Password</label>
            <input type="password" name="password" required>
            <button type="submit">Sign In →</button>
        </form>
    </div>
</body>
</html>