jQuery(document).ready(function(){
    loadData(0);
    setInterval(function(){loadData(jQuery('.guestbook_id').val())},30000);
    jQuery('button.save-guestbook').on('click', function(event){
        event.preventDefault();
        jQuery.post(
            ajaxurl, 
            {
                'action': 'save_guestbook',
                'data':{
                    'nickname': jQuery('#Scout_Guestbook_Nickname').val(),
                    'email': jQuery('#Scout_Guestbook_Email').val(),
                    'content': jQuery('#Scout_Guestbook_Content').val()
                }
            }, 
                function(response){
                if(response.success != false)
                {
                    loadData(jQuery('.guestbook_id').val());
                }
            }
        );
    });
});

function loadData(id)
{
    jQuery.post(
            ajaxurl, 
            {
                'action': 'load_guestbook',
                'data':{id:id}
            }, 
            function(response){
                if (response != 0)
                {
                    for(key in response)
                    {
                        jQuery('.guestbook-content').prepend('<input type="hidden" class="guestbook_id" value="'+response[key].id+'" /><div class="guestbook_nickname">'+response[key].nickname+'</div><div class="guestbook_email">'+response[key].email+'</div><div class="clear"></div><div class="guestbook_content">'+response[key].content+'</div><hr />');
                    }
                }
                
            }
    );
}