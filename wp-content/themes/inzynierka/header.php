<?php
/**
 * The Header template for our theme
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php wp_title( '|', true, 'right' ); ?></title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->
	<?php wp_head(); ?>
</head>
<?php include_once 'walker/TopMenuNavwalker.php'; ?>
<body>
    <div class="container">
        <div class="jumbotron">
        </div>
            <div class="navbar navbar-inverse">
                        <?php
        wp_nav_menu( array(
        'menu'              => 'Main-menu',
        'theme_location'    => 'Main-menu',
        'depth'             => 2,
        'container'         => false,
        'menu_class'        => 'nav navbar-nav',
        'fallback_cb'       => 'wp_bootstrap_navwalker::fallback',
        'walker'            => new wp_bootstrap_navwalker())
    );?>
            </div>
         <div class="clear"></div>
       
         <div class="container">
        <div class="row">
            <div class="col-lg-4" style="height:200px;background:red;">
                
            </div>
            <div class="col-lg-8" style="height:200px;background:blue;">
                
            </div>
        </div>
             
         </div>
    </div>