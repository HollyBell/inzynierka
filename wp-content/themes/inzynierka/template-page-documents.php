<?php
/*
Template Name: Druzyny Template
*/
    get_header();
?>
        <div class="row">
            <div class="col-lg-4 rounded-corner">
                <div class="box-head">
                    <h4>Menu</h4>
                </div>
                <?php get_sidebar('documents'); ?>
                <?php if (dynamic_sidebar('sidebar_widget_area') ) : else : endif; ?>
            </div>
            <div class="col-lg-7 col-lg-offset-1 rounded-corner">
                <div class="box-head">
                    <h4>Artykuły / Strona</h4>
                </div>
                <?php if (have_posts()) : while (have_posts()) : the_post();?>
                <?php the_content(); ?>
                <?php endwhile; endif; ?>
            </div>
            
        </div>     
        
<?php 
    get_footer();
?>