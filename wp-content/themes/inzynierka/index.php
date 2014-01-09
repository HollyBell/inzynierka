<?php
    get_header();
?>
        <div class="row">
            <div>
                <div class="col-lg-4 rounded-corner">
                    <div class="box-head">
                        <h4>Menu</h4>
                    </div>
                    <div class="box-content">
                        
                    </div>
                    <?php if (dynamic_sidebar('sidebar_widget_area') ) : else : endif; ?>
                </div>
                
            </div>
            <div class="col-lg-7 col-lg-offset-1 rounded-corner">
                <div class="box-head">
                    <h4>Artykuły / Strona</h4>
                </div>
                <div class="box-content">
                    <?php if (have_posts()) : while (have_posts()) : the_post();?>
                    <?php the_content(); ?>
                    <?php endwhile; endif; ?>
                </div>
            </div>
            
        </div>     
        
<?php 
    get_footer();
?>