<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Activity Log Helper - Versi Tanpa IP Address
 */

if (!function_exists('log_activity')) {
    function log_activity($activity_type, $description, $user_id = null) {
        $ci = &get_instance();
        
        if (!$user_id) {
            $user_id = $ci->session->userdata('admin_id');
        }
        
        if (!$user_id) {
            return false;
        }

        $data = [
            'user_id'       => $user_id,
            'activity_type' => strtoupper($activity_type),
            'description'   => $description,
            'created_at'    => date('Y-m-d H:i:s')
        ];

        return $ci->db->insert('activity_logs', $data);
    }
}

if (!function_exists('get_badge_color')) {
    function get_badge_color($activity_type) {
        $activity_type = strtoupper($activity_type);
        $colors = [
            'LOGIN'  => 'success',
            'LOGOUT' => 'secondary',
            'ADD'    => 'info',
            'EDIT'   => 'warning',
            'DELETE' => 'danger',
            'PRINT'  => 'primary'
        ];
        
        return isset($colors[$activity_type]) ? $colors[$activity_type] : 'dark';
    }
}