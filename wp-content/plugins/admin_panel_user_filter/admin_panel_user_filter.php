<?php
/**
 * Plugin Name: Admin Panel User Filer
 * Author: Polcode
 * Description: Plugin to add filter per activated user and add dropdown to filter by teams
 */
add_action( 'manage_users_custom_column', 'wti_show_user_custom_column_content', 999999999, 3);
 add_filter( 'manage_users_columns', 'user_role_column');

function user_role_column( $columns = array() ) {
		$columns['test']          = __( 'Team',  'test_5999999' );
		$columns['test2'] = __( 'Test2', 'test_5999999' );

		return $columns;
	}

function wti_show_user_custom_column_content( $value, $column_name, $user_id ) {
   if ( 'user_id' == $column_name )
      return $user_id;
    
   return $value;
}