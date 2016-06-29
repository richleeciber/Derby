<script>
var uploadType = '';
var origOpen = XMLHttpRequest.prototype.open;
$(window).load(function() {

    $("button[id='FILE_ATTACH_WRK_ATTACHADD']").on('click', function() {
        uploadType = $(this).attr('udtype');
    }); /*set upload type*/

    $.ajax({
        url: $('#pshidden').attr('udolaurl'),
        success: function(result) {
            $('#pshidden').html(result);
            refresh_binds();

            $("button[id='FILE_ATTACH_WRK_ATTACHADD']").one('click', function(event) {
                //$.get($(this).attr('udolaurl'), function() {});
            }); /*set cookie*/

            XMLHttpRequest.prototype.open = function() {
                this.addEventListener("readystatechange", function() {
                    if (this.readyState == 1) {
                        this.setRequestHeader("UdType", uploadType);
                        console.log('getudtype = ' + uploadType);
                    }
                });

                this.addEventListener('loadend', function() {
                    refresh_binds();
                    // var doc = new DOMParser().parseFromString(this.responseText, "text/xml");
                    if (String(this.response).indexOf("<PAGE id='CBR_UPLOAD'>") > -1 && String(this.response).indexOf('<?xml version=') == 0) {
                        var xmlDoc = $.parseXML(this.responseText);
                        var retCode = Number($($(xmlDoc).find('FIELD[id="win0divDERIVED_EDITTABLE"]').text()).attr('value'));
                        if (retCode == 0) {
                            udola_refresh('#' + $("button[id='FILE_ATTACH_WRK_ATTACHADD']").attr('refdiv'), refresh_binds);
                        } else {
                            //alert('file upload requirements failed');
                        }
                        //var xmlDoc = $.parseXML(this.responseText);
                        //console.log('retcode=' + $($(xmlDoc).find('FIELD[id="win0divDERIVED_EDITTABLE"]').text()).attr('value'));
                    }
                });
                origOpen.apply(this, arguments);
            };
        }
    });
});

saveRecord = function(savediv, refreshdiv) {
    var finalstr = '';
    $(savediv).each(function() {
        var tmpAry = {
            psrecord: $(this).attr("psrecord"),
            fields: []
        };

        $(this).find(':input:not(".tt-hint")').each(function() {
            tmpAry.fields.push($(this).serializeArray()[0]);
        });
        if (finalstr == '') {
            finalstr = JSON.stringify(tmpAry);
        } else {
            finalstr = finalstr + ',' + JSON.stringify(tmpAry);
        }
    });

    finalstr = '[' + finalstr + ']';

    if ($(savediv).attr('udolaurl').indexOf('/EMPL/') > -1) {
        $(savediv).attr('udolaurl', $(savediv).attr('udolaurl').replace('/PDEV/', '/HDEV/').replace('/EMPL/', '/HRMS/').replace('/pdev.', '/hdev.'));
    }

    $.ajax({
        url: $(savediv).attr('udolaurl'),
        xhrFields: {
            withCredentials: true
        },
        processData: false,
        type: "POST",
        data: finalstr,
        success: function(result) {
            udola_refresh(refreshdiv, refresh_binds);
        },
        error: function() {
            console.log('failed');
        }
    });
}

deleteRecord = function(mydiv, refreshdiv) {
    $(mydiv).each(function() {
        $(this).find(':not(:input[pstype="key"])').each(function() {
            $(this).val('');
        });
    });
    saveRecord(mydiv, refreshdiv);
}


udola_refresh = function(refdiv, myCallBack) {
    $.ajax({
        url: $(refdiv).attr('udolaurl'),
        xhrFields: {
            withCredentials: true
        },
        processData: false,
        type: "GET",
        success: function(result) {
            $(refdiv).html(jQuery(result).find('#' + $(refdiv).attr('id')).html());
            myCallBack();
        },
        error: function() {
            alert('failed!');
        }
    });

}

refresh_binds = function() {
    $("button[id='FILE_ATTACH_WRK_ATTACHADD']").attr('onclick', $("input[id='FILE_ATTACH_WRK_ATTACHADD']").attr('onclick'));
    $("button[id='FILE_ATTACH_WRK_ATTACHADD']").on('click', function() {
        uploadType = $(this).attr('udtype');
        console.log('click fired ' + uploadType);
    }); /*set upload type*/
}
</script>