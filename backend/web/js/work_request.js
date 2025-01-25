/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* READ ME
 *
 * DOKUMENTASI MASALAH ADA DI MODEL
 */


//http://jsfiddle.net/kY98p/10/
$(document).ready(function () {

    $("[id^=workrequest]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=workrequest-]" ,function () {
        calculate();
    });

    $(document).on("click", "[id^=workrequest-detail-del-btn]" , function () {
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#work-request-payment").change(function () {
//        calculate();
//    });


    //https://stackoverflow.com/questions/33159354/how-do-i-find-the-decimal-separator-for-current-locale-in-javascript
    //separator type = "decimal" or "group"
    function getSeparator(locale, separatorType)
    {
        const numberWithGroupAndDecimalSeparator = 1000.1;
        return Intl.NumberFormat(locale)
            .formatToParts(numberWithGroupAndDecimalSeparator)
            .find(part => part.type === separatorType)
            .value;
    }


    function calculate()
    {
        //https://stackoverflow.com/questions/60175384/how-to-add-thousand-separator-to-a-string-with-js-or-jquery-in-this-particular-f
        //CHECK FORMATTER IN MAIN CONFIG.
        const id_formatter = new Intl.NumberFormat(
            'id-ID',
            { maximumSignificantDigits: 8, maximumFractionDigits: 3 }
        );

        //separator type = "decimal" or "group"
        thousandSeparator = getSeparator('id-ID','group');
        if (thousandSeparator==='.') {
            thousandSeparator = /\./g;
        }

        subTotal = 0;
        for (i = 0; i < 15; i++) {
            if ($('#workrequestdetail-' + i + '-price-disp').length > 0 ) {
                var unmaskedDetailPrice = +$('#workrequestdetail-' + i + '-price-disp').inputmask('unmaskedvalue');
                //HITUNG AKUMULASI TOTAL DETAIL

                subTotal = subTotal + unmaskedDetailPrice
            }
        }

        $('#workrequest-total-disp').val(subTotal);
        //console.log('subTotal : ' + subTotal)
    }
});

