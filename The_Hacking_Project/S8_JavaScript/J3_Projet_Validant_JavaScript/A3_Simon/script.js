var $one = document.getElementById('circle-red');
var $two =  document.getElementById('circle-green');
var $three = document.getElementById('circle-yellow');
var $four = document.getElementById('circle-blue');
// verifier les $
var tab_board = [$one, $two, $three, $four];
var current_board = [];
var played_board = [];
var count_turn = 0;

function player_round(){
	$one.onclick = function() {
		played_board.push(this);
		check_game_status(); };
	$two.onclick = function() {
		played_board.push(this);
		check_game_status(); };
	$three.onclick = function() {
		played_board.push(this);
		check_game_status(); };
	$four.onclick = function() {
		played_board.push(this);
		check_game_status(); };
// A factoriser
}
function check_game_status(){
	if(played_board.length < current_board.length) //
	{
		player_round();
	}
	else if(played_board.length === current_board.length) {
		for(i=0; i < current_board.length; i++){
			for(j=0; j < played_board.length; j++){
			    if(played_board[j]===current_board[i]){
		       		console.log(played_board[j]);
		       		console.log(current_board[i]);


					played_board = []; //-> while(played_board.length){played_board.pop();}
					console.log(played_board.length);
					start_game();
	      		}else if(played_board[j] !== current_board[i]){


					alert('GAME OVER !');
					console.log(played_board[j]);
		       		console.log(current_board[i]);
				}
	    	}
		}
	}
}
// revoir les conditions pour le moment ce sont des testes !
function start_game(){
	var random = Math.floor(Math.random()*4);
	computer_round(random);
	count_turn = count_turn +1;
	console.log(count_turn);
}
function computer_round(random){
		current_board.push(tab_board[random]);
		console.log(current_board);

		for(var i = 0; i<current_board.length; i++)
		{
			//current_board[i].classList.add('circle-ligth');

			//current_board[i].classList.remove('circle-ligth');
			// console.log(count_turn);
		}
			//tab_board[random].classList.add('circle-ligth');

			//tab_board[random].classList.remove('circle-ligth');
		    //console.log(tab_board[random]);
/****************/
player_round()/**/
/****************/
// Pour le moment boucle car pas de limite dans player_round
// à regler
}
start_game();











var $one = document.getElementById('circle-red');
var $two =  document.getElementById('circle-green');
var $three = document.getElementById('circle-yellow');
var $for = document.getElementById('circle-blue');

var tab_board = [$one, $two, $three, $for];
var current_board = [];
var played_bord = [];

// var random = Math.floor(Math.random()*4);


function randomize (){
	var random = Math.floor(Math.random()*4);
	return ligth(random);
}
function ligth(random){

	tab_board[random].classList.add('circle-ligth');
	// console.log(tab_board[test]);

	current_board.push(tab_board[random]);

	// console.log(current_board);
}
function player_turn(){
	tab_board.onclick = function() {
		alert('OUI !!!!');
		// played_bord.push
		while(current_board === played_bord){
		randomize();
		}
	}
	alert("game over !");
}
player_turn();


	$one.addEventListener('click', function() {
		played_board.push(this);
		check_game_status();
		//console.log(played_board);
	});



$two.addEventListener('click', function() {
		played_board.push(this);
		check_game_status();
		//console.log(played_board);
	});

	$three.addEventListener('click', function() {
		played_board.push(this);
		check_game_status();
		//console.log(played_board);
	});

	$four.addEventListener('click', function() {
		played_board.push(this);
		check_game_status();
		//console.log(played_board);
});







//css
.board {
	width: 800px;
	height: 800px;
	margin: 0 auto;
}
div {
	width: 400px;
	height: 400px;
	float: left;
}
#circle-red {
	background-color: #E85965;
	border-top-right-radius: 50%;
	border-bottom-left-radius: 50%;
}
#circle-green {
	background-color: #8EFF70;
	border-top-left-radius: 50%;
	border-bottom-right-radius: 50%;
}
#circle-yellow {
	background-color: #FFED45;
		border-top-left-radius: 50%;
	border-bottom-right-radius: 50%;
}
#circle-blue {
	background-color: #5F8FFF;
	border-top-right-radius: 50%;
	border-bottom-left-radius: 50%;
}
#circle-red:hover {
	background-color: #FF1605;
	cursor: pointer;
}
#circle-green:hover {
	background-color: #46E812;
	cursor: pointer;
}
#circle-yellow:hover {
	background-color: #FFC612;
	cursor: pointer;
}
#circle-blue:hover {
	background-color: #2725FF;
	cursor: pointer;
}
.circle-ligth {
	opacity: 0.5;
	border: 3px solid red;
}
