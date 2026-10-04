<?php
session_start();
require_once 'includes/auth.php';

$auth = new Auth();
$auth->requireAdmin();

$db = Database::getInstance();

$totalOrders = $db->queryOne("SELECT COUNT(*) as count FROM orders")['count'];
$delivered   = $db->queryOne("SELECT COUNT(*) as count FROM orders WHERE status = 'delivered'")['count'];
$inTransit   = $db->queryOne("SELECT COUNT(*) as count FROM orders WHERE status = 'in_transit'")['count'];
$pending     = $db->queryOne("SELECT COUNT(*) as count FROM orders WHERE status = 'pending'")['count'];
$totalVehicles = $db->queryOne("SELECT COUNT(*) as count FROM vehicles")['count'];
$totalBarangays = $db->queryOne("SELECT COUNT(*) as count FROM barangays")['count'];
$totalFloodZones = $db->queryOne("SELECT COUNT(*) as count FROM flood_zones")['count'];

$recentOrders = $db->queryAll("SELECT * FROM orders ORDER BY created_at DESC LIMIT 6");

$pageTitle = 'Dashboard Overview';
require_once 'includes/header.php';
?>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-icon indigo">📦</div>
        <div class="stat-details">
            <p>Total Orders</p>
            <h2><?= number_format($totalOrders) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon green">✅</div>
        <div class="stat-details">
            <p>Delivered</p>
            <h2><?= number_format($delivered) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon yellow">🚚</div>
        <div class="stat-details">
            <p>In Transit</p>
            <h2><?= number_format($inTransit) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon red">⏳</div>
        <div class="stat-details">
            <p>Pending</p>
            <h2><?= number_format($pending) ?></h2>
        </div>
    </div>
</div>

<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-icon indigo">🚐</div>
        <div class="stat-details">
            <p>Fleet Size</p>
            <h2><?= number_format($totalVehicles) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon green">📍</div>
        <div class="stat-details">
            <p>Barangays Covered</p>
            <h2><?= number_format($totalBarangays) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon red">🌊</div>
        <div class="stat-details">
            <p>Flood Zones</p>
            <h2><?= number_format($totalFloodZones) ?></h2>
        </div>
    </div>
    <div class="stat-card">
        <div class="stat-icon yellow">🗺️</div>
        <div class="stat-details">
            <p>Active Routes</p>
            <h2>0</h2>
        </div>
    </div>
</div>

<div class="panel">
    <div class="panel-header">
        <div>
            <h3>Recent Orders</h3>
            <p>Latest deliveries entering the system</p>
        </div>
        <a href="orders.php" class="btn">View All Orders</a>
    </div>
    <div class="table-wrap">
        <?php if (empty($recentOrders)): ?>
            <div class="empty-state">
                <div class="icon">📭</div>
                <h4>No orders yet</h4>
                <p>Add your first order to get started.</p>
            </div>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th>Tracking #</th>
                        <th>Recipient</th>
                        <th>Barangay</th>
                        <th>Status</th>
                        <th>Created</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($recentOrders as $o): ?>
                        <tr>
                            <td><strong><?= htmlspecialchars($o['tracking_number']) ?></strong></td>
                            <td><?= htmlspecialchars($o['recipient_name']) ?></td>
                            <td><?= htmlspecialchars($o['barangay']) ?></td>
                            <td><span class="badge <?= $o['status'] ?>"><?= str_replace('_',' ', $o['status']) ?></span></td>
                            <td><?= date('M j, Y g:i A', strtotime($o['created_at'])) ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>
</div>

<?php require_once 'includes/footer.php'; ?>