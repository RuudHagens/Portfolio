function doFirst()
{
	var button = document.getElementById('button');
	button.addEventListener('click', saveData, false);
	display();
}

function saveData()
{
	var one = document.getElementById('one').value;
	var two = document.getElementById('two').value;
	sessionStorage.setItem(one,two);
	
	display();
	
	document.getElementById('one').value ="";
	document.getElementById('two').value ="";
}

function display()
{
	var rb = document.getElementById('rb');
	rb.innerHTML = "";
	
	for(var x=0;x<sessionStorage.length;x++)
	{
		var a = sessionStorage.key(x);
		var b = sessionStorage.getItem(a);
		rb.innerHTML += a+" - " +b+"<br />";
	}
}

window.addEventListener('load',doFirst,false);