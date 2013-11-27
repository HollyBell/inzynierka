<?php

class Guestbook_widget extends WP_Widget
{
    public function __construct() {
        parent::__construct(
			'guestbook_widget',
			__( 'Księga gości' ),
			array( 'description' => __( 'Guestbook' ) )
		);
    }
    
    public function widget($args, $instance) {
        include_once 'widget_view.php';
    }
}

function guestbook_register_widgets() {
	register_widget( 'Guestbook_widget' );
}

add_action( 'widgets_init', 'guestbook_register_widgets' );
