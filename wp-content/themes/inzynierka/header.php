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
	<meta charset="UTF-8" />
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
            <div class="logo">
               rerferf
            </div>
            <div class="banner">
                <!--SLIDER------------------------------------------------>
                <div id="myCarousel" class="carousel slide">  
                  <!-- Carousel items -->  
                    <div class="carousel-inner">  
                        <div class="active item"><img src="<?php echo get_template_directory_uri(); ?>/images/img_0.jpg" alt="" /></div>  
                        <div class="item"><img src="<?php echo get_template_directory_uri(); ?>/images/img_1.jpg" alt="" /></div>  
                        <div class="item"><img src="<?php echo get_template_directory_uri(); ?>/images/img_2.jpg" alt="" /></div>  
                    </div>  
                  <!-- Carousel nav -->  
                  <a class="carousel-control left" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>  
                    <a class="carousel-control right" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>  
                </div>  
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
        </div>
            
        <div class="clear"></div>
        