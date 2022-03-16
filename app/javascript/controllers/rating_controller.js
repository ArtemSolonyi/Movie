// src/controllers/starrating.js
import {Controller} from "@hotwired/stimulus"


export default class extends Controller {
    greet() {
        console.log("df")
        $.ajax({
            url: $("#movie_path").val(),
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            type: 'PATCH',
            data: {rating: $("#stars input[type='radio']:checked").val()},
        });
    }
}