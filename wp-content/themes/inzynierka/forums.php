<?php /* Template Name: Forum */ ?>
<?php
    get_header();
?>
        <div class="row">
            <div class="col-lg-12 rounded-corner content-box">
                <div class="row">
                    <?php if (dynamic_sidebar('forum_widget_area') ) : else : endif; ?>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 content-box" >
                <div class="">
                    <?php if (have_posts()) : while (have_posts()) : the_post();?>
                    <?php the_content(); ?>
                    <?php endwhile; endif; ?>
                </div>
            </div>
        </div>     
        
<?php 
    get_footer();
?>