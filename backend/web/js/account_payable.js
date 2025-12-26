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

    $("[id^=accountpayable-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=accountpayabledetail-]" ,function () {
        calculate();
    });

    $(document).on("click", "[id^=accountpayable-detail-del-btn]" , function () {
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#accountpayable-payment").change(function () {
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

        thousandSeparator = getSeparator('id-ID','group');
        //console.log('thousand separator : '+thousandSeparator)
        if (thousandSeparator=='.') {
            thousandSeparator = /\./g;
        }
        
        let totalClaim = 0;
        for (i=0; i < 30; i++) {
            if (+$('#accountpayabledetail-' + i + '-amount-disp').length > 0 ) {
                //HILANGKAN GRUP SEPARATOR
                let detailAmount  = +$('#accountpayabledetail-' + i + '-amount-disp').inputmask('unmaskedvalue');

                //HITUNG AKUMULASI TOTAL DETAIL
                totalClaim = totalClaim + detailAmount;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                $('#accountpayabledetail-' + i + '-amount-disp').val(detailAmount);
            }
        }

        //HILANGKAN GRUP SEPARATOR SEBELUM DIHITUNG
        let surcharge   = +$('#accountpayable-surcharge-disp').inputmask('unmaskedvalue');
        let penalty     = +$('#accountpayable-penalty-disp').inputmask('unmaskedvalue');
        let discount    = +$('#accountpayable-discount_nominal-disp').inputmask('unmaskedvalue');
        let payment     = +$('#accountpayable-payment-disp').inputmask('unmaskedvalue');

        //HITUNG TOTAL & BALANCE
        let claim       = totalClaim;
        let total       = claim + surcharge + penalty;
        let balance     = payment-(total-discount);

        $('#accountpayable-claim-disp').val(claim);
        $('#accountpayable-surcharge-disp').val(surcharge);
        $('#accountpayable-penalty-disp').val(penalty);
        $('#accountpayable-total-disp').val(total);
        $('#accountpayable-discount_nominal-disp').val(discount);
        $('#accountpayable-payment-disp').val(payment);
        $('#accountpayable-balance-disp').val(balance);
    }

});

