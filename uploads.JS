<script>
var origOpen = XMLHttpRequest.prototype.open;

$.ajax({
    url: $('#pshidden').attr('udolaurl'),
    success: function(result) {
        $('#pshidden').html(result);

        $('#FILE_ATTACH_WRK_ATTACHADD').attr('onclick', jQuery(result).find('#FILE_ATTACH_WRK_ATTACHADD').attr('onclick'));
        /*
                    $('#FILE_ATTACH_WRK_ATTACHADD').one('click', function() {
                        $.get($(this).attr('udolaurl'), function() {
                            console.log('cookie fired');
                        });
                    });
        */
        XMLHttpRequest.prototype.open = function() {
            this.addEventListener('loadend', function() {
                doc = new DOMParser().parseFromString(this.responseText, "text/xml");
                if ((this.responseURL).includes('CBR_UPLOAD.GBL') && doc.doctype == null) {
                    xmlDoc = $.parseXML(this.responseText);
                    console.log($($(xmlDoc).find('FIELD[id="win0divDERIVED_EDITTABLE"]').text()).attr('value'));
                    //console.log($(doc).find('FIELD[id="win0divDERIVED_EDITTABLE"]:first-child').get(0).tagName);
                }
            });
            origOpen.apply(this, arguments);
        };
    }
});



udola_refresh = function(refdiv) {
    $.ajax({
        url: $(refdiv).attr('udolaurl'),
        xhrFields: {
            withCredentials: true
        },
        processData: false,
        type: "GET",
        success: function(result) {
            $(refdiv).html(jQuery(result).find('#' + $(refdiv).attr('id')).html());
        },
        error: function() {
            alert('failed!');
        }
    });

}
</script>