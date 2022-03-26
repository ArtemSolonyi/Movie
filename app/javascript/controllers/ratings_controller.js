// src/controllers/ratings_controller.js
import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    greet() {
        $.ajax({
            url:this.data.get("myValue"),
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            type: 'PATCH',
            data: {rating: $("#stars input[type='radio']:checked").val()},
        });
    }
}