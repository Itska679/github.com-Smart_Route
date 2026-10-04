<?php
require_once __DIR__ . '/auth.php';
$auth = new Auth();
$auth->requireAdmin();

$current = basename($_SERVER['PHP_SELF'], '.php');
$pageTitle = $pageTitle ?? 'Dashboard';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($pageTitle) ?> — Smart-Route AI</title>
    <link rel="stylesheet" href="assets/css/style.css?v=<?= time() ?>">
</head>
<body>
<div class="admin-layout">

    <aside class="sidebar" id="sidebar">
        <div class="sidebar-brand">
            <div class="brand-logo">🚚</div>
            <div class="brand-text">
                <h2>Smart-Route AI</h2>
                <p>2GO Express · Dagupan</p>
            </div>
        </div>

        <nav class="sidebar-nav">
            <div class="nav-section">
                <div class="nav-label">Overview</div>
                <a href="dashboard.php" class="<?= $current === 'dashboard' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><path d="M3 12l9-9 9 9M5 10v10h14V10"/></svg>
                    <span>Dashboard</span>
                </a>
            </div>

            <div class="nav-section">
                <div class="nav-label">Operations</div>
                <a href="orders.php" class="<?= $current === 'orders' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/><rect x="8" y="2" width="8" height="4" rx="1"/><path d="M9 12h6M9 16h6"/></svg>
                    <span>Orders</span>
                </a>
                <a href="routes.php" class="<?= $current === 'routes' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><circle cx="6" cy="19" r="3"/><circle cx="18" cy="5" r="3"/><path d="M9 19h6a3 3 0 0 0 0-6H9a3 3 0 0 1 0-6h6"/></svg>
                    <span>Routes</span>
                </a>
                <a href="vehicles.php" class="<?= $current === 'vehicles' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><path d="M1 3h15v13H1z"/><path d="M16 8h4l3 3v5h-7V8z"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/></svg>
                    <span>Vehicles</span>
                </a>
            </div>

            <div class="nav-section">
                <div class="nav-label">Geography</div>
                <a href="barangays.php" class="<?= $current === 'barangays' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
                    <span>Barangays</span>
                </a>
                <a href="flood_zones.php" class="<?= $current === 'flood_zones' ? 'active' : '' ?>">
                    <svg class="nav-icon" viewBox="0 0 24 24"><path d="M2 12c2 0 2-2 4-2s2 2 4 2 2-2 4-2 2 2 4 2 2-2 4-2"/><path d="M2 18c2 0 2-2 4-2s2 2 4 2 2-2 4-2 2 2 4 2 2-2 4-2"/></svg>
                    <span>Flood Zones</span>
                </a>
            </div>
        </nav>

        <div class="sidebar-footer">
            <div class="user-chip">
                <div class="user-avatar"><?= strtoupper(substr($_SESSION['username'], 0, 1)) ?></div>
                <div class="user-info">
                    <div class="name"><?= htmlspecialchars($_SESSION['username']) ?></div>
                    <div class="role"><?= htmlspecialchars($_SESSION['role']) ?></div>
                </div>
            </div>
            <a href="logout.php" class="logout-btn">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
                <span>Logout</span>
            </a>
        </div>
    </aside>

    <div class="sidebar-overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>

    <div class="admin-main">
        <header class="topbar">
            <div class="topbar-left">
                <button class="menu-toggle" onclick="toggleSidebar()">☰</button>
                <div>
                    <div class="breadcrumb">Admin / <span><?= htmlspecialchars($pageTitle) ?></span></div>
                    <h1><?= htmlspecialchars($pageTitle) ?></h1>
                </div>
            </div>
            <div class="topbar-right">
                <div class="topbar-date"><?= date('l, F j, Y') ?></div>
            </div>
        </header>

        <main class="content">

<script>
function toggleSidebar() {
    document.getElementById('sidebar').classList.toggle('open');
    document.getElementById('sidebarOverlay').classList.toggle('open');
}
</script>