<div class="col-lg-12">
    <div class="box-head">
        <h3><?php echo $args['widget_name']; ?></h3>
    </div>
    <div class="box-content">
        <div class="guestbook-content">
        </div>
        <div class="guestbook-form">
            <form method="post">
                Podaj imię i nazwisko<br />
                <input type="text" name="Scout_Guestbook[nickname]" placeholder="Imię i nazwisko" class="form-control" id="Scout_Guestbook_Nickname"  /></br />
                Podaj email<br />
                <input type="email" name="Scout_Guestbook[email]" placeholder="Email" class="form-control" id="Scout_Guestbook_Email" /><br />
                Treść wpisu<br />
                <textarea name="Scout_Guestbook[content]" rows="4" cols="80" class="form-control" placeholder="Zawartość" id="Scout_Guestbook_Content" ></textarea><br />
                <button type="submit" class="btn btn-primary save-guestbook" name="Scout_Guestbook[save]" value="true">Dodaj wpis</button>
            </form>
        </div>
        <div class="clear"></div>
    </div>
</div>

<style>
    .guestbook-content{
        float:left;
        width:60%;
        margin-right:10%;
    }
    .guestbook-form{
        float:right;
        width:30%;
    }
</style>