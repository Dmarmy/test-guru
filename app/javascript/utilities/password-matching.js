document.addEventListener("turbolinks:load", function() {
    var control = document.getElementById('user_password_confirmation');

    if (control) control.addEventListener("input", checkMatching);
});

function checkMatching() {

    var password = document.getElementById('user_password');

    if (!this.value.length) {
        document.querySelector('.octicon-verified').classList.add('hide');
        document.querySelector('.octicon-x').classList.add('hide');
    }

    if (this.value == password.value) {
        document.querySelector('.octicon-verified').classList.remove('hide');
        document.querySelector('.octicon-x').classList.add('hide');
    }

    else {
        document.querySelector('.octicon-verified').classList.add('hide');
        document.querySelector('.octicon-x').classList.remove('hide');
    }
}
