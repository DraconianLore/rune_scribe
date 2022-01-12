$(() => {
    $('#party_level').click(() => {
        if (window.confirm("Are you sure you want to level the entire party?")) {
            fetch('/level_party', {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                }
            })
            .then(res => res.json())
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                console.error('Error: ', error)
            })
        }
    })

    function changeLevel(direction, char, id) {
        if (window.confirm(`Are you sure you want to change ${char}'s level?`)) {
            fetch('/level/' + id, {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                },
                body: JSON.stringify({ direction: direction })
            })
            .then(res => res.json())
            .then(result => {
                console.log(char + ' has had their level changed to ' + result.new_level);
                $('#' + result.charId + '-level').html(result.new_level)
            })
            .catch(error => {
                console.error('Error: ', error)
            })
        }

    }

    $('.level-down').click((e) => {
        const id = e.currentTarget.id.slice(1)
        const char = e.currentTarget.parentNode.id
        changeLevel('down', char, id)
    })
    $('.level-up').click((e) => {
        const id = e.currentTarget.id.slice(1)
        const char = e.currentTarget.parentNode.id
        changeLevel('up', char, id)
    })

})