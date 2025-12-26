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

    $("[id^=purchase-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=purchasedetail-]" ,function () {
        calculate();
    });

    $(document).on("click", "[id^=purchase-detail-del-btn]" , function () {
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#purchase-payment").change(function () {
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
        //thousandSeparator= <?php echo Yii::$app->formatter->thousandSeparator ?>
        if (thousandSeparator=='.') {
            thousandSeparator = /\./g;
        }

        let totalClaim = 0;
        for (i=0; i < 30; i++) {
            if ($('#purchasedetail-' + i + '-quantity').length > 0 ||
                    $('#purchasedetail-' + i + '-price').length > 0) {
                //HILANGKAN GRUP SEPARATOR
                let detailQuantity  = +$('#purchasedetail-' + i + '-quantity-disp').inputmask('unmaskedvalue');
                let detailPrice     = +$('#purchasedetail-' + i + '-price-disp').inputmask('unmaskedvalue');
                let detailTotal     = detailQuantity*detailPrice;

                //HITUNG AKUMULASI TOTAL DETAIL
                totalClaim = totalClaim + detailTotal;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                +$('#purchasedetail-' + i + '-quantity-disp').val(detailQuantity);
                +$('#purchasedetail-' + i + '-price-disp').val(detailPrice);
                +$('#purchasedetail-' + i + '-total-disp').val(detailTotal);
            }
        }

        //HILANGKAN GRUP SEPARATOR SEBELUM DIHITUNG
        let surcharge   = +$('#purchase-surcharge-disp').inputmask('unmaskedvalue');
        let penalty     = +$('#purchase-penalty-disp').inputmask('unmaskedvalue');
        let discount    = +$('#purchase-discount_nominal-disp').inputmask('unmaskedvalue');
        let payment     = +$('#purchase-payment-disp').inputmask('unmaskedvalue');

        //HITUNG TOTAL & BALANCE
        let claim       = totalClaim;
        let total       = claim + surcharge + penalty;
        let balance     = payment-(total-discount);

        $('#purchase-claim-disp').val(claim);
        $('#purchase-surcharge-disp').val(surcharge);
        $('#purchase-penalty-disp').val(penalty);
        $('#purchase-total-disp').val(total);
        $('#purchase-discount_nominal-disp').val(discount);
        $('#purchase-payment-disp').val(payment);
        $('#purchase-balance-disp').val(balance);
    }

});

