<?php

function register_css_and_style()
{
    wp_register_script( 'bootstrap.min', get_template_directory_uri() . '/js/bootstrap.min.js');
    wp_register_script( 'jquery.slidertron', get_template_directory_uri() . '/js/jquery.slidertron-1.3.js');
    wp_register_script( 'ownscripts', get_template_directory_uri() . '/js/ownscripts.js');
    wp_register_style('bootstrap', get_template_directory_uri() . '/css/bootstrap.css');
    wp_register_style('bootstrap-theme', get_template_directory_uri() . '/css/bootstrap-theme.css');
    wp_enqueue_style('bootstrap');
    wp_enqueue_style('bootstrap-theme');
    wp_enqueue_script( 'bootstrap.min' );
    wp_enqueue_script( 'jquery.slidertron' );  
    wp_enqueue_script( 'ownscripts' );  
}

add_action('wp_enqueue_scripts', 'register_css_and_style');

function register_my_menus() {
  register_nav_menus(
    array(
      'Main-menu' => __( 'Main Menu' ),
      'Documents-menu' => __( 'Extra Menu' ), 
      'Teams-menu' => __('Teams Menu'),
      'Gallery-menu' => __('Gallery Menu'),
      'Informations-menu' => ('Informations Menu'),
    )
  );
}
add_action( 'init', 'register_my_menus' );


function acl_function()
{
    global $post;
    if($post->ID == 69 && !is_user_logged_in())
    {
        wp_redirect('/');
    }
}
add_action('template_redirect', 'acl_function');

function bottom_widgets_init() {

	register_sidebar( array(
		'name' => 'Bottom widget area',
		'id' => 'bottom_widget_area',
		'before_widget' => '',
		'after_widget' => '',
		'before_title' => '',
		'after_title' => '',
	) );
}
add_action( 'widgets_init', 'bottom_widgets_init' );

function sidebar_widgets_init() {

	register_sidebar( array(
		'name' => 'Sidebar widget area',
		'id' => 'sidebar_widget_area',
		'before_widget' => '',
		'after_widget' => '',
		'before_title' => '',
		'after_title' => '',
	) );
}
add_action( 'widgets_init', 'sidebar_widgets_init' );