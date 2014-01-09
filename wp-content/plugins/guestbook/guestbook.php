<?php
/**
 * Plugin Name: Guestbook
 * Version: 1.0
 * Description: Plugin add guestbook function
 * Author: Arhimenrius
 * Author URI: http://www.arhiweb.pl
 */

include_once dirname( __FILE__ ) . '/widget.php';
wp_enqueue_script( 'jquery' );
wp_register_script( 'ajax_handler', plugin_dir_url( __FILE__ ) . '/ajax_handler.js');
wp_enqueue_script( 'ajax_handler' );

class Guestbook
{   
    public function install()
    {
        global $wpdb;

        $table_name = $wpdb->prefix . 'guestbook';

        $sql = "CREATE TABLE $table_name (
            id int(11) NOT NULL AUTO_INCREMENT,
            nickname varchar(255) DEFAULT NULL,
            email varchar(255) DEFAULT NULL,
            content text DEFAULT NULL,
            UNIQUE KEY id (id)
        )DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;";

        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        dbDelta( $sql );
    }
    
    public function saveEntry()
    {
        global $wpdb;
        //?!?!?!?!?!?!?!
        $data = $this->_validateForm($_POST['data']);
        if(is_array($data))
        {
            $wpdb->query ("SET NAMES 'utf8'");
            $wpdb->insert($wpdb->prefix.'guestbook', $data);
            
            wp_send_json(true);
        }
        else
        {
            wp_send_json_error($data);
        }
    }
    
    public function loadEntry()
    {
        global $wpdb;
        $data = $wpdb->get_results( "SELECT * FROM ".$wpdb->prefix."guestbook WHERE id > ".$_POST['data']['id'] );
        wp_send_json($data);
    }
    
    protected function _validateForm($data)
    {
        if(!filter_var($data['email'], FILTER_VALIDATE_EMAIL))
        {
            return 'This is not email!';
        }
        $data['content'] = preg_replace('/\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|$!:,.;]*[A-Z0-9+&@#\/%=~_|$]/i', '', $data['content']);
        
        $data['content'] = trim($data['content']);
        $data['email'] = trim($data['email']);
        $data['nickname'] = trim($data['nickname']);
        return $data;
    }
}


register_activation_hook( __FILE__, array( 'Guestbook', 'install' ));
$guestbook = new Guestbook;
add_action( 'wp_ajax_save_guestbook', array($guestbook, 'saveEntry'));
add_action( 'wp_ajax_load_guestbook', array('Guestbook', 'loadEntry'));
