<?php

function register_css_and_style()
{
    wp_register_script( 'bootstrap.min', get_template_directory_uri() . '/js/bootstrap.min.js');
    wp_register_script( 'theme-customizer', get_template_directory_uri() . '/js/theme-customizer.js');
    wp_register_style('bootstrap', get_template_directory_uri() . '/css/bootstrap.css');
    wp_register_style('bootstrap-theme', get_template_directory_uri() . '/css/bootstrap-theme.css');
    wp_enqueue_style('bootstrap');
    wp_enqueue_style('bootstrap-theme');
    wp_enqueue_script( 'bootstrap.min' );  
    wp_enqueue_script( 'theme-customizer' );  
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