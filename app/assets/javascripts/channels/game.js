App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function() {},

  disconnected: function() {},

  received: function(data) {

    console.log(data);

    $('.ui-button').filter(function () {
      return this.value==data['clicked'];
    }).each(function() {
     $(this).button();
      $(this)[0].classList.add(['white','red','green','black'][$(this).attr('team')]);
      $(this).button("disable");
    });
    
  },

  click: function(word) {
    return this.perform('click', {
      word: word
    });
  }
});
$(document).on('click', '.ui-button', function(e) {
  App.game.click($(this)[0].value);
});
