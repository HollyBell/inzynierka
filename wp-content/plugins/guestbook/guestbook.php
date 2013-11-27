<?php
/**
 * Plugin Name: Guestbook
 * Version: 1.0
 * Description: Plugin add guestbook function
 * Author: Arhimenrius
 * Author URI: http://www.arhiweb.pl
 */

include_once dirname( __FILE__ ) . '/widget.php';

class Guestbook
{
    protected $_data;
    
    public function __construct($data) {
        $this->_data = $data;
    }
    
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
        );";

        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        dbDelta( $sql );
    }
    
    public function validateForm()
    {
        
    }
    
    public function save()
    {
        
    }
}
if($_POST['Scout_Guestbook']['save'])
{
    $guestbook = new Guestbook($_POST['Scout_Guestbook']);
    $guestbook ->validateForm();
    $guestbook ->save();
}

register_activation_hook( __FILE__, array( 'Guestbook', 'install' ) );