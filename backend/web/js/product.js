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


    $("[id^=product-]").change(function () {
        calculate();
    });

    $(document).on("change", "[id^=productdetail-]" ,function () {
        calculate();
    });

    $(document).on("click", "[id^=product-detail-del-btn]" , function () {
        calculate();
    });

//    $(document).on("click", "a", function(){
//        alert("A link was clicked!");
//    });
//    SISAKAN SEBAGAI CONTOH
//    $("#product-payment").change(function () {
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

        let subTotal = 0;
        let detailTotal = 0;
        for (i = 0; i < 30; i++) {
            if (+$('#productdetail-' + i + '-quantity-disp').length > 0 ||
                +$('#productdetail-' + i + '-price-disp').length > 0) {
                let detailQuantity = +$('#productdetail-' + i + '-quantity-disp').inputmask('unmaskedvalue');
                let detailPrice = +$('#productdetail-' + i + '-price-disp').inputmask('unmaskedvalue');

                detailTotal = detailQuantity * detailPrice;

                //HITUNG AKUMULASI TOTAL DETAIL
                subTotal = subTotal + detailTotal;

                //GRUP SEPARATOR DIATUR OLEH KARTIK DI FORM
                $('#productdetail-' + i + '-quantity-disp').val(detailQuantity);
                $('#productdetail-' + i + '-price-disp').val(detailPrice);
                $('#productdetail-' + i + '-total-disp').val(detailTotal);
            }
        }
        sum_material_or_account = $('#product-dummy_total').val();
        //grandTotal = (parseFloat(subTotal) + parseFloat(dummyTotal))


        +$('#product-total-disp').val(subTotal);
        //$('#' + rowItemUnit).val(obj.item_unit_id).change();

    }
});

