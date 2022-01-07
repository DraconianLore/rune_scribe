$(() => {
    // set jquery to use case insensitive search
    jQuery.expr[':'].fuzzy = function(a, i, m) {
        return jQuery(a).text().toUpperCase()
            .indexOf(m[3].toUpperCase()) >= 0;
      };

    function closeModal() {
        $('.detail-modal').hide()
    }
    function openModal(data) {
        // fill fields with data then show modal
        $('.s-size').html(data.number_of_runes + ' Runes');
        $('.s-title').html(data.name);
        let description = data.description;
        if (data.additional) {
            description += '<hr>' + data.additional;
        };
        $('.s-description').html(description);
        $('.rules-targets').html(data.target.join(', '));
        $('.rules-trace').html(data.trace);
        $('.rules-draw').html(data.draw);
        if (data.discovered) {
            $('.s-locked').hide()
            data.strained ? $('.s-strained').show() : $('.s-strained').hide();
        } else {
            $('.s-strained').hide()
            $('.s-locked').show().attr('id', 'U' + data.id)
        }
            $('.detail-modal').css('display', 'flex');
    }
    $('.s-close').click(() => {
        closeModal()
    })
    $('.structure').click((el) => {
        const structId = el.currentTarget.id
        // get structure data and pass on to display
        openModal(JSON.parse(el.currentTarget.getAttribute('data-details')))
    })
    $('.detail-modal').click((e) => {
        e.preventDefault();
        closeModal()
    });
    $('.modal-content').click((e) => {
        e.stopPropagation();
    });

    function filter_structures(query) {
        $('.structure').css('display', 'flex')
        $(".structure h3:not(:fuzzy('" + query + "'))").parent().hide()
    }

    $('#structure-search').keyup((e) => {
        filter_structures(e.currentTarget.value)
    })

    $('.s-locked').click((e) => {
        if (window.confirm("Are you sure you want to unlock this structure?")) {
            fetch('/unlock/' + e.currentTarget.id.slice(1), {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                }
            })
            .then(res => res.json())
            .then(result => {
                console.log(result.message);
                window.location.reload(false);
            })
            .catch(error => {
                console.error('Error: ', error)
            })
        }
    })

    // on refresh or reload persist search
    filter_structures($('#structure-search').val())
    

});
