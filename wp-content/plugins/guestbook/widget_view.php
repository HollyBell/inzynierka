<div class="col-lg-12">
    <div class="box-head">
        <h3><?php echo $args['widget_name']; ?></h3>
    </div>
    <div class="box-content">
        <hr />
        <form method="post">
            Podaj swoją nazwę<br />
            <input type="text" name="Scout_Guestbook[nickname]" placeholder="nickname" class="form-control" required /></br />
            Podaj email<br />
            <input type="email" name="Scout_Guestbook[email]" placeholder="email" class="form-control" required/><br />
            Treść wpisu<br />
            <textarea name="Scout_Guestbook[content]" rows="4" cols="80" class="form-control" placeholder="Zawartość" required></textarea><br />
            <button type="submit" class="btn btn-primary" name="Scout_Guestbook[save]" value="true">Dodaj wpis</button>
            
        </form>
    </div>
</div>