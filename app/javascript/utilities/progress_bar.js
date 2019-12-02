document.addEventListener('turbolinks:load', function() {
    var progressBar = document.querySelector('.progress-bar');

    if (progressBar){
        var questionsAmount = document.querySelector('.passage-progress').dataset.questionsAmount;
        var question = progressBar.dataset.question;

        if (question > 1) {
            var width = ( question - 1 ) / questionsAmount * 100;
            progressBar.style.width = width + '%'
        }
    }
});
