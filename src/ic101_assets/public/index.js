import ic101 from 'ic:canisters/ic101';

ic101.greet(window.prompt("Enter your name:")).then(greeting => {
  window.alert(greeting);
});
